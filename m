Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43CEC4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 00:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 681C183F4B;
	Mon, 12 Feb 2024 00:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9-7Jm3nZVh5; Mon, 12 Feb 2024 00:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 631DF83F4C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 631DF83F4C;
	Mon, 12 Feb 2024 00:28:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13EA41BF861
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB2E440189
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:28:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ItaLqkVjCiI3 for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 00:28:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71C5640106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71C5640106
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71C5640106
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 00:28:14 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6e0aa4bb62fso41357b3a.1
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707697693; x=1708302493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=08/gLpOoDWXVa2dybWvXbIqFZ6OdgONy67LN+2oXkds=;
 b=spRSWSrxjVvUay7pkFMUX8dYzVUyXFD+282O6thGPbQmJK43zfGXUpXelMY3LyLku1
 Tic4rbyFzFjqXM45ovZDpegl4KBi+v3C5VFL7Hj022h8T/fO6blgGwtOsUZeOpdqZgBG
 1UduE/PiVp8hoojwFgBn2ARRjHvFlb/0WCQOcd23+KfBnMHNVJM5X+5GNirsTucK2xLQ
 +d7U0+/AYTpSuC0sa9GVYofw3Mjp0K6jNcDwztPQKH65h6UVORmG171Hb20p73s/ies8
 ts3cXgvvMXDdd7TBsyucKgGWufK9IFLcsxjaDlnyy1nMOl4C/k7lboyMm2ZJqAsFY9P7
 zTAQ==
X-Gm-Message-State: AOJu0YxrZYFJe2IUV9507GjBWosHSLbML4ZqSk5WIp4lJaOnHgD1dnMd
 t5+nAxtBb4/sAuab3iH98W19MjnnYgKN2t4C9MWiR0LCiwz93FP+eJBQbyE/5Os=
X-Google-Smtp-Source: AGHT+IF0BnMptmKNUY4PNfZVVrOMBTH3zsEl41KmwMDFcIYojT2YaSV30VVmEY5l1kT9uiYkA+NQfA==
X-Received: by 2002:aa7:8381:0:b0:6e0:9e95:b3f8 with SMTP id
 u1-20020aa78381000000b006e09e95b3f8mr4463997pfm.9.1707697692768; 
 Sun, 11 Feb 2024 16:28:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW6FE0WAyua4I1Fpc/vsbc1bdjNWt6C4PJRW3V0T+l81XQa7E51/ClSP61fzwfy23AMlkXy/ps4tDQQwHGjtPWl2oCwRaiI6xc=
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 q26-20020a62ae1a000000b006e080bbc92dsm4357368pff.177.2024.02.11.16.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 16:28:12 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:26:07 -0800
Message-Id: <20240212002607.12158-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707697693; x=1708302493; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=08/gLpOoDWXVa2dybWvXbIqFZ6OdgONy67LN+2oXkds=;
 b=XGBKOfXtvz4a+S25GbIaq0uvCifeRUXm3SQ5XtX11+W3V8LNhgbJMMUeZFRQK1cRQI
 A1A8wcYS94R/eM266BRN21HdrHAPIImD6OdSPnTcsl4bFylxYNMFLjbg8NCqaS5KodA7
 hl6BkD+g+5qE16ammDo0Ilp8zWNljXBMxXdY9Kc/Vok9tLA18HCV4SEq5mFeMcmll7uA
 by5nn2woEFk3NwOTZ2/sMATCe3o8y1qR9sYQDwspx4mEnWcUewBy6w/1q0uo0LYNzf/Z
 Q0Fv/Wc8oKoa+eRcIX6gfOxKHArKD4HqcSgn1SktnRuL+XMBNVUkF3YnB51GVmm4pR2U
 m2+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XGBKOfXt
Subject: [Buildroot] [PATCH v2] package/ustreamer: new package
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Lightweight and fast MJPEG-HTTP streamer
(https://github.com/pikvm/ustreamer/tree/master#%C2%B5streamer)

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
Changes v1 -> v2:
  - Fix 'make legal-info' with ustreamer package enabled.
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/ustreamer/Config.in      | 17 +++++++++++++++++
 package/ustreamer/ustreamer.hash |  3 +++
 package/ustreamer/ustreamer.mk   | 23 +++++++++++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 package/ustreamer/Config.in
 create mode 100644 package/ustreamer/ustreamer.hash
 create mode 100644 package/ustreamer/ustreamer.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d12c3abcb..a6182777c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1875,6 +1875,9 @@ F:	package/easy-rsa/
 N:	Justin Maggard <jmaggard@netgear.com>
 F:	package/dtach/
 
+N:	Kadambini Nema <kadambini.nema@gmail.com>
+F:	package/ustreamer/
+
 N:	Kamel Bouhara <kamel.bouhara@gmail.com>
 F:	package/libodb-boost/
 F:	package/libodb-mysql/
diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..479c8b6657 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2595,6 +2595,7 @@ endif
 	source "package/uredir/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
+	source "package/ustreamer/Config.in"
 	source "package/vde2/Config.in"
 	source "package/vdr/Config.in"
 	source "package/vdr-plugin-vnsiserver/Config.in"
diff --git a/package/ustreamer/Config.in b/package/ustreamer/Config.in
new file mode 100644
index 0000000000..52c511e22d
--- /dev/null
+++ b/package/ustreamer/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_USTREAMER
+	bool "ustreamer"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16 # V4L2_EVENT_SOURCE_CHANGE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBBSD
+	select BR2_PACKAGE_LIBGPIOD
+	help
+	  Lightweight and fast MJPEG-HTTP streamer
+
+	  https://github.com/pikvm/ustreamer
+
+comment "ustreamer needs a toolchain w/ threads, headers >= 3.16, dynamic library"
diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
new file mode 100644
index 0000000000..b7a85ca2d5
--- /dev/null
+++ b/package/ustreamer/ustreamer.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  198283aaea5e7aa51da54426eb79ea436641ffb9b431e9ebace8fe5a76dfb105  ustreamer-b2ebcf99c8c51f97c44eccb6c768f5e824ecf952.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
new file mode 100644
index 0000000000..fbc30527bc
--- /dev/null
+++ b/package/ustreamer/ustreamer.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# ustreamer
+#
+################################################################################
+
+USTREAMER_VERSION = b2ebcf99c8c51f97c44eccb6c768f5e824ecf952
+USTREAMER_SITE = $(call github,pikvm,ustreamer,$(USTREAMER_VERSION))
+USTREAMER_LICENSE = GPL-3.0-or-later
+USTREAMER_LICENSE_FILES = LICENSE
+USTREAMER_DEPENDENCIES = jpeg libevent libbsd libgpiod
+USTREAMER_CONF_ENV = "CFLAGS=$(TARGET_CFLAGS)"
+
+define USTREAMER_BUILD_CMDS
+	$(MAKE)  $(if $(BR2_PACKAGE_SYSTEMD),WITH_SYSTEMD=1, ) WITH_PTHREAD_NP=1  WITH_SETPROCTITLE=1 HAS_PDEATHSIG=1 $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define USTREAMER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/ustreamer $(TARGET_DIR)/usr/bin/ustreamer
+	$(INSTALL) -D -m 0755 $(@D)/ustreamer-dump $(TARGET_DIR)/usr/bin/ustreamer-dump
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
