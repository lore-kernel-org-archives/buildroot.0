Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BD7C4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 03:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE2A882390;
	Mon, 12 Feb 2024 03:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X4v_0-rXdXhk; Mon, 12 Feb 2024 03:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4299827D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4299827D2;
	Mon, 12 Feb 2024 03:50:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 243A31BF2F8
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 03:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EDE641BF2
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 03:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FlOHz2y75tQ1 for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 03:50:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC09541BEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC09541BEE
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC09541BEE
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 03:50:03 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5cfd95130c6so1461835a12.1
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 19:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707709802; x=1708314602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t6qWgWha+ZuQLkv/hKPG/hkUhV8YDTx88nr/jowyfno=;
 b=J31gRAFbjSPFiW/uIeHN55yEURSpwcr5HQWu4bpQ+8DV9TeEdnNVTjgNfMOZJ6ouhX
 nzxM5MnTF/VjuDRe7cisHMamgqIwtGWDOgCQHjQdeBIGQzgFy8UEa7uCuiLpkjKo1A8C
 qQXZqrF7Upz9Hv6WEkHTut6PyOCLiBkDUaKbfHURLitEuQpKpU6i8q1d+oZqZvDJ57j3
 poDE3vg32OK+IzlYU/XwFKbfyZS/gH6OnTxZqjzv4/QPkka3NGskhPm3Sn/jzP+ID8Gb
 +wRmWkP9CvFTUe3A3KNo8BpaDaSxfXA9CXa6t1fi8+nvcH5v809Ph9vnGADK1qjR1imZ
 B7dQ==
X-Gm-Message-State: AOJu0Yx5/LYRd2Xdlb+ioCGu/02xnlReCYMWIqeSIpi5rwSuowtDRnp8
 tJWL0uTvs6PovDI4V/5NsbKqisDedC3aR6l/82XaELpvp98tEz1n9yzpC1qH6Bk=
X-Google-Smtp-Source: AGHT+IH5tMUPRfk6iEV3VMwbM6HTtZ+NBBp4anNQpAn9Z2XtaQAWDRbmhvfmqLqeC/UFjI01qM7PZQ==
X-Received: by 2002:a17:903:2304:b0:1d9:5b75:4602 with SMTP id
 d4-20020a170903230400b001d95b754602mr6591481plh.7.1707709802143; 
 Sun, 11 Feb 2024 19:50:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXrgjMJ/nV84JL9OaUiKz523duY0caWQ7ES9zxnrOC7ZlSN4FJLw+5xwuixjj1pC12lNi1zHHhnNJLkCnSkjz/f2T0petJH0ehxVm5tMShI+z/fmRMZmYUsjpeG91nM/7ied7gp
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d3-20020a170902c18300b001da1ecb05f9sm2869717pld.240.2024.02.11.19.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 19:50:01 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 19:47:57 -0800
Message-Id: <20240212034757.99951-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707709802; x=1708314602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t6qWgWha+ZuQLkv/hKPG/hkUhV8YDTx88nr/jowyfno=;
 b=JJEjpm+80FgE1SXfxNABPDN9mKnYCP2S9j4DWUIvkkqh0N+heQgTHm+pt+q42t/F+q
 N4NkccDmiNJ79IwDtHMRuz7HM2wTgZXKxRJZeN3UkGV74294RlLQSiTijKPfBxpxeNl6
 UAs9mqccHwgPXk+mwPzjPkLiNnCRuRL5xc96oJka/a5GQhL8lulR9ZwSWuBgRyQrrcek
 kaHPG/Rtd2iDE2BP5Q7Fo9h9a1KsK4n9eKTZZfqOu8h4zFheI0KjerYHTzc3aHNcbUjN
 YGbnMNLUmYAeDJ8g8iCr2T1Da1kabwgXRiEmz/WlIS3FQs6dfCTCVmBANUpMEmVC/P1w
 c5ZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JJEjpm+8
Subject: [Buildroot] [PATCH 1/1] package/atop: bump to version 2.10.0 -
 Added a new dependency - libglib2 - Remove
 0001-atop.h-include-time.h.patch. It was applied upstream
 (https://github.com/Atoptool/atop/commit/03c5c4dd29bc7590baccb55a36d61e7f4b39c1fe).
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/atop/0001-atop.h-include-time.h.patch | 41 -------------------
 package/atop/Config.in                        |  1 +
 package/atop/atop.hash                        |  2 +-
 package/atop/atop.mk                          | 10 +++--
 4 files changed, 8 insertions(+), 46 deletions(-)
 delete mode 100644 package/atop/0001-atop.h-include-time.h.patch

diff --git a/package/atop/0001-atop.h-include-time.h.patch b/package/atop/0001-atop.h-include-time.h.patch
deleted file mode 100644
index 2b8a390e71..0000000000
--- a/package/atop/0001-atop.h-include-time.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 03c5c4dd29bc7590baccb55a36d61e7f4b39c1fe Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 29 Oct 2023 18:56:35 +0100
-Subject: [PATCH] atop.h: include time.h
-
-Include time.h to avoid the following build failure with musl:
-
-atop.h:157:1: error: unknown type name 'time_t'
-  157 | time_t          normalize_epoch(time_t, long);
-      | ^~~~~~
-atop.h:157:1: note: 'time_t' is defined in header '<time.h>'; did you forget to '#include <time.h>'?
-atop.h:157:40: error: expected ')' before 'long'
-  157 | time_t          normalize_epoch(time_t, long);
-      |                                        ^~~~~
-      |                                        )
-
-Fixes:
- - http://autobuild.buildroot.org/results/e7ec8d16f2299320f374a0198c8e9b18a102b037
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/Atoptool/atop/pull/280
----
- atop.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/atop.h b/atop.h
-index 9274fc5..3d5fea4 100644
---- a/atop.h
-+++ b/atop.h
-@@ -24,6 +24,8 @@
- #ifndef __ATOP__
- #define __ATOP__
- 
-+#include <time.h>
-+
- #define	EQ		0
- #define SECONDSINDAY	86400
- #define RAWNAMESZ	256
--- 
-2.42.0
-
diff --git a/package/atop/Config.in b/package/atop/Config.in
index b8ee30c306..c00281fc47 100644
--- a/package/atop/Config.in
+++ b/package/atop/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_ATOP
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_WCHAR
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Atop is an ASCII full-screen performance monitor for Linux
 	  that is capable of reporting the activity of all processes
diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 0b7ee061dd..a6539e6211 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  8d82f211b712a227000ef254c0a2b53bcb71235bf40d93316acce80b04bff926  atop-2.9.0.tar.gz
+sha256  e7a673cf2c82578e7dd82ecb0dec83fd9ecb30828b2561c28a9fa5aaf75d5f93  atop-2.10.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 27cd537f64..6c40805eb7 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,21 +4,23 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.9.0
+ATOP_VERSION = 2.10.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
 ATOP_CPE_ID_VALID = YES
-ATOP_DEPENDENCIES = ncurses zlib
+ATOP_DEPENDENCIES = ncurses zlib libglib2
 
-ATOP_CFLAGS = $(TARGET_CFLAGS)
+ATOP_CFLAGS = $(TARGET_CFLAGS) -O2 -I. -Wall $(shell $(HOST_DIR)/bin/pkg-config --cflags  glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security
+
+ATOP_LDFLAGS = $(TARGET_LDFLAGS) $(shell $(HOST_DIR)/bin/pkg-config --libs glib-2.0)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 ATOP_CFLAGS += -O0
 endif
 
 define ATOP_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(ATOP_CFLAGS)" \
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(ATOP_CFLAGS)" LDFLAGS="$(ATOP_LDFLAGS)" \
 		-C $(@D)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
