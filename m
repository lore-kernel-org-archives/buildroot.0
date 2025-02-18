Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8591C021AF
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 20:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0EA40902;
	Tue, 18 Feb 2025 20:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxIpPPNfDXJf; Tue, 18 Feb 2025 20:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3999B40C78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3999B40C78;
	Tue, 18 Feb 2025 20:14:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 291CAC8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0287040A03
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjy_553Bgnsr for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 20:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08C97405F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08C97405F0
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:14:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00060819DE; Tue, 18 Feb 2025 20:14:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 20:50:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3aacb38098864eba4f0af21e947cb9cbf2cf6dbe
X-Git-Newrev: 5494efe61b64c40dc5b197d8fd9732b4a3fadd98
X-Patchwork-Hint: ignore
Message-Id: <20250218201426.00060819DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "utils/brmake: add option to run in
 docker"
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

commit: https://git.buildroot.net/buildroot/commit/?id=5494efe61b64c40dc5b197d8fd9732b4a3fadd98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All our documented uses of utils/docker-run, besides running it
standalone to get an interactive shell, is to use it as a prefix
to the otherwise standard command to run, e.g.:
  - ./utils/docker-run make foo_defconfig
  - ./utils/docker-run make menuconfig
  - ./utils/docker-run make
  - ./utils/docker-run make check-package

Commit 8aad67f1575f (utils/brmake: add option to run in docker) departed
from that usual convention, by hiding the call to docker-run inside
brmake, conditioned by an environment variable. The only reason is that
brmake internally used ubuffer. This is no longer the case, so we can
now use brmake together with docker-run in the usual manner.

This basically reverts commit 8aad67f1575f1d8a9c90ccd70302e9a6823cf794,
after resolving the conflict due to the removal of unbuffer in te
previous commit.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/brmake     | 8 +-------
 utils/readme.txt | 3 ---
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/utils/brmake b/utils/brmake
index e5437d8f2c..4b9179e415 100755
--- a/utils/brmake
+++ b/utils/brmake
@@ -7,13 +7,7 @@ main() {
 
     start=${SECONDS}
 
-    if [ -n "$BR2_DOCKER" ]; then
-        docker=("${0%/*}/docker-run")
-    else
-        docker=()
-    fi
-
-    ( exec 2>&1; "${docker[@]}" make "${@}"; ) \
+    ( exec 2>&1; make "${@}" ) \
     > >( while read -r line; do
              printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
          done \
diff --git a/utils/readme.txt b/utils/readme.txt
index abff659d4f..b5862f1fb9 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -7,9 +7,6 @@ brmake
     front of each line, redirects all of the build output to a file
     ("'br.log' in the current directory), and just outputs the Buildroot
     messages (those lines starting with >>>) on stdout.
-    To run this within a container using docker-run (see below), set
-    BR2_DOCKER=y in the environment, i.e. call it as
-    `BR2_DOCKER=y utils/brmake`.
     Do not run this script for interactive configuration (e.g. menuconfig)
     or on an unconfigured directory. The output is redirected so you will see
     nothing.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
