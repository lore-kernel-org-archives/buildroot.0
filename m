From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 19:53:09 +0200
Subject: [Buildroot] [git commit] package/python-rpi-ws281x: new package
Message-ID: <20190921175102.929948EF62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65baf9053bf52996fd3dd6bbeec40ba397a0e76f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Userspace Raspberry Pi PWM/PCM/SPI library for SK6812 and WS281X LEDs.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Fix-cross-compilation.patch               | 83 ++++++++++++++++++++++
 package/python-rpi-ws281x/Config.in                |  7 ++
 package/python-rpi-ws281x/python-rpi-ws281x.hash   |  6 ++
 package/python-rpi-ws281x/python-rpi-ws281x.mk     | 14 ++++
 6 files changed, 112 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8206bf41b7..77fa95210c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -994,6 +994,7 @@ F:	package/python-mimeparse/
 F:	package/python-pigpio/
 F:	package/python-pyjwt/
 F:	package/python-redis/
+F:	package/python-rpi-ws281x/
 F:	package/python-wtforms/
 
 N:	Guillaume Gardet <guillaume.gardet@oliseo.fr>
diff --git a/package/Config.in b/package/Config.in
index dbf297f4df..23efe9394f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1051,6 +1051,7 @@ menu "External python modules"
 	source "package/python-requests-oauthlib/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rpi-gpio/Config.in"
+	source "package/python-rpi-ws281x/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
diff --git a/package/python-rpi-ws281x/0001-Fix-cross-compilation.patch b/package/python-rpi-ws281x/0001-Fix-cross-compilation.patch
new file mode 100644
index 0000000000..c291d4af38
--- /dev/null
+++ b/package/python-rpi-ws281x/0001-Fix-cross-compilation.patch
@@ -0,0 +1,83 @@
+From aa3698d2eb38788b66b146faaa83ce4994c984e8 Mon Sep 17 00:00:00 2001
+From: Grzegorz Blach <grzegorz@blach.pl>
+Date: Fri, 20 Sep 2019 21:07:10 +0000
+Subject: [PATCH] Fix cross-compilation
+
+Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
+---
+ Makefile | 24 ------------------------
+ setup.py | 21 ++++++++-------------
+ 2 files changed, 8 insertions(+), 37 deletions(-)
+ delete mode 100644 Makefile
+
+diff --git a/Makefile b/Makefile
+deleted file mode 100644
+index b8da8f5..0000000
+--- a/Makefile
++++ /dev/null
+@@ -1,24 +0,0 @@
+-.PHONY: clean lib
+-
+-SRC = lib
+-BUILD = lib-built
+-OBJECTS = $(BUILD)/ws2811.o $(BUILD)/rpihw.o $(BUILD)/pcm.o $(BUILD)/pwm.o $(BUILD)/dma.o $(BUILD)/mailbox.o
+-LIB = libws2811.a
+-
+-all: $(BUILD) $(BUILD)/version.h $(BUILD)/$(LIB)
+-
+-$(BUILD):
+-	mkdir -p $(BUILD)
+-
+-$(BUILD)/version.h:
+-	cp version.h $(BUILD)/version.h
+-
+-$(OBJECTS): $(BUILD)/%.o : $(SRC)/%.c
+-	gcc $< -o $@ -c -g -O2 -Wall -Werror -fPIC
+-
+-$(BUILD)/$(LIB): $(OBJECTS)
+-	ar rc $@ $^
+-	ranlib $@
+-
+-clean:
+-	-rm -f $(OBJECTS) $(BUILD)/$(LIB) $(BUILD)/version.h
+diff --git a/library/setup.py b/library/setup.py
+index b6785ec..1639574 100755
+--- a/setup.py
++++ b/setup.py
+@@ -8,14 +8,6 @@ from setuptools import setup, find_packages, Extension
+ from setuptools.command.build_py import build_py
+ import subprocess
+ 
+-class CustomInstallCommand(build_py):
+-    """Customized install to run library Makefile"""
+-    def run(self):
+-        print("Compiling ws281x library...")
+-        proc =subprocess.Popen(["make"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+-        print(proc.stderr.read())
+-        build_py.run(self)
+-
+ setup(name              = 'rpi_ws281x',
+       version           = '4.2.2',
+       author            = 'Jeremy Garff <jer@jers.net>, Phil Howard <phil@pimoroni.com>',
+@@ -24,10 +16,13 @@ setup(name              = 'rpi_ws281x',
+       long_description  = open('README.rst').read() + "\n" + open('CHANGELOG.txt').read(),
+       license           = 'MIT',
+       url               = 'https://github.com/rpi-ws281x/rpi-ws281x-python/',
+-      cmdclass          = {'build_py':CustomInstallCommand},
+       packages          = ['rpi_ws281x'],
+       ext_modules       = [Extension('_rpi_ws281x', 
+-                                     sources=['rpi_ws281x_wrap.c'],
+-                                     include_dirs=['lib/'],
+-                                     library_dirs=['lib-built/'],
+-                                     libraries=['ws2811'])])
++                                     include_dirs=['.'],
++                                     sources=['rpi_ws281x_wrap.c',
++                                         'lib/dma.c',
++                                         'lib/mailbox.c',
++                                         'lib/pcm.c',
++                                         'lib/pwm.c',
++                                         'lib/rpihw.c',
++                                         'lib/ws2811.c'])])
+-- 
+2.23.0
+
diff --git a/package/python-rpi-ws281x/Config.in b/package/python-rpi-ws281x/Config.in
new file mode 100644
index 0000000000..5f1313003d
--- /dev/null
+++ b/package/python-rpi-ws281x/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_RPI_WS281X
+	bool "python-rpi-ws281x"
+	help
+	  Userspace Raspberry Pi PWM/PCM/SPI library for SK6812 and
+	  WS281X LEDs.
+
+	  https://github.com/rpi-ws281x/rpi-ws281x-python/
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.hash b/package/python-rpi-ws281x/python-rpi-ws281x.hash
new file mode 100644
index 0000000000..b009014fb1
--- /dev/null
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/rpi_ws281x/json
+md5	7914013f6e0ee17ce23d51622d60761d  rpi_ws281x-4.2.2.tar.gz
+sha256	d06cd31217dec40d715a3a07ccb2b4b0b0719527c5aa020cbdd77d0c0b31d113  rpi_ws281x-4.2.2.tar.gz
+# Locally computed sha256 checksums
+sha256	7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  LICENSE
+sha256	7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  lib/LICENSE
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
new file mode 100644
index 0000000000..6c83cab417
--- /dev/null
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-rpi-ws281x
+#
+################################################################################
+
+PYTHON_RPI_WS281X_VERSION = 4.2.2
+PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
+PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/3b/b3/cdc84887ead3f15b9f3f2b5fe2b48168757a606c6d08feb53536a8afb396
+PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
+PYTHON_RPI_WS281X_LICENSE = MIT
+PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
+
+$(eval $(python-package))
