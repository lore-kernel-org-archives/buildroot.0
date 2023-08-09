Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294ADC001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB94741A05;
	Wed,  9 Aug 2023 17:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB94741A05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n3j9_Ct1M2no; Wed,  9 Aug 2023 17:35:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9108B418DD;
	Wed,  9 Aug 2023 17:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9108B418DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 718781BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53FD641929
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53FD641929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QuuJwEJwkr3q for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:35:14 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26F1741938
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26F1741938
Received: from fli4l.lan.fli4l (p54a1be35.dip0.t-ipconnect.de [84.161.190.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 25F5DA4C1110;
 Wed,  9 Aug 2023 19:33:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34482)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTn3v-0001yu-2w;
 Wed, 09 Aug 2023 19:33:35 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 19:33:26 +0200
Message-Id: <20230809173334.2514813-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809173334.2514813-1-bernd@kuhls.net>
References: <20230809173334.2514813-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691602416;
 bh=vQNFNcS5P7NfImf0P8tso4y6n6G4t0KZGVLjosd9Ngs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nGz2M5nUAmDrHqzzQGHIzKxKfKjr02KfZ4wrrfQ44rxRbgyTqra8A9YmM4BudHAVR
 +SwEPvTVvIK30s0rUuU1vaHfXa3jGIOv7mQZKt4dnXf2CAOUfI66kuhw+J8bl03TxR
 NX5yo7kDhinEiO5vRvtSQDPhPWn1FzT4GDTk7cUA3hGMdbQC/7xfGfOyrB0aeEt/i3
 zMt0GSfeDtMsyRf1pUB3+wDKsPw/9zBdX7RgR+0MN+Xck61X6pX4fcCV9MRHcdemtm
 f5qzTGROR3IdCc9EBYlOsNi44BYj+sbxmk06ZF/YfRkRDHl4l15UJTY7lLQc2CqH9A
 vxIBdhLBSTTYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=nGz2M5nU
Subject: [Buildroot] [PATCH/next v2 08/16] package/python3: use upstream
 build system to disable ossaudiodev module
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
 ...on-to-disable-the-ossaudiodev-module.patch | 30 -------------------
 package/python3/python3.mk                    |  6 ++--
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 7bc62afa59..10a9011f3b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1226,7 +1226,6 @@ package/python3/0018-Add-an-option-to-disable-NIS.patch Upstream
 package/python3/0019-Add-an-option-to-disable-unicodedata.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
-package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
diff --git a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
deleted file mode 100644
index 56713a7f8f..0000000000
--- a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d48d9da534cec7891ae444b4ab94a76ac67f5daa Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:51:58 +0100
-Subject: [PATCH] Add an option to disable the ossaudiodev module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index e6b1f1e9de..db33d567ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3678,6 +3678,12 @@ fi
- 
- AC_MSG_RESULT($with_decimal_contextvar)
- 
-+AC_ARG_ENABLE(ossaudiodev,
-+	AS_HELP_STRING([--disable-ossaudiodev], [disable OSSAUDIODEV]),
-+	[ if test "$enableval" = "no"; then
-+	  DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ossaudiodev"
-+	  fi])
-+
- # Check for libmpdec machine flavor
- AC_MSG_CHECKING(for decimal libmpdec machine)
- AS_CASE([$ac_sys_system],
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 596bf44b56..4a2a19eadf 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -156,10 +156,8 @@ else
 PYTHON3_CONF_ENV += py_cv_module_zlib=n/a
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
-PYTHON3_CONF_OPTS += --enable-ossaudiodev
-else
-PYTHON3_CONF_OPTS += --disable-ossaudiodev
+ifneq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
+PYTHON3_CONF_ENV += py_cv_module_ossaudiodev=n/a
 endif
 
 # Make python believe we don't have 'hg', so that it doesn't try to
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
