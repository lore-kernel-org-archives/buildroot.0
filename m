Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EBCC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 19:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0571460A61;
	Tue, 21 May 2024 19:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rW2VBY7DJfDO; Tue, 21 May 2024 19:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F47060A62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F47060A62;
	Tue, 21 May 2024 19:00:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 995FD1C54BF
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 19:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 864DD416A5
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 19:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6adCtuksqqiZ for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 19:00:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC8D141588
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC8D141588
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC8D141588
 for <buildroot@buildroot.org>; Tue, 21 May 2024 19:00:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-354b7d76c52so3448600f8f.3
 for <buildroot@buildroot.org>; Tue, 21 May 2024 12:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716318005; x=1716922805;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z795xKAST8JmwYSF+HA8mYc1LkcrWf7qdvM3+zkLwkg=;
 b=IKN4yG61v5cAx0s0G0AcjIAQe4DnOCwdd1De5YFgLK8KRptr1imDkRvL2VA5Jnaxr+
 wXTMD2k1ocpYlGMrqGZd6uCfHzRFAQ7aV5Ylcq+2FjqpGBdIex2H40RRcLheaZ5U3fnC
 ccBIWIZ8YLGNMeOHEkyUXXa1V1z4s8kj2uYjFqYXxF+TK9Xb6915urabuIFPrh8MK/CE
 4HgNoJVFDXsE3HLoHINfY7YiIa5ciPZDh/+Sd6E2CBIC0MRl66Sy9sf4Y/RpmJvcc56l
 gdXlp4iuBSXheZAs7aUTAk7qNWdB+OYXnM7bZOZQ6Qb7og2exKlj0CkRnjUs1m3RLdOQ
 6Asw==
X-Gm-Message-State: AOJu0Yza2TWcBcud+TROyEuiQnupPqjbpub/CFEqdSigK9Mg5BHI4Jla
 bTDWTpVQiUNH7/mM1SHONyMg+RdfoxoH2DLs4IqDk2Odk135cwiyBaALZA==
X-Google-Smtp-Source: AGHT+IEWc8aRqFnP2xQcjXJ2Zbk7yaYk0SWiCe9bkMkGK5uxqhGIbFW5PIJnwGXqF226J85glxEOdQ==
X-Received: by 2002:adf:e501:0:b0:34f:4cc7:88f5 with SMTP id
 ffacd0b85a97d-3504a737029mr20239806f8f.27.1716318005128; 
 Tue, 21 May 2024 12:00:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354bd2e2a5asm9503519f8f.45.2024.05.21.12.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 12:00:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 21:00:01 +0200
Message-ID: <20240521190001.271761-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716318005; x=1716922805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z795xKAST8JmwYSF+HA8mYc1LkcrWf7qdvM3+zkLwkg=;
 b=E8kEHZBls5u0FEpD7o8v39kI7iQoC0UgeV7D/VftqeMx26NMpr5wrig261xgS1/VbE
 RD2R6U1IimVTuf8H69Y1o3P3ZgjUcg/lvVzGNPFjD8yUBHktxYExjwVOV/LpVKhuKyHP
 ueJssTwl5fWC8hg5uIp8RnDJj2WzQBB70orqVQXRehocJuj3+nlhvQlmgVKK3cWb2jSc
 5HLmt6Hczw2uHu1XE/NbFVwJX3Hx/QXuawr5eH7bZqpsndrxe8DVqAcGB1lhCo18p7bd
 L0FE/+ZgEZBj+zq8sVic2b2MEB5yKi0UY6t/y7UWKXtu66k/NtjKadTOGSgHOg1BID2S
 Q7Vw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E8kEHZBl
Subject: [Buildroot] [PATCH 1/1] package/dhcpdump: bump to version 1.9
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to an active fork (which is already used by Fedora 39)
- Drop patch (not needed since
  https://github.com/bbonev/dhcpdump/commit/be272278c3c3fd7fe0d30203d9047fff6b83fa44)
- HAVE_STRSEP has been dropped since
  https://github.com/bbonev/dhcpdump/commit/0f7c525da62e7ae928782b2beae9c5313fb972f8
- CFLAGS and LDFLAGS must be set since
  https://github.com/bbonev/dhcpdump/commit/6eac74e7efb88bcce9423b3a452dcaa1d48850f0
- This bump will fix the following build failure with gcc 14 thanks to
  https://github.com/bbonev/dhcpdump/commit/be272278c3c3fd7fe0d30203d9047fff6b83fa44:

dhcpdump.c: In function 'pcap_callback':
dhcpdump.c:153:17: error: implicit declaration of function 'strftime' [-Wimplicit-function-declaration]
  153 |                 strftime(timestamp, sizeof(timestamp), "%Y-%m-%d %H:%M:%S.",
      |                 ^~~~~~~~
dhcpdump.c:28:1: note: include '<time.h>' or provide a declaration of 'strftime'
   27 | #include "dhcp_options.h"
  +++ |+#include <time.h>
   28 |

https://github.com/bbonev/dhcpdump/releases/tag/v1.9

Fixes:
 - http://autobuild.buildroot.org/results/9e559d634ac4e06f74f7b9e0402e45209aef2952

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 .../0001-use-non-bsd-structures.patch         | 23 -------------------
 package/dhcpdump/Config.in                    |  2 +-
 package/dhcpdump/dhcpdump.hash                |  2 +-
 package/dhcpdump/dhcpdump.mk                  | 13 +++++------
 5 files changed, 8 insertions(+), 33 deletions(-)
 delete mode 100644 package/dhcpdump/0001-use-non-bsd-structures.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 00bf0202a6..36b1dc598c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -560,7 +560,6 @@ package/dhcp/S80dhcp-relay Shellcheck lib_sysv.Variables
 package/dhcp/S80dhcp-server Shellcheck lib_sysv.Variables
 package/dhcp/dhclient-script Shellcheck lib_shellscript.TrailingSpace
 package/dhcpcd/S41dhcpcd lib_sysv.Indent lib_sysv.Variables
-package/dhcpdump/0001-use-non-bsd-structures.patch lib_patch.Upstream
 package/dhrystone/0001-cmdline-nruns.patch lib_patch.Sob lib_patch.Upstream
 package/dhrystone/0002-HZ.patch lib_patch.Sob lib_patch.Upstream
 package/dhrystone/0003-exit.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/dhcpdump/0001-use-non-bsd-structures.patch b/package/dhcpdump/0001-use-non-bsd-structures.patch
deleted file mode 100644
index 40115fb640..0000000000
--- a/package/dhcpdump/0001-use-non-bsd-structures.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-The udphdr structure has uh_* fields when _FAVOR_BSD is
-defined. Otherwise, the fields are just named source, dest, len and
-check. See <netinet/udp.h>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: dhcpdump-1.8/dhcpdump.c
-===================================================================
---- dhcpdump-1.8.orig/dhcpdump.c	2011-05-17 20:20:46.506980003 +0200
-+++ dhcpdump-1.8/dhcpdump.c	2011-05-17 20:20:59.338979999 +0200
-@@ -163,10 +163,10 @@
- 	strcpy(ip_origin, (u_char *)inet_ntoa(ip->ip_src));
- 	strcpy(ip_destination, (u_char *)inet_ntoa(ip->ip_dst));
- 
--	if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->uh_ulen)))
-+	if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->len)))
- 		return;
- 
--	printdata((u_char *)(sp + offset), ntohs(udp->uh_ulen));
-+	printdata((u_char *)(sp + offset), ntohs(udp->len));
- }
- 
- // check for matching CHADDR (Peter Apian-Bennewitz <apian@ise.fhg.de>)
diff --git a/package/dhcpdump/Config.in b/package/dhcpdump/Config.in
index e0abe040fc..30e42928e4 100644
--- a/package/dhcpdump/Config.in
+++ b/package/dhcpdump/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_DHCPDUMP
 	help
 	  A tool for monitoring dhcp requests using tcpdump.
 
-	  http://www.mavetju.org/unix/general.php
+	  https://github.com/bbonev/dhcpdump
diff --git a/package/dhcpdump/dhcpdump.hash b/package/dhcpdump/dhcpdump.hash
index a24db5b275..fdf3243ad1 100644
--- a/package/dhcpdump/dhcpdump.hash
+++ b/package/dhcpdump/dhcpdump.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6d5eb9418162fb738bc56e4c1682ce7f7392dd96e568cc996e44c28de7f77190  dhcpdump-1.8.tar.gz
+sha256  3658ac21cc33e79e72bed070454e49c543017991cb6c37f4253c85e9176869d1  dhcpdump-1.9.tar.xz
 sha256  bab6ca76b7e93885396513689b1248dfb0e8fd662695b8bd1b26784ef71a0192  LICENSE
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index ec9571c0af..21cbd56b9c 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-DHCPDUMP_VERSION = 1.8
-DHCPDUMP_SITE = http://www.mavetju.org/download
+DHCPDUMP_VERSION = 1.9
+DHCPDUMP_SOURCE = dhcpdump-$(DHCPDUMP_VERSION).tar.xz
+DHCPDUMP_SITE = https://github.com/bbonev/dhcpdump/releases/download/v$(DHCPDUMP_VERSION)
 DHCPDUMP_DEPENDENCIES = libpcap
 DHCPDUMP_LICENSE = BSD-2-Clause
 DHCPDUMP_LICENSE_FILES = LICENSE
@@ -15,12 +16,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 DHCPDUMP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 endif
 
-# glibc, uclibc and musl have strsep()
-DHCPDUMP_CFLAGS = $(TARGET_CFLAGS) -DHAVE_STRSEP
-
 define DHCPDUMP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC) $(DHCPDUMP_CFLAGS) \
-		-D_GNU_SOURCE" LIBS="$(DHCPDUMP_LIBS)" dhcpdump
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(DHCPDUMP_LIBS)" dhcpdump
 endef
 
 define DHCPDUMP_INSTALL_TARGET_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
