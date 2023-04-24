Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB0DC77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4950141763;
	Mon, 24 Apr 2023 20:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4950141763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWue9T8XCEgi; Mon, 24 Apr 2023 20:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC28B41758;
	Mon, 24 Apr 2023 20:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC28B41758
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5DD91BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD02681F0A
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD02681F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBJowWctmajb for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C57E381F06
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C57E381F06
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:23 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-63b7b54642cso3691044b3a.0
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367923; x=1684959923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0n7STI62O8XI3oymCkuNUBoXUNmzFWEhWp0Fer++t8=;
 b=Kp+aanwPdJ2UU4y9farNOQ8EJscKhcRqfhV5LsHRImc8X+OApG6jwKledsBip+IPfp
 fbtq/sjK61h/s7UnvELzC46ZVFt7pFKt7w2kfatdYA+iCg0zhFWYIWyBSA/tDeX8ZVZ1
 Mi8hqet2ozwJ1vxy9z+0JfJiRXLEvL4k8Y/nGjbhZMDQWw3US8KDoIlBBR2/zQTs6sA1
 PF3GA09axYMKKnFw2D3Ii/nCEo5l9IYmIXD1kzhSHCFDLJYgDg212g0fWnwyTxJ/C2Qs
 21TeNPYw7DSKtoHp4NAN9OB8n0tRL5yQNMGwIMgyfn+nDSjeWRSpU/8UxbkJLVciPZJc
 V9gg==
X-Gm-Message-State: AAQBX9eAHK0XH1Gjd4w1wOS0hydxwWiiWekfOhFTVHpzHE69sKBoq5xh
 KB1xT3sulTSViphS+z8WKwDjvsaCIjSMuQ==
X-Google-Smtp-Source: AKy350Y09f44F+7i9nmUOAtKIjBbyk58edYs2DETcHAPxcedOxQqO36D+lbfylkeYdp5b9D0YqQE6Q==
X-Received: by 2002:a05:6a00:1144:b0:63f:120a:1d96 with SMTP id
 b4-20020a056a00114400b0063f120a1d96mr16219675pfm.11.1682367922679; 
 Mon, 24 Apr 2023 13:25:22 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:22 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:06 -0700
Message-Id: <20230424202514.1546092-6-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367923; x=1684959923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0n7STI62O8XI3oymCkuNUBoXUNmzFWEhWp0Fer++t8=;
 b=TJrAfmXxjjfzM9QO1Z/naTtrylcgbz/f162KYa8LgGcZwRYJCAykvWWAzOsnfxuOfA
 KZfOFJN+QBiNvyRSVK1wI6mZQvze6kJEEvD+DqULx8Aj557l+Ra+Cs9wfFEgP6Ma02WH
 wSI+KuiEoC95bXpvmi44QgIIpfBY68p0HFJqtoKGZiJ4za3EEef8qljSLWSAaw+Kpl9+
 hG8RX7nsxzJzwG/s6y0YoByyICuP1fi0fTE27Cb+FljITiDXibrePDAfCod3F6oac5WE
 2iy10SZrYwwSZwds08QgGo7GTIhvd6t09AX5B2CrGRGWoBvk9kgai372QuAgBjYKaM9Q
 9u3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TJrAfmXx
Subject: [Buildroot] [PATCH 05/13] package/libselinux: bump to version 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- libselinux now requires pip to install the python tools.
- Rebase patches for version 3.5

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libselinux/0001-fix-musl-build.patch     |  4 ++--
 ...CEXT-and-rely-on-the-installed-file-nam.patch |  8 ++++----
 package/libselinux/Config.in                     |  1 +
 package/libselinux/libselinux.hash               |  2 +-
 package/libselinux/libselinux.mk                 | 16 +++++++++++++---
 5 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/package/libselinux/0001-fix-musl-build.patch b/package/libselinux/0001-fix-musl-build.patch
index 44189e6400..b8b16be26f 100644
--- a/package/libselinux/0001-fix-musl-build.patch
+++ b/package/libselinux/0001-fix-musl-build.patch
@@ -12,13 +12,13 @@ Domain, and we want to avoid license propagation, so this macro is
 completely written from scratch, and non-optimal.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-[Updated for 3.0]
+[Updated for 3.5]
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 diff --git a/src/booleans.c b/src/booleans.c
 index ffa8d26..8569002 100644
 --- a/src/booleans.c
 +++ b/src/booleans.c
-@@ -65,6 +65,14 @@ int security_get_boolean_names(char ***names, int *len)
+@@ -64,6 +64,14 @@ int security_get_boolean_names(char ***names, int *len)
  		goto bad;
  	}
  
diff --git a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
index 18c79b3b4d..c744ca4069 100644
--- a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
+++ b/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
@@ -18,7 +18,7 @@ was installed.
 Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
 [Refreshed for 3.1]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[Refreshed for 3.0]
+[Refreshed for 3.5]
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 ---
  src/Makefile | 3 +--
@@ -31,14 +31,14 @@ index 190016e2af34..7ee22fd35da3 100644
 @@ -15,7 +15,6 @@ INCLUDEDIR ?= $(PREFIX)/include
  PYINC ?= $(shell $(PKG_CONFIG) --cflags $(PYPREFIX))
  PYLIBS ?= $(shell $(PKG_CONFIG) --libs $(PYPREFIX))
- PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(plat_specific=1, prefix='$(PREFIX)'))")
+ PYTHONLIBDIR ?= $(shell $(PYTHON) -c "import sysconfig; print(sysconfig.get_path('platlib', vars={'platbase': '$(PREFIX)', 'base': '$(PREFIX)'}))")
 -PYCEXT ?= $(shell $(PYTHON) -c 'import importlib.machinery;print(importlib.machinery.EXTENSION_SUFFIXES[0])')
  RUBYINC ?= $(shell $(RUBY) -e 'puts "-I" + RbConfig::CONFIG["rubyarchhdrdir"] + " -I" + RbConfig::CONFIG["rubyhdrdir"]')
  RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
  RUBYINSTALL ?= $(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
-@@ -184,7 +183,7 @@ install: all
+@@ -189,7 +188,7 @@ install: all
  install-pywrap: pywrap
- 	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)` $(PYTHON_SETUP_ARGS)
+ 	$(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
  	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
 -	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
 +	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index 3098fe3ea4..bc40e32a46 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_LIBSEPOL
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS if BR2_PACKAGE_PYTHON3
 	help
 	  libselinux is the runtime SELinux library that provides
 	  interfaces (e.g. library functions for the SELinux kernel
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index a2e0083f7b..14bc627a80 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  acfdee27633d2496508c28727c3d41d3748076f66d42fccde2e6b9f3463a7057  libselinux-3.3.tar.gz
+sha256  9a3a3705ac13a2ccca2de6d652b6356fead10f36fb33115c185c5ccdf29eec19  libselinux-3.5.tar.gz
 
 # Hash for license file
 sha256  86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364  LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index db35da130f..b8de21edaa 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 3.3
+LIBSELINUX_VERSION = 3.5
 LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
@@ -31,7 +31,11 @@ LIBSELINUX_MAKE_OPTS += FTS_LDLIBS=-lfts
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-LIBSELINUX_DEPENDENCIES += python3 host-swig
+LIBSELINUX_DEPENDENCIES += \
+	python3 \
+	python-setuptools \
+	host-python-pip \
+	host-swig
 
 LIBSELINUX_MAKE_OPTS += \
 	$(PKG_PYTHON_DISTUTILS_ENV) \
@@ -77,7 +81,13 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
 endef
 
 HOST_LIBSELINUX_DEPENDENCIES = \
-	host-pkgconf host-libsepol host-pcre2 host-swig host-python3
+	host-pkgconf \
+	host-libsepol \
+	host-pcre2 \
+	host-swig \
+	host-python3 \
+	host-python-pip \
+	host-python-setuptools
 
 HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
