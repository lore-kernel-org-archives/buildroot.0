Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3CAC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:13:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 565F2601FD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 565F2601FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3226C404DB;
	Tue,  3 Aug 2021 20:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-DsUsMZ_U5Z; Tue,  3 Aug 2021 20:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B05B40470;
	Tue,  3 Aug 2021 20:13:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC0101BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAAA983A79
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mq_xBgLHe0xM for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:13:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAB5A839BF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:13:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 46E698B392; Tue,  3 Aug 2021 20:13:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 22:08:20 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 91811cbb3887e13b665b85af868cae2612716f48
X-Git-Newrev: f79cb5116c537856a3987379b1555584f31e0c1e
X-Patchwork-Hint: ignore
Message-Id: <20210803201309.46E698B392@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] boot/uboot: add missing
 dependency to host-pkgconf
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f79cb5116c537856a3987379b1555584f31e0c1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Commit 2eaa6d0f3629 (boot/uboot: fix uboot building host tools on x86
architecture) added use of $(PKG_CONFIG_HOST_BINARY), but forgot to add
the corresponding build-ordr dependency.

Add this missing depenency now.

Additionally, the associated test had an explicit host pkgconf enbled in
its configuration. This is superfluous now that uboot properly depends
on host-pkgconf, so drop that from the test.

Note: it hapenned to work, because host-pkgconf, when explicitly enabled
in the configuration, and without per-package directories, would build
before uboot and thus be available. This would fail with PPD, though,
and thus would break for TLPB.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d0edfec1e27b7b1b1cb46221e71cae1537f58440)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk                                           | 2 +-
 support/testing/tests/package/test_uboot_openssl_pkgconfig.py | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a7eaedb06f..a8a8bedc01 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -17,7 +17,7 @@ UBOOT_CPE_ID_PRODUCT = u-boot
 UBOOT_INSTALL_IMAGES = YES
 
 # u-boot 2020.01+ needs make 4.0+
-UBOOT_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
+UBOOT_DEPENDENCIES = host-pkgconf $(BR2_MAKE_HOST_DEPENDENCY)
 UBOOT_MAKE = $(BR2_MAKE)
 
 ifeq ($(UBOOT_VERSION),custom)
diff --git a/support/testing/tests/package/test_uboot_openssl_pkgconfig.py b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
index de2d83f5b8..55a45f44fc 100644
--- a/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
+++ b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
@@ -12,7 +12,6 @@ class TestUbootOpensslPkgConfig(infra.basetest.BRTest):
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BOARD_DEFCONFIG="efi-x86_payload64"
         BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-        BR2_PACKAGE_HOST_PKGCONF=y
         """
 
     def test_run(self):
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
