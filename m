Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95B3C369CB
	for <buildroot@archiver.kernel.org>; Sat, 26 Apr 2025 07:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BFD5419C1;
	Sat, 26 Apr 2025 07:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSpNjhHkarww; Sat, 26 Apr 2025 07:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 886D4419CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 886D4419CB;
	Sat, 26 Apr 2025 07:50:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B45A31
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 07:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31DD540A7F
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 07:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDlqbYSQ-ME5 for <buildroot@buildroot.org>;
 Sat, 26 Apr 2025 07:50:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26D7840197
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26D7840197
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26D7840197
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 07:50:26 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43e9ccaa1ebso3538395e9.1
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 00:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745653824; x=1746258624;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Jtmx8Dxcj9lyNf4KyxAUmEKHu+4cetrg8SOdxpqXnw=;
 b=kxFq5k3M9v5WJkEfe9bGca5yelSmzg+bZGVBX6RB/Hh7JvwMtWNJ/CN5EU/pmrlF1s
 18adrCTi/EdcEFjIeRKSgqsqjDxAdvoLbjl0hml1VlMuAnqocazVU/BbtdC2TlB2cglh
 XTgTwYDxHU/2nFhSBf45zcUSZzNQaGIPze3GnYu7bH8fSS/se9uZ3P4swVltpR+eNrPz
 sLhMhYYOf7Oq6a6p8/sekY5C5xwNEoaPPdW/pZ71hME5MVcJj7bNeZFM/doHurxL4ZjW
 GGBvevPoYBZjO205k/ZqG3MvyluWM3HWggSa3E5tx6ljCSMDfFXWexLngom86uq9Oqo4
 PCaw==
X-Gm-Message-State: AOJu0YwFJJVZfMsGV7pQm/sfxK35ZV2vC5BbJpO+h+Z+tyKCezjWaGsR
 a1jak5F7ZKRYTqCr1FRKH3GVrTpPTmVdHjsFaqrRHFCEPzf9sgK5fDmPBahY
X-Gm-Gg: ASbGncuKuGFq5RGu0OrzFbYrVmFjaBYXAldK6NAp7MH7/yBJvVWZyKb0LDska72S9Hb
 opkWS3asyRqbfIUwESOHfjDMe/Ts7DGYDJBnhp2FfRIaqNc7U2nh+Zxs0dBc/Wnmw4L0qXmISLL
 jHh5EtJU53q9vL3WapL/LitiGPPwgpBMwdzbVfqgVCzItkDi9KH01pSAo89PCbpBnpGW1VsVtnK
 BhEr+avRQAxv2F1saCBUg/v669FIP79x0nSdGHYgwL++nj8avSYM4c0lBenNiRg08QCMkOFwQRn
 HXqynFCwdnfJQ2x4ds6Wa7f5LkVpFw==
X-Google-Smtp-Source: AGHT+IFqT6GJf095lOdC+iivA4QGW83cClVQCk5aXbuUB2HtARHn1j4NBqGtjk08LzLeAXKnh/SQ9A==
X-Received: by 2002:a05:600c:1d9e:b0:43b:c938:1d0e with SMTP id
 5b1f17b1804b1-440a65bad64mr17139245e9.2.1745653823659; 
 Sat, 26 Apr 2025 00:50:23 -0700 (PDT)
Received: from kampala.. ([41.84.201.45]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4408c80174dsm90461645e9.0.2025.04.26.00.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Apr 2025 00:50:23 -0700 (PDT)
From: "Joseph Zikusooka (ZIK)" <josephzik@gmail.com>
X-Google-Original-From: "Joseph Zikusooka (ZIK)" <zik@jambula.net>
To: buildroot@buildroot.org
Cc: "Joseph Zikusooka (ZIK)" <zik@jambula.net>
Date: Sat, 26 Apr 2025 10:50:00 +0300
Message-ID: <20250426075000.314807-1-zik@jambula.net>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745653824; x=1746258624; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Jtmx8Dxcj9lyNf4KyxAUmEKHu+4cetrg8SOdxpqXnw=;
 b=YAMehWBySVSorImEcAcXSMyqUf5g8zE8N2qQdu2OwftmfyeF0JMkNoSqU4wb+BjyQt
 6R03nOsTmYuww5SuHPTLl463ZuudCF9ab1MXXltx55piKE1ihw3+00ikf8U+qjjbXPqE
 91SKCyPBFtIi+l/A6ybzCJ+Ub3fciCTkyu53I/vo5zjBZLRB83bT9HhHgZTwHw8dA8GN
 XonVAtuIHdDlGk6RJXz1XmCSp34X/8mF2FEZCimN0i6dxKcWTR8LidL/pDI5P9fgWdsi
 Pedsjol+vxp/Opq6aj3GppMpCVIBBQuwBRcYSmac9Q1wprZkuTOjB+WPLLSvnLKDBFG1
 g46w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YAMehWBy
Subject: [Buildroot] [PATCH] Kea: new package - kea version 2.6.2
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

Add Kea, an open-source Dynamic Host Configuration Protocol (DHCP)
server developed by the Internet Systems Consortium (ISC).
It's designed to provide dynamic IP address allocation and
configuration for devices on a network. Kea is known for its
modular architecture, allowing for easy extension and integration
with other services.

Supersedes: a015291dc94b5497ac1fd60a2e4cf84fe3c82cb5
---
 package/kea/Config.in | 17 +++++++++++++++++
 package/kea/kea.hash  |  3 +++
 package/kea/kea.mk    | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 package/kea/Config.in
 create mode 100644 package/kea/kea.hash
 create mode 100644 package/kea/kea.mk

diff --git a/package/kea/Config.in b/package/kea/Config.in
new file mode 100644
index 0000000000..1b3bbe2e50
--- /dev/null
+++ b/package/kea/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_KEA
+
+	bool "kea"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LOG4CPLUS
+
+	help
+	  DHCP implementation from Internet Systems Consortium, Inc. that features fully
+	  functional DHCPv4, DHCPv6 and Dynamic DNS servers.
+	  Both DHCP servers fully support server discovery, address assignment, renewal,
+	  rebinding and release. The DHCPv6 server supports prefix delegation. Both
+	  servers support DNS Update mechanism, using stand-alone DDNS daemon
+
+          https://www.isc.org/kea
diff --git a/package/kea/kea.hash b/package/kea/kea.hash
new file mode 100644
index 0000000000..37cb4e19f4
--- /dev/null
+++ b/package/kea/kea.hash
@@ -0,0 +1,3 @@
+# Locally computed - sha256
+sha256  8a50b63103734b59c3b8619ccd6766d2dfee3f02e3a5f9f3abc1cd55f70fa424  kea-2.6.2.tar.gz
+sha256  2768ea1cbc79ac048f0c34c5cb50cf7e7d4c13a83337ebfa147a700b876431d5  COPYING
diff --git a/package/kea/kea.mk b/package/kea/kea.mk
new file mode 100644
index 0000000000..d589d2c1c2
--- /dev/null
+++ b/package/kea/kea.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# kea
+#
+################################################################################
+
+KEA_VERSION = 2.6.2
+KEA_SOURCE = kea-$(KEA_VERSION).tar.gz
+KEA_SITE = https://dl.cloudsmith.io/public/isc/kea-2-6/raw/versions/$(KEA_VERSION)
+KEA_LICENSE = MPL 2.0
+KEA_LICENSE_FILES = COPYING
+
+KEA_DEPENDENCIES = host-pkgconf openssl boost log4cplus
+
+KEA_CONF_OPTS = "--with-openssl=$(STAGING_DIR)/usr" 
+KEA_CONF_OPTS = "--with-log4cplus=$(STAGING_DIR)/usr"
+#KEA_CONF_OPTS = "--with-boost-include=$(STAGING_DIR)/usr"
+
+KEA_INSTALL_STAGING = YES
+KEA_INSTALL_TARGET = YES
+
+$(eval $(autotools-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
