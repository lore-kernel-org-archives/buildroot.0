Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B91CA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 11:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50E6A61516;
	Wed,  3 Sep 2025 11:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1dKS6V6i0I8; Wed,  3 Sep 2025 11:33:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64AE76154B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64AE76154B;
	Wed,  3 Sep 2025 11:33:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50F7B2BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 11:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36B9461567
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 11:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kxChJOSZWCI for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 11:33:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33FF161516
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33FF161516
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33FF161516
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 11:33:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45b76f3b24eso8516105e9.2
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 04:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756899217; x=1757504017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7nsyjZDQBSVmxFd1+j0KjqhG5kNl5RIKQTIfDbDIsHY=;
 b=fFNTk3YyWLHQBs+CRTHoHurgr8R4F8PHPNsZ/aBK+W6BF0KI+dt1RT2RPJB0ppsA9g
 4ZoEhApSws2jUgiboOMDK4dpNMugpTS3cC3Evn4HI71lNRn33OsjAAvM4Xr8Oe9FjVGF
 sneM3RL7UE22iHrbXZJWdR7Cvze9vqBBMcU6XxLsDFCICI/KcNN7FOInzSzMmG2Xu5mE
 Rt4WeLJogCwhguyYf5ES8qaTd7jKrWpoxLe7mub+mNUWBEtkeZEs6itsnOU+sd1lZzR0
 Z34HFjeg0U05vr0tjdztOt1dDohhAnHpUlCTl8Bw3zhmn3AtfBPYwid2X8KqgdxODU9o
 Th/g==
X-Gm-Message-State: AOJu0Yy9KRe9rBwC48VjV8W3LLthATi4khq5SHPGXAipt8SWktnsIEsY
 gB6p0ora9TSSea0O9ZaCiRrMX89ryOo1MKHjrxujsj66DKqNerJKUcO6ahLk6w==
X-Gm-Gg: ASbGncv/JQa8nDFxgWRPCyqBX9XmhnHhbXoFSnLHO9bCEDKCDZYuVwjZE9flovOBaxZ
 jNn/GdcvHsqyyuKoLiLVWrr2a5GWA3S1/swnEePcJEpKKyAgIDGQ9MLfysD/qPc2MrIR/rIDoH3
 tTV3uPUXgOpDl3i4HB/1gWDT0dKafzRVXhCHrxcc7wIQeik4ETeL0+esyPS+1dEGHnAoo1aifl7
 Y036icBPY7f3+4vfqy2qbS78mE/keHPnEyqJdHXTDl1V/ASdskjkZt+4P2UXtXlE+zFRsOa+6Iq
 eYtwLKuToyleFZckhjsvIk3o/rMh+2QBG8TIvdlhQoexle1mDErGx9adjK6ZCRpPlUN6myYE0/q
 /deX2ZL6BRk9WOHBUwOPDhGs37JyDLEKFfPFg
X-Google-Smtp-Source: AGHT+IFlf+9VgxWfJe5JRpyQfio4d3WRlusPqJt9F8MEYK19WKMiQm0KmHxlpGkdL9Va7yKRQKTbuw==
X-Received: by 2002:a05:600c:c059:20b0:45b:9135:d8af with SMTP id
 5b1f17b1804b1-45b9135e637mr20541965e9.8.1756899216704; 
 Wed, 03 Sep 2025 04:33:36 -0700 (PDT)
Received: from nuremberg.jambulanet ([41.84.201.45])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0a1f807f9sm22487482f8f.38.2025.09.03.04.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:33:36 -0700 (PDT)
From: "Joseph Zikusooka (ZIK)" <josephzik@gmail.com>
X-Google-Original-From: "Joseph Zikusooka (ZIK)" <zik@jambula.net>
To: buildroot@buildroot.org
Cc: "Joseph Zikusooka (ZIK)" <zik@jambula.net>
Date: Wed,  3 Sep 2025 14:33:07 +0300
Message-ID: <20250903113307.100754-1-zik@jambula.net>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756899217; x=1757504017; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7nsyjZDQBSVmxFd1+j0KjqhG5kNl5RIKQTIfDbDIsHY=;
 b=RHdqD0GE+ybjSRRQZPsefjRBLV/KdLcZt4y+FsWoiEh3QWnzi8VPWDtOFWC/+Iukd2
 d2T9IcnovK4sLl0jmFkUhUh07NK0DHbzdQJwO/dO9Ku4mDzK7TBaVEwDstnsgjfX58Y2
 fk95+qM/NLOk/YtKf//MDlUyCtWu0tH/C5a3m5RkojZ5RIfvi6tO8cqbCFLeqFIm1uFV
 hfZE7e3SOxeIQGC2Dgjtkl/Bv6B/PfBF1kzoOTrO9113syhRzg0laFty4GlUj2szSfs4
 TrjeASC5Ln3GnmCAZjwjbRBcYz1WYasYCcG8BG3sWqNLghhhPEnQPn4132OnPP+XlcX1
 3QaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RHdqD0GE
Subject: [Buildroot] [PATCH] package/kea: new package for ISC Kea DHCP server
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

Kea is a DHCP server implementation from ISC that supports
DHCPv4, DHCPv6, and Dynamic DNS. It uses Boost, log4cplus, and
OpenSSL.

This package enables the core Kea components with support for
address assignment, prefix delegation, and DNS updates via a
separate DDNS daemon.

Signed-off-by: Joseph Zikusooka (ZIK) <zik@jambula.net>

Changes v2 -> v3:
- Bumped version to 2.6.4
- Removed PostgreSQL support temporarily - Requires wrapper
- Added KEA_USERS
- Minor cleanup and rebase

Signed-off-by: Joseph Zikusooka (ZIK) <zik@jambula.net>
---
 DEVELOPERS            |  3 +++
 package/kea/Config.in | 34 ++++++++++++++++++++++++++++++++++
 package/kea/kea.hash  |  3 +++
 package/kea/kea.mk    | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+)
 create mode 100644 package/kea/Config.in
 create mode 100644 package/kea/kea.hash
 create mode 100644 package/kea/kea.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 32d7c8ac61..f6ee1fe069 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3531,3 +3531,6 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+
+N:	Joseph Zikusooka (ZIK) <zik@jambula.net>
+F:	package/kea/
diff --git a/package/kea/Config.in b/package/kea/Config.in
new file mode 100644
index 0000000000..387b006014
--- /dev/null
+++ b/package/kea/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_KEA
+	bool "kea"
+	depends on BR2_INSTALL_LIBSTDCPP # boost, log4cplus
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # log4cplus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # log4cplus, boost
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # log4cplus, boost
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # log4cplus
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_ATOMIC
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LOG4CPLUS
+	help
+	  Kea is a DHCP implementation from the Internet Systems
+	  Consortium, Inc., supporting fully functional DHCPv4, DHCPv6,
+	  and dynamic DNS servers.
+	  Both DHCP servers support address assignment, renewal,
+	  rebinding, release, and server discovery. The DHCPv6 server
+	  also supports prefix delegation. DNS updates are handled by a
+	  standalone DDNS daemon.
+
+	  https://www.isc.org/kea
+
+comment "kea needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "kea needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/kea/kea.hash b/package/kea/kea.hash
new file mode 100644
index 0000000000..e10c516278
--- /dev/null
+++ b/package/kea/kea.hash
@@ -0,0 +1,3 @@
+# Locally computed - sha256
+sha256  6806405e4d559abc10febd2c273dc6e2bc6ac42767afa5ca20b118ffba84a671  kea-2.6.4.tar.gz
+sha256  2768ea1cbc79ac048f0c34c5cb50cf7e7d4c13a83337ebfa147a700b876431d5  COPYING
diff --git a/package/kea/kea.mk b/package/kea/kea.mk
new file mode 100644
index 0000000000..23f0792d61
--- /dev/null
+++ b/package/kea/kea.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# Kea DHCP Server
+#
+################################################################################
+
+KEA_VERSION = 2.6.4
+KEA_SITE = https://dl.cloudsmith.io/public/isc/kea-2-6/raw/versions/$(KEA_VERSION)
+KEA_SOURCE = kea-$(KEA_VERSION).tar.gz
+KEA_LICENSE = MPL-2.0
+KEA_LICENSE_FILES = COPYING
+
+KEA_DEPENDENCIES = boost log4cplus openssl
+
+KEA_CONF_OPTS = \
+	--prefix=/usr \
+	--with-boost=$(STAGING_DIR)/usr \
+	--with-log4cplus=$(STAGING_DIR)/usr \
+	--with-openssl=$(STAGING_DIR)/usr \
+	--enable-shell
+
+ifeq ($(BR2_PACKAGE_MARIADB),y)
+KEA_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
+KEA_DEPENDENCIES += mariadb
+else
+KEA_CONF_OPTS += --without-mysql
+endif
+
+define KEA_USERS
+	kea -1 kea -1 * /home/kea - Kea DHCP Daemon
+endef
+
+$(eval $(autotools-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
