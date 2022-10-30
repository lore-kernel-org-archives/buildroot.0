Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98660C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 18:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EAB940523;
	Sun, 30 Oct 2022 18:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EAB940523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0YoVCiMIxr0; Sun, 30 Oct 2022 18:34:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55A5140151;
	Sun, 30 Oct 2022 18:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55A5140151
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23BDA1BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3F0E605AC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3F0E605AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6Mjrrb-k-LF for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 18:33:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12EB1605A4
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 18:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12EB1605A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1745875BF; Sun, 30 Oct 2022 18:33:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 19:32:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7619682552dd34f499e9f17b0234af53da743ec
X-Git-Newrev: 50da16cf949596ee450e8c3c20cc676a3baabc9a
X-Patchwork-Hint: ignore
Message-Id: <20221030183357.F1745875BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/batman-adv: bump to version 2022.2
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
Content-Type: multipart/mixed; boundary="===============5941141582776699851=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5941141582776699851==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=50da16cf949596ee450e8c3c20cc676a3baabc9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with kernel >= 5.18 thanks to
https://github.com/open-mesh-mirror/batman-adv/commit/f07a0c37ab278fb6a9e95cad89429b1282f1ab59:

/home/buildroot/autobuild/instance-2/output-1/build/batman-adv-2021.4/net/batman-adv/bridge_loop_avoidance.c: In function ‘batadv_bla_send_claim’:
/home/buildroot/autobuild/instance-2/output-1/build/batman-adv-2021.4/net/batman-adv/bridge_loop_avoidance.c:446:9: error: implicit declaration of function ‘netif_rx_any_context’ [-Werror=implicit-function-declaration]
  446 |         netif_rx_any_context(skb);
      |         ^~~~~~~~~~~~~~~~~~~~

Indeed, netif_rx_any_context has been dropped since kernel 5.18:
https://github.com/torvalds/linux/commit/2655926aea9beea62c9ba80c032485456fd848f0

https://github.com/open-mesh-mirror/batman-adv/blob/v2022.2/CHANGELOG.rst

Fixes:
 - http://autobuild.buildroot.org/results/542b7b99da7b7a65e6e11e7c73a26856e3222e89

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/batman-adv/batman-adv.hash | 6 +++---
 package/batman-adv/batman-adv.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
index c098663739..c5add4cdea 100644
--- a/package/batman-adv/batman-adv.hash
+++ b/package/batman-adv/batman-adv.hash
@@ -1,7 +1,7 @@
-# From https://downloads.open-mesh.org/batman/releases/batman-adv-2021.4/batman-adv-2021.4.tar.gz.sha1
-sha1  80a3e4d763b6bf35db6e561ed9d6775dc874d7c6  batman-adv-2021.4.tar.gz
+# From https://downloads.open-mesh.org/batman/releases/batman-adv-2022.2/batman-adv-2022.2.tar.gz.sha1
+sha1  e1829e10fc37ea674a20cb9ba1d6c1483042fbfa  batman-adv-2022.2.tar.gz
 
 # Hash for license files
-sha256  cff7a2f160045fd0dbf1f1cd7e35e93bf489e81cb8b9501b3756daa391f3eb1b  batman-adv-2021.4.tar.gz
+sha256  8aca27c6f168b137a7ed7031d58169396c1a97f958c2ea95b9c30a9b92576fe0  batman-adv-2022.2.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 6a1aaa699c..d279694bf5 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATMAN_ADV_VERSION = 2021.4
+BATMAN_ADV_VERSION = 2022.2
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
 BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
 BATMAN_ADV_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT

--===============5941141582776699851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5941141582776699851==--
