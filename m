Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FBDC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 12:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D10606D4;
	Fri, 31 May 2024 12:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOBMzJ_LLlgr; Fri, 31 May 2024 12:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CE01606BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CE01606BD;
	Fri, 31 May 2024 12:52:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 107041D51A5
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 12:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECA33408C3
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 12:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgpCu7xygrCE for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 12:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 193E1400D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 193E1400D7
 for <buildroot@buildroot.org>; Fri, 31 May 2024 12:52:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E847B8780B; Fri, 31 May 2024 12:52:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 14:42:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b574b0b9e6d076e25a3d67e8f4bddcd690ef2b1f
X-Git-Newrev: 9a629f5129d652960b203e53685aea24a4dd86a1
X-Patchwork-Hint: ignore
Message-Id: <20240531125202.E847B8780B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/docker-run: allow
 running with Podman
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a629f5129d652960b203e53685aea24a4dd86a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Podman is command line compatible with Docker, there's no need to
require contributors to install Docker to run checks before sending
patches.

The additional "--userns=keep-id" option is necessary because unlike
Docker Podman creates a user namespace for containers by
default. Without keep-id the repository and pre-existing output files
belong to root inside the container namespace, breaking writes,
certain Git safety checks, and possibly all access (if the user is
using a strict umask).

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 79694474c1..3dcabe2718 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -29,6 +29,16 @@ declare -a mountpoints=(
     "$(pwd)"
 )
 
+if command -v docker >/dev/null; then
+    DOCKER="docker"
+elif command -v podman >/dev/null; then
+    DOCKER="podman"
+    docker_opts+=( --userns=keep-id )
+else
+    echo "ERROR: Neither docker nor podman available!" >&2
+    exit 1
+fi
+
 # curl lists (and recognises and uses) other types of *_proxy variables,
 # but only those make sense for Buildroot:
 for env in all_proxy http_proxy https_proxy ftp_proxy no_proxy; do
@@ -84,4 +94,4 @@ if tty -s; then
     docker_opts+=( -t )
 fi
 
-exec docker run "${docker_opts[@]}" "${IMAGE}" "${@}"
+exec ${DOCKER} run "${docker_opts[@]}" "${IMAGE}" "${@}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
