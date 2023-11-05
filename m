Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48F3C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 22:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B329400CB;
	Sun,  5 Nov 2023 22:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B329400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-heElwM0CYd; Sun,  5 Nov 2023 22:06:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1087403AE;
	Sun,  5 Nov 2023 22:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1087403AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36C0C1BF410
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 22:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FBC981EAD
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 22:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FBC981EAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TaUNtvdSdoJ for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 22:06:07 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B60C081EAC
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 22:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B60C081EAC
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c504a5e1deso51645921fa.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 14:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699221964; x=1699826764;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RDffHYUuVFDKYLHy+Xr495LI/HpCkKjASFyDppZnpAg=;
 b=j2PyXu6kTqs+Tn0RlQudjiGkiMEXEEPD3DJ4HFlQzo38d6+dFngsFfjWrgPX+VyyVZ
 TCmEe8+ahdh5cjR9NnGrgjZ0m00KIXYyI+2l9K7kumAj7e1d2+qtG07dYeTde5JlVKpO
 Gx0fa/EHkn8mzn0GZl0HmJCandq4BivQA1H9zxbe4QX8fTKpnVpFYaQ5I4Jq+tEoK1Ij
 9svdqnm9XrHhfO3unehhJjvi3sHnYP29n59HXoqBO44EuXNs/XGOXMDs2q+R/XEbTaqU
 LsIaXBpZyLqH+6I1OuF+cxuaqJaE7+pr6Lh4uiGBJQO/3TJoHp74KTyS0xlXo5xW4bai
 5XPA==
X-Gm-Message-State: AOJu0Yx/kriQ/Vnm4squJQS3PiVwQJLRNVe4ah7Yk6HVdJHztgJ7XDxu
 iIxf5xbx3ly/427fgkHxZSB+G4KlB0k=
X-Google-Smtp-Source: AGHT+IHY+FPQyQVZmWqe+LqGM2qYj4FdkAxfrNCSQdECOgKJCbRu/W08STRdz9AjJYkFvOHABMSh5w==
X-Received: by 2002:a2e:978f:0:b0:2c1:9a8b:f67 with SMTP id
 y15-20020a2e978f000000b002c19a8b0f67mr21623390lji.1.1699221963597; 
 Sun, 05 Nov 2023 14:06:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c419600b00401d8181f8bsm9838902wmh.25.2023.11.05.14.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 14:06:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 23:06:01 +0100
Message-ID: <20231105220601.383892-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699221964; x=1699826764; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RDffHYUuVFDKYLHy+Xr495LI/HpCkKjASFyDppZnpAg=;
 b=MU05q1VQmc9p6IdhKnhfor22zZAdm/vmsUxrFOpq3Q1Yi4e8mDUCkXlBwr87o9mx4m
 8sfwHpZhQyJe+zqHYzN2OZxrxNHMr4S4OmCZFLV3PpLZxla0ppwsjATD8SFIY2nhvLsa
 QP5dafdQ/26B0iTw+iihsulci39XGKL2Pph2Hrgf3NszlZzHEum3UxNYazu01lSc5Y29
 aRdLAeps4YauwH2G55C6Na/scKhzG+l2TlJ5IQjlMaEUlr0tv1Pd94xznN/UGkwfU5X7
 Ma+ipMpef+O/Np6674DBbV0BR6zs3r1oyvXpAgrGjQG3V2bNgaphDDxhLVl3vMZwzZI1
 FWvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MU05q1VQ
Subject: [Buildroot] [PATCH 1/1] package/librtas: bump to version 2.0.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- host-pkgconf is a mandatory dependency to run autoreconf (even when
  cmocka-based tests are disabled) since
  https://github.com/ibm-power-utilities/librtas/commit/b62ecd42180d7ac7b32cac6a50802455850a857a

https://github.com/ibm-power-utilities/librtas/blob/v2.0.5/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...onfigure.ac-remove-LOCAL_CHECK_FLAGS.patch | 46 -------------------
 package/librtas/librtas.hash                  |  2 +-
 package/librtas/librtas.mk                    |  3 +-
 4 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 0c67afdd7e..2e680193ef 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -726,7 +726,6 @@ package/libpthsem/0001-fix-build-on-linux-3.x-host.patch Upstream
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch Upstream
 package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch Upstream
 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch Upstream
-package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch Upstream
 package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch Upstream
 package/libselinux/0001-fix-musl-build.patch Upstream
 package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch Upstream
diff --git a/package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch b/package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch
deleted file mode 100644
index dd5f944317..0000000000
--- a/package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 148712f8a559cc613236e9e72b3ce6c24b83c373 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 23 Jul 2022 18:51:37 +0200
-Subject: [PATCH] configure.ac: remove LOCAL_CHECK_FLAGS
-
-These cause problems with Buildroot (the -fstack-protector-all check
-does only a compile test, it should do a link test), and generally the
-decision of using those flags or not should be left to Buildroot.
-
-An issue has been reported upstream at
-https://github.com/ibm-power-utilities/librtas/issues/25 to hopefully
-get a better solution.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 14 --------------
- 1 file changed, 14 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c3429e8..b7208ee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -24,20 +24,6 @@ AC_TYPE_UID_T
- AC_TYPE_UINT32_T
- AC_TYPE_UINT64_T
- 
--AC_DEFUN([LOCAL_CHECK_FLAGS],[
--  AC_REQUIRE([AX_CHECK_LINK_FLAG])
--  AC_REQUIRE([AX_APPEND_COMPILE_FLAGS])
--  AC_LANG_PUSH([C])
--  AX_APPEND_COMPILE_FLAGS([-Wall])
--  AX_APPEND_COMPILE_FLAGS([-D_FORTIFY_SOURCE=2 -fstack-protector-all])
--  AX_APPEND_COMPILE_FLAGS([-fwrapv -fPIE -Wstack-protector])
--  AX_APPEND_COMPILE_FLAGS([--param=ssp-buffer-size=1])
--  AX_CHECK_LINK_FLAG([-z relro -z now])
--  AX_CHECK_LINK_FLAG([-pie])
--  AC_LANG_POP
--])
--LOCAL_CHECK_FLAGS
--
- LT_INIT
- LT_LANG([C])
- 
--- 
-2.37.1
-
diff --git a/package/librtas/librtas.hash b/package/librtas/librtas.hash
index 8d4c4e1912..6f8628cca8 100644
--- a/package/librtas/librtas.hash
+++ b/package/librtas/librtas.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1b951422ec9553fa9d5e5e158fd8e298f867f561189fff6817a9540d5661f145  librtas-2.0.3.tar.gz
+sha256  b4928b300350c12618563a051be01189275853fd8eacaac509c9aa1460991ec4  librtas-2.0.5.tar.gz
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LESSER
diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
index 458d7a0e47..804d6de191 100644
--- a/package/librtas/librtas.mk
+++ b/package/librtas/librtas.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LIBRTAS_VERSION = 2.0.3
+LIBRTAS_VERSION = 2.0.5
 LIBRTAS_SITE = $(call github,ibm-power-utilities,librtas,v$(LIBRTAS_VERSION))
 LIBRTAS_LICENSE = LGPL-2.1+
 LIBRTAS_LICENSE_FILES = COPYING.LESSER
 LIBRTAS_INSTALL_STAGING = YES
 # From git
 LIBRTAS_AUTORECONF = YES
+LIBRTAS_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
