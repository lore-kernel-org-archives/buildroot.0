From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Fri, 11 Oct 2019 14:40:41 +0200
Subject: [Buildroot] [PATCH v3 3/9] package/libavl: add package
In-Reply-To: <20191011124131.28246-1-heiko.thiery@gmail.com>
References: <20191011124131.28246-1-heiko.thiery@gmail.com>
Message-ID: <20191011124131.28246-4-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Walle <michael@walle.cc>

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 DEVELOPERS                             |  3 ++
 package/Config.in                      |  1 +
 package/libavl/0001-fix-makefile.patch | 49 ++++++++++++++++++++++++++
 package/libavl/Config.in               | 13 +++++++
 package/libavl/libavl.hash             |  5 +++
 package/libavl/libavl.mk               | 43 ++++++++++++++++++++++
 6 files changed, 114 insertions(+)
 create mode 100644 package/libavl/0001-fix-makefile.patch
 create mode 100644 package/libavl/Config.in
 create mode 100644 package/libavl/libavl.hash
 create mode 100644 package/libavl/libavl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7e4d7fa94a..e8ef69efc7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1666,6 +1666,9 @@ F:	package/python-pyzmq/
 N:	Michael Trimarchi <michael@amarulasolutions.com>
 F:	package/python-spidev/
 
+N:	Michael Walle <michael@walle.cc>
+F:	package/libavl/
+
 N:	Micha? ?yszczek <michal.lyszczek@bofc.pl>
 F:	board/altera/socrates_cyclone5/
 F:	board/pine64/rock64
diff --git a/package/Config.in b/package/Config.in
index c3faa20d88..48a66ec7dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1715,6 +1715,7 @@ menu "Other"
 	source "package/lapack/Config.in"
 	source "package/libargtable2/Config.in"
 	source "package/libatomic_ops/Config.in"
+	source "package/libavl/Config.in"
 	source "package/libb64/Config.in"
 	source "package/libbsd/Config.in"
 	source "package/libcap/Config.in"
diff --git a/package/libavl/0001-fix-makefile.patch b/package/libavl/0001-fix-makefile.patch
new file mode 100644
index 0000000000..6cc96e5f74
--- /dev/null
+++ b/package/libavl/0001-fix-makefile.patch
@@ -0,0 +1,49 @@
+makefile: fix compilation and installation
+
+This was originally taken from:
+https://sources.debian.org/data/main/liba/libavl/0.3.5-4/debian/patches/fix-makefile
+
+Unfortunately, the URL does not end in ".patch", therefore we cannot
+use it in the FOO_PATCH variable directly.
+
+Signed-off-by: Michael Walle <michael@walle.cc>
+
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -6,7 +6,8 @@
+ LDCONFIG ?= /sbin/ldconfig
+ 
+ # Some suggestions: (-mcpu= generates i386 compatible code)
+-CFLAGS ?= -O2 -fomit-frame-pointer -pipe -mcpu=i686 -w
++CFLAGS ?= -O2 -pipe -Wall -Werror
++CFLAGS += -fPIC
+ #CFLAGS = -O2 -fomit-frame-pointer -pipe -march=i586 -Wall -g
+ #CFLAGS = -O6 -fomit-frame-pointer -pipe -march=i586 -Wall -ansi -pedantic
+ #CFLAGS = -O6 -fomit-frame-pointer -pipe -march=i686 -Wall -ansi -pedantic
+@@ -34,20 +35,21 @@
+ 	$(CC) $(LDFLAGS) $^ -o $@ $(LIBS)
+ 
+ $(LIBRARY): avl.o
+-	$(CC) -nostdlib -shared -Wl,-soname,libavl.so.1 $^ -o $@ -lc
++	$(CC) $(LDFLAGS) -shared -Wl,-soname,libavl.so.1 $^ -o $@ -lc
+ 
+ clean:
+ 	$(RM) *.o $(PROGRAMS) libavl.*
+ 
+ install: all
+ 	$(INSTALL) -d $(DESTDIR)$(libdir)
+-	$(INSTALL) avl.h $(DESTDIR)$(includedir)
+-	$(INSTALL) $(LIBRARIES) $(DESTDIR)$(libdir)
+-	for i in $(LIBRARIES); do\
++	$(INSTALL) -d $(DESTDIR)$(includedir)
++	$(INSTALL) -m 644 avl.h $(DESTDIR)$(includedir)
++	$(INSTALL) -m 644 $(LIBRARY) $(DESTDIR)$(libdir)
++	for i in $(LIBRARY); do\
+ 		$(LN) -sf $$i $(DESTDIR)$(libdir)/$${i%.*};\
+ 		$(LN) -sf $${i%.*} $(DESTDIR)$(libdir)/$${i%.*.*};\
+ 	done
+-	-$(LDCONFIG)
++	#-$(LDCONFIG)
+ 
+ .PHONY: clean install all
+ .PRECIOUS: %.h %.c
diff --git a/package/libavl/Config.in b/package/libavl/Config.in
new file mode 100644
index 0000000000..20d3c5ef7d
--- /dev/null
+++ b/package/libavl/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBAVL
+	bool "libavl"
+	depends on !BR2_STATIC_LIBS
+	help
+	  AVLTree is a small implementation of AVL trees for the C
+	  programming language.
+
+	  https://packages.debian.org/buster/libavl1
+
+	  This is not the GNU AVL library by Ben Pfaff.
+
+comment "libavl needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libavl/libavl.hash b/package/libavl/libavl.hash
new file mode 100644
index 0000000000..4d70f0cca9
--- /dev/null
+++ b/package/libavl/libavl.hash
@@ -0,0 +1,5 @@
+# From http://snapshot.debian.org/archive/debian/20160621T164030Z/pool/main/liba/libavl/libavl_0.3.5-4.dsc
+sha256	4497b9e22cdd61ae2fa893b9d5fd6213dc306726d7c4be08c29e173622dca8a0	libavl_0.3.5.orig.tar.gz
+
+# Locally computed
+sha256	767a9accfe3b110153b567983b98889469dfaae02899a632aeadbb81ad611293	COPYING
diff --git a/package/libavl/libavl.mk b/package/libavl/libavl.mk
new file mode 100644
index 0000000000..75ada32765
--- /dev/null
+++ b/package/libavl/libavl.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# libavl
+#
+################################################################################
+
+LIBAVL_VERSION = 0.3.5
+LIBAVL_SITE = http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/liba/libavl
+LIBAVL_SOURCE = libavl_$(LIBAVL_VERSION).orig.tar.gz
+LIBAVL_LICENSE = LGPL-2.0+
+LIBAVL_LICENSE_FILES = COPYING
+LIBAVL_INSTALL_STAGING = YES
+
+LIBAVL_CFLAGS = $(TARGET_CFLAGS) -fPIC
+HOST_LIBAVL_CFLAGS = $(HOST_CFLAGS) -fPIC
+
+define LIBAVL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		CFLAGS="$(LIBAVL_CFLAGS)"
+endef
+
+define LIBAVL_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) install \
+		prefix=/usr DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBAVL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) install \
+		prefix=/usr DESTDIR=$(TARGET_DIR)
+endef
+
+define HOST_LIBAVL_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
+		CFLAGS="$(HOST_LIBAVL_CFLAGS)"
+endef
+
+define HOST_LIBAVL_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) install \
+		prefix=$(HOST_DIR)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.20.1
