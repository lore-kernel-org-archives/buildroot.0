Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FB5C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 09:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E3DD405DB;
	Sun, 11 Feb 2024 09:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0QVakkmVSklD; Sun, 11 Feb 2024 09:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9AC6405E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9AC6405E8;
	Sun, 11 Feb 2024 09:16:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47F131BF3D0
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 09:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41BB34086D
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 09:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ggoDcCC-zGwt for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 09:16:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 461294086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461294086C
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 461294086C
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 09:16:44 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5ce6b5e3c4eso1687213a12.2
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 01:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707643003; x=1708247803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TFCBZYu33bwqmoNZGMFadD0BrgcQB8zYeUBk6Z5Cj84=;
 b=rE3IVPHqsln1TORBriatSvBUWxC97HYgM5A7vZoIQ+6M7ghCKcXqYLlMXNU4CiM4IQ
 IUOqO+hpTNGRRzAKJxNBfuRcrQIaPMJG7pXeBYR8dpnotVX6QYwL9XuyJlZAlJHKPXMC
 MWBWATG4wlJZPdNv5SGWIi1EMLM311XE+R7+VNiFyTt4KkJniBmfxI8wfDsF6HRuySno
 JW29yJXoNktrqevpWeQTch1m33uD7wQXgj/J/z2/0dFglbpTHrIiDNmoOq5HGT7Mxqbk
 bmI+qxFkv64R3kTote7jmHLCHpT9XkeNVIQQHjgfBpsBIaidnB44ANIEFaj5itW3nsBq
 r/iA==
X-Gm-Message-State: AOJu0YyQUsfsvRq2JFcIqsKDeBodAGsLcXmMPj3PVNQAXePqHen7Vx7a
 ITExstBGcxRhvLotkVDehck7jknoU8SUEskUGv8tZkgPMjcJis76ZzIHqHbdP0E=
X-Google-Smtp-Source: AGHT+IGs5MLELlWX40xCNvBB5H8E2vizbZmWjSZ9p8yHBY3qU1OVEySyPzYID2D+NaEYIbExQlQfgQ==
X-Received: by 2002:a05:6a00:4fc6:b0:6e0:ad61:6a8d with SMTP id
 le6-20020a056a004fc600b006e0ad616a8dmr2444545pfb.1.1707643002587; 
 Sun, 11 Feb 2024 01:16:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWgU+FwiLgvPNsbLHRn6ouM0jRDbiky4bhEP3vChZyj309EyfnLdXsRZEQ0Erg1LYzQD+/c8eYU1wE4YtF/c3QBMGES2S5okMQ=
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 n3-20020aa79843000000b006e053c0509esm3455543pfq.69.2024.02.11.01.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 01:16:42 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 01:14:22 -0800
Message-Id: <20240211091422.597625-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707643003; x=1708247803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TFCBZYu33bwqmoNZGMFadD0BrgcQB8zYeUBk6Z5Cj84=;
 b=kuuMW4nK9Zl60NHPTyS+Uancl5RppPyvypQFux+ZTED/2lRMjgYtnp85d+ECzQ2f27
 RMVi/2hY1D5Z+Er7g/2gHIEncA8ZhWV2g5qtSfaVhqJsffabr4+UZS9Oqj2zNiRuKmy/
 E5dxF3eOITTFNIlf/t9bNz3QGTNlSIvmxfKQb0+kHmLOLWjPmT1YwoYPkDCngugOEqoA
 ES0L/q1n8XjRcINzyM84NW7xAuBBeQsUji/QMQeNSRGKJKEfSpAe7MD0SxGHZxNkMJ+q
 8YLAaPtN7rHDXTCB/CnxmVuWhJwc3OZAEPsUbn5+jOi914dfp71nchX2ExKlgqK37Ezo
 ELaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kuuMW4nK
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: new package
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
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/ustreamer/Config.in      | 17 +++++++++++++++++
 package/ustreamer/ustreamer.hash |  3 +++
 package/ustreamer/ustreamer.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/ustreamer/Config.in
 create mode 100644 package/ustreamer/ustreamer.hash
 create mode 100644 package/ustreamer/ustreamer.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c6c84b05b..cf22054970 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1870,6 +1870,9 @@ F:	package/easy-rsa/
 N:	Justin Maggard <jmaggard@netgear.com>
 F:	package/dtach/
 
+N:	Kadambini Nema <kadambini.nema@gmail.com>
+F:	package/ustreamer/
+
 N:	Kamel Bouhara <kamel.bouhara@gmail.com>
 F:	package/libodb-boost/
 F:	package/libodb-mysql/
diff --git a/package/Config.in b/package/Config.in
index 91a6f1de00..ea3ecd6fdc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2596,6 +2596,7 @@ endif
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
index 0000000000..86ce18f476
--- /dev/null
+++ b/package/ustreamer/ustreamer.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# ustreamer
+#
+################################################################################
+
+USTREAMER_VERSION = b2ebcf99c8c51f97c44eccb6c768f5e824ecf952
+USTREAMER_SITE = $(call github,pikvm,ustreamer,$(USTREAMER_VERSION))
+USTREAMER_SUBDIR = ustreamer
+USTREAMER_LICENSE = GPL-3.0-or-later
+USTREAMER_LICENSE_FILES = $(USTREAMER_SUBDIR)/LICENSE
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
