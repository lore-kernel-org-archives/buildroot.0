From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  1 Feb 2017 10:34:23 -0500
Subject: [Buildroot] [PATCH 1/1] secilc: new package
Message-ID: <20170201153423.13611-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The SELinux CIL Compiler is a compiler that converts the CIL language as
described on the CIL design wiki into a kernel binary policy file.
http://github.com/SELinuxProject/cil/wiki/

In addition, the default makefile always tries to build the man pages
and there is no way to not build them.  If we try to build them, it would
require the dependency xmlto.  As such, I have included a small patch that
removes the man page building step from the makefile.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/Config.in                                  |  1 +
 ...01-remove-man-page-building-from-makefile.patch | 49 ++++++++++++++++++++++
 package/secilc/Config.in                           | 16 +++++++
 package/secilc/secilc.hash                         |  2 +
 package/secilc/secilc.mk                           | 21 ++++++++++
 5 files changed, 89 insertions(+)
 create mode 100644 package/secilc/0001-remove-man-page-building-from-makefile.patch
 create mode 100644 package/secilc/Config.in
 create mode 100644 package/secilc/secilc.hash
 create mode 100644 package/secilc/secilc.mk

diff --git a/package/Config.in b/package/Config.in
index d1c517a..8f6f99c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1707,6 +1707,7 @@ endmenu
 
 menu "Security"
 	source "package/policycoreutils/Config.in"
+	source "package/secilc/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/secilc/0001-remove-man-page-building-from-makefile.patch b/package/secilc/0001-remove-man-page-building-from-makefile.patch
new file mode 100644
index 0000000..1595285
--- /dev/null
+++ b/package/secilc/0001-remove-man-page-building-from-makefile.patch
@@ -0,0 +1,49 @@
+From e28aa219500c60922620bea8b61084c9d2acce25 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Wed, 1 Feb 2017 10:26:02 -0500
+Subject: [PATCH 1/1] Remove man page building from Makefile
+
+We don't need to build the man pages for this package, and doing so
+would create the dependency of xmlto.  This patch removes building
+the man pages.
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ secilc/Makefile | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/secilc/Makefile b/secilc/Makefile
+index 9bea186..d8310d1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -17,7 +17,7 @@ CFLAGS ?= -Wall -Wshadow -Wextra -Wundef -Wmissing-format-attribute -Wcast-align
+ 
+ override CFLAGS += -I$(INCLUDEDIR) -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
+ 
+-all: $(SECILC) man
++all: $(SECILC)
+ 
+ $(SECILC): $(SECILC_OBJS)
+ 	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)
+@@ -28,11 +28,9 @@ test: $(SECILC)
+ man: $(MANPAGE).xml
+ 	$(XMLTO) man $(MANPAGE).xml
+ 
+-install: all man
++install: all
+ 	-mkdir -p $(BINDIR)
+-	-mkdir -p $(MANDIR)/man8
+ 	install -m 755 $(SECILC) $(BINDIR)
+-	install -m 644 $(MANPAGE) $(MANDIR)/man8
+ 
+ doc:
+ 	$(MAKE) -C docs
+@@ -46,4 +44,4 @@ clean:
+ 
+ relabel:
+ 
+-.PHONY: all clean test install doc relabel man
++.PHONY: all clean test install doc relabel
+-- 
+2.9.3
+
diff --git a/package/secilc/Config.in b/package/secilc/Config.in
new file mode 100644
index 0000000..d3325e5
--- /dev/null
+++ b/package/secilc/Config.in
@@ -0,0 +1,16 @@
+comment "secilc needs a glibc toolchain w/ threads, dynamic library"
+	depends on !BR2_arc
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_SECILC
+	bool "secilc"
+	select BR2_PACKAGE_LIBSEPOL
+	help
+	  The SELinux CIL Compiler is a compiler that converts the CIL language as 
+	  described on the CIL design wiki into a kernel binary policy file. 
+	  Please see the CIL Design Wiki at: 
+	  http://github.com/SELinuxProject/cil/wiki/
+	  for more information about the goals and features on the CIL language.
+
+	  http://selinuxproject.org/page/Main_Page
diff --git a/package/secilc/secilc.hash b/package/secilc/secilc.hash
new file mode 100644
index 0000000..f2f7f70
--- /dev/null
+++ b/package/secilc/secilc.hash
@@ -0,0 +1,2 @@
+# https://github.com/SELinuxProject/selinux/wiki/Releases
+sha256 a84838c15bb7b0141238b48294b15ff0e1618107f547541a0067d1ddabcc9502  secilc-2.6.tar.gz
diff --git a/package/secilc/secilc.mk b/package/secilc/secilc.mk
new file mode 100644
index 0000000..6aebb07
--- /dev/null
+++ b/package/secilc/secilc.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# secilc
+#
+################################################################################
+
+SECILC_VERSION = 2.6
+SECILC_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
+SECILC_LICENSE = FreeBSD
+SECILC_LICENSE_FILES = COPYING
+
+define SECILC_BUILD_CMDS
+	$(MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR)
+endef
+
+define SECILC_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.9.3
