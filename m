Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0609AC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B315F41B0E;
	Mon, 18 Dec 2023 19:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B315F41B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cS6Tt9sDd6vC; Mon, 18 Dec 2023 19:41:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5EDF4187F;
	Mon, 18 Dec 2023 19:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5EDF4187F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 847821BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6980940648
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6980940648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcHiLajdUSug for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:13 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 145D640463
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 145D640463
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d3b8184a84so6958735ad.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928411; x=1703533211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i4O6LydNN/H8SwBx8wsZgSnzclke6A7a3maoWyEKExo=;
 b=HrlPtP+zxK+Yy5oX9jSiUBTdBLSf7+acNhxzGg7RzjYUPb0GtJGzysW6K0x3vG7xBb
 T8W2DDXBuey+bCMUzhIYYlnNZeQNLRUJjnEm7lQICwz7ysOAgegdhXOQ0z+c6DnC74Ch
 xBvSA8PmfF7eeruxZ1aX0LhkrNDFpN3JU2gEWdcEHzfJeR+OKc4bHJO5xj1GCo8ZvXS1
 vDpgMws7SNCJvmo7eheZYzM3bigazvih2QK8NFbFFaN512dE7WWdiAJbcRLWPWsPKsNQ
 kfkgK1nmh8gHtPBcmjAKu7tzcM1A7clCEsxD9iEDH5yGIVdK7HwfizXM/yoSE/mPOINC
 OvZw==
X-Gm-Message-State: AOJu0YwPKbchOw8BKrhRNZbgy0QrOPOFE6ViX5PavkSNE7/G6bVKSfVI
 r/rjkMVxiHpCl2Du7j6busKWg6PK2uQvE5hIbI4=
X-Google-Smtp-Source: AGHT+IENC3oIAp6ZdSq8iAeyJ9IGiaY04etl8kQ3z9OVEoWSPbY9QWC2OoxB5fafEwBB0MaOw7HMTg==
X-Received: by 2002:a17:902:d58e:b0:1d3:141:cb0f with SMTP id
 k14-20020a170902d58e00b001d30141cb0fmr8011536plh.28.1702928411509; 
 Mon, 18 Dec 2023 11:40:11 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:10 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:51 -0700
Message-ID: <20231218194001.544887-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928411; x=1703533211;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4O6LydNN/H8SwBx8wsZgSnzclke6A7a3maoWyEKExo=;
 b=TP1DV8TTZPkhNHSHPYK9M/JKeFvBDzpWMTJjuSGJbSi1fvTvqkNRCbbE9YS/RvqkCp
 tXYUPy1btO93Far68wOUUMPvS5M7VabfuWMrllPcd5MgenZRXZTVKznrDs6K6ejtFn1i
 FTb2xyqLIqIbS0ZFp4zzUqiDw4z8pEUdP6loA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TP1DV8TT
Subject: [Buildroot] [PATCH v2 06/14] package/libutempter: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-force-symlink-creation.patch         | 36 +++++++++++++++++++
 package/libutempter/Config.in                 | 11 ++++++
 package/libutempter/libutempter.hash          |  3 ++
 package/libutempter/libutempter.mk            | 27 ++++++++++++++
 6 files changed, 79 insertions(+)
 create mode 100644 package/libutempter/0001-force-symlink-creation.patch
 create mode 100644 package/libutempter/Config.in
 create mode 100644 package/libutempter/libutempter.hash
 create mode 100644 package/libutempter/libutempter.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5d710bbb46..027604e495 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -39,6 +39,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/libutempter/
 F:	package/python-kmod/
 F:	package/python-versioneer/
 F:	package/tllist/
diff --git a/package/Config.in b/package/Config.in
index 36e29d4fa2..2887538147 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2163,6 +2163,7 @@ menu "Other"
 	source "package/libunwind/Config.in"
 	source "package/liburcu/Config.in"
 	source "package/liburing/Config.in"
+	source "package/libutempter/Config.in"
 	source "package/libuv/Config.in"
 	source "package/lightning/Config.in"
 	source "package/linux-pam/Config.in"
diff --git a/package/libutempter/0001-force-symlink-creation.patch b/package/libutempter/0001-force-symlink-creation.patch
new file mode 100644
index 0000000000..c30928afd5
--- /dev/null
+++ b/package/libutempter/0001-force-symlink-creation.patch
@@ -0,0 +1,36 @@
+From 13e0a4ca67d860bc8f1e3b2ad6a3926758d76b47 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Wed, 22 Nov 2023 14:09:13 -0700
+Subject: [PATCH] force symlink creation
+
+Force symlink creation to avoid errors when reinstalling
+
+Upstream: https://github.com/altlinux/libutempter/pull/5
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8c90121..1cfc627 100644
+--- a/Makefile
++++ b/Makefile
+@@ -83,12 +83,12 @@ install:
+ 	$(INSTALL) -p -m644 $(PROJECT).h $(DESTDIR)$(includedir)/
+ 	$(INSTALL) -p -m755 $(SHAREDLIB) $(DESTDIR)$(libdir)/$(SHAREDLIB).$(VERSION)
+ 	$(INSTALL) -p -m644 $(STATICLIB) $(DESTDIR)$(libdir)/
+-	ln -s $(SHAREDLIB).$(VERSION) $(DESTDIR)$(libdir)/$(SONAME)
+-	ln -s $(SONAME) $(DESTDIR)$(libdir)/$(SHAREDLIB)
++	ln -sf $(SHAREDLIB).$(VERSION) $(DESTDIR)$(libdir)/$(SONAME)
++	ln -sf $(SONAME) $(DESTDIR)$(libdir)/$(SHAREDLIB)
+ 	$(INSTALL) -p -m644 $(PROJECT).3 $(DESTDIR)$(man3dir)/
+ 	for n in lib$(PROJECT) utempter_add_record utempter_remove_record \
+ 	    utempter_remove_added_record utempter_set_helper; do \
+-		ln -s $(PROJECT).3 $(DESTDIR)$(man3dir)/$$n.3; \
++		ln -sf $(PROJECT).3 $(DESTDIR)$(man3dir)/$$n.3; \
+ 	done
+ 
+ clean:
+-- 
+2.42.0
+
diff --git a/package/libutempter/Config.in b/package/libutempter/Config.in
new file mode 100644
index 0000000000..a06a240418
--- /dev/null
+++ b/package/libutempter/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBUTEMPTER
+	bool "libutempter"
+	help
+	  The libutempter library provides interface for terminal
+	  emulators such as screen and xterm to record user
+	  sessions to utmp and wtmp files.
+
+	  http://ftp.altlinux.org/pub/people/ldv/utempter/
+
+comment "libutempter needs a toolchain w/ headers >= 4.14, dynamic library"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
diff --git a/package/libutempter/libutempter.hash b/package/libutempter/libutempter.hash
new file mode 100644
index 0000000000..53a6c6db63
--- /dev/null
+++ b/package/libutempter/libutempter.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  967fef372f391de501843ad87570c6cf5dabd9651f00f1783090fbc12b2a34cb  libutempter-1.2.1.tar.gz
+sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libutempter/libutempter.mk b/package/libutempter/libutempter.mk
new file mode 100644
index 0000000000..2ce0bcd7c9
--- /dev/null
+++ b/package/libutempter/libutempter.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libutempter
+#
+################################################################################
+
+LIBUTEMPTER_VERSION = 1.2.1
+LIBUTEMPTER_SITE = ftp.altlinux.org/pub/people/ldv/utempter
+LIBUTEMPTER_INSTALL_STAGING = YES
+LIBUTEMPTER_LICENSE = LGPL-2.1
+LIBUTEMPTER_LICENSE_FILES = COPYING
+
+define LIBUTEMPTER_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define LIBUTEMPTER_INSTALL_STAGING_CMDS
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+			$(MAKE) DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/ install
+endef
+
+define LIBUTEMPTER_INSTALL_TARGET_CMDS
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+			$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/ install
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
