Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E30CFC9EF5
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 11:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 338A684244;
	Sat,  7 Mar 2026 11:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_TItrHyDARq; Sat,  7 Mar 2026 11:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 092CA8423F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772882467;
	bh=UnHI0QZuCQo20baTL5VkRoJ2w4gr4MkPEradoTEqYBI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AbVef6Z2aP4XS/MjbQZAUtG4QRg1TI4cLEW4x/e9LInJikotjJbskwNtiagGLLe1J
	 CD5OdPhDkoLbGgYJQmaC6n8lWi485WhP7yq2+LY5dvlEnlGR9C26hq+awLSGkidLbH
	 hf3ZFewit0P6Xme4X7d0vxiT+j6IIVe7HVlcE/SOrcYPnDz2wTprmJcDr7ehGpOj90
	 hkpHtaYBOZHjzwAXv3Kp5lbUbG/ag0HjBvLnqcvi4GsRYdFlRQiZ9O1FLfLkR9xJSO
	 HrOi3iOOoRo7DqWEXUig80XiISsCL1JLV0tIJuwxqpxJ0NmKdZbX2Fms11A5br3/F6
	 1tl9AxzVxXMJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 092CA8423F;
	Sat,  7 Mar 2026 11:21:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2BB925B
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B920E610E0
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-3HABFfxNyC for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 11:21:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C76361078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C76361078
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C76361078
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:21:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 321D0A4C3781
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 12:20:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vypiL-000000004DY-3IWg
 for buildroot@buildroot.org; Sat, 07 Mar 2026 11:20:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  7 Mar 2026 12:20:55 +0100
Message-ID: <20260307112057.31154-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260307112057.31154-1-bernd@kuhls.net>
References: <20260307112057.31154-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772882458;
 bh=O6MFCrkZtTvQGxqKC6bhasTb7Wka8N6R4ZB7QXGkgu4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=UvbCPco0RV9zUcjn+O4/dNuGk9FtdwWrijXM+PpUVQYPDCMm6l5B2M5MoGxl/nqwk
 waFmpeKKlLCi1IJ6sNlTl88HGQKMnv0Wj+MfkRvr11PURkY1lA/4fv6WPyijZgKUnO
 dSlYCHlb7f3WAmB3Q5iItueQPLYKKI28JhyNpjS7Amp8TPB02eINCJWz/ZQeitWhfF
 3VwAeGs+9s7ziS4yTELfyXdhhKi2koiyE4QCQdQhNGbnq/l+gWKdKL4RqgjhvMsIH9
 zbcuS3TOv0+mMyRY5iA5NboEkPSJacWP+595Prs3sdtSDmoX/kZVYdU2ADRfRPJRAn
 fJ0n1xl2XVWzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UvbCPco0
Subject: [Buildroot] [PATCH 2/4] package/openswan: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

last release: Jan 2021
last commit: Feb 2021
open issues: 122 (youngest from Aug 2024)
open PR: 2 (youngest from Feb 2021)

Debian removed the package in 2014:
https://tracker.debian.org/pkg/openswan

Fedora removed the package in 2013:
https://src.fedoraproject.org/rpms/openswan/commits/rawhide
"Obsoleted by libreswan"

https://github.com/libreswan/libreswan
"Libreswan was forked from Openswan 2.6.38"

The Openswan package causes autobuilder errors with gcc 14.x.
The earliest build error to be found dates back to Jul 2024:
https://autobuild.buildroot.net/results/8f1/8f109654affea46a18d42bf494d1f3a83084fcdc/build-end.log

/home/autobuild/autobuild/instance-7/output-1/build/openswan-3.0.0/programs/pluto/crypto.c:99:18:
 error: initialization of 'void (*)(void *, const u_char *, size_t)'
 {aka 'void (*)(void *, const unsigned char *, unsigned int)'} from
 incompatible pointer type 'void (*)(void *, const unsigned char *,
 long unsigned int)' [-Wincompatible-pointer-types]
   99 |     hash_update: osMD5Update,

Fixes:
https://autobuild.buildroot.net/results/bac/bacc1790d17992413503a4d62fe11ec56d0a8edc/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  7 +++
 package/Config.in                             |  1 -
 ...constants.c-workaround-missing-ns_t_.patch | 29 ------------
 package/openswan/Config.in                    | 15 -------
 package/openswan/openswan.hash                |  4 --
 package/openswan/openswan.mk                  | 44 -------------------
 7 files changed, 7 insertions(+), 94 deletions(-)
 delete mode 100644 package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch
 delete mode 100644 package/openswan/Config.in
 delete mode 100644 package/openswan/openswan.hash
 delete mode 100644 package/openswan/openswan.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 200bb1aff8..6c273d0a48 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -723,7 +723,6 @@ package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch lib_pa
 package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch lib_patch.Upstream
 package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch lib_patch.Upstream
 package/openrc/0006-Also-create-run-lock-subsys-directory.patch lib_patch.Upstream
-package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch lib_patch.Upstream
 package/opentyrian/0001-Move-definitions-that-don-t-need-to-be-exposed-from-opl-h-to-opl-c.patch lib_patch.Upstream
 package/openvmtools/0001-no_cflags_werror.patch lib_patch.Upstream
 package/openvmtools/0002-dont-force-cppflags.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 2f1a5cafd6..17eca307e9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_OPENSWAN
+	bool "openswan removed"
+	select BR2_LEGACY
+	help
+	  Openswan was no longer maintained upstream, so it has
+	  been dropped.
+
 config BR2_PACKAGE_RUBIX
 	bool "rubix removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 4011946695..4ad7c1e22b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2567,7 +2567,6 @@ endif
 	source "package/openobex/Config.in"
 	source "package/openresolv/Config.in"
 	source "package/openssh/Config.in"
-	source "package/openswan/Config.in"
 	source "package/openvpn/Config.in"
 	source "package/p910nd/Config.in"
 	source "package/parprouted/Config.in"
diff --git a/package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch b/package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch
deleted file mode 100644
index ea50dd11ad..0000000000
--- a/package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 66f8abe037970dda50fbc460edb2a2fa9f391d8a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 3 Aug 2022 19:14:25 +0200
-Subject: [PATCH] lib/libopenswan/constants.c: workaround missing ns_t_tkey
- definition in uClibc < 1.0.41
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- lib/libopenswan/constants.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/lib/libopenswan/constants.c b/lib/libopenswan/constants.c
-index 90c973b5f..04e68da42 100644
---- a/lib/libopenswan/constants.c
-+++ b/lib/libopenswan/constants.c
-@@ -1411,7 +1411,9 @@ static const char *const rr_qtype_name[] = {
- 	NULL
-     };
- 
--enum_names rr_qtype_names = { ns_t_tkey, ns_t_any
-+/* ns_t_tkey is 249, but its definition is missing from uClibc <
-+ * 1.0.41, so let's hardcode it */
-+enum_names rr_qtype_names = { 249 /* ns_t_tkey */, ns_t_any
- 			      , rr_qtype_name, &rr_type_names };
- 
- static const char *const rr_class_name[] = {
--- 
-2.37.1
-
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
deleted file mode 100644
index 31c4a66b35..0000000000
--- a/package/openswan/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_OPENSWAN
-	bool "openswan"
-	depends on BR2_USE_MMU # iproute2
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2
-	select BR2_PACKAGE_GMP
-	select BR2_PACKAGE_IPROUTE2
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
-	help
-	  Openswan is an implementation of IPsec for Linux
-
-	  http://www.openswan.org
-
-comment "openswan needs a toolchain w/ headers >= 3.4"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
deleted file mode 100644
index 574009ebfb..0000000000
--- a/package/openswan/openswan.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated
-sha256  69fe7a71e54aaf0ea93b874db4963057c1ff4904b3617b36f2c9be2010c23331  openswan-3.0.0.tar.gz
-sha256  1c36ae1e7b0f6cce4b4ffe969b71f83635734804acdd38544443564b00f8783a  COPYING
-sha256  d7d012ef3be47faffba4d97a83d4986c9f4a63ac997ebf5961d33852e5f1801a  LICENSE
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
deleted file mode 100644
index 64218810f8..0000000000
--- a/package/openswan/openswan.mk
+++ /dev/null
@@ -1,44 +0,0 @@
-################################################################################
-#
-# openswan
-#
-################################################################################
-
-OPENSWAN_VERSION = 3.0.0
-OPENSWAN_SITE = $(call github,xelerance,Openswan,v$(OPENSWAN_VERSION))
-OPENSWAN_LICENSE = GPL-2.0+, BSD-3-Clause
-OPENSWAN_LICENSE_FILES = COPYING LICENSE
-OPENSWAN_CPE_ID_VENDOR = xelerance
-
-OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
-OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" POD2MAN="" XMLTO="" \
-	USERCOMPILE="$(TARGET_CFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
-	USERLINK="$(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
-	INC_USRLOCAL=/usr USE_KLIPS=false USE_MAST=false USE_NM=false \
-	USE_NOMANINSTALL=true WERROR=""
-
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-OPENSWAN_DEPENDENCIES += libcurl
-OPENSWAN_MAKE_OPTS += USE_LIBCURL=true
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-OPENSWAN_DEPENDENCIES += libxcrypt
-endif
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-OPENSWAN_DEPENDENCIES += openssl
-OPENSWAN_MAKE_OPTS += HAVE_OPENSSL=true
-endif
-
-define OPENSWAN_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
-		$(OPENSWAN_MAKE_OPTS) programs
-endef
-
-define OPENSWAN_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
-		$(OPENSWAN_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
