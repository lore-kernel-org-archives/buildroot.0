Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFFBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 23:00:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82CF461090
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 23:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82CF461090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59C2083267;
	Thu, 14 Oct 2021 23:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z4orVtrHG8jD; Thu, 14 Oct 2021 23:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49FE5831A7;
	Thu, 14 Oct 2021 23:00:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA291BF37B
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1777540105
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ob8uJ2qDkbvH for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:58:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8079740018
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:58:58 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id s136so3623830pgs.4
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 15:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=efqnP/J0R6GqUAATBGgMgRFkjT52dMvbN7mfvLmFZFw=;
 b=Ik28fZfUdY9mfgCbjwLpa/1z9mRlmI/Dko7GzPO6yzuLg3sFxYPChSSaJGOhdLW2vU
 VZUi56Gmg5kxVS+gCgX16PXZEEdYOgjFRMGicHsCSaH5wfK4nr4Q6kt4IcBoMC1O6BoM
 BBiYkI9hRVflC/2faQ/f6NPPLeAf7QRrZBKk3u6KI9trGvlZVSdDmMV+ejjtZJ0w7phX
 qrxhFes8NTFseO3jA+KdcQpl207f7D3mrV7Pc+Qdik0ahP+g4pBS6ThA6y/3dkm4KZOq
 p3O5biAKGP8WnM/Wex8W8pOYQ/hUHodQGgWbV3tK74Ce9ORblp2YOvpC6dYAD/h25Egz
 G7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=efqnP/J0R6GqUAATBGgMgRFkjT52dMvbN7mfvLmFZFw=;
 b=HBxPsUhUmeUvngLNsd6y4Sunp6klBSwK+OKxQOa0TdOkm0qnMzsLSbWdbYO36YCuSh
 Gk8pBNfWtPm7hGTVcqjB5GB2eNVojwsQ+mDnoFeuIRjoySQ9RjM3kbAikLOPFjfuXl61
 EzESjjUZ4T78tp2Vj68S/nRyTiI79epx6xmknHNz4ipeTd08eXsv++xAZfNlTcG3y5bf
 6I/GsUwLJWeWdZFD+pYfDGkPox1F18MNRgYc8kSTZj/ZIRNFUrp3cvI2fJUsHaV2EAGk
 xMpgw+jfLqbm2V748UYRpToVK9001FYz5MOEaY4lV+kT61z90ysdXQp+k4ZuQHKZkD2a
 osYA==
X-Gm-Message-State: AOAM532bsRL9gE+/wovpsJrkRoxYHxmvQ6/G4ccGYwlahm1w9rzz+NPp
 RWV7ohqSjyF7TpZjuvayG60etcxGUZI=
X-Google-Smtp-Source: ABdhPJy/81T2G00aQFgc4EKn7TjbvE1b0B/NNtFzCSvkvKAWuqRkNwjCm1KP4Ah+PM1O9lUbODB6aw==
X-Received: by 2002:a62:3387:0:b0:44d:7ec:906a with SMTP id
 z129-20020a623387000000b0044d07ec906amr8279402pfz.69.1634252337669; 
 Thu, 14 Oct 2021 15:58:57 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id w19sm10171319pjy.9.2021.10.14.15.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:58:57 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 15:58:44 -0700
Message-Id: <20211014225849.832479-7-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014225849.832479-1-aduskett@gmail.com>
References: <20211014225849.832479-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 06/11] package/python-matplotlib: bump to
 version 3.4.3
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Remove upstreamed patches
- Add BR2_PACKAGE_PYTHON_CERTIFI and BR2_PACKAGE_QHULL as dependencies
- Add a new file: setup.cfg. This file is needed to force matplotlib to use
  the system-provided freetype and qhull, and to disable lto.
  The setup.cfg file is copied to the source directory before configuring.

LTO must be disabled or else compile errors such as:
"Relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZSt3hexRSt8ios_base'
which may bind externally can not be used when making a shared object;
recompile with -fPIC"

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../0001-Fix-invalid-inclusion-headers.patch  |  29 ---
 ...st-11983-from-anntzer-builddepchecks.patch | 170 ------------------
 package/python-matplotlib/Config.in           |   2 +
 .../python-matplotlib/python-matplotlib.hash  |   2 +-
 .../python-matplotlib/python-matplotlib.mk    |  14 +-
 package/python-matplotlib/setup.cfg           |  10 ++
 6 files changed, 23 insertions(+), 204 deletions(-)
 delete mode 100644 package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch
 delete mode 100644 package/python-matplotlib/0002-Merge-pull-request-11983-from-anntzer-builddepchecks.patch
 create mode 100644 package/python-matplotlib/setup.cfg

diff --git a/package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch b/package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch
deleted file mode 100644
index b10bfb326f..0000000000
--- a/package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b0232c3cf1051749dd1e2bd0ec7c5c0a3a008d2f Mon Sep 17 00:00:00 2001
-From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
-Date: Thu, 9 May 2019 15:06:36 +0200
-Subject: [PATCH] Fix invalid inclusion headers
-
-By default, matplotlib includes headers from host
-machine which breaks the build process.
-
-Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
----
- python-matplotlib-3.0.3/setupext.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setupext.py b/setupext.py
-index fc82d5d..eb978d2 100644
---- a/setupext.py
-+++ b/setupext.py
-@@ -267,7 +267,7 @@ def get_base_dirs():
-         'gnu0': ['/usr'],
-         'aix5': ['/usr/local'],
-         }
--    return basedir_map.get(sys.platform, ['/usr/local', '/usr'])
-+    return basedir_map.get(sys.platform, [])
- 
- 
- def get_include_dirs():
--- 
-2.7.4
-
diff --git a/package/python-matplotlib/0002-Merge-pull-request-11983-from-anntzer-builddepchecks.patch b/package/python-matplotlib/0002-Merge-pull-request-11983-from-anntzer-builddepchecks.patch
deleted file mode 100644
index b3a22acbb4..0000000000
--- a/package/python-matplotlib/0002-Merge-pull-request-11983-from-anntzer-builddepchecks.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-From 923ce72409f184bd8e8c61b196260891036ba87e Mon Sep 17 00:00:00 2001
-From: Antony Lee <anntzer.lee@gmail.com>
-Date: Thu, 30 Aug 2018 15:27:55 +0200
-Subject: [PATCH] Simplify version checks for freetype and libpng.
-
-Currently, setupext.py replicates a lot of work done by the compiler to
-check whether header files are present, and whether freetype and libpng
-have sufficiently recent versions.
-
-Instead, we can just add a small stub source file at the top of the
-extension sources which just tries to include the header and checks the
-version macros.  If the header is not found, compilation will
-immediately abort with `foo.h: No such file or directory`; if the
-version is too old, we can emit an appropriate error message (`#pragma
-message` is supported by all major compilers and allows expanding of
-macros in the error message).
-
-[Retrieved from:
-https://github.com/matplotlib/matplotlib/commit/d1060a885309ec7ac19ca912d3011a5eb1673bd5]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- setupext.py              | 83 +++++-----------------------------------
- src/checkdep_freetype2.c | 13 +++++++
- src/checkdep_libpng.c    |  5 +++
- 3 files changed, 28 insertions(+), 73 deletions(-)
- create mode 100644 src/checkdep_freetype2.c
- create mode 100644 src/checkdep_libpng.c
-
-diff --git a/setupext.py b/setupext.py
-index d5f4b81f562..a5163e39288 100644
---- a/setupext.py
-+++ b/setupext.py
-@@ -814,6 +814,13 @@ def add_flags(self, ext, add_sources=True):
-                                for x in agg_sources)
- 
- 
-+# For FreeType2 and libpng, we add a separate checkdep_foo.c source to at the
-+# top of the extension sources.  This file is compiled first and immediately
-+# aborts the compilation either with "foo.h: No such file or directory" if the
-+# header is not found, or an appropriate error message if the header indicates
-+# a too-old version.
-+
-+
- class FreeType(SetupPackage):
-     name = "freetype"
-     pkg_names = {
-@@ -825,59 +832,8 @@ class FreeType(SetupPackage):
-         "windows_url": "http://gnuwin32.sourceforge.net/packages/freetype.htm"
-         }
- 
--    def check(self):
--        if options.get('local_freetype'):
--            return "Using local version for testing"
--
--        if sys.platform == 'win32':
--            try:
--                check_include_file(get_include_dirs(), 'ft2build.h', 'freetype')
--            except CheckFailed:
--                check_include_file(get_include_dirs(), os.path.join('freetype2', 'ft2build.h'), 'freetype')
--            return 'Using unknown version found on system.'
--
--        status, output = subprocess.getstatusoutput(
--            "freetype-config --ftversion")
--        if status == 0:
--            version = output
--        else:
--            version = None
--
--        # Early versions of freetype grep badly inside freetype-config,
--        # so catch those cases. (tested with 2.5.3).
--        if version is None or 'No such file or directory\ngrep:' in version:
--            version = self.version_from_header()
--
--        # pkg_config returns the libtool version rather than the
--        # freetype version so we need to explicitly pass the version
--        # to _check_for_pkg_config
--        return self._check_for_pkg_config(
--            'freetype2', 'ft2build.h',
--            min_version='2.3', version=version)
--
--    def version_from_header(self):
--        version = 'unknown'
--        ext = self.get_extension()
--        if ext is None:
--            return version
--        # Return the first version found in the include dirs.
--        for include_dir in ext.include_dirs:
--            header_fname = os.path.join(include_dir, 'freetype.h')
--            if os.path.exists(header_fname):
--                major, minor, patch = 0, 0, 0
--                with open(header_fname, 'r') as fh:
--                    for line in fh:
--                        if line.startswith('#define FREETYPE_'):
--                            value = line.rsplit(' ', 1)[1].strip()
--                            if 'MAJOR' in line:
--                                major = value
--                            elif 'MINOR' in line:
--                                minor = value
--                            else:
--                                patch = value
--                return '.'.join([major, minor, patch])
--
-     def add_flags(self, ext):
-+        ext.sources.insert(0, 'src/checkdep_freetype2.c')
-         if options.get('local_freetype'):
-             src_path = os.path.join(
-                 'build', 'freetype-{0}'.format(LOCAL_FREETYPE_VERSION))
-@@ -1058,30 +1014,11 @@ class Png(SetupPackage):
-         "windows_url": "http://gnuwin32.sourceforge.net/packages/libpng.htm"
-         }
- 
--    def check(self):
--        if sys.platform == 'win32':
--            check_include_file(get_include_dirs(), 'png.h', 'png')
--            return 'Using unknown version found on system.'
--
--        status, output = subprocess.getstatusoutput("libpng-config --version")
--        if status == 0:
--            version = output
--        else:
--            version = None
--
--        try:
--            return self._check_for_pkg_config(
--                'libpng', 'png.h',
--                min_version='1.2', version=version)
--        except CheckFailed as e:
--            if has_include_file(get_include_dirs(), 'png.h'):
--                return str(e) + ' Using unknown version found on system.'
--            raise
--
-     def get_extension(self):
-         sources = [
-+            'src/checkdep_libpng.c',
-             'src/_png.cpp',
--            'src/mplutils.cpp'
-+            'src/mplutils.cpp',
-             ]
-         ext = make_extension('matplotlib._png', sources)
-         pkg_config.setup_extension(
-diff --git a/src/checkdep_freetype2.c b/src/checkdep_freetype2.c
-new file mode 100644
-index 00000000000..bf9a8c94e38
---- /dev/null
-+++ b/src/checkdep_freetype2.c
-@@ -0,0 +1,13 @@
-+#include <ft2build.h>
-+#include FT_FREETYPE_H
-+
-+#define XSTR(x) STR(x)
-+#define STR(x) #x
-+
-+#pragma message("Compiling with FreeType version " \
-+  XSTR(FREETYPE_MAJOR) "." XSTR(FREETYPE_MINOR) "." XSTR(FREETYPE_PATCH) ".")
-+#if FREETYPE_MAJOR << 16 + FREETYPE_MINOR << 8 + FREETYPE_PATCH < 0x020300
-+    #error "FreeType version 2.3 or higher is required." \
-+      "Consider setting the MPLLOCALFREETYPE environment variable to 1."
-+  #error
-+#endif
-diff --git a/src/checkdep_libpng.c b/src/checkdep_libpng.c
-new file mode 100644
-index 00000000000..5ebe5cbe4d7
---- /dev/null
-+++ b/src/checkdep_libpng.c
-@@ -0,0 +1,5 @@
-+#include <png.h>
-+#pragma message("Compiling with libpng version " PNG_LIBPNG_VER_STRING ".")
-+#if PNG_LIBPNG_VER < 10200
-+  #error "libpng version 1.2 or higher is required."
-+#endif
diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index afc090856f..f38618d709 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_FREETYPE # runtime
 	select BR2_PACKAGE_LIBPNG # runtime
+	select BR2_PACKAGE_PYTHON_CERTIFI
 	select BR2_PACKAGE_PYTHON_CYCLER
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
@@ -13,6 +14,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
+	select BR2_PACKAGE_QHULL
 	select BR2_PACKAGE_ZLIB # runtime
 	help
 	  Matplotlib strives to produce publication quality 2D
diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
index ccb22eefa5..81e83ac0de 100644
--- a/package/python-matplotlib/python-matplotlib.hash
+++ b/package/python-matplotlib/python-matplotlib.hash
@@ -1,4 +1,4 @@
 # sha256 from https://pypi.org/project/matplotlib/#files
-sha256	e1d33589e32f482d0a7d1957bf473d43341115d40d33f578dad44432e47df7b7  matplotlib-3.0.3.tar.gz
+sha256	fc4f526dfdb31c9bd6b8ca06bf9fab663ca12f3ec9cdf4496fb44bc680140318  matplotlib-3.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256	5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 8d00ac8a07..2f55dd5d5d 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -4,17 +4,23 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_VERSION = 3.0.3
+PYTHON_MATPLOTLIB_VERSION = 3.4.3
 PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
-PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/26/04/8b381d5b166508cc258632b225adbafec49bbe69aa9a4fa1f1b461428313
+PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/21/37/197e68df384ff694f78d687a49ad39f96c67b8d75718bc61503e1676b617
 PYTHON_MATPLOTLIB_LICENSE = Python-2.0
 PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE/LICENSE
-PYTHON_MATPLOTLIB_DEPENDENCIES = host-pkgconf freetype host-python-numpy \
-	libpng python-cycler
+PYTHON_MATPLOTLIB_DEPENDENCIES = \
+	host-pkgconf freetype host-python-numpy \
+	libpng python-cycler host-python-certifi qhull
 PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
 
 ifeq ($(BR2_PACKAGE_PYTHON_MATPLOTLIB_QT),y)
 PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyqt5
 endif
 
+define PYTHON_MATPLOTLIB_COPY_SETUP_CFG
+	cp $(PYTHON_MATPLOTLIB_PKGDIR)/setup.cfg $(@D)/setup.cfg
+endef
+PYTHON_MATPLOTLIB_PRE_CONFIGURE_HOOKS += PYTHON_MATPLOTLIB_COPY_SETUP_CFG
+
 $(eval $(python-package))
diff --git a/package/python-matplotlib/setup.cfg b/package/python-matplotlib/setup.cfg
new file mode 100644
index 0000000000..4bda0d4376
--- /dev/null
+++ b/package/python-matplotlib/setup.cfg
@@ -0,0 +1,10 @@
+[libs]
+# Disable LTO to prevent the following error:
+# Relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZSt3hexRSt8ios_base'
+# which may bind externally can not be used when making a shared object;
+# recompile with -fPIC
+enable_lto = False
+
+# Freetype and qhull are provided by Buildroot
+system_freetype = True
+system_qhull = True
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
