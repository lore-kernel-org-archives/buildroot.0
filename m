Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F98DC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 21:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3973E60B75;
	Tue,  5 Apr 2022 21:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZXsbVAh_cfY; Tue,  5 Apr 2022 21:20:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61C0C60E33;
	Tue,  5 Apr 2022 21:20:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3C21BF3A3
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6720D415E3
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fZ8jJVeJYDh for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 21:19:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83F2D415AF
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 21:19:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7074B83657; Tue,  5 Apr 2022 21:10:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 5 Apr 2022 23:16:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab85fc137faa46bd1feb5d95b14ba9bedb1513e8
X-Git-Newrev: ac91235797fe9b234fb820c0112f21c26be1349f
X-Patchwork-Hint: ignore
Message-Id: <20220405211029.7074B83657@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spidev_test: fix version depending
 on kernel headers version
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac91235797fe9b234fb820c0112f21c26be1349f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  - http://autobuild.buildroot.net/results/a5c008aaff40f4851ffa36439c7340b6243a4842

  .../build/spidev_test-5.8/spidev_test.c:132:13: error: 'SPI_TX_OCTAL' undeclared (first use in this function); did you mean 'SPI_TX_DUAL'?
    132 |  if (mode & SPI_TX_OCTAL)
        |             ^~~~~~~~~~~~
        |             SPI_TX_DUAL

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/spidev_test/Config.in      | 2 +-
 package/spidev_test/spidev_test.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
index 81386adf7a..abfa885b73 100644
--- a/package/spidev_test/Config.in
+++ b/package/spidev_test/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_SPIDEV_TEST
 	  proper operation of 'spidev_test'.
 
 	  The version used is based on your toolchain headers version,
-	  if it's older than 3.15 then 3.0 is used, up to headers 4.20
+	  if it's older than 3.15 then 3.0 is used, up to headers 5.7
 	  version 4.10 is used and otherwise version 5.8.
 	  This means you won't have quad-pumped SPI support if your
 	  toolchain is too old.
diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index 6c5a9495a4..bd138b0142 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -10,7 +10,7 @@
 # If you need quad-pumped spi support you need to upgrade your toolchain.
 # Note that the location of spidev_test.c changes from v4.5 onwards.
 
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0),y)
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8),y)
 SPIDEV_TEST_VERSION = 5.8
 SPIDEV_TEST_PATH = tools/spi
 else ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
