Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6124C021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 20:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A30E640D82;
	Tue, 18 Feb 2025 20:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OryzNX9RRPvh; Tue, 18 Feb 2025 20:23:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 797E940D58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 797E940D58;
	Tue, 18 Feb 2025 20:23:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9D91C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEEA983668
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xs4K3dhlPu29 for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 20:23:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A9528364F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A9528364F
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:23:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7BBD8781C; Tue, 18 Feb 2025 20:23:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 21:18:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d21aeb44e06eb8259179edb3f7e330a07f8b908f
X-Git-Newrev: 25b6a6eceeb8b13ba1827649a0d6586dd65f11aa
X-Patchwork-Hint: ignore
Message-Id: <20250218202324.A7BBD8781C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: allow explicitly setting
 of docker/podman/...
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
