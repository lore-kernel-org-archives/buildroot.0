Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24402C44539
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 09:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A76CE80E7A;
	Wed, 22 Jul 2026 09:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6A_SkRU_jet; Wed, 22 Jul 2026 09:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89BDE80E3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784713447;
	bh=4kkr28s9327tkD8bkcF3yJLs/p0HRcMNLSS/WQ6ynl0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=MkhshooRlZaHKTB08yKpRRxKyLwn4qmO44JcIlABB5sWVmn1eKJFKKmJH8e5SQJSm
	 KHATVrt9jjkQg+JKNREeAyOMaw1WvglFtn2DVSxAwuY4RYZKpso5jfrC5XxW8oz0ZV
	 P5e4Dt372SXiMxrt4HWV1ic2PYztGdldNvqMBaUmgBth0bOAyGxiA9q+nxqNVrDC1J
	 Hj7T9TEy1+cREHMO8UvA0vVU616upa/4ZuiVOHT840qiqsaSEwKqVS0DVaGTzy2YDP
	 FVuLVFK2FiYCI34D2WTyh1+95Czq0IY/bfkfCNlRuiiR2YMQXmSS5+Jx9/CP3WvkaV
	 brBX1qFarM8Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BDE80E3F;
	Wed, 22 Jul 2026 09:44:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B652109C
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 09:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D6B8407DE
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 09:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfMHBdLRHE_5 for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 09:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA352407D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA352407D9
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA352407D9
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 09:44:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E7981814BD; Wed, 22 Jul 2026 11:44:00 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 22 Jul 2026 11:43:30 +0200
Message-ID: <20260722094344.153516-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1784713442; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=lsnfVCyrvpxUiwmCDAqMRjVDygoM8guZUv02kEugKeY=;
 b=sLc9mJc0eBr+ekpTPCGN9UqZhicZJDmZyNahXwRWd40aUnrM+tW98G+lhL/EzX3TnIMXQ5
 dJIUstjAN+XQ65uHN9yoW/V3p4nRlpStL9Rk5TfmuQInCfAlm7wz0yPgel/9w1KMFVK00c
 zy92xetAHc6yXuLfyPjxOIon0I+lfHA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=sLc9mJc0
Subject: [Buildroot] [PATCH] package/libgpiod2: bump to version 2.3.1
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Boerge Struempfel <boerge.struempfel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- buildsystem changed from autotools to meson
- add option to install dbus-server and client

changelog:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.3.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/libgpiod2/Config.in      | 10 ++++++++++
 package/libgpiod2/libgpiod2.hash |  2 +-
 package/libgpiod2/libgpiod2.mk   | 29 ++++++++++++++++++-----------
 3 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/package/libgpiod2/Config.in b/package/libgpiod2/Config.in
index 5a13bfc344..80b84160fd 100644
--- a/package/libgpiod2/Config.in
+++ b/package/libgpiod2/Config.in
@@ -16,6 +16,16 @@ config BR2_PACKAGE_LIBGPIOD2
 
 if BR2_PACKAGE_LIBGPIOD2
 
+if BR2_PACKAGE_HAS_UDEV
+
+config BR2_PACKAGE_LIBGPIOD2_DBUS
+	bool "install dbus-server and client"
+	select BR2_PACKAGE_LIBGUDEV
+	help
+	  Include dbus-server and client for managing GPIOs.
+
+endif
+
 config BR2_PACKAGE_LIBGPIOD2_TOOLS
 	bool "install tools"
 	help
diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index a12752261a..48f7c77855 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592  libgpiod-2.2.4.tar.xz
+sha256  e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54b3566484650a30  libgpiod-2.3.1.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index d83fdbd94a..d74c98684c 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.2.4
+LIBGPIOD2_VERSION = 2.3.1
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
@@ -14,27 +14,34 @@ LIBGPIOD2_LICENSE_FILES = COPYING
 LIBGPIOD2_INSTALL_STAGING = YES
 LIBGPIOD2_DEPENDENCIES = host-pkgconf
 LIBGPIOD2_CONF_OPTS = \
-	--disable-bindings-python \
-	--disable-examples \
-	--disable-tests
+	-Dbindings-python=disabled \
+	-Dexamples=disabled \
+	-Dtests=disabled
+
+ifeq ($(BR2_PACKAGE_LIBGPIOD2_DBUS),y)
+LIBGPIOD2_CONF_OPTS += -Ddbus=enabled
+LIBGPIOD2_DEPENDENCIES += libgudev
+else
+LIBGPIOD2_CONF_OPTS += -Ddbus=disabled
+endif
 
 ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
-LIBGPIOD2_CONF_OPTS += --enable-tools
+LIBGPIOD2_CONF_OPTS += -Dtools=enabled
 else
-LIBGPIOD2_CONF_OPTS += --disable-tools
+LIBGPIOD2_CONF_OPTS += -Dtools=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 LIBGPIOD2_DEPENDENCIES += libedit
-LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
+LIBGPIOD2_CONF_OPTS += -Dgpioset-interactive=enabled
 else
-LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
+LIBGPIOD2_CONF_OPTS += -Dgpioset-interactive=disabled
 endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
+LIBGPIOD2_CONF_OPTS += -Dbindings-cxx=enabled
 else
-LIBGPIOD2_CONF_OPTS += --disable-bindings-cxx
+LIBGPIOD2_CONF_OPTS += -Dbindings-cxx=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
