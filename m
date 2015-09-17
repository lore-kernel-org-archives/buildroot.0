From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2015 23:36:51 +0200
Subject: [Buildroot] [git commit] micropython: new package
Message-ID: <20150917214802.3E9E581EE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9646e80fca281030eb5d3125f499a60231476373
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Micro Python is a lean and fast implementation of the Python 3
programming language that is optimised to run on a microcontroller.

[Thomas: fix minor typo in Config.in noticed by Vicente.]

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/micropython/0001-fix-version.patch |   22 +++++++++++++++++++
 package/micropython/Config.in              |   12 ++++++++++
 package/micropython/micropython.mk         |   32 ++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e2f669a..e702e5f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -509,6 +509,7 @@ menu "Lua libraries/modules"
 endmenu
 endif
 	source "package/lutok/Config.in"
+	source "package/micropython/Config.in"
 	source "package/moarvm/Config.in"
 	source "package/mono/Config.in"
 if BR2_PACKAGE_MONO
diff --git a/package/micropython/0001-fix-version.patch b/package/micropython/0001-fix-version.patch
new file mode 100644
index 0000000..1bf2992
--- /dev/null
+++ b/package/micropython/0001-fix-version.patch
@@ -0,0 +1,22 @@
+Always use the fallback behaviour for determining the version number
+
+When built from within buildroot the micropython build process detects
+that it is inside a git repository and ends up using the buildroot
+version number instead of the correct micropython version number.
+
+Signed-off-by: Chris Packham <judge.packham@gmail.com>
+---
+diff -Naur micropython-v1.4.5-old/py/makeversionhdr.py micropython-v1.4.5/py/makeversionhdr.py
+--- micropython-v1.4.5-old/py/makeversionhdr.py	2015-08-12 00:42:30.000000000 +1200
++++ micropython-v1.4.5/py/makeversionhdr.py	2015-09-16 10:21:06.698962836 +1200
+@@ -70,9 +70,7 @@
+ 
+ def make_version_header(filename):
+     # Get version info using git, with fallback to docs/conf.py
+-    info = get_version_info_from_git()
+-    if info is None:
+-        info = get_version_info_from_docs_conf()
++    info = get_version_info_from_docs_conf()
+ 
+     git_tag, git_hash, ver = info
+ 
diff --git a/package/micropython/Config.in b/package/micropython/Config.in
new file mode 100644
index 0000000..c62b3ab
--- /dev/null
+++ b/package/micropython/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_MICROPYTHON
+	bool "micropython"
+	select BR2_PACKAGE_LIBFFI
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Micro Python is a lean and fast implementation of the Python 3
+	  programming language that is optimised to run on a microcontroller.
+
+	  http://micropython.org
+
+comment "micropython needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
new file mode 100644
index 0000000..2d7c924
--- /dev/null
+++ b/package/micropython/micropython.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# micropython
+#
+################################################################################
+
+MICROPYTHON_VERSION = v1.4.5
+MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
+MICROPYTHON_LICENSE = MIT
+MICROPYTHON_LICENSE_FILES = LICENSE
+MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
+
+# Use fallback implementation for exception handling on architectures that don't
+# have explicit support.
+ifeq ($(BR2_powerpc),y)
+MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
+endif
+
+define MICROPYTHON_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
+		CROSS_COMPILE=$(TARGET_CROSS) \
+		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS)
+endef
+
+define MICROPYTHON_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
+		DESTDIR=$(TARGET_DIR) \
+		PREFIX=$(TARGET_DIR)/usr \
+		install
+endef
+
+$(eval $(generic-package))
