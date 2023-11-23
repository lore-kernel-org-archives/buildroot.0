Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B88C27C40
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B058D81F11;
	Thu, 23 Nov 2023 00:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B058D81F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4x_7plKqO3gM; Thu, 23 Nov 2023 00:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3DF681F97;
	Thu, 23 Nov 2023 00:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3DF681F97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 594351BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4041281EDD
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4041281EDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XmBzEOLgc7Mb for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:33 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2807381ED5
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2807381ED5
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5bcfc508d14so224245a12.3
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698111; x=1701302911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vjCr70gw9kJF5uh8S0RMdZOwngjlYOKSTKA02+jOrwo=;
 b=T7/3SgziGQQsM1M8XPnu7rUg+98UYPw8WPegIXFwibuTEcLoR/UZOgWFdV55svudPq
 q9Dd9WsTdHIoWui+UtY6YzEYISc7M8n1NS7qVE1ugUyFVeICQdErTzjjF5lkhkA14xzx
 C+oM1tKx6kzoDq9LFFhm5v6Kqt6Xm4F1dLk5h6hqFvJbZg4hgLpqmfVYLJpePjaG6xqX
 Ru4Tlvg5Z0qgaeD6mtvFxGii//ZnIkaqDQZKGaX3ivoJ998xKDiAFbDkCukG1WVO7y7x
 G/F6FzMp5i9F6MD8Jt9M52W3Y1GzJ6fI3K/bLHrDr08vCKPHYt3qkAM4+fazBC49+SaR
 Ia7w==
X-Gm-Message-State: AOJu0YxQE8QhjB5oaZHOMNILMNXy7VZlJ1arSOraCVIhr4xEj+uxhGHL
 fnwSrg66R8HHKMuU74r4Mxy+m7oWmx/vBJuemq8=
X-Google-Smtp-Source: AGHT+IHZCX6Kg8rz0krZukAXRB11LpFyDxVI4JvYXGpiR+Q/sKt6lFY39sgjeZ+owEDmrW37V7mmRw==
X-Received: by 2002:a05:6a20:9186:b0:18b:844d:778f with SMTP id
 v6-20020a056a20918600b0018b844d778fmr1380763pzd.12.1700698111630; 
 Wed, 22 Nov 2023 16:08:31 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:31 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:11 -0700
Message-ID: <20231123000819.488595-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698111; x=1701302911;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vjCr70gw9kJF5uh8S0RMdZOwngjlYOKSTKA02+jOrwo=;
 b=iKw+nVUc7bpe58roA4Y5cV7d4K8DZrXrii4ljAUxRTkPQw248C0ZyT4flwaKaVvR1s
 42hSEXxkWpwvWk2L91LT7yj7TmwWMBtbpTjFj2RWo4qcXuLxz8BAVkGRUITA3L2rARq3
 W0D/Ca4pVLqGdv7edkg/qVNXVInd+41N2Tu+A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=iKw+nVUc
Subject: [Buildroot] [PATCH/next 05/13] package/libutempter: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 269cb9e765..a8cdd8e5a9 100644
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
index c40e7ebe2f..6d0e84c4c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2161,6 +2161,7 @@ menu "Other"
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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
