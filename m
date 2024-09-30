Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA27BCEB2C2
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 22:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 931BC606A7;
	Mon, 30 Sep 2024 22:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eO-4H0CKlC2L; Mon, 30 Sep 2024 22:31:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A63F6079C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A63F6079C;
	Mon, 30 Sep 2024 22:31:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 466191BF294
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 22:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33E214017A
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 22:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Da7m60bgoq70 for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 22:31:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC43F400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC43F400AF
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC43F400AF
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 22:31:39 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a0cad8a0a5so26102965ab.1
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 15:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727735498; x=1728340298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Navg2cc+t5GbabKQWlt0Qq/8zQTm8lvG2fEv/AyUfXI=;
 b=n+qGI5fBvqbXtupDl9JKVpQfiVuf7z3L2orjQZ1c9yEXXNUmHFTUewKR6jmE/UQQaK
 AMDuLFHTWLJin7GQa3bI3T8Fr1u0/AesGv2iTb5/z0Uuwroo/DHSMkYKsPW6DnGEYPJd
 Xh11rOJ9BwsjHrqOgSv2O2eDabbYDEWn7hCZO1cAMxHfVwXN9yNae4aIz/EHtkgvd3Kg
 UIIbLHK3d78R+y+ehYum8ZfXMgV+ClZ/uTVFO4YKHa7kl0mce0sBCF/Q1xT3j9v32V3C
 dAdKchni30o34wKX2ZRCbkoyBI/YYUmUZIIEABd6NrM9XO4t3MDBeSyKbfi33phpwsJV
 d0Yw==
X-Gm-Message-State: AOJu0YwEO5bxRU4ti6XUjIClT8IYZ/OJwpCUPToUZs9d8HwNL82V3TWF
 fY2Z9GVTI1vFJsAFGVrZV2A7/2OGyih9QLHAQ52b1wZK2MRI8YRVHIiciQ==
X-Google-Smtp-Source: AGHT+IGNQclNIBMoqMMASfdGEkJiRWqCzrppSxbzFSpBbyrPQmv6LSpmz1QZyBylJ1hDuGqpzgQ2hQ==
X-Received: by 2002:a05:6e02:1547:b0:3a2:7651:9864 with SMTP id
 e9e14a558f8ab-3a3451746e8mr114750925ab.12.1727735498363; 
 Mon, 30 Sep 2024 15:31:38 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d8888d94eesm2327929173.129.2024.09.30.15.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 15:31:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 16:31:32 -0600
Message-Id: <20240930223133.1202389-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930223133.1202389-1-james.hilliard1@gmail.com>
References: <20240930223133.1202389-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727735498; x=1728340298; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Navg2cc+t5GbabKQWlt0Qq/8zQTm8lvG2fEv/AyUfXI=;
 b=SSc55wNCNZMl50soEdZT2x0b1SeZISi5eEnqgviGqUWCcUa0s/L93feeqjPa5dkEPN
 5Da8eDo063YNEKJIvTyu/Fn3KznK985ZXbH/fTcSDJObRjbpoCcyKsSWaZCOV8eWda+Y
 hH/9NdP4UTaNXKlaPxb/LgF0+v4eFFpdzd6+bN5bQBkUM4vIqcGH8eJRq7vAwW0U6w1H
 +PlH1dL+/x4a/NE/xzzY925jZt49194lBZhrJZY7ujfmPPgkDfhgApQZzk3DEhxQwyHo
 AOlvcIn6ePUl900rSp5HYoCe1NVLq/C5SEp015Qk0a5BM9g62RqcjxxsB3TKHRB1SujS
 LJFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SSc55wNC
Subject: [Buildroot] [PATCH 3/4] package/libppd: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in          |  1 +
 package/libppd/Config.in   | 23 +++++++++++++++++++++++
 package/libppd/libppd.hash |  4 ++++
 package/libppd/libppd.mk   | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 package/libppd/Config.in
 create mode 100644 package/libppd/libppd.hash
 create mode 100644 package/libppd/libppd.mk

diff --git a/package/Config.in b/package/Config.in
index e0afe0f28b..68b313996f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2065,6 +2065,7 @@ menu "Networking"
 	source "package/libpagekite/Config.in"
 	source "package/libpcap/Config.in"
 	source "package/libpjsip/Config.in"
+	source "package/libppd/Config.in"
 	source "package/libpsl/Config.in"
 	source "package/librelp/Config.in"
 	source "package/librsync/Config.in"
diff --git a/package/libppd/Config.in b/package/libppd/Config.in
new file mode 100644
index 0000000000..5e59b81fdb
--- /dev/null
+++ b/package/libppd/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_LIBPPD
+	bool "libppd"
+	# needs fork()
+	depends on BR2_USE_MMU
+	depends on BR2_INSTALL_LIBSTDCPP # libcupsfilters -> qpdf
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_CUPS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libcupsfilters -> qpdf
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libcupsfilters -> qpdf
+	select BR2_PACKAGE_LIBCUPSFILTERS
+	help
+	  To avoid re-writing support for an obsolete format from
+	  scratch, only for retro-fitting legacy printer drivers
+	  we have created this package, libppd, the legacy support
+	  library for PPD files.
+
+	  https://github.com/OpenPrinting/libppd
+
+comment "libppd needs a toolchain w/ C++ and dynamic library, gcc >= 5"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/libppd/libppd.hash b/package/libppd/libppd.hash
new file mode 100644
index 0000000000..ee32f11bbe
--- /dev/null
+++ b/package/libppd/libppd.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  882d3c659a336e91559de8f3c76fc26197fe6e5539d9b484a596e29a5a4e0bc8  libppd-2.0.0.tar.xz
+sha256  dc67c986b28ffbea80cb508622355213e2227fe854b43b1f1092e36087829c28  COPYING
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libppd/libppd.mk b/package/libppd/libppd.mk
new file mode 100644
index 0000000000..59478340b4
--- /dev/null
+++ b/package/libppd/libppd.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# libppd
+#
+################################################################################
+
+LIBPPD_VERSION = 2.0.0
+LIBPPD_SOURCE = libppd-$(LIBPPD_VERSION).tar.xz
+LIBPPD_SITE = https://github.com/OpenPrinting/libppd/releases/download/$(LIBPPD_VERSION)
+LIBPPD_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
+LIBPPD_LICENSE_FILES = COPYING LICENSE
+LIBPPD_INSTALL_STAGING = YES
+LIBPPD_DEPENDENCIES = cups libcupsfilters
+
+LIBPPD_CONF_OPTS = \
+	--disable-mutool \
+	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
+	--with-sysroot=$(STAGING_DIR) \
+	--with-pdftops=pdftops
+
+ifeq ($(BR2_PACKAGE_GHOSTSCRIPT),y)
+LIBPPD_DEPENDENCIES += ghostscript
+LIBPPD_CONF_OPTS += --enable-ghostscript
+else
+LIBPPD_CONF_OPTS += --disable-ghostscript
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER),y)
+LIBPPD_DEPENDENCIES += poppler
+LIBPPD_CONF_OPTS += --enable-pdftops
+else
+LIBPPD_CONF_OPTS += --disable-pdftops
+endif
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
