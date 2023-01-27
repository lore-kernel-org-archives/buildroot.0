Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791DBC54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0917E417DF;
	Fri, 27 Jan 2023 14:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0917E417DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QrJoabsXpFEW; Fri, 27 Jan 2023 14:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35C0540A71;
	Fri, 27 Jan 2023 14:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35C0540A71
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13ED71BF39E
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1FFC82FBE
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1FFC82FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pxEUSO4Z4YDB for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:11:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2E6782F3D
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2E6782F3D
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:11:02 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id e204so1955036iof.1
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0SspQugj4Bm7C6sWS8CsB68Q00Y6SdY7IpsJlRivU3w=;
 b=BU8/9OEy8P/EdyG9Qe1Z0S84wVSUsotncSERRmEv6+iFxbd1cNuYQj1heU1xXeYikB
 Fh08De7zn0znYeY1jSa5roq9yfPguDRiSUGCL/XgzECXH81fEAgx/dx23cinzFz77/GC
 bbrOEVLht5xd1d0eFzRAYxvspMNjG+4xgVFoYdiuAqkn5nbmyNGaCRH7yp//aFJE59qc
 ngV4NmqvoXbLCdqvgi+UAOTTEyYi/kpAjdhAYUB2qiaP41iF8yRRHHoalzp2p4FClkE/
 JxuddjIEljTGlHCcyYHqjHmmE/tIOD4Nes0iqpbHq+VbyMxqXIteIDkj2cjksdY06TJz
 UrnA==
X-Gm-Message-State: AFqh2koSyoFckCkWaVS/T4y7YZOTZMdWHVbpuX8yu48+tpwZOoPVjvHC
 iMtl224BOFuDNvlMBSwb8/UUvaY4HjrKqA==
X-Google-Smtp-Source: AMrXdXvY8KaH+70neRkPkPQQBCFb3rWU95u3Hm3idN/HTzyyd4ZDugZTyf1yPwFpbKuV1SeELAUQVw==
X-Received: by 2002:a6b:b4d2:0:b0:6df:e3ad:1e1c with SMTP id
 d201-20020a6bb4d2000000b006dfe3ad1e1cmr28019457iof.12.1674828661584; 
 Fri, 27 Jan 2023 06:11:01 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bed02000000b006d8b7bcaa6esm1290806iog.4.2023.01.27.06.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:11:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 07:10:47 -0700
Message-Id: <20230127141058.2180747-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127141058.2180747-1-james.hilliard1@gmail.com>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0SspQugj4Bm7C6sWS8CsB68Q00Y6SdY7IpsJlRivU3w=;
 b=ZyAJ+w2NmNhfBw7AY+Y6kHzf1Ye6DOt787mZBH8g3kpuIZnCpCHnDi6zg9CQ4V0wB2
 NtkiKdtc+z3amwgiy7OhxL9Chyrxzt6WzjMVkIHcLrbRx/t+7XppJbbZvXqdtIBwp4uN
 wKRxqg6eAFvthDZCcC2ILBRhrpXQaiE/lzEz9Tr3tE3D7E3V61pT5qjeYkxdY/R/4+oN
 B9mJtyO0f5krO1hWN7IXc/vFgbE/L69bFxuwC2ngotdrxCkPrxC3Gcjd6tuEm7L89cwb
 pdr2XgnpVnBZzJRlvufJyns8I/jrzSYsxV2SpK8n4CsUU5XQjDQZYXBInF1FAkWFqBeA
 FToQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZyAJ+w2N
Subject: [Buildroot] [PATCH v4 02/13] package/cpuinfo: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - move to libraries->hardware handling
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/cpuinfo/Config.in    |  9 +++++++++
 package/cpuinfo/cpuinfo.hash |  4 ++++
 package/cpuinfo/cpuinfo.mk   | 17 +++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/cpuinfo/Config.in
 create mode 100644 package/cpuinfo/cpuinfo.hash
 create mode 100644 package/cpuinfo/cpuinfo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e8e0dffcd3..3fd5ea32bc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2701,6 +2701,9 @@ F:	package/libvpx/
 F:	package/mesa3d-demos/
 F:	package/ti-gfx/
 
+N:	Stefan Hager <stefan.hager@ginzinger.com>
+F:	package/cpuinfo/
+
 N:	Stefan Ott <stefan@ott.net>
 F:	package/unbound/
 
diff --git a/package/Config.in b/package/Config.in
index 995dae2c57..5537699c86 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1637,6 +1637,7 @@ menu "Hardware handling"
 	source "package/bcm2835/Config.in"
 	source "package/c-periphery/Config.in"
 	source "package/ccid/Config.in"
+	source "package/cpuinfo/Config.in"
 	source "package/dtc/Config.in"
 	source "package/gnu-efi/Config.in"
 	source "package/hackrf/Config.in"
diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
new file mode 100644
index 0000000000..137f657d69
--- /dev/null
+++ b/package/cpuinfo/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CPUINFO
+	bool "cpuinfo"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  CPU INFOrmation library, cpuinfo is a library to detect
+	  essential for performance optimization information about
+	  host CPU.
+
+	  https://github.com/pytorch/cpuinfo
diff --git a/package/cpuinfo/cpuinfo.hash b/package/cpuinfo/cpuinfo.hash
new file mode 100644
index 0000000000..c3f70fa90f
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  0936848904943381b2c01321101614776e43d583840ee0f3ceeea1e3fb7405f7  cpuinfo-de2fa78ebb431db98489e78603e4f77c1f6c5c57.tar.gz
+# License files, locally calculated
+sha256  8e7e60636c3aa0cb03571a1a841ce5697f9551ff92b3c426c2561613d15ade70  LICENSE
diff --git a/package/cpuinfo/cpuinfo.mk b/package/cpuinfo/cpuinfo.mk
new file mode 100644
index 0000000000..ab6a0269ec
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cpuinfo
+#
+################################################################################
+
+CPUINFO_VERSION = de2fa78ebb431db98489e78603e4f77c1f6c5c57
+CPUINFO_SITE = $(call github,pytorch,cpuinfo,$(CPUINFO_VERSION))
+CPUINFO_LICENSE = BSD-2-Clause
+CPUINFO_LICENSE_FILES = LICENSE
+CPUINFO_INSTALL_STAGING = YES
+CPUINFO_CONF_OPTS = \
+	-DCPUINFO_BUILD_UNIT_TESTS=OFF \
+	-DCPUINFO_BUILD_MOCK_TESTS=OFF \
+	-DCPUINFO_BUILD_BENCHMARKS=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
