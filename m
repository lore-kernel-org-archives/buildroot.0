Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12309CF9C69
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 12:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9280B400F6;
	Thu, 26 Sep 2024 12:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wvv5rVyrdrzd; Thu, 26 Sep 2024 12:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DC8540386
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DC8540386;
	Thu, 26 Sep 2024 12:41:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AECF1BF3EF
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 12:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09F4280B84
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 12:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PoCvTTfZaDBc for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 12:41:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=aleksandr.o.makarov@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB0A480B58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB0A480B58
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB0A480B58
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 12:41:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-37cd1ccaf71so280368f8f.0
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 05:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727354496; x=1727959296;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JopgqhopP/FwIOPy8RWNaj5bk07PkmWfHSX5cu0hczg=;
 b=bybwr6xFbQf2JSg+b/4tGyo0qcJbwvkL4y8D3rGAYojeK8JHM342umQ4fqWN7BDjSp
 PfJ69TYg3SAZR37dkvSKw5rn5OskWomEfe/BBqkW3qGmSaS3JlZyB5C3TEig6woYRzLm
 NvgjlVkeC5PX25q96b9VXxnCreVSEdqepXOIndkx/73U+bStGX3PQoKiYuxskhGcV6KQ
 etGTbauqX05MV6rmkhEAPfSVujk85WTlY5HolcQhKGTLeNirpsM6M294++HHacF8/AOk
 ymLv0d5pfYIrrfxwa0pRQH+XizSAhCn74cx8Wih6uJIMTK9vQlo0q2kaZxpJYKAzFuxh
 m/RA==
X-Gm-Message-State: AOJu0YyTKynAWwORvzkDdsOG9PXggMPy2FLv39umlKkEN+PE9Yz7clHm
 2DJDLWoWXhOYA2YRGHh5lFFyYF76gt4DACDfJ98bLfsS/ukhM58RbXccRFjw
X-Google-Smtp-Source: AGHT+IGmni+8QGXvK5EgJQgN2Rw5JG+Rhv5L+8myMJIbVoAvPmGS3RlExSCTaWxfXLRx26JtIuTU4g==
X-Received: by 2002:adf:ce8c:0:b0:374:c1ea:2d40 with SMTP id
 ffacd0b85a97d-37ccdb097ccmr2049818f8f.1.1727354496165; 
 Thu, 26 Sep 2024 05:41:36 -0700 (PDT)
Received: from aleksandr-System-Product-Name.qscaudio.com ([146.70.124.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd2878cf0sm505303f8f.75.2024.09.26.05.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 05:41:35 -0700 (PDT)
From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 15:41:31 +0300
Message-ID: <20240926124131.930145-1-aleksandr.o.makarov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727354496; x=1727959296; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JopgqhopP/FwIOPy8RWNaj5bk07PkmWfHSX5cu0hczg=;
 b=SSs126z83si4ZEPCSVNF2+7gVvTCRJguf+U8+TCCQoTAEUolpOXXjggBY2b4+VJ8j9
 qPQbGPdm53hchmMPK6TRUqhPMilQ47qCyTKSUDhkb6lyxhg4j0rdqr4v+QPcUolxnUdE
 MX2SOa3QRo0ezRSRH9l0Oiq96fqQ6CrGhSwuSEPofZatzczgX0L1wqr3UKJqfSaThfls
 fV5tu5TDMWRo/lOeOqSy2Q6X7W47SRbc/jY5POsimCdxrdceu0MI+F0fd3itw5V+YKxr
 Aol0Khg0Zj/0XPVya/8S9hz+Wie6D7ypPmc8uEYZKibc/m7bGINDz6ZiEx2f8rKBA578
 6ogQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SSs126z8
Subject: [Buildroot] [PATCH 1/1] package/cpp-httplib: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
---
 package/Config.in                    |  1 +
 package/cpp-httplib/Config.in        | 21 +++++++++++++
 package/cpp-httplib/cpp-httplib.hash |  3 ++
 package/cpp-httplib/cpp-httplib.mk   | 44 ++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 package/cpp-httplib/Config.in
 create mode 100644 package/cpp-httplib/cpp-httplib.hash
 create mode 100644 package/cpp-httplib/cpp-httplib.mk

diff --git a/package/Config.in b/package/Config.in
index c0f4d9ece5..27f464b112 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1987,6 +1987,7 @@ menu "Networking"
 	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/cni-plugins/Config.in"
+	source "package/cpp-httplib/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/curlpp/Config.in"
 	source "package/czmq/Config.in"
diff --git a/package/cpp-httplib/Config.in b/package/cpp-httplib/Config.in
new file mode 100644
index 0000000000..ee24adff81
--- /dev/null
+++ b/package/cpp-httplib/Config.in
@@ -0,0 +1,21 @@
+comment "cpp-httplib needs a toolchain w/ C++, wchar, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_CPP_HTTPLIB
+	bool "cpp-httplib"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	help
+	  A C++ header-only HTTP/HTTPS server and client library.
+
+	  https://github.com/yhirose/cpp-httplib
+
+if BR2_PACKAGE_CPP_HTTPLIB
+config BR2_PACKAGE_CPP_HTTPLIB_COMPILE
+	bool "compile"
+	select BR2_PACKAGE_HOST_PYTHON3
+	help
+	  Build as library
+
+endif # BR2_PACKAGE_CPP_HTTPLIB
diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
new file mode 100644
index 0000000000..45c2214105
--- /dev/null
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  6ed5894bbbc4a34a0f4c5e962672d0003d2ea099bbadacc66f6dee2b213ff394  cpp-httplib-0.18.0.tar.gz
+sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
new file mode 100644
index 0000000000..9b66114851
--- /dev/null
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# cpp-httplib
+#
+################################################################################
+
+CPP_HTTPLIB_VERSION = 0.18.0
+CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
+CPP_HTTPLIB_LICENSE = MIT
+CPP_HTTPLIB_LICENSE_FILES = LICENSE
+CPP_HTTPLIB_CONF_OPTS = \
+	-Dcpp-httplib_test=false
+
+
+ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_compile=true
+CPP_HTTPLIB_DEPENDENCIES += host-python3
+else
+CPP_HTTPLIB_INSTALL_STAGING = YES
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_openssl=enabled
+CPP_HTTPLIB_DEPENDENCIES += openssl
+else
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_openssl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_zlib=enabled
+CPP_HTTPLIB_DEPENDENCIES += zlib
+else
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_zlib=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_brotli=enabled
+CPP_HTTPLIB_DEPENDENCIES += brotli
+else
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_brotli=disabled
+endif
+
+$(eval $(meson-package))
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
