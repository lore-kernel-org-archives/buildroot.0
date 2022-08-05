Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C29C25B08
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 14:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A9B360B1D;
	Fri,  5 Aug 2022 14:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A9B360B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zlLr0M1ADZTP; Fri,  5 Aug 2022 14:37:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D9586F970;
	Fri,  5 Aug 2022 14:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D9586F970
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89AEA1BF868
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 14:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 648DF83E90
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 14:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 648DF83E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yth_UFxbxa3F for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 14:37:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D689783E85
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D689783E85
 for <buildroot@busybox.net>; Fri,  5 Aug 2022 14:37:02 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n20-20020a05600c3b9400b003a4f2261a7eso1376717wms.2
 for <buildroot@busybox.net>; Fri, 05 Aug 2022 07:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dq60yWtRDK5rou2AZnd/LS6JtS3pC3mQRN0AlXTuYMY=;
 b=oyEv9GpsmvoD38ij4EIhomuSE5kbfJnhd65DDie4DxsFJOi7DPzXE/XVox9JqlXZjS
 /07V6St6TekeXCkfT6cWCszS4p47uxzqGs4TIA9ZyvnSniuaUAI1EGkmBraPWZLYrhtb
 Krms4/wbsEy2eXSO4tzRu/ggNvU8KmiZu3Es5hMyDphOcVweFLqdcROiV910vRoV3lJw
 Awq01rFSOLavYcyceJF1xSvp38rmFARq/MD6rwMng/uyBEgIsJcoaywV1JJrih12seFC
 RfU5095atJwy3Aa/5JhqFN66QzlMRq/KgGNOMN77yQU6Po5jQ2dVP1tZTepcT1+O1fbm
 n6dw==
X-Gm-Message-State: ACgBeo2KWKEjWaeFeNWmnvHE2c1wRA7o53Al8uQRn1kCD0PoqKODKnRN
 wilpIbclApIb4bu9+bswF04i2xAY3W4=
X-Google-Smtp-Source: AA6agR58txrOWF8ciNxxvHbZa4vjQVElQf04ELEis48yAdSFzXJ69TR/6i3x6QGO+MIcm+iA40aRyg==
X-Received: by 2002:a1c:a3c4:0:b0:3a4:eea2:b8dc with SMTP id
 m187-20020a1ca3c4000000b003a4eea2b8dcmr9589190wme.171.1659710220701; 
 Fri, 05 Aug 2022 07:37:00 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a05600010c300b002206261cb6esm4082031wrx.66.2022.08.05.07.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 07:37:00 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Fri,  5 Aug 2022 16:36:25 +0200
Message-Id: <20220805143625.16542-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
References: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dq60yWtRDK5rou2AZnd/LS6JtS3pC3mQRN0AlXTuYMY=;
 b=ZOjsUnzQk44CAKEsViwtm05fBqZSABVr0oD6rHd3++HDv+ig4GB6BM7yMATRzUNCnK
 Rs4gmFeJzbsw0gbh7Q2w7l1mP2UUwou9Xofm/GUlYCta1sc0cRNTQN0SzpKPHs82kwE3
 lduYtz73Cw233VI5ok3Xnwa8N5keYia3jo+2WuJvqy+VSztQlLOF8wO+5bv6/AT8B7Nf
 /PXVzueNiY7rqfj2e62c+GzHwmQ3urg0zRCgQsuIk5dKHvOwaz8pQAxtt+TlYgEyVgVW
 tXs/7JjMwnbXepMZi3vo1wlPjqIofUWLYwZTPYDJtDzbDNLxlbxjMNkwA18gTWbDqK1A
 ZoVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZOjsUnzQ
Subject: [Buildroot] [RFC v3 2/2] package/python-scipy: bump version to 1.9.0
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SciPy is moving to a meson build infrastructure.
The current meson build scripts deduce all internal
locations based on the host-python location, which is incorrect
when dealing with "npyrandom" and "npymath", that are included
in code that gets cross-compiled.

https://github.com/scipy/scipy/issues/14812

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
As expected, moving to meson already makes things much easier for us,
as meson is capable of deducing a cross-compilation context and can take
advantage of pkg-config too. Also, the distutils approach will get removed before 1.12.0.

The npy core lib "problem" is acknowledged by the scipy dev team and we can expect improved
behavior in the next releases. Ralf Gommers from the team provided
valuable input for this patch serie, thank you!

Run the runtime test with
./support/testing/run-tests -d dl -o test -k test.package.test_python_scipy.TestPythonPy3SciPy
---
 ...uild-fix-numpy-core-include-location.patch | 33 +++++++++++++++
 package/python-scipy/python-scipy.hash        |  2 +-
 package/python-scipy/python-scipy.mk          | 42 +++++++++----------
 3 files changed, 53 insertions(+), 24 deletions(-)
 create mode 100644 package/python-scipy/0001-scipy-meson.build-fix-numpy-core-include-location.patch

diff --git a/package/python-scipy/0001-scipy-meson.build-fix-numpy-core-include-location.patch b/package/python-scipy/0001-scipy-meson.build-fix-numpy-core-include-location.patch
new file mode 100644
index 0000000000..3b5ee78f3e
--- /dev/null
+++ b/package/python-scipy/0001-scipy-meson.build-fix-numpy-core-include-location.patch
@@ -0,0 +1,33 @@
+From 3045d4ebc83dda5922175758adc74018aebccdd1 Mon Sep 17 00:00:00 2001
+From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
+Date: Fri, 5 Aug 2022 16:02:21 +0200
+Subject: [PATCH] scipy/meson.build: fix numpy core include location
+
+The numpy core location is deduced from host-python,
+while we will include lib npyrandom and npymath when cross compiling.
+These two must be previously cross-compiled.
+
+Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
+---
+ scipy/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scipy/meson.build b/scipy/meson.build
+index 76bb3606e..f65601aee 100644
+--- a/scipy/meson.build
++++ b/scipy/meson.build
+@@ -52,9 +52,9 @@ inc_f2py = include_directories(incdir_f2py)
+ fortranobject_c = incdir_f2py / 'fortranobject.c'
+ 
+ cc = meson.get_compiler('c')
+-npymath_path = incdir_numpy / '..' / 'lib'
++npymath_path = @NUMPY_SYSROOT_INCDIR@ / '..' / 'lib'
+ npymath_lib = cc.find_library('npymath', dirs: npymath_path)
+-npyrandom_path = incdir_numpy / '..' / '..' / 'random' / 'lib'
++npyrandom_path = @NUMPY_SYSROOT_INCDIR@ / '..' / '..' / 'random' / 'lib'
+ # Note: `required: false` can be removed once numpy 1.19 is the minimum version
+ npyrandom_lib = cc.find_library('npyrandom', dirs: npyrandom_path, required: false)
+ 
+-- 
+2.30.2
+
diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 0274679c43..6637faf5b4 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,5 +1,5 @@
 # Locally generated
-sha256  0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a1e9  scipy-1.8.1.tar.xz
+sha256  c0dfd7d2429452e7e94904c6a3af63cbaa3cf51b348bd9d35b42db7e9ad42791  scipy-1.9.0.tar.gz
 sha256  96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce623788a33da19c  LICENSE.txt
 sha256  37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index b5006a2e15..cb0b078e0b 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.8.1
-PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.xz
+PYTHON_SCIPY_VERSION = 1.9.0
+PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
 PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
@@ -23,6 +23,7 @@ PYTHON_SCIPY_LICENSE_FILES = \
 	scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING \
 	scipy/spatial/qhull_src/COPYING.txt
 PYTHON_SCIPY_DEPENDENCIES += \
+	host-pkgconf \
 	host-python-numpy \
 	host-python-pythran \
 	zlib \
@@ -31,26 +32,21 @@ PYTHON_SCIPY_DEPENDENCIES += \
 	python-pybind
 PYTHON_SCIPY_INSTALL_STAGING = YES
 
-PYTHON_SCIPY_SETUP_TYPE = setuptools
-PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
-
-PYTHON_SCIPY_LDFLAGS = $(TARGET_LDFLAGS) -shared \
-	-L$(PYTHON3_PATH)/site-packages/numpy/core/lib
-# -lnpyrandom localization
-PYTHON_SCIPY_LDFLAGS += \
-	-L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/random/lib
-
-PYTHON_SCIPY_ENV = \
-	F90=$(TARGET_FC) \
-	LDFLAGS="$(PYTHON_SCIPY_LDFLAGS)"
-
-# Provide system configuration options to numpy distutils extensions, telling
-# to find all include files and libraries in staging directory.
-define PYTHON_SCIPY_CONFIGURE_CMDS
-	-rm -f $(@D)/site.cfg
-	echo "[DEFAULT]" >> $(@D)/site.cfg
-	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
-	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
+# the meson.build infrastructure, currently uses host-python
+# for code generation, f2py invokation, but also to determine
+# all internal dependencies location. It is incorrect regarging
+# libnpyrandom and libnpymath because we need the cross-compiled version
+# for these two
+# sed -i 's/@NUMPY_SYSROOT_INCDIR@/$(STAGING_DIR)\/usr\/lib\/python$(PYTHON3_VERSION_MAJOR)\/site-packages\/numpy/' $(@D)/scipy/meson.build
+define PYTHON_SCIPY_FIX_NUMPY_CORE_SYSROOT_LOCATION
+	sed -i \
+	    "s:@NUMPY_SYSROOT_INCDIR@:'$(STAGING_DIR)\/usr\/lib\/python$(PYTHON3_VERSION_MAJOR)\/site-packages\/numpy\/core\/include\/':" \
+	        $(@D)/scipy/meson.build
 endef
+PYTHON_SCIPY_PRE_CONFIGURE_HOOKS += PYTHON_SCIPY_FIX_NUMPY_CORE_SYSROOT_LOCATION
+
+PYTHON_SCIPY_CONF_OPTS = \
+	-Dblas=lapack \
+	-Dlapack=lapack
 
-$(eval $(python-package))
+$(eval $(meson-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
