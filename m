Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90F8C54ED1
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 16:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 391F160BC3;
	Fri, 23 May 2025 16:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXb0uAc0y2Ef; Fri, 23 May 2025 16:47:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AB1D60B9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AB1D60B9F;
	Fri, 23 May 2025 16:47:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C21968
 for <buildroot@buildroot.org>; Fri, 23 May 2025 16:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D56683DCC
 for <buildroot@buildroot.org>; Fri, 23 May 2025 16:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CSEWrLfUWvv for <buildroot@buildroot.org>;
 Fri, 23 May 2025 16:47:30 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=amer.alshanawany@openpixelsystems.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB82C83DC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB82C83DC1
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB82C83DC1
 for <buildroot@buildroot.org>; Fri, 23 May 2025 16:47:27 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-442f5b3c710so56785e9.1
 for <buildroot@buildroot.org>; Fri, 23 May 2025 09:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748018845; x=1748623645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ICMG/gQ7tul7+orlxU92T7anY047idP7b4floDtiroQ=;
 b=OkkLdIqE5eEPk826i4v10ouQueCfm7pf/MMFaBaDYqkZ32wGhpmuhIzjzA4kLK2Tcn
 3i0nCl7l1RXkhe8yhy4/CpDRl0B5lpAvPFJCz3OWECSodxlqW5TWqA0tao/lrIG+eyaq
 /bImShGcZd3qoOVq0mRRcO7wblrLY5ioO4wKuPgx2sdpOsjnGUc22uQNxVgwxxw3TOnw
 SPMJuDIqWncxB6S6sguVrGBHgSmhbLGYTgVJe7U2T4YgZNFkvyizYj0dGe2fvAv+KFl6
 /n7XTxL23llY26gqKvA/yrYVKDPUO7KvOQQeZmfFU3gIYeMvEs+F2aQO2+wm81v1Ji8+
 fbnQ==
X-Gm-Message-State: AOJu0YyRZixhuK0VZGodNeympPVmjAtSKSoO3VzT9456B5yZqzsx4rgZ
 26ynG6Df+X9QCBmHuQshnL/jpb5/lXsKYkbO8RofabS+FtjDr62yVubjZtd+MWF+mQFYtVJcrDP
 Ab/KsslVZzdfY
X-Gm-Gg: ASbGncv+SgvoaPTpd5Zv6m3Bz3xleaDBtpUIeQFqwPexwQfmdxJ8zjib/15CnSyJdCe
 t9I8covmeIcdJcfGolrppFnhaqJplh6C+ZsyYoOTfLjvwr8qe7g07TAdTRrtn2rkexAv81JUXTB
 +i0oCNtFmGsL+/+bGGWm8zihdj/xFX6LyGwSfiPwUfwl9rlOGbKHNwdQdwi3zb4PIRq/Nidfhuv
 xMXrMmyjizIwidJNFF02/v9SA1VE2/WSEv60o7VPawhUtesOpXhMBwe8glhqVVfebczNw/GoBlC
 uHhjx0uY3xGCkV3lOwcE3Uc8PhzcKB4otYd06nv2P/NYECfqtgoGgAnNxvMUJAR0c3CReCk=
X-Google-Smtp-Source: AGHT+IHeL75kGYMrKKYN6HIrSDpkk2zFLnRJxYQyPom6I9YMxDn/m0Eqf9uwVek9LUJGZ9b/h5YHlQ==
X-Received: by 2002:a05:600c:4508:b0:43c:fe5e:f03b with SMTP id
 5b1f17b1804b1-44b6ec4e5a5mr40365535e9.30.1748018845028; 
 Fri, 23 May 2025 09:47:25 -0700 (PDT)
Received: from localhost ([185.77.198.11]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f23bfdd9sm143001445e9.18.2025.05.23.09.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 09:47:24 -0700 (PDT)
From: Amer Alshanawany <amer.alshanawany@openpixelsystems.org>
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Amer Alshanawany <amer.alshanawany@openpixelsystems.org>
Date: Fri, 23 May 2025 18:41:51 +0200
Message-ID: <20250523164150.69687-2-amer.alshanawany@openpixelsystems.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1748018845;
 x=1748623645; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ICMG/gQ7tul7+orlxU92T7anY047idP7b4floDtiroQ=;
 b=A8boyoJlz5TPnWOWYExla1QFiadXGezSpDtQBwgKrsZhyFDRQf6Yp1c2GQCu39MDZN
 MdFq40dGj7YvKVtB214GBuer7BSTkjIA0XE/9IGlSx1Jzg6Efjf20oWN66FoD4UROcI5
 cJ2506o6ficQri++aZ6rgfs2stJFUNJr+Tr91iLAAyH/v6j1wHeyJTiNhiiqTaiaGE6h
 hHeiXpjd4gMskW7vRMGKy50uqzhxYPdnsJnQRPkgDVsxoQ1wWLvCVuft5pLdU0Pl3Omx
 8CPptHie2m3fMGug08B8PL0KMSWgcnLoZX5wIMjtTdcenO7DvQda9UazAhgcx6BW2MQ1
 Fcdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems-org.20230601.gappssmtp.com
 header.i=@openpixelsystems-org.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=A8boyoJl
Subject: [Buildroot] [PATCH v2] package/uuu: add target support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: Amer Alshanawany <amer.alshanawany@openpixelsystems.org>
---
v1 -> v2:
package/uuu/Config.in:
-  BR2_USE_WCHAR comment as Julien Olivain has suggested
-  toolchain dependencis for c++14, atomic and threads

package/uuu/uuu.mk:
-  linked against libatomic when found

 package/Config.in     |  1 +
 package/uuu/Config.in | 23 +++++++++++++++++++++++
 package/uuu/uuu.mk    |  6 ++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/uuu/Config.in

diff --git a/package/Config.in b/package/Config.in
index 579b5ffc87..ac8951abc2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2817,6 +2817,7 @@ comment "Utilities"
 	source "package/tini/Config.in"
 	source "package/tmux/Config.in"
 	source "package/ttyd/Config.in"
+	source "package/uuu/Config.in"
 	source "package/which/Config.in"
 	source "package/wlr-randr/Config.in"
 	source "package/wtfutil/Config.in"
diff --git a/package/uuu/Config.in b/package/uuu/Config.in
new file mode 100644
index 0000000000..f1aeaff644
--- /dev/null
+++ b/package/uuu/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_UUU
+	bool "uuu"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # libuuu uses wchar_t
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_TINYXML2
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZSTD
+	help
+	  UUU (Universal Update Utility) is Freescale/NXP I.MX Chip
+	  image deploy tool. UUU is an evolution of MFGTools
+	  (aka MFGTools v3).
+
+	  https://github.com/nxp-imx/mfgtools
+
+comment "uuu needs a toolchain w/ C++14, threads, atomic, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_ATOMIC \
+	        || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 4683cbeec1..8adddaef7c 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -9,6 +9,7 @@ UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE
+UUU_DEPENDENCIES = bzip2 libusb openssl tinyxml2 zlib zstd
 HOST_UUU_DEPENDENCIES = \
 	host-bzip2 \
 	host-libusb \
@@ -17,4 +18,9 @@ HOST_UUU_DEPENDENCIES = \
 	host-zlib \
 	host-zstd
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+UUU_CONF_OPTS = -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
