Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D248C19F38
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:20:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A2260F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5A2260F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C46F760A3B;
	Tue,  3 Aug 2021 23:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2Di8ZAQZrAw; Tue,  3 Aug 2021 23:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E03608D2;
	Tue,  3 Aug 2021 23:20:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5971BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5166B4062E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rtBfyUluJ0TQ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52A3F40679
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9AA23860D3; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Jun 2021 17:10:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6d7f5c09f7ab37617f0f1f17bbe2c96b7d7c407e
X-Git-Newrev: 7af5a80aba23538b56e0caa227e954aa72f3b3ba
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.9AA23860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/boot/test_atf: update U-Boot in TestATFAllwinner
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

commit: https://git.buildroot.net/buildroot/commit/?id=7af5a80aba23538b56e0caa227e954aa72f3b3ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump U-Boot version in TestATFAllwinner. Updating U-Boot version to
2021.04 requires the following two changes.

First, after switching to binman, u-boot.itb is no more generated for
64-bit sunxi boards. Combined u-boot-sunxi-with-spl.bin image should
be used instead. This image contains SPL, U-Boot, and FIT image,
where FIT image contains other binaries such as BL31 and SCP.

Second, new U-Boot enables support for System Control Processor (SCP)
firmware. SCP firmware is included by default into FIT image in the
combined u-boot-sunxi-with-spl.bin binary. When SCP is not available
or not needed, it should be explicitly disabled by pointing to an
empty file. Support for Allwinner SCP firmware is not yet available
neither in Buildroot nor in mainline kernel. So disable it for now
using custom U-Boot build options.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/boot/test_atf.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index b0be7fb308..a9d5b67ac7 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -41,16 +41,15 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
         BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
         BR2_TARGET_UBOOT_NEEDS_DTC=y
         BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
         BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
         BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-        BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-        BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
         BR2_TARGET_UBOOT_SPL=y
-        BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+        BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+        BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
         """
 
     def test_run(self):
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
