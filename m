Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A3AC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98FCB85E9B;
	Fri, 28 Feb 2025 17:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k91sTX68fJDm; Fri, 28 Feb 2025 17:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 974C885E9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 974C885E9C;
	Fri, 28 Feb 2025 17:21:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D4AD711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 862A946E35
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEc3W02XcVNZ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE0F7459F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE0F7459F4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0FD087A74; Fri, 28 Feb 2025 16:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 21:18:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d21aeb44e06eb8259179edb3f7e330a07f8b908f
X-Git-Newrev: 25b6a6eceeb8b13ba1827649a0d6586dd65f11aa
X-Patchwork-Hint: ignore
Message-Id: <20250228163043.C0FD087A74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/docker-run: allow
 explicitly setting of docker/podman/...
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=25b6a6eceeb8b13ba1827649a0d6586dd65f11aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, our docker-run helper will decide on its own whether it
should use docker (preferred) or podman (fallback), as introduced in
9a629f5129d6 (utils/docker-run: allow running with Podman). In case
both are installed, it is not possible to exercise the podman case.
Often, 'docker' is just an alias for 'podman' when both are available,
but this is not always true - and in the latter case, the user needs to
be able to choose which one they want.

Allow the user to force the one to use, by setting the BR2_DOCKER
environment variable. If that is set and it doesn't exist, exit with
an explicit error message (rather than relying on the failure when
eventually exec-ing the specified command).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Fiona Klute <fiona.klute@gmx.de>
Reviewed-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/docker-run | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 849df66d54..27c169db72 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -35,7 +35,14 @@ declare -a mountpoints=(
 # compatibility command.
 export PODMAN_USERNS="keep-id"
 
-if command -v docker >/dev/null; then
+if [ "${BR2_DOCKER}" ]; then
+    if command -v "${BR2_DOCKER}" >/dev/null; then
+        DOCKER="${BR2_DOCKER}"
+    else
+        printf 'ERROR: Command "%s" (from env BR2_DOCKER) not found.\n' "${BR2_DOCKER}" >&2
+        exit 1
+    fi
+elif command -v docker >/dev/null; then
     DOCKER="docker"
 elif command -v podman >/dev/null; then
     DOCKER="podman"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
