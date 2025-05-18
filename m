Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AA5C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 20:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7070481F19;
	Sun, 18 May 2025 20:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oKPwkwqwwnh; Sun, 18 May 2025 20:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6760D81F1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6760D81F1A;
	Sun, 18 May 2025 20:27:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EC75E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8A8881F1F
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-OUwU6DWI-R for <buildroot@buildroot.org>;
 Sun, 18 May 2025 20:27:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E096981BFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E096981BFA
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E096981BFA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:27:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a20743a28bso352270f8f.1
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747600072; x=1748204872;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QnAcOp5581WZHEMzzZamgXXTmSo/0lOGR8+//U2o7ok=;
 b=d4Opt8PDP9WM0t2PHghBRaj8wC2Gkr4qXmMtDvLSMdxRxawH+hPIyshOfQpclt1HSU
 l9nETyGtvMjnQIU78OiwWlWntjWEXEqKVmCWxsZco1+9dbKGMC9sl1JTGQ6jb8agWheC
 P9eRlLY/m1waD1+ayDG/YDhn+2jQLIrXnxtQ8Gwd1yDi7iSOcF3IbUMRpiAa1LgCEZS2
 ZQIFj8q4npvPPxVozK9vT40TtnU8782aRo4GQXY75AINE2wPSe6Z0IiOcynNZad1ewTj
 5l3iwKT/Qv6vuqjgET5v0sIJs28g0QMn4eMm5YIwv80feYCh958DAtdpppJWeIgHl2r9
 6I5A==
X-Gm-Message-State: AOJu0YyNM53/q6fkXlJ+v2LPEy0NdProu+u1YjCum6u3zmg38hUNak9i
 xpizehMVsp89xn1R+WRXk40qsOn6oz7xn4W6FKqOMQNQfaoLl2sAeosDkW0MufSu
X-Gm-Gg: ASbGncuQRtx3kSNoVOsXY7L4+SrtL2Yvi9QfForkqRmSDGrwuzfICAAB2jxxpPp4+js
 xfHNBpGebuqX/ai3MRSIGxp+r4EiWDsN845otnFDStywNxcvSs73WVlOkO6Gzi9gzPBuFRIkou0
 qKoIjc8BGanb8GvEMOE03EPDaIS4Vgvv1kom2C2EocWkR9Eh+9vR+gDLprwE/nXaTj9XprwX20R
 gFfbYFQgkNjFcnW6pUifWERu3g1n0IdHutKhPkyJqCj2Aj0R7nJatedudKAvEp/atuXT3jBueSW
 fUS/3xYAIYdlMdxTTHBZbGLTBdR96sBYmQ+8cOpn
X-Google-Smtp-Source: AGHT+IHoyBcebuKrv+mLy0Zdn4l+wUYdAQj4bHlcYxRSFlRuQB+8oZkIJEOR1Yd248I80ggPyLqlrQ==
X-Received: by 2002:a05:6000:2284:b0:3a3:6e0e:a09d with SMTP id
 ffacd0b85a97d-3a36e0ea15dmr748201f8f.6.1747600072454; 
 Sun, 18 May 2025 13:27:52 -0700 (PDT)
Received: from fedora.. ([41.210.159.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88990sm10470841f8f.68.2025.05.18.13.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 13:27:51 -0700 (PDT)
From: "Joseph Zikusooka (ZIK)" <josephzik@gmail.com>
X-Google-Original-From: "Joseph Zikusooka (ZIK)" <zik@jambula.net>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com,
	"Joseph Zikusooka (ZIK)" <zik@jambula.net>
Date: Sun, 18 May 2025 23:26:37 +0300
Message-ID: <20250518202637.1918533-1-zik@jambula.net>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747600072; x=1748204872; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QnAcOp5581WZHEMzzZamgXXTmSo/0lOGR8+//U2o7ok=;
 b=jtTbzVDLBZSTmvuFEMjz88o1y9EK1nDouAA0qL3VQFuGj+i/60xZ4VZwZwHWNHco+L
 drDL/1/36PIwjSFQzKGNYxPCn7v3a2362x9Bl1idCFBRXUYfSRnUxgcWT1OeCzsIwzSe
 dFiL1sz755TXb6xl/UllOAu1CVPJoIHgZ7VqYPOlcaTBzeWxya4hn5JM8c6zxO2UXJC5
 8kdJ2MI8P4zPzBPk8+K1M6hbghzUD1QqhQyD8Q+x7UmVxBS0nss43yHl1AeZFtDhOQwE
 eexaoVkx4JTHrVVHzS8pYYl2eBFPUMVpBZs7aaYd5GNrKoLz8ehyI3kH8ihKTtP2ndRR
 Nf5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jtTbzVDL
Subject: [Buildroot] [PATCH v2] package/kea: new package for ISC Kea DHCP
 server
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
---
Changes v1 -> v2:
  - Added missing Signed-off-by line
  - Added entry to DEVELOPERS for package maintainership
  - Improved Config.in: added toolchain constraints, split boost components, clearer and reformatted help text
  - Enhanced kea.mk: removed redundant KEA_SOURCE, added optional MariaDB and PostgreSQL support, enabled shell support
  - Updated commit title and message for clarity and consistency with buildroot style

 DEVELOPERS            |  3 +++
 package/kea/Config.in | 34 ++++++++++++++++++++++++++++++++++
 package/kea/kea.hash  |  3 +++
 package/kea/kea.mk    | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+)
 create mode 100644 package/kea/Config.in
 create mode 100644 package/kea/kea.hash
 create mode 100644 package/kea/kea.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 78bb555530..112f6ebc24 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3554,3 +3554,6 @@ F:	package/quazip/
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
index 0000000000..37cb4e19f4
--- /dev/null
+++ b/package/kea/kea.hash
@@ -0,0 +1,3 @@
+# Locally computed - sha256
+sha256  8a50b63103734b59c3b8619ccd6766d2dfee3f02e3a5f9f3abc1cd55f70fa424  kea-2.6.2.tar.gz
+sha256  2768ea1cbc79ac048f0c34c5cb50cf7e7d4c13a83337ebfa147a700b876431d5  COPYING
diff --git a/package/kea/kea.mk b/package/kea/kea.mk
new file mode 100644
index 0000000000..c0ebabde58
--- /dev/null
+++ b/package/kea/kea.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# Kea DHCP Server
+#
+################################################################################
+
+KEA_VERSION = 2.6.2
+KEA_SITE = https://dl.cloudsmith.io/public/isc/kea-2-6/raw/versions/$(KEA_VERSION)
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
+KEA_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
+KEA_DEPENDENCIES += mariadb
+else
+KEA_CONF_OPTS += --without-mysql
+endif
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+KEA_CONF_OPTS += --with-pgsql=$(STAGING_DIR)/usr
+KEA_DEPENDENCIES += postgresql
+else
+KEA_CONF_OPTS += --without-pgsql
+endif
+
+$(eval $(autotools-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
