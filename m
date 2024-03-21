Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4743C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 18:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 703EB41789;
	Thu, 21 Mar 2024 18:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KD3IDmCf33m0; Thu, 21 Mar 2024 18:21:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3E184033F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3E184033F;
	Thu, 21 Mar 2024 18:21:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 732161BF359
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 18:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FCCF60F10
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 18:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rn48DwCkWP26 for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 18:21:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4757B60F13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4757B60F13
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4757B60F13
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 18:21:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7DEA4611AF;
 Thu, 21 Mar 2024 18:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99EDC433C7;
 Thu, 21 Mar 2024 18:21:39 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 20:21:26 +0200
Message-ID: <20240321182126.24115-3-jarkko@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240321182126.24115-1-jarkko@kernel.org>
References: <20240321182126.24115-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1711045300;
 bh=rhgC2KRXEqpiXEoioTEEsmzT/fTowei/dzrgegw8+WM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iOKbnQaaA6jruIjLl5ad99CjrEGfJRR7AdZEqjaJec8vKfX6+0V7cVIb6ieW263Zb
 Y2AgB6kVzQrX5yXowvYduTd7FzUWI3yOhNVAmO3Npt1qlN9eKL3/53dtmUa22dyxWX
 /unkPg1WVdA45VYpobPwyDqKnmzMATUq6Kh2Y18LvixOdIFa7YlRTa0lOYof6fegH+
 7T8RJS2S0eo/Sr62SuuHNu5+FNgZwnvHr6RIxCnkRbW5fiiqgTadK1C4A094RxiuRP
 G7CATipnHzlvAzEXBJ2NjFQCz5p3sALJC49vemO/eShMESIpgNTGueqyPqVII1yzlc
 0eopYyI3PEr1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=iOKbnQaa
Subject: [Buildroot] [PATCH RFC 2/2] package/swtpm: add host package
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add swtpm and its dependency libtpms to host packages. These are useful
for emulating TPM in QEMU environment.

Link: https://gitlab.com/jarkkojs/linux-tpmdd-test
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 package/libtpms/Config.in                     |  9 ++++
 package/libtpms/libtpms.hash                  |  1 +
 package/libtpms/libtpms.mk                    | 15 ++++++
 .../0001-comment-out-expect-and-socat.patch   | 46 +++++++++++++++++++
 package/swtpm/Config.host.in                  |  8 ++++
 package/swtpm/swtpm.hash                      |  1 +
 package/swtpm/swtpm.mk                        | 17 +++++++
 7 files changed, 97 insertions(+)
 create mode 100644 package/libtpms/Config.in
 create mode 100644 package/libtpms/libtpms.hash
 create mode 100644 package/libtpms/libtpms.mk
 create mode 100644 package/swtpm/0001-comment-out-expect-and-socat.patch
 create mode 100644 package/swtpm/Config.host.in
 create mode 100644 package/swtpm/swtpm.hash
 create mode 100644 package/swtpm/swtpm.mk

diff --git a/package/libtpms/Config.in b/package/libtpms/Config.in
new file mode 100644
index 0000000000..7ef61cf53c
--- /dev/null
+++ b/package/libtpms/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBTPMS
+	bool "libtpms"
+        depends on BR2_USE_WCHAR # glib2
+        depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+        depends on BR2_USE_MMU # glib2
+	help
+	  TPM emulation library
+
+	  https://github.com/stefanberger/libtpms
diff --git a/package/libtpms/libtpms.hash b/package/libtpms/libtpms.hash
new file mode 100644
index 0000000000..c31d824af6
--- /dev/null
+++ b/package/libtpms/libtpms.hash
@@ -0,0 +1 @@
+sha256  2807466f1563ebe45fdd12dd26e501e8a0c4fbb99c7c428fbb508789efd221c0  v0.9.6.tar.gz
diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
new file mode 100644
index 0000000000..5b1151baff
--- /dev/null
+++ b/package/libtpms/libtpms.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libtpms
+#
+################################################################################
+
+LIBTPMS_VERSION = v0.9.6
+LIBTPMS_SOURCE = $(LIBTPMS_VERSION).tar.gz
+LIBTPMS_SITE = $(call github,stefanberger,libtpms,$(LIBTPMS_VERSION))
+LIBTPMS_LICENSE = BSD-3-Clause
+LIBTPMS_INSTALL_STAGING = YES
+LIBTPMS_AUTORECONF = YES
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/swtpm/0001-comment-out-expect-and-socat.patch b/package/swtpm/0001-comment-out-expect-and-socat.patch
new file mode 100644
index 0000000000..09dcc49a7b
--- /dev/null
+++ b/package/swtpm/0001-comment-out-expect-and-socat.patch
@@ -0,0 +1,46 @@
+From 067c32ba93774b273de9af872b5587798dcabb15 Mon Sep 17 00:00:00 2001
+From: Jarkko Sakkinen <jarkko@kernel.org>
+Date: Tue, 19 Dec 2023 05:21:20 +0200
+Subject: [PATCH] configure.ac: comment out "expect" and "socat"
+
+Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
+---
+ configure.ac | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 49caf96..4acc763 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -394,20 +394,20 @@ AS_IF([test "x$enable_default_pcr_banks" != "x"],[
+ pcr_bank_checks
+ AC_SUBST([DEFAULT_PCR_BANKS])
+ 
+-AC_PATH_PROG([EXPECT], expect)
+-if test "x$EXPECT" = "x"; then
+-	AC_MSG_ERROR([expect is required: expect package])
+-fi
++# AC_PATH_PROG([EXPECT], expect)
++# if test "x$EXPECT" = "x"; then
++# 	AC_MSG_ERROR([expect is required: expect package])
++# fi
+ 
+ AC_PATH_PROG([GAWK], gawk)
+ if test "x$GAWK" = "x"; then
+ 	AC_MSG_ERROR([gawk is required: gawk package])
+ fi
+ 
+-AC_PATH_PROG([SOCAT], socat)
+-if test "x$SOCAT" = "x"; then
+-	AC_MSG_ERROR([socat is required: socat package])
+-fi
++# AC_PATH_PROG([SOCAT], socat)
++# if test "x$SOCAT" = "x"; then
++# 	AC_MSG_ERROR([socat is required: socat package])
++# fi
+ 
+ AC_PATH_PROG([BASE64], base64)
+ if test "x$BASE64" = "x"; then
+-- 
+2.40.1
+
diff --git a/package/swtpm/Config.host.in b/package/swtpm/Config.host.in
new file mode 100644
index 0000000000..e77eea2aa5
--- /dev/null
+++ b/package/swtpm/Config.host.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_SWTPM
+	bool "swtpm-host"
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
+	help
+	  Compiles SWTPM software TPM emulator for the host.
+
+	  https://github.com/stefanberger/swtpm
diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
new file mode 100644
index 0000000000..882f06d7a5
--- /dev/null
+++ b/package/swtpm/swtpm.hash
@@ -0,0 +1 @@
+sha256 7bba52aa41090f75087034fac5fe8daed10c3e7e7234df7c9558849318927f41  v0.8.1.tar.gz
diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
new file mode 100644
index 0000000000..79fbf1f420
--- /dev/null
+++ b/package/swtpm/swtpm.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# swtpm
+#
+################################################################################
+
+SWTPM_VERSION = v0.8.1
+SWTPM_SOURCE = $(SWTPM_VERSION).tar.gz
+SWTPM_SITE = $(call github,stefanberger,swtpm,$(SWTPM_VERSION))
+SWTPM_LICENSE = BSD-3-Clause
+SWTPM_AUTORECONF = YES
+
+HOST_SWTPM_DEPENDENCIES = host-libtasn1 host-openssl host-pkgconf host-json-glib host-libtpms
+HOST_SWTPM_CONF_ENV = PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)"
+HOST_SWTPM_CONF_OPTS = --without-seccomp
+
+$(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
