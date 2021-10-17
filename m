Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3990CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 13:22:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 011CD61212
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 13:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 011CD61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C34884018B;
	Sun, 17 Oct 2021 13:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCpiCuZ7jWDP; Sun, 17 Oct 2021 13:22:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD4D74035A;
	Sun, 17 Oct 2021 13:22:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 574441BF5AE
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 13:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 472B6827CE
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 13:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t4my9VflmtoK for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 13:22:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE5A282428
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 13:22:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k7so35793286wrd.13
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YC/++Y2cTRiq2U74GEdT+fm80bm+iLHThsW8fqFCOeg=;
 b=hE5zIRhaKZ+pE02tkwbdpjap2mrBiwLZmLHR0KfzmMECo8+7CkprtBGuZ11yp/niAQ
 A6Rt3gA54UbskCjNpbHgQfIVPT6oGIXVKSb9K9aAQqDJGTLNeFRDfefzIAjaHNhNT3E/
 H7kTB83YVoUYMEwTJOpnVkEYExhFQsugxM5/ytlDJLh0i4YiUWk6zkp7Ideg/5IocZQ5
 /PeorSDSjZpMJqT3K4erm0x5ugvdO2pGNMsHtt8ebZ1ywAdihr2ZPE7JKk0fOnCjWscO
 AdpJsjlpcOgPQTN7q5Txq3tWwGROa4n44zFAgkAyyfiEK5Dbu0wGPDGWhoWX5tH96oPE
 TJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YC/++Y2cTRiq2U74GEdT+fm80bm+iLHThsW8fqFCOeg=;
 b=u8J/5NiH0f4BMwnXx4vonEbNAXT3uyEqwKfaG1IsIh1sRzBX0qVioKUATlgNJ/z/JC
 0kuoIu+F0UncN9q1uUKq1JprSHmWyG5inMypyyKH+jIXlQDunOlQZISRuLnJhvJTI0Y6
 GD3SPVW99zFMIiXrlgVj7YRUB0maRl9jgbVq2/xaIR/IXdEXV4cyJ4VneY/2EItzuerE
 TR8RDgcJW8tc4w6GZWf6TsIWCgwl/aQDm1U/rQBdiunAlNC1Wvc1rWQbK1X295zShrS4
 8Po5MNaErbryyL4B5r/X9vL/9aM3QsL4IFs1loz5pnfnpdbaRLX8GO9pQN1QXhaKIYOY
 nk2g==
X-Gm-Message-State: AOAM5313FJzk1W+u0njFDMzNhClJsd0/XuCa7+sT8iV7wO1rKdwPY1XF
 HgzCh2i5Gpx4wMVRjPkNBhGmzQti5Vg=
X-Google-Smtp-Source: ABdhPJyTruyKdUce4Dsd5+HIaCdOYDpPTDFIAuUmitblKe0SD/8hd96ARYO3kNaNRCVKAFsSynjpgg==
X-Received: by 2002:adf:ba87:: with SMTP id p7mr2395496wrg.282.1634476950827; 
 Sun, 17 Oct 2021 06:22:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id t14sm9944463wrr.75.2021.10.17.06.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 06:22:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 15:21:10 +0200
Message-Id: <20211017132110.1153910-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017132110.1153910-1-fontaine.fabrice@gmail.com>
References: <20211017132110.1153910-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5,2/2] package/zeek: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Zeek Network Security Monitor

Zeek is a powerful network analysis framework that is much different
from the typical IDS you may know. (Zeek is the new name for the
long-established Bro system.)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v4 -> v5:
 - host-python3 is mandatory

Changes v3 -> v4:
 - Bump to latest version (4.1.1) and drop patch (already in version)
 - python 2 support dropped since
   https://github.com/zeek/zeek/commit/eeec219a66ed89235093fb63753d6baf6c21de78
 - BSD-3-Clause added since
   https://github.com/zeek/zeek/commit/d070709c573fc01a40735a6c921a9095988306cc

Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Bump to version 3.2.2 (security fixes)
 - Add host-zeek dependencies
 - Install bifcl and binpac to HOST_DIR

Changes v1 -> v2:
 - Bump to version 3.2.0
 - Drop second and third patches (already in version)
 - Update ZEEK_SITE
 - Update indentation in hash file (two spaces)
 - Update third party licences

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/zeek/Config.in | 43 +++++++++++++++++++
 package/zeek/zeek.hash |  6 +++
 package/zeek/zeek.mk   | 93 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 144 insertions(+)
 create mode 100644 package/zeek/Config.in
 create mode 100644 package/zeek/zeek.hash
 create mode 100644 package/zeek/zeek.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 19f6d95270..30383af538 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -919,6 +919,7 @@ F:	package/tinycbor/
 F:	package/tinydtls/
 F:	package/tinymembench/
 F:	package/whois/
+F:	package/zeek/
 
 N:	Fabrice Goucem <fabrice.goucem@oss.nxp.com>
 F:	board/freescale/imx6ullevk/
diff --git a/package/Config.in b/package/Config.in
index 48f365d773..93f42cb74e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2366,6 +2366,7 @@ endif
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
+	source "package/zeek/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/zeek/Config.in b/package/zeek/Config.in
new file mode 100644
index 0000000000..e474251aeb
--- /dev/null
+++ b/package/zeek/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_ZEEK
+	bool "zeek"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  The Zeek Network Security Monitor
+
+	  Zeek is a powerful network analysis framework that is much
+	  different from the typical IDS you may know. (Zeek is the new
+	  name for the long-established Bro system.)
+
+	  https://www.zeek.org
+
+if BR2_PACKAGE_ZEEK
+
+config BR2_PACKAGE_ZEEK_ZEEKCTL
+	bool "zeekctl"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_BASH # runtime
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_PYTHON3_CURSES
+	select BR2_PACKAGE_PYTHON3_HASHLIB
+	select BR2_PACKAGE_PYTHON3_SQLITE
+	select BR2_PACKAGE_PYTHON3_ZLIB
+	help
+	  Tool for managing Zeek deployments
+
+comment "zeekctl tools needs python3"
+	depends on !BR2_PACKAGE_PYTHON3
+
+endif
+
+comment "zeek needs a toolchain w/ C++, wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/zeek/zeek.hash b/package/zeek/zeek.hash
new file mode 100644
index 0000000000..05e57b5024
--- /dev/null
+++ b/package/zeek/zeek.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256  8c0afc999a8dd1c1f677a5cf818479b99c2d527e679e1ef99fb1b03f989c0373  zeek-4.1.1.tar.gz
+
+# Hash for license files:
+sha256  b2817e2fb935805ec9fc0e90c6b971efd810d9aedfc646bc5fcb535221e0266a  COPYING
+sha256  1a451eca7b3826a7df62991ba90dd6d23ff03d28c2eefb7f8c4f8b1eac97a61b  COPYING.3rdparty
diff --git a/package/zeek/zeek.mk b/package/zeek/zeek.mk
new file mode 100644
index 0000000000..1e30b9d95f
--- /dev/null
+++ b/package/zeek/zeek.mk
@@ -0,0 +1,93 @@
+################################################################################
+#
+# zeek
+#
+################################################################################
+
+ZEEK_VERSION = 4.1.1
+ZEEK_SITE = https://download.zeek.org
+ZEEK_LICENSE = \
+	BSD-3-Clause (zeek, C++ Actor Framework, ConvertUTF.c, CardinalityCounter.cc, pybind11), \
+	Public Domain (sqlite), \
+	MIT (doctest, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
+	LGPL-3.0+ (Multifast Project), \
+	BSD-2-Clause (event.h), \
+	BSD-3-Clause (in_cksum.cc) \
+	BSD-4-Clause (Patricia.c, strsep.c, bsd-getopt-long.c), \
+	Apache-2.0 (highwayhash, folly), \
+	MPL-2.0 (mozilla-ca-list.zeek)
+ZEEK_LICENSE_FILES = COPYING COPYING.3rdparty
+ZEEK_SUPPORTS_IN_SOURCE_BUILD = NO
+ZEEK_DEPENDENCIES = \
+	host-bison \
+	host-flex \
+	host-pkgconf \
+	host-python3 \
+	host-zeek \
+	$(if $(BR2_PACKAGE_LIBKRB5),libkrb5) \
+	$(if $(BR2_PACKAGE_LIBMAXMINDDB),libmaxminddb) \
+	libpcap \
+	openssl \
+	$(if $(BR2_PACKAGE_ROCKSDB),rocksdb) \
+	zlib
+HOST_ZEEK_DEPENDENCIES = \
+	host-bison \
+	host-flex \
+	host-pkgconf \
+	host-python3 \
+	host-libpcap \
+	host-openssl \
+	host-zlib
+
+ZEEK_CONF_OPTS = \
+	-DBIFCL_EXE_PATH=$(HOST_DIR)/bin/bifcl \
+	-DBINPAC_EXE_PATH=$(HOST_DIR)/bin/binpac \
+	-DBROKER_DISABLE_DOCS=ON \
+	-DBROKER_DISABLE_TESTS=ON \
+	-DINSTALL_AUX_TOOLS=ON \
+	-DZEEK_ETC_INSTALL_DIR=/etc
+
+define ZEEK_FIX_PYTHON_PATH
+	$(SED) 's,@PYTHON_EXECUTABLE@,/usr/bin/python,' \
+		$(@D)/auxil/zeekctl/ZeekControl/ssh_runner.py
+endef
+
+ZEEK_POST_INSTALL_TARGET_HOOKS += ZEEK_FIX_PYTHON_PATH
+
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+ZEEK_DEPENDENCIES += jemalloc
+ZEEK_CONF_OPTS += -DENABLE_JEMALLOC=ON
+else
+ZEEK_CONF_OPTS += -DENABLE_JEMALLOC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZEEK_ZEEKCTL),y)
+ZEEK_DEPENDENCIES += \
+	host-swig \
+	$(if $(BR2_PACKAGE_PYTHON3),python3)
+ZEEK_CONF_OPTS += \
+	-DDISABLE_PYTHON_BINDINGS=OFF \
+	-DINSTALL_ZEEKCTL=ON \
+	-DPY_MOD_INSTALL_DIR=/usr/lib/zeekctl
+else
+ZEEK_CONF_OPTS += \
+	-DDISABLE_PYTHON_BINDINGS=ON \
+	-DINSTALL_ZEEKCTL=OFF
+endif
+
+ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+ZEEK_DEPENDENCIES += musl-fts
+ZEEK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
+endif
+
+HOST_ZEEK_MAKE_OPTS = binpac bifcl
+
+define HOST_ZEEK_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/bifcl/bifcl \
+		$(HOST_DIR)/bin/bifcl
+	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/binpac/src/binpac \
+		$(HOST_DIR)/bin/binpac
+endef
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
