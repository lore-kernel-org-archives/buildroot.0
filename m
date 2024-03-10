Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED940C54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 15:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 542E0400F8;
	Sun, 10 Mar 2024 15:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XA-6Rq3AH26s; Sun, 10 Mar 2024 15:10:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D3E6403B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D3E6403B8;
	Sun, 10 Mar 2024 15:10:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BD4F1BF40B
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 15:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5649081352
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 15:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKE3YZHHCSzI for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 15:10:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C734F8134A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C734F8134A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C734F8134A
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 15:10:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 299ECB0055A;
 Sun, 10 Mar 2024 16:10:45 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 16:10:36 +0100
Message-ID: <20240310151036.1392876-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710083448;
 bh=uPmm1a16pXEfRntCZcy0T0J549BfzmhhoImja4W8Ock=;
 h=From:To:Cc:Subject:Date:From;
 b=lAXbgHzff+XGPC5hBuQlSBV9OAQ80YAqL1G2YQHh+8Oj3auhbarEAjVbr8w2xlP59
 bIpbvL6lF+a7ArIW2ft0rbGCyOl1fY1Tufu7Up4LDooD/wosXj5/LFZTu+kdead8xX
 9hXB92mcOg1CbFRw7o0ZqnO7z8CEgJtUaNTTimpG5K93iTANQZj+1PGfWEaJKl5V6y
 vyJ2MdmTc2psgBp3SZzRRI3p5sMQJMf9Sq/cP3TwKSaiTbDVvdJJz8bro6o9m3VPis
 0f2tZGyk54qa2XqHUgFhd3v4lIiUn5Cov4YI+OiCxvFRzkBWNTx0G1vL4i7yvsDYni
 p9O4WSVT/3DAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lAXbgHzf
Subject: [Buildroot] [PATCH 1/1] package/mokutil: new package
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mokutil is a tool to import or delete the machines owner
keys (MOK) stored in the database of shim.

"shim" is the first stage bootloader to support UEFI Secure
Boot. See also the "shim" package in the bootloaders
section.

https://github.com/lcp/mokutil

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 31abe2f with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p mokutil
    ...
        br-i386-pentium-mmx-musl [32/45]: FAILED
    ...
    45 builds, 32 skipped, 1 build failed, 0 legal-info failed, 0 show-info failed

Note: the br-i386-pentium-mmx-musl build failure is due to an old
musl libc not containing the qsort_r() function.

Thomas mentioned in [1] that this kind of failure should be addressed
by updating the toolchain in test-pkg, instead.

[1] https://lists.buildroot.org/pipermail/buildroot/2024-March/686962.html
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/mokutil/Config.in    | 31 +++++++++++++++++++++++++++++++
 package/mokutil/mokutil.hash |  3 +++
 package/mokutil/mokutil.mk   | 19 +++++++++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 package/mokutil/Config.in
 create mode 100644 package/mokutil/mokutil.hash
 create mode 100644 package/mokutil/mokutil.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a6364cdd441..087f3bc0b66 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1733,6 +1733,7 @@ F:	package/gnupg2/
 F:	package/highway/
 F:	package/kexec/
 F:	package/libjxl/
+F:	package/mokutil/
 F:	package/octave/
 F:	package/ola/
 F:	package/openblas/
diff --git a/package/Config.in b/package/Config.in
index c677c3ff4a9..a39022cef8c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2763,6 +2763,7 @@ menu "System tools"
 	source "package/mender-grubenv/Config.in"
 	source "package/mfoc/Config.in"
 	source "package/moby-buildkit/Config.in"
+	source "package/mokutil/Config.in"
 	source "package/monit/Config.in"
 	source "package/multipath-tools/Config.in"
 	source "package/ncdu/Config.in"
diff --git a/package/mokutil/Config.in b/package/mokutil/Config.in
new file mode 100644
index 00000000000..e6164087b86
--- /dev/null
+++ b/package/mokutil/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_MOKUTIL
+	bool "mokutil"
+	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_SHIM_ARCH_SUPPORTS
+	depends on BR2_USE_MMU # keyutils
+	depends on !BR2_STATIC_LIBS # efivar, keyutils
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS # efivar
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
+	depends on BR2_TOOLCHAIN_HAS_THREADS # efivar
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
+	select BR2_PACKAGE_EFIVAR
+	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  mokutil is a tool to import or delete the machines owner
+	  keys (MOK) stored in the database of shim.
+
+	  "shim" is the first stage bootloader to support UEFI Secure
+	  Boot. See also the "shim" package in the bootloaders
+	  section.
+
+	  https://github.com/lcp/mokutil
+
+comment "mokutil needs a toolchain w/ dynamic library, threads, gcc >= 4.9, headers >= 3.12"
+	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_SHIM_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
diff --git a/package/mokutil/mokutil.hash b/package/mokutil/mokutil.hash
new file mode 100644
index 00000000000..86555e6f4db
--- /dev/null
+++ b/package/mokutil/mokutil.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1c0bcba3d2f4ab98235b1edb5eb71b40508f79d93d3e28b1a04b7fbd4a2c1457  mokutil-0.7.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mokutil/mokutil.mk b/package/mokutil/mokutil.mk
new file mode 100644
index 00000000000..6e83d9f1383
--- /dev/null
+++ b/package/mokutil/mokutil.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# mokutil
+#
+################################################################################
+
+MOKUTIL_VERSION = 0.7.1
+MOKUTIL_SITE = $(call github,lcp,mokutil,$(MOKUTIL_VERSION))
+MOKUTIL_LICENSE = GPL-3.0+
+MOKUTIL_LICENSE_FILES = COPYING
+MOKUTIL_AUTORECONF = YES
+
+MOKUTIL_DEPENDENCIES = \
+	efivar \
+	host-pkgconf \
+	keyutils \
+	openssl
+
+$(eval $(autotools-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
