Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBF7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D9D42415;
	Sat, 23 Jul 2022 16:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D9D42415
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eeDq7zVhXgPG; Sat, 23 Jul 2022 16:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AAC342426;
	Sat, 23 Jul 2022 16:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AAC342426
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20F9C1BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F02B060F90
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F02B060F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0KrbHZPL52LN for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:56:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D12DC60ECE
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D12DC60ECE
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9302B84705; Sat, 23 Jul 2022 16:42:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 18:56:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dad510abd17c7c4a6fdab08d9c71dcf3be3eb1f5
X-Git-Newrev: 825b56371601611b812faf532d0f10a61916882f
X-Patchwork-Hint: ignore
Message-Id: <20220723164254.9302B84705@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/librtas: bump to v2.0.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=825b56371601611b812faf532d0f10a61916882f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes build fixes for musl, so remove the glibc restriction, as it
now builds fine for both musl and uclibc.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch | 46 ++++++++++++++++++++++
 package/librtas/Config.in                          |  5 ---
 package/librtas/librtas.hash                       |  2 +-
 package/librtas/librtas.mk                         |  2 +-
 4 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch b/package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch
new file mode 100644
index 0000000000..dd5f944317
--- /dev/null
+++ b/package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch
@@ -0,0 +1,46 @@
+From 148712f8a559cc613236e9e72b3ce6c24b83c373 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 23 Jul 2022 18:51:37 +0200
+Subject: [PATCH] configure.ac: remove LOCAL_CHECK_FLAGS
+
+These cause problems with Buildroot (the -fstack-protector-all check
+does only a compile test, it should do a link test), and generally the
+decision of using those flags or not should be left to Buildroot.
+
+An issue has been reported upstream at
+https://github.com/ibm-power-utilities/librtas/issues/25 to hopefully
+get a better solution.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac | 14 --------------
+ 1 file changed, 14 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c3429e8..b7208ee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -24,20 +24,6 @@ AC_TYPE_UID_T
+ AC_TYPE_UINT32_T
+ AC_TYPE_UINT64_T
+ 
+-AC_DEFUN([LOCAL_CHECK_FLAGS],[
+-  AC_REQUIRE([AX_CHECK_LINK_FLAG])
+-  AC_REQUIRE([AX_APPEND_COMPILE_FLAGS])
+-  AC_LANG_PUSH([C])
+-  AX_APPEND_COMPILE_FLAGS([-Wall])
+-  AX_APPEND_COMPILE_FLAGS([-D_FORTIFY_SOURCE=2 -fstack-protector-all])
+-  AX_APPEND_COMPILE_FLAGS([-fwrapv -fPIE -Wstack-protector])
+-  AX_APPEND_COMPILE_FLAGS([--param=ssp-buffer-size=1])
+-  AX_CHECK_LINK_FLAG([-z relro -z now])
+-  AX_CHECK_LINK_FLAG([-pie])
+-  AC_LANG_POP
+-])
+-LOCAL_CHECK_FLAGS
+-
+ LT_INIT
+ LT_LANG([C])
+ 
+-- 
+2.37.1
+
diff --git a/package/librtas/Config.in b/package/librtas/Config.in
index 11660eb281..2f8219ee98 100644
--- a/package/librtas/Config.in
+++ b/package/librtas/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBRTAS
 	bool "librtas"
 	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The librtas package provides an interface for Run-Time
 	  Abstraction Services (RTAS) calls on PAPR platforms.
@@ -9,7 +8,3 @@ config BR2_PACKAGE_LIBRTAS
 	  and parse RTAS events.
 
 	  http://librtas.sourceforge.net/
-
-comment "librtas needs a glibc toolchain"
-	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/librtas/librtas.hash b/package/librtas/librtas.hash
index de0c0a476c..8d4c4e1912 100644
--- a/package/librtas/librtas.hash
+++ b/package/librtas/librtas.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b47b2a6f140347ac265e2c66ddf68293f6cdcc7c0c9a78c6e21ff52846465415  librtas-2.0.2.tar.gz
+sha256  1b951422ec9553fa9d5e5e158fd8e298f867f561189fff6817a9540d5661f145  librtas-2.0.3.tar.gz
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LESSER
diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
index c92a9e2fa4..458d7a0e47 100644
--- a/package/librtas/librtas.mk
+++ b/package/librtas/librtas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRTAS_VERSION = 2.0.2
+LIBRTAS_VERSION = 2.0.3
 LIBRTAS_SITE = $(call github,ibm-power-utilities,librtas,v$(LIBRTAS_VERSION))
 LIBRTAS_LICENSE = LGPL-2.1+
 LIBRTAS_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
