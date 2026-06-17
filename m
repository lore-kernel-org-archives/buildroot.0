Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F74CD98F0
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 21:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B83281EEB;
	Wed, 17 Jun 2026 21:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlWvkEe1EEQq; Wed, 17 Jun 2026 21:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0B7A81EE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781731454;
	bh=zatbjh4LdGY9f76cH1N6+1wkPLwvRGp6ZhX2We8H6yE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qHgA8e5k0py4wfo9/ciJAZP/iKPcAwKkDI0DI0ADlAtyRz9kJmIHwJXjuPhLjW/TP
	 7hC3oOG0k/VUsqNRyI5zXVNRV7zMGu7Aj1G87ZXbVcMDRzE+hGpf1bWg0KOYuobm2T
	 JgERDNjZsk3i0lgp5rkOXbhay2bA10bjtqXeCp8rxHkCW3MX+/R8zjA86WEaiN7qeM
	 stXAk4jU0dYDJyx6GtVmTDpiNrqjI6Rj2Ggd9saMNG6EiYKRCzieY74uiw1cvgKLc9
	 RIIs3Fv6QuGAeMlp4OefeddR7SJgBC7TPOkXOs/FMu5pyE+3kE+3Br5plXu8Kz59Xk
	 RVlDw1CB/RYBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0B7A81EE1;
	Wed, 17 Jun 2026 21:24:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 444CCD8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 21:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AF6F60737
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 21:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsLXgp_bFCo3 for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 21:24:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A176F60720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A176F60720
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A176F60720
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 21:24:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a06cf.dip0.t-ipconnect.de [91.58.6.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DAAE6A4C0403;
 Wed, 17 Jun 2026 23:24:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53270)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZxk0-000000004WS-3mNz;
 Wed, 17 Jun 2026 21:24:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2026 23:24:08 +0200
Message-ID: <20260617212408.1374984-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781731448;
 bh=lB994aooW8wR2TAXezx/XBGXfXsg/9vwu7K73V1S8cA=;
 h=From:To:Cc:Subject:Date:From;
 b=kJBmTeGg3FJpsl8R5gupWJYt71kO8NtaVCrP2+v69EhTWMgLGK9EuV3hC6ybIBBM/
 CXS06BjRhTtlVLui7ORKccDgZPmrBE8A1QT+Lll4gw5qCsPFx7SUDvwUkFVhzo7vaT
 GPxmjShEzqA/qpz7jbM+KP1Ir/TnyH86IyNLnhnT0jOBhf1lL5EOcF0oqgxHQ2tNnj
 i6ORJPf+O7pERwR3n4Isz0Na1zjWI44IvmjjoXn9unGBt5mEH4d+x89BvYvc6DCNBg
 LWqV/uCV+mJAvOO0sh3fdj2pUbQJNJw1SfoIECNdwfq36M9BKvN6OVoMpy3vEYMMUn
 1CDto2pm5b9JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kJBmTeGg
Subject: [Buildroot] [PATCH 1/1] package/wget2: new package
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/62908d7f8fcfeb7faf2c742292e83ae9d23a9641

 DEVELOPERS               |   1 +
 package/Config.in        |   1 +
 package/wget2/Config.in  |  15 ++++++
 package/wget2/wget2.hash |   4 ++
 package/wget2/wget2.mk   | 100 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 121 insertions(+)
 create mode 100644 package/wget2/Config.in
 create mode 100644 package/wget2/wget2.hash
 create mode 100644 package/wget2/wget2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d591c62805..ba1a29bbec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -533,6 +533,7 @@ F:	package/unixodbc/
 F:	package/utfcpp/
 F:	package/vlc/
 F:	package/wget/
+F:	package/wget2/
 F:	package/wireless-regdb/
 F:	package/wireless_tools/
 F:	package/x264/
diff --git a/package/Config.in b/package/Config.in
index 96e113e226..582ef59543 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2664,6 +2664,7 @@ endif
 	source "package/vtun/Config.in"
 	source "package/wavemon/Config.in"
 	source "package/wget/Config.in"
+	source "package/wget2/Config.in"
 	source "package/whois/Config.in"
 	source "package/wireguard-linux-compat/Config.in"
 	source "package/wireguard-tools/Config.in"
diff --git a/package/wget2/Config.in b/package/wget2/Config.in
new file mode 100644
index 0000000000..9be8971489
--- /dev/null
+++ b/package/wget2/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_WGET2
+	bool "wget2"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
+	help
+	  GNU Wget2 is the successor of GNU Wget, a file and recursive
+	  website downloader.
+
+	  https://gitlab.com/gnuwget/wget2
+
+comment "wget2 needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
diff --git a/package/wget2/wget2.hash b/package/wget2/wget2.hash
new file mode 100644
index 0000000000..0e5742aed4
--- /dev/null
+++ b/package/wget2/wget2.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  d7544b13e37f18e601244fce5f5f40688ac1d6ab9541e0fbb01a32ee1fb447b4  wget2-2.2.1.tar.gz
+sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/wget2/wget2.mk b/package/wget2/wget2.mk
new file mode 100644
index 0000000000..21005bd708
--- /dev/null
+++ b/package/wget2/wget2.mk
@@ -0,0 +1,100 @@
+################################################################################
+#
+# wget2
+#
+################################################################################
+
+WGET2_VERSION = 2.2.1
+WGET2_SITE = $(BR2_GNU_MIRROR)/wget
+WGET2_DEPENDENCIES = host-pkgconf
+WGET2_LICENSE = GPL-3.0+, LGPL-3.0+
+WGET2_LICENSE_FILES = COPYING COPYING.LESSER
+WGET2_CPE_ID_VENDOR = gnu
+
+WGET2_CONF_OPTS = \
+	--without-libhsts \
+	--without-libmicrohttpd \
+	--without-lzip
+
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+WGET2_CONF_OPTS += --with-brotlidec
+WGET2_DEPENDENCIES += brotli
+else
+WGET2_CONF_OPTS += --without-brotlidec
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+WGET2_CONF_OPTS += --with-bzip2
+WGET2_DEPENDENCIES += bzip2
+else
+WGET2_CONF_OPTS += --without-bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+WGET2_CONF_OPTS += --with-ssl=gnutls
+WGET2_DEPENDENCIES += gnutls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+WGET2_CONF_OPTS += --with-ssl=openssl
+WGET2_DEPENDENCIES += openssl
+else
+WGET2_CONF_OPTS += --without-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGPGME),y)
+WGET2_CONF_OPTS += --with-gpgme
+WGET2_DEPENDENCIES += libgpgme
+else
+WGET2_CONF_OPTS += --without-gpgme
+endif
+
+# BR2_ENABLE_LOCALE and BR2_PACKAGE_LIBICONV are mutually exclusive
+ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV)$(BR2_PACKAGE_LIBIDN2),yy)
+WGET2_CONF_OPTS += --with-libidn2
+WGET2_DEPENDENCIES += libidn2
+else
+WGET2_CONF_OPTS += --without-libidn2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPSL),y)
+WGET2_CONF_OPTS += --with-libpsl
+WGET2_DEPENDENCIES += libpsl
+else
+WGET2_CONF_OPTS += --without-libpsl
+endif
+
+ifeq ($(BR2_PACKAGE_NGHTTP2),y)
+WGET2_CONF_OPTS += --with-libnghttp2
+WGET2_DEPENDENCIES += nghttp2
+else
+WGET2_CONF_OPTS += --without-libnghttp2
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+WGET2_CONF_OPTS += --with-libpcre2
+WGET2_DEPENDENCIES += pcre2
+else
+WGET2_CONF_OPTS += --without-libpcre2
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+WGET2_CONF_OPTS += --with-lzma
+WGET2_DEPENDENCIES += xz
+else
+WGET2_CONF_OPTS += --without-lzma
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+WGET2_CONF_OPTS += --with-zlib
+WGET2_DEPENDENCIES += zlib
+else
+WGET2_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+WGET2_CONF_OPTS += --with-zstd
+WGET2_DEPENDENCIES += zstd
+else
+WGET2_CONF_OPTS += --without-zstd
+endif
+
+$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
