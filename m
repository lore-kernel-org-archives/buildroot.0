Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4344C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5787540010;
	Fri,  7 Jan 2022 21:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30g1RcsR49FU; Fri,  7 Jan 2022 21:08:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60F7E404C5;
	Fri,  7 Jan 2022 21:08:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCA1F1BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBE9C428C9
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAl0vr6gaK_x for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:08:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E29F8410E8
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:08:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 222E38349E; Fri,  7 Jan 2022 21:02:01 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 22:08:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebce685e1d60b47b8fc5490a5820b79fc3a913ca
X-Git-Newrev: abb9e8dae230dcd1024aacf53a41eed0efb06187
X-Patchwork-Hint: ignore
Message-Id: <20220107210201.222E38349E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qpdf: needs atomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=abb9e8dae230dcd1024aacf53a41eed0efb06187
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qpdf needs atomic since bump to version 10.5.0 in commit
b5352c2177011ca389cbb7c68e78447549cbdaaa and
https://github.com/qpdf/qpdf/commit/c5c1a028cdd3cf345046c46963fb0fdacfb2c33c:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: /home/buildroot/autobuild/instance-2/output-1/build/qpdf-10.5.0/libqpdf/build/.libs/libqpdf.a(QPDF.o): in function `QPDF::QPDF()':
QPDF.cc:(.text+0x48de): undefined reference to `__atomic_fetch_add_8'

Fixes:
 - http://autobuild.buildroot.org/results/7e18689670dcbe491c35f0597e5c3c787936263f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups-filters/Config.in | 2 ++
 package/qpdf/Config.in         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
index 32381e6c1f..ded99a4774 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_CUPS_FILTERS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qpdf
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # qpdf
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
@@ -33,6 +34,7 @@ config BR2_PACKAGE_CUPS_FILTERS
 
 comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library, gcc >= 5"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
index 047c4c8a75..accf2b5f34 100644
--- a/package/qpdf/Config.in
+++ b/package/qpdf/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QPDF
 	bool "qpdf"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
@@ -16,5 +17,6 @@ config BR2_PACKAGE_QPDF
 	  http://qpdf.sourceforge.net/
 
 comment "qpdf needs a toolchain w/ C++, gcc >= 5"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
