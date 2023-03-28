Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63821C76196
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 16:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0DDB40528;
	Tue, 28 Mar 2023 16:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0DDB40528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-QfP3G0lTpN; Tue, 28 Mar 2023 16:27:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C626940C11;
	Tue, 28 Mar 2023 16:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C626940C11
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 625011BF2B5
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 16:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42C1F83EDD
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 16:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C1F83EDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9GkxgV_xutl for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 16:27:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D60DC83ED9
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D60DC83ED9
 for <buildroot@busybox.net>; Tue, 28 Mar 2023 16:27:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id p34so7325943wms.3
 for <buildroot@busybox.net>; Tue, 28 Mar 2023 09:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680020840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xBWCIjBAL8K/PTjksQ/3XqiVZ3qv+PsBvKDwtcbAg18=;
 b=XiJ0+It09OYkO/HQcYD6bKfSEdv4JXhSy3BRUVZW1hyVe0yv9Akom/L4SFtOLTxqRI
 VRtpSFT2JPQVtieVqpjfWJHfsFhEqbZTUcvp3w+/1ZUoPkW9GbQRrPJezjoQT5EDWgh0
 rr7wJBiHvIE7xGpC66O9KRGTndCuohhpq3wBRuBfrYwTjTbRP6mBgP8Btk/RRhoZ2YNO
 J0jcdJrm4xI/lmRCJbMct2O0cILTUFufZCHCtP7Z5dq4ouIVr3uY6UplbNAEesvHW2on
 yf85vOwIiChjIIfK0oR77zV3QBcUzORjkcYfvu+w+gjpfgIZ/mQD68hPNqwp8Uj/oQZN
 +fkQ==
X-Gm-Message-State: AO0yUKWTAtnTB0bwyZmCNiwcsTTt/5POjCd2vWLbwEYAtXT2j9vBh7Xm
 Gel9j90EM1zEkrW8YYn2YStmBDMtscM=
X-Google-Smtp-Source: AK7set+tZCCBs/uAxAlw41n1IDbE5yR9NyNjRPq2a6idfBjc+ZZ5s+T4PzzWQHtc0QhqNq5dDhXrYg==
X-Received: by 2002:a7b:c44f:0:b0:3ed:d3a7:7077 with SMTP id
 l15-20020a7bc44f000000b003edd3a77077mr12009756wmi.40.1680020839910; 
 Tue, 28 Mar 2023 09:27:19 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a7bca57000000b003ef5b011b30sm14088345wml.8.2023.03.28.09.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 09:27:19 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 28 Mar 2023 18:27:14 +0200
Message-Id: <20230328162715.1502327-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680020840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xBWCIjBAL8K/PTjksQ/3XqiVZ3qv+PsBvKDwtcbAg18=;
 b=YO2jZgwk7Q11SR5Fx53L1hK8nba57BZAL9Xv+yPBX9K3GNpXrmwRA+AfuDuMSeUDhJ
 9CZ+igPCN9TWUd7O9FcyBZy5CpHhoDa+q3pchVc79jBgLsz80wCgUCruPxTxYeXXFXUD
 jRiV6U4ForcMU2yQcVc41QhFhwwtefDaKurNbDiy6zwYEpZvmgkcaRoivKCGxrJqAqvS
 xe/4eEZoEwsv0mhvVpFI/sxvYeWPNL8v6dMEyRf3u4dZJpsTSDdt2DBxXy5XesfYLard
 2WdmW3skvlw28SxGe5lh+W1OgHJvV67l4EZTnk3LEyTxgqg6rvRKhlvQPstSVEmGA7Y/
 MU4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YO2jZgwk
Subject: [Buildroot] [PATCH] package/pciutils: bump to version 3.9.0
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

remove patch, see commit "Avoid adding multiple version tags to the same symbol"

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...nd-build-failure-with-older-binutils.patch | 57 -------------------
 package/pciutils/Config.in                    |  2 +-
 package/pciutils/pciutils.hash                |  2 +-
 package/pciutils/pciutils.mk                  |  2 +-
 4 files changed, 3 insertions(+), 60 deletions(-)
 delete mode 100644 package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch

diff --git a/package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch b/package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch
deleted file mode 100644
index 1590bc19c..000000000
--- a/package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From fda20d4bcb91f0f9d0db294b4813264de2d88866 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 12 May 2022 16:16:21 +0300
-Subject: [PATCH] Workaround build failure with older binutils
-
-binutils releases older than 2.35 are affected by bug gas/23840[1] that
-breaks the link of shared library:
-
-cc -O2 -Wall -W -Wno-parentheses -Wstrict-prototypes -Wmissing-prototypes -fPIC -fvisibility=hidden   -c -o filter.o filter.c
-/tmp/ccLtucRG.s: Assembler messages:
-/tmp/ccLtucRG.s:6: Error: multiple versions [`pci_filter_init@@LIBPCI_3.8'|`pci_filter_init@LIBPCI_3.3'] for symbol `pci_filter_init_v38'
-/tmp/ccLtucRG.s:8: Error: multiple versions [`pci_filter_parse_slot@@LIBPCI_3.8'|`pci_filter_parse_slot@LIBPCI_3.3'] for symbol `pci_filter_parse_slot_v38'
-/tmp/ccLtucRG.s:10: Error: multiple versions [`pci_filter_parse_id@@LIBPCI_3.8'|`pci_filter_parse_id@LIBPCI_3.3'] for symbol `pci_filter_parse_id_v38'
-/tmp/ccLtucRG.s:12: Error: multiple versions [`pci_filter_match@@LIBPCI_3.8'|`pci_filter_match@LIBPCI_3.3'] for symbol `pci_filter_match_v38'
-
-The symbol versioning feature has little value in the context of
-Buildroot. As a workaround remove one of each duplicated symbol.
-
-[1] https://sourceware.org/bugzilla/show_bug.cgi?id=23840
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: not upstreamable
-
-Upstream bug report: https://lore.kernel.org/linux-pci/87mtfm7v58.fsf@tarshish/
----
- lib/filter.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/lib/filter.c b/lib/filter.c
-index b881b6bc9083..bc34e8c2bab9 100644
---- a/lib/filter.c
-+++ b/lib/filter.c
-@@ -304,20 +304,16 @@ pci_filter_match_v30(struct pci_filter_v30 *f, struct pci_dev *d)
- 
- STATIC_ALIAS(void pci_filter_init(struct pci_access *a, struct pci_filter *f), pci_filter_init_v38(a, f));
- SYMBOL_VERSION(pci_filter_init_v30, pci_filter_init@LIBPCI_3.0);
--SYMBOL_VERSION(pci_filter_init_v38, pci_filter_init@LIBPCI_3.3);
- SYMBOL_VERSION(pci_filter_init_v38, pci_filter_init@@LIBPCI_3.8);
- 
- STATIC_ALIAS(char *pci_filter_parse_slot(struct pci_filter *f, char *str), pci_filter_parse_slot_v38(f, str));
- SYMBOL_VERSION(pci_filter_parse_slot_v30, pci_filter_parse_slot@LIBPCI_3.0);
--SYMBOL_VERSION(pci_filter_parse_slot_v38, pci_filter_parse_slot@LIBPCI_3.3);
- SYMBOL_VERSION(pci_filter_parse_slot_v38, pci_filter_parse_slot@@LIBPCI_3.8);
- 
- STATIC_ALIAS(char *pci_filter_parse_id(struct pci_filter *f, char *str), pci_filter_parse_id_v38(f, str));
- SYMBOL_VERSION(pci_filter_parse_id_v30, pci_filter_parse_id@LIBPCI_3.0);
--SYMBOL_VERSION(pci_filter_parse_id_v38, pci_filter_parse_id@LIBPCI_3.3);
- SYMBOL_VERSION(pci_filter_parse_id_v38, pci_filter_parse_id@@LIBPCI_3.8);
- 
- STATIC_ALIAS(int pci_filter_match(struct pci_filter *f, struct pci_dev *d), pci_filter_match_v38(f, d));
- SYMBOL_VERSION(pci_filter_match_v30, pci_filter_match@LIBPCI_3.0);
--SYMBOL_VERSION(pci_filter_match_v38, pci_filter_match@LIBPCI_3.3);
- SYMBOL_VERSION(pci_filter_match_v38, pci_filter_match@@LIBPCI_3.8);
--- 
-2.35.1
-
diff --git a/package/pciutils/Config.in b/package/pciutils/Config.in
index a082f2399..d16c36340 100644
--- a/package/pciutils/Config.in
+++ b/package/pciutils/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PCIUTILS
 	  Various utilities dealing with the PCI bus.
 	  Provides things like setpci and lspci.
 
-	  http://atrey.karlin.mff.cuni.cz/~mj/pciutils.html
+	  https://mj.ucw.cz/sw/pciutils/
diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index 0b66b8258..93df1558f 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256  91edbd0429a84705c9ad156d4ff38ccc724d41ea54c4c5b88e38e996f8a34f05  pciutils-3.8.0.tar.xz
+sha256  cdea7ae97239dee23249a09c68a19a287a3f109fbeb2c232ebb616cb38599012  pciutils-3.9.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 140276dbc..95b377d84 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.8.0
+PCIUTILS_VERSION = 3.9.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
