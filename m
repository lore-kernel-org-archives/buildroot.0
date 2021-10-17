Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAAEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 13:01:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9149460FDC
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 13:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9149460FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FF29605D3;
	Sun, 17 Oct 2021 13:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEmYUReAnx2t; Sun, 17 Oct 2021 13:01:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 583976066D;
	Sun, 17 Oct 2021 13:01:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63F731BF976
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 13:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 607084034A
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 13:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgLVsLgeEgyl for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 13:01:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 277D540345
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 13:01:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 j10-20020a1c230a000000b0030d523b6693so7610834wmj.2
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x9kktq3/fJVR+WP4u4wjrLKEyOcWIO0OW+AuHU66Bio=;
 b=ovB+s6UamLW9E0WYFxdqXhLk5AO5P51Aeik4OuJ4uFW09EMpt8X3JdndVVQ8ySCz5y
 aRAB5JMkkDQoi1ddGn0lH7IBc8zCrJbZZ7yyiXvgNGFQhDz+nRX1NbbORzZ2ixkWXHh6
 5lAn831tWGKTmY1WohKXP6eG6tflnit4KXr8iRt6A+M+E/0UmtWQcPtNqL+AUZJJFZz9
 kP2OrAOTTur4miwsjBGtjxHp0/qQ2LunpV9EK4hiCnzl6zovaEAKiM0yK0o6lDTeflGD
 Nrqu5RXVTtQ5Lt+M9Ql+R3C4V+sUJG2yNq2N+a7OJRQfuLU7lPKYd0miDfN+23kosHM0
 wHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x9kktq3/fJVR+WP4u4wjrLKEyOcWIO0OW+AuHU66Bio=;
 b=HrGvS2msG7SfuVAJEiAvEWhV2ijT4dA0rAq1sJPtxT5rSNw4h+oPrTzRt8PmAdPdj9
 WU1C0zseN+tCrCfHDcQQw6CNj4r7bPVq2SyMGjb9PzzKYH7xHDEqT7j55r7sxxTc2bKs
 8ZCYWUbVFkJmGlmz1LyTNR0ywDYpotE2r7fdBja0g3f+MVPVfpkefLAeW5HDNt3VFebm
 u/J+D1jUrA4GmgqYiBtgkoFCg2QV3ggQs4USISFPAgXZYLzvysF0knUvBFQdgIErrQJq
 tdhX84AcDdkzyr9jx8tOrnwXocEOP7nGvnK7kFVFrce2PVsC+/Bh/gP3r7Wz7CRNDtmZ
 h4gA==
X-Gm-Message-State: AOAM533X+ws8UMC1dK4CUVQ15minQ0Uyh5Z4bhjEaCGvSAmeF99VyLiP
 kW1AnC21FZ2tmW9zec+3JqZxVVdYV6M=
X-Google-Smtp-Source: ABdhPJyXLDPj+3iLjxPKs5LHEw+5vlBnpZ7NgoMlHVdB200hjRWetolZpvLyLitLVMUs7jJA70IoNg==
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr38330505wmq.5.1634475660131; 
 Sun, 17 Oct 2021 06:01:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id l2sm9781671wrw.42.2021.10.17.06.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 06:00:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 14:59:39 +0200
Message-Id: <20211017125939.1007483-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017125939.1007483-1-fontaine.fabrice@gmail.com>
References: <20211017125939.1007483-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4,2/2] package/zeek: new package
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
 package/zeek/Config.in | 43 +++++++++++++++++++++
 package/zeek/zeek.hash |  6 +++
 package/zeek/zeek.mk   | 87 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 138 insertions(+)
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
index 0000000000..b2900f4090
--- /dev/null
+++ b/package/zeek/zeek.mk
@@ -0,0 +1,87 @@
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
+	$(if $(BR2_PACKAGE_PYTHON3),host-python3) \
+	host-zeek \
+	$(if $(BR2_PACKAGE_LIBKRB5),libkrb5) \
+	$(if $(BR2_PACKAGE_LIBMAXMINDDB),libmaxminddb) \
+	libpcap \
+	openssl \
+	$(if $(BR2_PACKAGE_ROCKSDB),rocksdb) \
+	zlib
+HOST_ZEEK_DEPENDENCIES = \
+	host-bison host-flex host-pkgconf host-libpcap host-openssl host-zlib
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
