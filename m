Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C81CC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 09:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCF0B81BBD;
	Wed,  3 Aug 2022 09:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCF0B81BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVtJ345K6wnI; Wed,  3 Aug 2022 09:38:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C507781BB0;
	Wed,  3 Aug 2022 09:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C507781BB0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC581BF2A6
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 09:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 035D281BB0
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 09:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 035D281BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54qE_61UKBYC for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 09:38:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD70818C2
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADD70818C2
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 09:38:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z16so20786268wrh.12
 for <buildroot@busybox.net>; Wed, 03 Aug 2022 02:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TOCt2D6mOGLHr/bRTFLgzuAnvPLqqleG+otela5kXvs=;
 b=ehhGcZ/uNIcpseX4kfSsWe69q0FDQHoslSE7vhyWM7D9hRHCVHfGKdjKxM6UlI1t1h
 0JYYS6ztvmSW8Qwi4jgLb3XXH64S7L/runLHhKYU2ZFFiEjDsoRSk4Wat0voTBAOEK3A
 nXkVCD7XyGKQBsVEUVz4BMaTSLpHT108ii+xjEwd6R3+rlGgM1p/GmBL8OVAh7U117az
 7sUah18WTbRL13SsTUTmqdmqpuIFHc78Notvp0D1GRYYWjUsEDafmgEFwkMjSB4UgNS4
 V8gzNUECmKJpV9LX/ZmJnI7etWZdBN1vWA52gLAslztPIbE6kWcfpvLk/hJe6Hj7zXeW
 cXOw==
X-Gm-Message-State: ACgBeo1Zv7g9FklinE2lcCMmzLFa/tbc1AzwjKSUEnctiMc4SXB3rcV/
 ZlCJzGnZF6o4w+H2FEvUeE/omHnGHhU=
X-Google-Smtp-Source: AA6agR5WMfkyVQROjav3+Jwn0QSrlrHYMRjM8UgyiVPx7OeTdTSifVy8Ap3SFcd0fwStspICsUDJEA==
X-Received: by 2002:a05:6000:1446:b0:21d:cfe1:67a0 with SMTP id
 v6-20020a056000144600b0021dcfe167a0mr15755421wrx.91.1659519484598; 
 Wed, 03 Aug 2022 02:38:04 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003a4bb3f9bc6sm2109981wmp.41.2022.08.03.02.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 02:38:04 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Wed,  3 Aug 2022 11:37:54 +0200
Message-Id: <20220803093754.19637-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TOCt2D6mOGLHr/bRTFLgzuAnvPLqqleG+otela5kXvs=;
 b=c+7wfCmtVRT6DrkD6NIjvXaHRilXlfQaFDUsgv/WYKndOc0ZlMRwlgKFbMvOHgjXtC
 MeifitSfPf0V3ul9jrVYkcvfz4qjGyTAPJyoasSUL6y50qbfE0QTrAfJS+gR3+Iz2GV7
 gRwvnE2HydfObeXkXoGb9Jns07quFeEGBTeGHw07iu0eiQHfd9MO6f529vMw8u7X/UMj
 zm+yRv6ci9yXEpkFIQcFgF/cviRyqiKr6zzywVyhzREPDAm80ayYMylB3AMjL1H+Q42C
 aLx+R0bYxf7MY+8Ve4PUUch8e+ADA6SQUxpO28270XQvVRKP4D3Yhb6FNtd64VKvxsuY
 f/iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c+7wfCmt
Subject: [Buildroot] [RFC 1/1] package/python-scipy: bump version to 1.9.0
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

Scipy is moving to a Meson build infrastructure.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
I'm expecting meson to simplify things a lot for us.
But we're not there yet..

I'm referring to this page, which is the only one available at the moment,
on how to build the package with the new infra

https://scipy.github.io/devdocs/dev/contributor/meson.html

My current setup has pretty much everything figured out, but meson
does not locate the fortran cross-compiler. Could anyone help me?

output/build/python-scipy-v1.9.0/meson.build:41:0: ERROR: 'fortran' compiler binary not defined in cross or native file

cat output/build/python-scipy-v1.9.0/build/cross-compilation.conf
[binaries]
c = '/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc'
cpp = '/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-g++'
ar = '/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc-ar'
strip = '/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-strip'
cmake = '/usr/bin/cmake'
pkgconfig = '/buildroot/output/host/bin/pkgconf'
g-ir-compiler = '/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/g-ir-compiler'
g-ir-scanner = '/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/g-ir-scanner'

[built-in options]
c_args = ['-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=64', '-Os', '-g0', '-D_FORTIFY_SOURCE=1']
c_link_args = []
cpp_args = ['-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=64', '-Os', '-g0', '-D_FORTIFY_SOURCE=1']
cpp_link_args = []
wrap_mode = 'nodownload'
cmake_prefix_path = '/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/cmake'

[properties]
needs_exe_wrapper = true
sys_root = '/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot'
pkg_config_libdir = '/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig:/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig'
pkg_config_static = 'false'
cmake_toolchain_file = '/buildroot/output/host/share/buildroot/toolchainfile.cmake'
cmake_defaults = false

[host_machine]
system = 'linux'
cpu_family = 'arm'
cpu = 'cortex-a7'
endian = 'little

With my current setup, I am able to
- fetch the git submoule like in the 1st tutorial
- initiate the meson configure step
- meson figures out pretty much everything correctly (gcc, etc..)
- meson fails to locate "fortran" the gfortran cross-compiler.
I have tried PYTHON_SCIPY_NINJA_ENV and PYTHON_SCIPY_CONF_ENV,
but none of these have any effect.

See this page for meson benefits, dependencies and general discussions
https://labs.quansight.org/blog/2021/07/moving-scipy-to-meson
---
 package/python-scipy/python-scipy.hash |  2 +-
 package/python-scipy/python-scipy.mk   | 35 ++++++++------------------
 2 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 0274679c43..704581639f 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,5 +1,5 @@
 # Locally generated
-sha256  0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a1e9  scipy-1.8.1.tar.xz
+sha256  6d06380a5e93e254de693d763cd7c1f888b217a78f39cad438769aa353ded8a9  python-scipy-v1.9.0-br1.tar.gz
 sha256  96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce623788a33da19c  LICENSE.txt
 sha256  37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index b5006a2e15..810f58482f 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.8.1
-PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.xz
-PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
+PYTHON_SCIPY_VERSION = v1.9.0
+PYTHON_SCIPY_SITE_METHOD = git
+PYTHON_SCIPY_SITE = https://github.com/scipy/scipy.git
+PYTHON_SCIPY_GIT_SUBMODULES = YES
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
@@ -23,6 +24,7 @@ PYTHON_SCIPY_LICENSE_FILES = \
 	scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING \
 	scipy/spatial/qhull_src/COPYING.txt
 PYTHON_SCIPY_DEPENDENCIES += \
+	host-pkgconf \
 	host-python-numpy \
 	host-python-pythran \
 	zlib \
@@ -31,26 +33,11 @@ PYTHON_SCIPY_DEPENDENCIES += \
 	python-pybind
 PYTHON_SCIPY_INSTALL_STAGING = YES
 
-PYTHON_SCIPY_SETUP_TYPE = setuptools
-PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
+PYTHON_SCIPY_CONF_ENV += \
+	PYTHONPATH=$(PYTHON3_PATH) \
+	fortran="$(TARGET_FC)"
 
-PYTHON_SCIPY_LDFLAGS = $(TARGET_LDFLAGS) -shared \
-	-L$(PYTHON3_PATH)/site-packages/numpy/core/lib
-# -lnpyrandom localization
-PYTHON_SCIPY_LDFLAGS += \
-	-L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/random/lib
+PYTHON_SCIPY_CONF_OPTS = \
+	-Dlapack=lapack
 
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
-endef
-
-$(eval $(python-package))
+$(eval $(meson-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
