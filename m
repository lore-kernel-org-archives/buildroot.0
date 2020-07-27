From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 15:34:23 +0200
Subject: [Buildroot] [git commit] package/python-rpi-ws281x: bump to version
 4.2.4
Message-ID: <20200727141951.DFDE8890C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91a759ba66449ad8ede344adf9f0659aa91c8789
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-cross-compilation.patch               | 83 ----------------------
 package/python-rpi-ws281x/python-rpi-ws281x.hash   |  8 +--
 package/python-rpi-ws281x/python-rpi-ws281x.mk     |  4 +-
 3 files changed, 6 insertions(+), 89 deletions(-)

diff --git a/package/python-rpi-ws281x/0001-Fix-cross-compilation.patch b/package/python-rpi-ws281x/0001-Fix-cross-compilation.patch
deleted file mode 100644
index c291d4af38..0000000000
--- a/package/python-rpi-ws281x/0001-Fix-cross-compilation.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From aa3698d2eb38788b66b146faaa83ce4994c984e8 Mon Sep 17 00:00:00 2001
-From: Grzegorz Blach <grzegorz@blach.pl>
-Date: Fri, 20 Sep 2019 21:07:10 +0000
-Subject: [PATCH] Fix cross-compilation
-
-Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
----
- Makefile | 24 ------------------------
- setup.py | 21 ++++++++-------------
- 2 files changed, 8 insertions(+), 37 deletions(-)
- delete mode 100644 Makefile
-
-diff --git a/Makefile b/Makefile
-deleted file mode 100644
-index b8da8f5..0000000
---- a/Makefile
-+++ /dev/null
-@@ -1,24 +0,0 @@
--.PHONY: clean lib
--
--SRC = lib
--BUILD = lib-built
--OBJECTS = $(BUILD)/ws2811.o $(BUILD)/rpihw.o $(BUILD)/pcm.o $(BUILD)/pwm.o $(BUILD)/dma.o $(BUILD)/mailbox.o
--LIB = libws2811.a
--
--all: $(BUILD) $(BUILD)/version.h $(BUILD)/$(LIB)
--
--$(BUILD):
--	mkdir -p $(BUILD)
--
--$(BUILD)/version.h:
--	cp version.h $(BUILD)/version.h
--
--$(OBJECTS): $(BUILD)/%.o : $(SRC)/%.c
--	gcc $< -o $@ -c -g -O2 -Wall -Werror -fPIC
--
--$(BUILD)/$(LIB): $(OBJECTS)
--	ar rc $@ $^
--	ranlib $@
--
--clean:
--	-rm -f $(OBJECTS) $(BUILD)/$(LIB) $(BUILD)/version.h
-diff --git a/library/setup.py b/library/setup.py
-index b6785ec..1639574 100755
---- a/setup.py
-+++ b/setup.py
-@@ -8,14 +8,6 @@ from setuptools import setup, find_packages, Extension
- from setuptools.command.build_py import build_py
- import subprocess
- 
--class CustomInstallCommand(build_py):
--    """Customized install to run library Makefile"""
--    def run(self):
--        print("Compiling ws281x library...")
--        proc =subprocess.Popen(["make"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
--        print(proc.stderr.read())
--        build_py.run(self)
--
- setup(name              = 'rpi_ws281x',
-       version           = '4.2.2',
-       author            = 'Jeremy Garff <jer@jers.net>, Phil Howard <phil@pimoroni.com>',
-@@ -24,10 +16,13 @@ setup(name              = 'rpi_ws281x',
-       long_description  = open('README.rst').read() + "\n" + open('CHANGELOG.txt').read(),
-       license           = 'MIT',
-       url               = 'https://github.com/rpi-ws281x/rpi-ws281x-python/',
--      cmdclass          = {'build_py':CustomInstallCommand},
-       packages          = ['rpi_ws281x'],
-       ext_modules       = [Extension('_rpi_ws281x', 
--                                     sources=['rpi_ws281x_wrap.c'],
--                                     include_dirs=['lib/'],
--                                     library_dirs=['lib-built/'],
--                                     libraries=['ws2811'])])
-+                                     include_dirs=['.'],
-+                                     sources=['rpi_ws281x_wrap.c',
-+                                         'lib/dma.c',
-+                                         'lib/mailbox.c',
-+                                         'lib/pcm.c',
-+                                         'lib/pwm.c',
-+                                         'lib/rpihw.c',
-+                                         'lib/ws2811.c'])])
--- 
-2.23.0
-
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.hash b/package/python-rpi-ws281x/python-rpi-ws281x.hash
index 5333baabb6..54d91a6df0 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.hash
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/rpi-ws281x/json
-md5	17a714941043621e81f592e6a137dd92  rpi_ws281x-4.2.3.tar.gz
-sha256	265a395410cc7199f779c4209ca3970b7211896b86dbaa4731bdc3569d2e595f  rpi_ws281x-4.2.3.tar.gz
+md5  8eb175e05905ee7a00bb5fd2f1b15e40  rpi_ws281x-4.2.4.tar.gz
+sha256  7175e708d6085bc02a9d0b8227797d697e34fd00787030ae5f119fe2f4f90889  rpi_ws281x-4.2.4.tar.gz
 # Locally computed sha256 checksums
-sha256	7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  LICENSE
-sha256	7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  lib/LICENSE
+sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  LICENSE
+sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  lib/LICENSE
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
index 899ad3d1e3..4af1d268af 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.mk
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPI_WS281X_VERSION = 4.2.3
+PYTHON_RPI_WS281X_VERSION = 4.2.4
 PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
-PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/03/6c/46fad1bace9d5917190fd76e1550ec6727010cff6d3e5818b8c3a5405ba3
+PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/3b/99/0f74f2d303e03432d10b11dab240cb15afad1bc6ab9a1449c9bc08af2ee4
 PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
 PYTHON_RPI_WS281X_LICENSE = MIT
 PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
