Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A95C27C50
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 13:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A7C760627;
	Sat,  1 Jun 2024 13:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1aJz0VgkuvLY; Sat,  1 Jun 2024 13:52:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83D9E60665
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83D9E60665;
	Sat,  1 Jun 2024 13:52:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD2C31BF2F5
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 13:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A20848474E
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 13:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMVmRhHD7QSn for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 13:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 748E98474D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 748E98474D
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 13:52:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52CD087880; Sat,  1 Jun 2024 13:52:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jun 2024 15:51:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 42fad03182ed53de8003b66d50e893f42b72145e
X-Git-Newrev: f97e6293de1491e75b0798bddf4b0532c7f92bd2
X-Patchwork-Hint: ignore
Message-Id: <20240601135252.52CD087880@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/docker-run: set podman
 userns option in environment
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f97e6293de1491e75b0798bddf4b0532c7f92bd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 9a629f5 "utils/docker-run: allow running with Podman" added an
option on system providing the podman command. This case is mainly
for Fedora systems.

Fedora repositories have a podman-docker package, that provides the
docker command for compatibility. See [1]. In that case, invoking
"docker" redirects to podman.

When this package is installed on a Fedora system, both the docker and
podman commands are available. Since the docker command is checked
before podman, the --userns option is not passed in that case. This
brings "permission denied" errors.

Other cases are also possible, like a host system providing the real
Docker alongside a podman installation. In such a case, to avoid
unexpected change of behavior of the docker-run script, the original
search order is preserved (search for "docker" first, then "podman").

This commit changes the way the podman user namespace mode is set.
Rather than adding the "--userns=keep-id" command line option only in
the podman case, it is globally set using the PODMAN_USERNS=keep-id
environment variable [2].

Doing so makes sure that the variable will be consumed by the "docker"
compatibility command, and just ignored by the real "docker"
implementation.

[1] https://packages.fedoraproject.org/pkgs/podman/podman-docker/
[2] https://docs.podman.io/en/latest/markdown/podman-run.1.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 3dcabe2718..1adb02d74e 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -29,11 +29,16 @@ declare -a mountpoints=(
     "$(pwd)"
 )
 
+# We use the PODMAN_USERNS environment variable rather than using the
+# --userns command line argument because Fedora system may have the
+# podman-docker package installed, providing the "docker"
+# compatibility command.
+export PODMAN_USERNS="keep-id"
+
 if command -v docker >/dev/null; then
     DOCKER="docker"
 elif command -v podman >/dev/null; then
     DOCKER="podman"
-    docker_opts+=( --userns=keep-id )
 else
     echo "ERROR: Neither docker nor podman available!" >&2
     exit 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
