Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37F9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 22:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FEC381971;
	Tue, 22 Feb 2022 22:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kc7JeELGfxxK; Tue, 22 Feb 2022 22:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BA8181767;
	Tue, 22 Feb 2022 22:03:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A35721BF39A
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 22:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 914C640102
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 22:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cVKYXEI7ZSEH for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 22:03:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D638400EF
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 22:03:05 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id l25so10506501oic.13
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 14:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bGrGKWGUiuRZ8hqaAqhMXbIEJZUAdwiGSy8HGt24NPQ=;
 b=ImTbxo0ZMNvouf7jwdFTrdTfrxMg1xyc4pmywsRLBqL2X/eU6dXop6STU8l3wObM/2
 Xrm5yykGbs1H80qFP/EAlZbKmMfOGDyG/m+dr5oPQAy5c5RsXZvsHJcVDr669tZ3vLkm
 ZcZKrKKb13nvorbbwOs2ajwZQpV2/Z+KsLS7oTWyALbWGSjMV71wKklZQ2wGrutMgpUR
 BoDIys8xiJn96/IbPBed+tqChQt1up/ICrjpfeYDlpJxeybvFvzRsKB6y7AFyjiSPS/4
 a39+F3olGgUvVcD/jJQxXIhjjK2gKl2aOh3tcKLegoNhaPqMYV7x6Pt20e/oRw3vjhhG
 qnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bGrGKWGUiuRZ8hqaAqhMXbIEJZUAdwiGSy8HGt24NPQ=;
 b=zyLFUVmBz/GF0b43gRzYWv5ZM2lbB/G5k00KOvEC53r8Gr7DYKsbrQtZ5/bsdd41Zi
 +gS0h+0x0iVyJsWHvo+H/QwphHpWQWNCtG5spy941grZOLi7YxZVoGtQLd6XJB2FpUyf
 4vXQ0dg+dFa8tgcHj/QrE7C38rU/qMT8zwiy8cHRlpURqtAJn9aGi6FJgXu2oebCUezx
 slbGEiFUmrkdrZ4JEJd+/RnB+gyuttnuDiaD1G4JCcUS8KgE/w+LEtnmf7m2D88ie/gl
 0fmeZ8uvJvCI1IYRwJjhYWBmPEyFhpcwGQy4MojwNgXbvpyxyqUk4//9nLpH5bu9hMoa
 jmEg==
X-Gm-Message-State: AOAM532KDC5NVfl3BpZ7Y4i0oF8MBP/4YlpgaD3GzQCXvVRor4So5qHw
 lzeiqcSM8yCk0IqwDInCFwmR68RAmipfaj8P
X-Google-Smtp-Source: ABdhPJzh7I6Xf4RsD4YQZoeB0oEb1waGn6JL7oPo++cITykRMmu7rPqBYFJKqog1ROGFKQVTsBs93A==
X-Received: by 2002:a05:6808:2110:b0:2d4:4137:b4fc with SMTP id
 r16-20020a056808211000b002d44137b4fcmr3225741oiw.111.1645567384584; 
 Tue, 22 Feb 2022 14:03:04 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id u3sm30789932oao.25.2022.02.22.14.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 14:03:04 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 23:02:55 +0100
Message-Id: <20220222220255.22327-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC][PATCH 1/1] package/bind: bump to version 9.16.26
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BIND 9.11 EOL in March, 2022. BIND 9.16 is current Stable/ESV version.

Changes:
* libuv (new dependency)
* openssl is now mandatory
* zlib must be detected with PKG_CONFIG_PATH (specifying zlib
  installation path is not supported)
* bind9-config and isc-config.sh removed
* updated COPYRIGHT hash

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

time to move on to 9.16.

Tested only local build as I don't use bind.
I'll also verify builds with utils/test-pkg.
But it'd be great if anybody could also test running bind.

Kind regards,
Petr

 package/bind/Config.in | 12 +++++++++++-
 package/bind/bind.hash |  6 +++---
 package/bind/bind.mk   | 15 +++++++--------
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index db10ceb304..9887403ed9 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_BIND
 	bool "bind"
-	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_MMU # fork(), libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on !BR2_STATIC_LIBS # libuv
+	select BR2_PACKAGE_LIBUV
+	select BR2_PACKAGE_OPENSSL
 	help
 	  BIND (Berkeley Internet Name Domain) is an
 	  implementation of the Domain Name System (DNS) protocols
@@ -24,6 +29,11 @@ config BR2_PACKAGE_BIND
 
 	  https://www.isc.org/bind/
 
+comment "bind needs a toolchain w/ NPTL, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+
 if BR2_PACKAGE_BIND
 
 config BR2_PACKAGE_BIND_SERVER
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 70299f1677..401e389e49 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.36/bind-9.11.36.tar.gz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.26/bind-9.16.26.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  c953fcb6703b395aaa53e65ff8b2869b69a5303dd60507cba2201305e1811681  bind-9.11.36.tar.gz
-sha256  cad49daa42654bc241762cd998630168a2542c8fd6fad3881e2eac1510bb6fcd  COPYRIGHT
+sha256  70b39a5eb71650358ec9ba41da3050d32aeac0aeb4a466684b23f35affa7fb45  bind-9.16.26.tar.xz
+sha256  daf6f1eddf5983ed664a2d125b619e56e2e93917c19d0d41c7586ea153ba2155  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e329c803a3..5b4c60b14c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.36
+BIND_VERSION = 9.16.26
+BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
-BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
 BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
 BIND_CPE_ID_VENDOR = isc
@@ -32,15 +32,18 @@ BIND_CONF_ENV = \
 BIND_CONF_OPTS = \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads) \
 	--without-lmdb \
-	--with-libjson=no \
+	--with-json-c=no \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
 	--enable-filter-aaaa \
 	--disable-backtrace
 
+BIND_DEPENDENCIES = libuv
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-BIND_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
+BIND_CONF_OPTS += --with-zlib
 BIND_DEPENDENCIES += zlib
+BIND_DEPENDENCIES += host-pkgconf zlib
 else
 BIND_CONF_OPTS += --without-zlib
 endif
@@ -66,7 +69,6 @@ else
 BIND_CONF_OPTS += --with-libxml2=no
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
 BIND_DEPENDENCIES += host-pkgconf openssl
 BIND_CONF_OPTS += \
 	--with-openssl=$(STAGING_DIR)/usr \
@@ -80,9 +82,6 @@ BIND_CONF_OPTS += --with-gost=yes
 else
 BIND_CONF_OPTS += --with-gost=no
 endif
-else
-BIND_CONF_OPTS += --with-openssl=no
-endif
 
 # Used by dnssec-keymgr
 ifeq ($(BR2_PACKAGE_PYTHON_PLY),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
