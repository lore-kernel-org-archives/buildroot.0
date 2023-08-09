Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FC0C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04E4160EA7;
	Wed,  9 Aug 2023 21:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04E4160EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rwm0NaDNZNzx; Wed,  9 Aug 2023 21:15:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10DD360F16;
	Wed,  9 Aug 2023 21:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10DD360F16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36CB41BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10BBD4063C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10BBD4063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cK9zWdgslFUy for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:15:33 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40CC6400D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40CC6400D9
Received: from fli4l.lan.fli4l (p4fd6c449.dip0.t-ipconnect.de [79.214.196.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD2E1A4C1113;
 Wed,  9 Aug 2023 23:14:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57460)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTqVG-0001EZ-3D;
 Wed, 09 Aug 2023 23:14:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:13:54 +0200
Message-Id: <20230809211401.3587177-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809211401.3587177-1-bernd@kuhls.net>
References: <20230809211401.3587177-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691615643;
 bh=HXQmdlezp0s1wWKYUecNCPGCAlj92Fp6diyXGeIaKHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eBO0u1goCWHUorhMNPi4gGTEtqUrKt6O3F4OatHiBE7/b7AHSp0egblnmmHp5dVze
 7wCtWOAeJBd4zmhA6BvpUV3fSaF4dEhaU07yBJlTanpqjvX/aixrSrKHUNBiTowB4B
 vsxlfjHqje8wSdE8mQXJgSWBUdLVFy/AV/z04habTIAudi3YRDMjKyWye9VjTD9S3d
 VH4sHdChvjKabv5ERsK9l9WeXu1QVHwLPpALI85XR7TXty9C14gcstWEfm/HI9CpyW
 wWmPLJFFShPTBkeQ0gKck5TomLqsnI5v2H1LvAOEe8xKvBh1wwFEOupogeYE/A+aPt
 eOQa9vx763edA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=eBO0u1go
Subject: [Buildroot] [PATCH/next v3 07/14] package/python3: use upstream
 build system to disable unicodedata module
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...Add-an-option-to-disable-unicodedata.patch | 30 -------------------
 package/python3/python3.mk                    |  4 +--
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/python3/0019-Add-an-option-to-disable-unicodedata.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 6586a637dd..1cc9260d7b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1226,7 +1226,6 @@ package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
 package/python3/0016-Add-an-option-to-disable-expat.patch Upstream
 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch Upstream
 package/python3/0018-Add-an-option-to-disable-NIS.patch Upstream
-package/python3/0019-Add-an-option-to-disable-unicodedata.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
diff --git a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch b/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
deleted file mode 100644
index 74702b67a5..0000000000
--- a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4fe7f375a3d171d294caebdd7b7ce49bbc9ad9f3 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:50:27 +0100
-Subject: [PATCH] Add an option to disable unicodedata
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 1bdde7f69d..ba4b0e0c1c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4200,6 +4200,12 @@ AC_ARG_ENABLE(nis,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-   	  fi])
- 
-+AC_ARG_ENABLE(unicodedata,
-+	AS_HELP_STRING([--disable-unicodedata], [disable unicodedata]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
-+  	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4a2a19eadf..e047cf8a56 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -27,7 +27,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--with-expat=system \
 	--disable-codecs-cjk \
 	--disable-nis \
-	--enable-unicodedata \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev
@@ -41,6 +40,7 @@ HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
 	py_cv_module__curses=n/a \
 	py_cv_module__curses_panel=n/a \
+	py_cv_module_unicodedata=yes \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
@@ -130,7 +130,7 @@ PYTHON3_CONF_OPTS += --disable-codecs-cjk
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
-PYTHON3_CONF_OPTS += --disable-unicodedata
+PYTHON3_CONF_ENV += py_cv_module_unicodedata=n/a
 endif
 
 # Disable auto-detection of uuid.h (util-linux)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
