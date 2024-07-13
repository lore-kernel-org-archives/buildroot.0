Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55871C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 087C640918;
	Sat, 13 Jul 2024 19:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NU6S4qH-MqW0; Sat, 13 Jul 2024 19:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5BD6404FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5BD6404FF;
	Sat, 13 Jul 2024 19:56:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 244181BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAF82401ED
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFOPPhiWeoEl for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2DD7404B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2DD7404B0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD92486604; Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 21:55:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19b145777385a31864d7d719201e765d1b0af35d
X-Git-Newrev: 9b9333c929d334a98a47c61af70b531b389dc787
X-Patchwork-Hint: ignore
Message-Id: <20240713195553.DD92486604@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymupdf: bump to version
 1.23.22
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4144934734976578181=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4144934734976578181==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9b9333c929d334a98a47c61af70b531b389dc787
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-pymupdf and mupdf packages do not follow the exact same
version numbers anymore. There is no specific mention of version
compatibilities in the upstream package, so update our comment to just
say that both should be "compatible" (to try to avoid one being
updated without the other).

The hardcoded paths we used to remove from setup.py are no longer
present, so the post-patch hook is removed.  The new setup.py instead
uses new environment variables which we now provide.

This new python-pymupdf version fails at runtime when mupdf builds
static libraries.

Note also that python-pymupdf is gradually switching to a new
implementation that requires mupdf to be built with python
bindings. For now, both implementations are still available but we
only compile the old one. The runtime test is adapted accordingly as
the legacy implementation has to be imported with "fitz_old".

While at it, the dependencies are also split to one per line to make
them easier to diff in the future.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Raphaël:
 - fix cross-compilation
 - remove unneeded dependencies
 - update to 1.23.22
 - update the commit message
]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mupdf/mupdf.mk                             |   2 +-
 ...-allow-providing-python-config-externally.patch | 125 +++++++++++++++++++++
 package/python-pymupdf/Config.in                   |   6 +-
 package/python-pymupdf/python-pymupdf.hash         |   4 +-
 package/python-pymupdf/python-pymupdf.mk           |  23 ++--
 .../testing/tests/package/sample_python_pymupdf.py |   2 +-
 6 files changed, 142 insertions(+), 20 deletions(-)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 1c63059954..9eecb84232 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# python-pymupdf's version must match mupdf's version
+# python-pymupdf's version be compatible with mupdf's version
 MUPDF_VERSION = 1.23.9
 MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.lz
 MUPDF_SITE = https://mupdf.com/downloads/archive
diff --git a/package/python-pymupdf/0001-pipcl.py-allow-providing-python-config-externally.patch b/package/python-pymupdf/0001-pipcl.py-allow-providing-python-config-externally.patch
new file mode 100644
index 0000000000..95aa3f7a21
--- /dev/null
+++ b/package/python-pymupdf/0001-pipcl.py-allow-providing-python-config-externally.patch
@@ -0,0 +1,125 @@
+From ca3417b8d605ccdb2e6c516c5e0c79180381627c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
+Date: Sun, 4 Feb 2024 16:13:45 +0100
+Subject: [PATCH] pipcl.py: allow providing python-config externally
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When cross-compiling (e.g. using Buildroot), the python-config
+executable that resides next to the host python executable provides
+incorrect includes (the ones for the host).
+
+Since the correct path to python-config cannot be guessed, add an
+additional environment variable to allow setting the path to the
+correct python-config executable externally.
+
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+Upstream: https://github.com/pymupdf/PyMuPDF/commit/3a214b0c144d86fd1329b26030f6b9f2a6b27020
+---
+ pipcl.py | 72 +++++++++++++++++++++++++++++---------------------------
+ setup.py |  3 +++
+ 2 files changed, 40 insertions(+), 35 deletions(-)
+
+diff --git a/pipcl.py b/pipcl.py
+index 209f660..c154774 100644
+--- a/pipcl.py
++++ b/pipcl.py
+@@ -1789,43 +1789,45 @@ class PythonFlags:
+             self.ldflags = f'-L {_lib_dir}'
+ 
+         else:
+-            # We use python-config which appears to work better than pkg-config
+-            # because it copes with multiple installed python's, e.g.
+-            # manylinux_2014's /opt/python/cp*-cp*/bin/python*.
+-            #
+-            # But... on non-macos it seems that we should not attempt to specify
+-            # libpython on the link command. The manylinux docker containers
+-            # don't actually contain libpython.so, and it seems that this
+-            # deliberate. And the link command runs ok.
+-            #
+-            python_exe = os.path.realpath( sys.executable)
+-            if darwin():
+-                # Basic install of dev tools with `xcode-select --install` doesn't
+-                # seem to provide a `python3-config` or similar, but there is a
+-                # `python-config.py` accessible via sysconfig.
++            python_config = os.environ.get("PYMUPDF_PYTHON_CONFIG")
++            if not python_config:
++                # We use python-config which appears to work better than pkg-config
++                # because it copes with multiple installed python's, e.g.
++                # manylinux_2014's /opt/python/cp*-cp*/bin/python*.
+                 #
+-                # We try different possibilities and use the last one that
+-                # works.
++                # But... on non-macos it seems that we should not attempt to specify
++                # libpython on the link command. The manylinux docker containers
++                # don't actually contain libpython.so, and it seems that this
++                # deliberate. And the link command runs ok.
+                 #
+-                python_config = None
+-                for pc in (
+-                        f'python3-config',
+-                        f'{sys.executable} {sysconfig.get_config_var("srcdir")}/python-config.py',
+-                        f'{python_exe}-config',
+-                        ):
+-                    e = subprocess.run(
+-                            f'{pc} --includes',
+-                            shell=1,
+-                            stdout=subprocess.DEVNULL,
+-                            stderr=subprocess.DEVNULL,
+-                            check=0,
+-                            ).returncode
+-                    log1(f'{e=} from {pc!r}.')
+-                    if e == 0:
+-                        python_config = pc
+-                assert python_config, f'Cannot find python-config'
+-            else:
+-                python_config = f'{python_exe}-config'
++                python_exe = os.path.realpath( sys.executable)
++                if darwin():
++                    # Basic install of dev tools with `xcode-select --install` doesn't
++                    # seem to provide a `python3-config` or similar, but there is a
++                    # `python-config.py` accessible via sysconfig.
++                    #
++                    # We try different possibilities and use the last one that
++                    # works.
++                    #
++                    python_config = None
++                    for pc in (
++                            f'python3-config',
++                            f'{sys.executable} {sysconfig.get_config_var("srcdir")}/python-config.py',
++                            f'{python_exe}-config',
++                            ):
++                        e = subprocess.run(
++                                f'{pc} --includes',
++                                shell=1,
++                                stdout=subprocess.DEVNULL,
++                                stderr=subprocess.DEVNULL,
++                                check=0,
++                                ).returncode
++                        log1(f'{e=} from {pc!r}.')
++                        if e == 0:
++                            python_config = pc
++                    assert python_config, f'Cannot find python-config'
++                else:
++                    python_config = f'{python_exe}-config'
+             log1(f'Using {python_config=}.')
+             try:
+                 self.includes = run( f'{python_config} --includes', capture=1).strip()
+diff --git a/setup.py b/setup.py
+index 23a5c78..4b3b5c7 100755
+--- a/setup.py
++++ b/setup.py
+@@ -36,6 +36,9 @@ Environmental variables:
+         PYMUPDF_MUPDF_LIB
+             Directory containing MuPDF libraries, (libmupdf.so,
+             libmupdfcpp.so).
++
++        PYMUPDF_PYTHON_CONFIG
++            Optional path to python-config.
+     
+     PYMUPDF_SETUP_IMPLEMENTATIONS
+         Must be one of 'a', 'b', 'ab'. If unset we use 'ab'.
+-- 
+2.41.0
+
diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
index 7e961689b6..e6e7c38c9e 100644
--- a/package/python-pymupdf/Config.in
+++ b/package/python-pymupdf/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 	depends on BR2_INSTALL_LIBSTDCPP # mupdf -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mupdf -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # mupdf -> harfbuzz
+	depends on !BR2_STATIC_LIBS # runtime failure
 	select BR2_PACKAGE_HOST_SWIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_MUPDF
@@ -12,7 +13,8 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 
 	  https://github.com/pymupdf/PyMuPDF
 
-comment "python-pymupdf needs a toolchain w/ C++, gcc >= 4.9"
+comment "python-pymupdf needs a toolchain w/ C++, gcc >= 4.9, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		BR2_STATIC_LIBS
diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index 9fd8150088..341366d46f 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5  468fe56375a1fca99e83fe0aa0b9f8bd  PyMuPDF-1.22.0.tar.gz
-sha256  6e1694e5c0cd8b92d503a506ee8e4ba1bed768528de586889d3ec90e9dc4a7d3  PyMuPDF-1.22.0.tar.gz
+md5  5c219a0c4cb3d57b60e39cc901ebd220  PyMuPDF-1.23.22.tar.gz
+sha256  c41cd91d83696cea67a4b6c65cc1951c2019ac0a561c5a3f543318ede30d3cd0  PyMuPDF-1.23.22.tar.gz
 # Locally computed sha256 checksums
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 8547d4f3fb..1d6ad78bce 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-# python-pymupdf's version must match mupdf's version
-PYTHON_PYMUPDF_VERSION = 1.22.0
+# python-pymupdf's version must be compatible with mupdf's version
+PYTHON_PYMUPDF_VERSION = 1.23.22
 PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
-PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/28/ba/d6bb6fd678e8396d7b944870286fb25fd6f499b8cb599b5436c8f725adbf
+PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/05/20/a0d1221d8f379afcc12b4d1687a8f4adb69eef659e835d781c3fa331ff46
 PYTHON_PYMUPDF_SETUP_TYPE = setuptools
 PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
@@ -15,16 +15,11 @@ PYTHON_PYMUPDF_LICENSE_FILES = COPYING
 PYTHON_PYMUPDF_DEPENDENCIES = freetype host-swig mupdf
 PYTHON_PYMUPDF_BUILD_OPTS = --skip-dependency-check
 
-PYTHON_PYMUPDF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/mupdf -I$(STAGING_DIR)/usr/include/freetype2"
-
-# We need to remove the original paths as we provide them in the CFLAGS:
-define PYTHON_PYMUPDF_REMOVE_PATHS
-	sed -i "/\/usr\/include\/mupdf/d" $(@D)/setup.py
-	sed -i "/\/usr\/include\/freetype2/d" $(@D)/setup.py
-	sed -i "/\/usr\/local\/include\/mupdf/d" $(@D)/setup.py
-	sed -i "/mupdf\/thirdparty\/freetype\/include/d" $(@D)/setup.py
-endef
-
-PYTHON_PYMUPDF_POST_PATCH_HOOKS = PYTHON_PYMUPDF_REMOVE_PATHS
+PYTHON_PYMUPDF_ENV = \
+	PYMUPDF_INCLUDES="$(STAGING_DIR)/usr/include/freetype2:$(STAGING_DIR)/usr/include" \
+	PYMUPDF_MUPDF_LIB="$(STAGING_DIR)/usr/lib" \
+	PYMUPDF_PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config" \
+	PYMUPDF_SETUP_IMPLEMENTATIONS=a \
+	PYMUPDF_SETUP_MUPDF_BUILD=
 
 $(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_pymupdf.py b/support/testing/tests/package/sample_python_pymupdf.py
index 574bd27965..ffcbfa1140 100644
--- a/support/testing/tests/package/sample_python_pymupdf.py
+++ b/support/testing/tests/package/sample_python_pymupdf.py
@@ -1,4 +1,4 @@
-import fitz
+import fitz_old as fitz
 
 # Write a test PDF file
 outfile = "python-pymupdf.pdf"

--===============4144934734976578181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4144934734976578181==--
