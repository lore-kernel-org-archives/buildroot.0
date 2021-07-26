Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79B8C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 22:35:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32CA460F41
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 22:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32CA460F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 036DF605DD;
	Mon, 26 Jul 2021 22:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SXb3Xw2872II; Mon, 26 Jul 2021 22:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E132B607BF;
	Mon, 26 Jul 2021 22:35:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6EE91BF2FF
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 22:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3D7A6009C
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 22:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEwwo8-iBWZj for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 22:35:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F7DB605DD
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 22:35:20 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.155.191])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 89BrmQHp3nxSq89BumxN5r; Tue, 27 Jul 2021 00:35:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627338918; bh=RzQg8C+5t3/6bPsNtdb2t+fZS7pzkDKSIXHdAUsd8dE=;
 h=From:To:Subject:Date:MIME-Version;
 b=f+bTq8KER937FxAxWxwz+JydS+n5MBspgfj/D4o876xgcS2jBhkkXkBa7e8OXQSx2
 769fpra91/g94NeUw81HuHHRSHdhbtSuqVir63qq5e/+EzUF8oeZJe186HiF6iyjts
 Hkmp2pdS9mPXaa4kWk2mdCB2PjIqMgXy753y17Q2OYDBkEInIFBy8WTtpCZb7zhxO9
 STc+tSBW5iEB4RwfiJMcYsDLgq46qpcyPkA1QIaBYLTqG/hJsdn4UiMhhnILCcKZ+k
 YU+nfUzrTB73lg5tff2Qp9QqXs6j52kPraetmsqtJDfPzOzOf/qeHagBHA+b49Mpmf
 bw464eQofO4DQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 00:34:35 +0200
Message-Id: <20210726223435.2906458-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfANeqTx1khsoR+a6AQZltZLSJ6lWjzXhDEPjUSeSNOYbTJsyWYcw3XQh1l5g8wCNcx9BOa28Os4x/hVmexEO6zp41NpQ9UmpjFcI/Fdtw0gUpwlaf485
 3mA9xi9W3sSxo5R31P1YvtpohFlZ7cc/mFO3oMKHveCKufr2qPweiyMFsuJS5DAkQFldaKc8nQA+QLfgAAEhBe4hbAbrXCM5zE9kUWfvFxCUjWUTNt51a+GM
 sdDtlvWx//K0szAruoq1mZbEy4RNKWhY373dVKiqVl1Y+Cn+ByEZAGmiQj5mIsJIGBQWjJjm7wbx+IXM5TKnjVu5DBgbOtwl6vo/m0MG9fppOk7ssYvntJxy
 D1obm+fZRGUA2qwzEtBsriGrES6hlaEPtGXf/1ZBKJgu5Ph8P0lnXcl482VxqHkVBQ5cAY3O9vBwadPfHV74MSF/M6bfmLuzf54MPIHBHVxtVck7SIMbxjyE
 TJ7OPCh7/DCKftcO
Subject: [Buildroot] [PATCH v2 3/3] toolchain: remove binutils bug 21464
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Nosthoff <buildroot@heine.tech>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This bug has been fixed upstream and backported to buildroot binutils
package. So let's remove it from toolchain/Config.in and from packages
that are affected by it:
- libgeos
- postgis
- protobuf

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/Config.in  | 4 +---
 package/postgis/Config.in  | 4 +---
 package/protobuf/Config.in | 1 -
 toolchain/Config.in        | 6 ------
 4 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 86a1cddcf3..124e2da661 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBGEOS
 	bool "libgeos"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
@@ -13,7 +12,6 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 21464, 27597"
+comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 04705f7e16..78c52ea7b2 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_POSTGIS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
 	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
 	depends on BR2_USE_WCHAR # libgeos, proj
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 # libgeos
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
 	select BR2_PACKAGE_LIBGEOS
 	select BR2_PACKAGE_PROJ
@@ -20,9 +19,8 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 21464, 27597"
+comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 27597"
 	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 30050950aa..46c820b9cf 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -24,7 +24,6 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 
 config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 8603e2aaff..3598307b20 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -71,12 +71,6 @@ source "package/gdb/Config.in.host"
 
 comment "Toolchain Generic Options"
 
-# https://sourceware.org/bugzilla/show_bug.cgi?id=21464
-# Affect toolchains built with binutils 2.31.1, still not fixed.
-config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
-	bool
-	default y if BR2_or1k
-
 # https://sourceware.org/bugzilla/show_bug.cgi?id=27597
 # Affect toolchains built with binutils 2.36.1, still not fixed.
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
