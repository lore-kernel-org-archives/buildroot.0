Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E9BC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 19:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE7DF81462;
	Tue,  6 Feb 2024 19:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agXyTqAda9E9; Tue,  6 Feb 2024 19:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5C8681444
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5C8681444;
	Tue,  6 Feb 2024 19:26:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFCC41BF2FB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9DF4404D0
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yci09Fad-jXU for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 19:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.89.224.132;
 helo=mx1.sberdevices.ru; envelope-from=ddrokosov@salutedevices.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AA76404BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AA76404BF
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AA76404BF
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 19:26:01 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 19447120018;
 Tue,  6 Feb 2024 22:26:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 19447120018
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Tue,  6 Feb 2024 22:25:59 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 6 Feb 2024 22:25:59 +0300
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, Herve Codina <herve.codina@bootlin.com>
Date: Tue, 6 Feb 2024 22:25:34 +0300
Message-ID: <20240206192543.7179-3-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206192543.7179-1-ddrokosov@salutedevices.com>
References: <20240206192543.7179-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183246 [Feb 06 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a,
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 100.64.160.123:7.1.2; salutedevices.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress:
 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/06 15:39:00 #23379857
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1707247560;
 bh=06X1qtfBkJMTOw+l+CuneME+iYYsd2Bcjejo+JcorNs=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=f3CVXeCRxQnec5bOCEwm/oD+pBOlUIck1Q6FaZ9wFBQCRCcpiEtH02lLbnNA3UGZC
 k+Qwut2O0nR7NoLa3EAqmsKn18i7kQ5/oLc1ai21qOzJAGI6HsW351/YHR/rKVOlqJ
 YENJuqMbXyEmiPQcJ7AKfoteWJgLrDMoGj6x4o/qlouqkCy/QmuilHTeW4zowGVtNU
 ugcWRH7+DSA3gqwWLie5JLl+iFBEul8CYptbZmSO7Mok9d5Fm8/KEJ3rUNL9P4V64w
 QMhdNVm0gOLrpFNW/fHXXD3C5O25k/FVKnIoQGgJYkDh9BHTqv14g12OUhgGzFi1r9
 BhsZgw6IpTP9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=salutedevices.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=f3CVXeCR
Subject: [Buildroot] [PATCH v2 2/2] package/linux-tools: multilib build
 supported
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
From: Dmitry Rokosov via buildroot <buildroot@buildroot.org>
Reply-To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Dmitry Rokosov <ddrokosov@salutedevices.com>, chopps@chopps.org,
 Konstantin Menyaev <KAMenyaev@sberdevices.ru>, sdfw_system_team@sberdevices.ru,
 kernel@sberdevices.ru, rockosov@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>

- LINUX_TOOLS_MAKE_OPTS option introduced:
    allows to override CROSS_COMPILE param

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 package/linux-tools/linux-tool-gpio.mk.in      | 2 +-
 package/linux-tools/linux-tool-iio.mk.in       | 2 +-
 package/linux-tools/linux-tool-mm.mk.in        | 2 +-
 package/linux-tools/linux-tool-pci.mk.in       | 2 +-
 package/linux-tools/linux-tool-perf.mk.in      | 2 +-
 package/linux-tools/linux-tool-selftests.mk.in | 2 +-
 package/linux-tools/linux-tool-tmon.mk.in      | 2 +-
 package/linux-tools/linux-tools.mk             | 2 ++
 8 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/linux-tools/linux-tool-gpio.mk.in b/package/linux-tools/linux-tool-gpio.mk.in
index e825db1b1127..dcee11002e8c 100644
--- a/package/linux-tools/linux-tool-gpio.mk.in
+++ b/package/linux-tools/linux-tool-gpio.mk.in
@@ -6,7 +6,7 @@
 
 LINUX_TOOLS += gpio
 
-GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
+GPIO_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define GPIO_BUILD_CMDS
 	$(Q)if ! grep install $(LINUX_DIR)/tools/gpio/Makefile >/dev/null 2>&1 ; then \
diff --git a/package/linux-tools/linux-tool-iio.mk.in b/package/linux-tools/linux-tool-iio.mk.in
index 27ab0ed7ed63..1372faafd1a8 100644
--- a/package/linux-tools/linux-tool-iio.mk.in
+++ b/package/linux-tools/linux-tool-iio.mk.in
@@ -6,7 +6,7 @@
 
 LINUX_TOOLS += iio
 
-IIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
+IIO_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define IIO_BUILD_CMDS
 	$(Q)if ! grep install $(LINUX_DIR)/tools/iio/Makefile >/dev/null 2>&1 ; then \
diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
index 5431e0574b04..51a54026dea4 100644
--- a/package/linux-tools/linux-tool-mm.mk.in
+++ b/package/linux-tools/linux-tool-mm.mk.in
@@ -7,7 +7,7 @@
 LINUX_TOOLS += mm
 
 MM_DEPENDENCIES = linux
-MM_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CC="$(TARGET_CC)"
+MM_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) CC="$(TARGET_CC)"
 
 define MM_BUILD_CMDS
 	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
index 17246f5d7ed2..48c3435a5c8a 100644
--- a/package/linux-tools/linux-tool-pci.mk.in
+++ b/package/linux-tools/linux-tool-pci.mk.in
@@ -6,7 +6,7 @@
 
 LINUX_TOOLS += pci
 
-PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
+PCI_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define PCI_BUILD_CMDS
 	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index ee308a85dfd1..38910cda7d75 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -19,7 +19,7 @@ PERF_ARCH=$(NORMALIZED_ARCH)
 endif
 
 PERF_MAKE_FLAGS = \
-	$(LINUX_MAKE_FLAGS) \
+	$(LINUX_TOOLS_MAKE_OPTS) \
 	JOBS=$(PARALLEL_JOBS) \
 	ARCH=$(PERF_ARCH) \
 	DESTDIR=$(TARGET_DIR) \
diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index e29c7f59debd..144dd6616f2b 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -22,7 +22,7 @@ SELFTESTS_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
 
 SELFTESTS_MAKE_FLAGS = \
-	$(LINUX_MAKE_FLAGS) \
+	$(LINUX_TOOLS_MAKE_OPTS) \
 	ARCH=$(SELFTESTS_ARCH)
 
 # O must be redefined here to overwrite the one used by Buildroot for
diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
index 56c328c51fd7..7c33915049c2 100644
--- a/package/linux-tools/linux-tool-tmon.mk.in
+++ b/package/linux-tools/linux-tool-tmon.mk.in
@@ -7,7 +7,7 @@
 LINUX_TOOLS += tmon
 
 TMON_DEPENDENCIES = host-pkgconf ncurses
-TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
+TMON_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) \
 	CC=$(TARGET_CC) \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index 81b1fbc17605..38bb2c83966a 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -26,6 +26,8 @@ LINUX_TOOLS_PATCH_DEPENDENCIES = linux
 # may install shared libraries and headers (e.g. cpupower).
 LINUX_TOOLS_INSTALL_STAGING = YES
 
+LINUX_TOOLS_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CROSS_COMPILE="$(TARGET_CROSS)"
+
 LINUX_TOOLS_DEPENDENCIES += $(foreach tool,$(LINUX_TOOLS),\
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
 		$($(call UPPERCASE,$(tool))_DEPENDENCIES)))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
