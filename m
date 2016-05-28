From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 15:15:44 +0200
Subject: [Buildroot] [git commit branch/next] ficl: new package
Message-ID: <20160528131634.14A7C81D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=814911aecb6d49bb603c34dbfcc0d86614516b41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/ficl/0001-fix-Makefile.patch | 47 ++++++++++++++++++++++++++++
 package/ficl/Config.in               |  9 ++++++
 package/ficl/ficl.hash               |  2 ++
 package/ficl/ficl.mk                 | 59 ++++++++++++++++++++++++++++++++++++
 5 files changed, 118 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e64e058..3328d19 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -494,6 +494,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
+	source "package/ficl/Config.in"
 	source "package/gauche/Config.in"
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
diff --git a/package/ficl/0001-fix-Makefile.patch b/package/ficl/0001-fix-Makefile.patch
new file mode 100644
index 0000000..d5a25c4
--- /dev/null
+++ b/package/ficl/0001-fix-Makefile.patch
@@ -0,0 +1,47 @@
+fix dependency in Makefiles
+
+there is no longer a sysdep.h file.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+diff --git a/Makefile b/Makefile
+index 976d00a..7f73c44 100644
+--- a/Makefile
++++ b/Makefile
+@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
+ 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
+ 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
+ 
+-main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
++main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
+ 	$(CC) $(CFLAGS) $(LDFLAGS) main.o -o main -L. -lficl -lm
+ 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
+ 
+diff --git a/Makefile.ansi b/Makefile.ansi
+index e510fcd..170e6eb 100644
+--- a/Makefile.ansi
++++ b/Makefile.ansi
+@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
+ 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
+ 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
+ 
+-main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
++main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
+ 	$(CC) main.o -o main -L. -lficl -lm
+ 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
+ 
+diff --git a/Makefile.linux b/Makefile.linux
+index d447e7e..7f2cdfe 100644
+--- a/Makefile.linux
++++ b/Makefile.linux
+@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
+ 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
+ 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
+ 
+-main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
++main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
+ 	$(CC) main.o -o main -L. -lficl -lm
+ 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
+ 
+-- 
+
diff --git a/package/ficl/Config.in b/package/ficl/Config.in
new file mode 100644
index 0000000..3445a64
--- /dev/null
+++ b/package/ficl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FICL
+	bool "ficl"
+	help
+	  Ficl is a programming language interpreter designed to be embedded
+	  into other systems as a command, macro, and development
+	  prototyping language.
+	  Ficl is an acronym for "Forth Inspired Command Language".
+
+	  http://ficl.sourceforge.net
diff --git a/package/ficl/ficl.hash b/package/ficl/ficl.hash
new file mode 100644
index 0000000..4bfbbd0
--- /dev/null
+++ b/package/ficl/ficl.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  4daf74f3d3d6f8b86ea7cb47bc24931d50b4809b50ba34ca32e0ca1e972bd3a3  ficl-4.1.0.tar.gz
diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
new file mode 100644
index 0000000..6c212a6
--- /dev/null
+++ b/package/ficl/ficl.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# ficl
+#
+################################################################################
+
+FICL_VERSION_MAJOR = 4.1
+FICL_VERSION = $(FICL_VERSION_MAJOR).0
+FICL_SITE = http://downloads.sourceforge.net/project/ficl/ficl-all/ficl$(FICL_VERSION_MAJOR)
+FICL_LICENSE = BSD-2c
+FICL_LICENSE_FILES = ReadMe.txt
+FICL_INSTALL_STAGING = YES
+
+ifeq ($(BR2_STATIC_LIBS),y)
+FICL_BUILD_TARGETS += ficl
+define FICL_INSTALL_STATIC_BIN
+	$(INSTALL) -D -m 0755 $(@D)/ficl $(TARGET_DIR)/usr/bin/ficl
+endef
+endif
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+FICL_BUILD_TARGETS += libficl.a
+define FICL_INSTALL_STATIC_LIB
+	$(INSTALL) -D -m 0644 $(@D)/libficl.a $(STAGING_DIR)/usr/lib/libficl.a
+endef
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+FICL_BUILD_TARGETS += main libficl.so.$(FICL_VERSION)
+define FICL_INSTALL_SHARED_BIN
+	$(INSTALL) -D -m 0755 $(@D)/main $(TARGET_DIR)/usr/bin/ficl
+endef
+define FICL_INSTALL_SHARED_LIB
+	$(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so.$(FICL_VERSION)
+	ln -sf libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so.4
+	ln -sf libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so
+endef
+endif
+
+define FICL_BUILD_CMDS
+	$(MAKE) -C $(@D) -f Makefile.linux $(TARGET_CONFIGURE_OPTS) \
+		CPPFLAGS="$(TARGET_CPPFLAGS) -I. -Dlinux" $(FICL_BUILD_TARGETS)
+endef
+
+define FICL_INSTALL_STAGING_CMDS
+	$(FICL_INSTALL_STATIC_LIB)
+	$(call FICL_INSTALL_SHARED_LIB,$(STAGING_DIR))
+	$(INSTALL) -D -m 0644 $(@D)/ficl.h $(STAGING_DIR)/usr/include/ficl.h
+	$(INSTALL) -D -m 0644 $(@D)/ficllocal.h $(STAGING_DIR)/usr/include/ficllocal.h
+	$(INSTALL) -D -m 0644 $(@D)/ficlplatform/unix.h $(STAGING_DIR)/usr/include/ficlplatform/unix.h
+endef
+
+define FICL_INSTALL_TARGET_CMDS
+	$(FICL_INSTALL_STATIC_BIN)
+	$(FICL_INSTALL_SHARED_BIN)
+	$(call FICL_INSTALL_SHARED_LIB,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
