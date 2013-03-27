From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 27 Mar 2013 12:15:26 +0100
Subject: [Buildroot] [PATCH 1/1] add mongrel2 package
Message-ID: <1364382926-26133-1-git-send-email-lionel.orry@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds the mongrel2 web server package to buildroot.

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
---
 package/Config.in                                  |  1 +
 package/mongrel2/Config.in                         | 14 +++++++
 .../mongrel2-001-fix-procer-compiler.patch         | 11 ++++++
 .../mongrel2/mongrel2-002-do-not-run-tests.patch   | 22 +++++++++++
 package/mongrel2/mongrel2.mk                       | 43 ++++++++++++++++++++++
 5 files changed, 91 insertions(+)
 create mode 100644 package/mongrel2/Config.in
 create mode 100644 package/mongrel2/mongrel2-001-fix-procer-compiler.patch
 create mode 100644 package/mongrel2/mongrel2-002-do-not-run-tests.patch
 create mode 100644 package/mongrel2/mongrel2.mk

diff --git a/package/Config.in b/package/Config.in
index 5d8f4f6..f27dae6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -680,6 +680,7 @@ source "package/linphone/Config.in"
 source "package/lrzsz/Config.in"
 source "package/macchanger/Config.in"
 source "package/mii-diag/Config.in"
+source "package/mongrel2/Config.in"
 source "package/mrouted/Config.in"
 source "package/msmtp/Config.in"
 source "package/mutt/Config.in"
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
new file mode 100644
index 0000000..fb9fb76
--- /dev/null
+++ b/package/mongrel2/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_MONGREL2
+	bool "mongrel2"
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZEROMQ
+	help
+	  Mongrel2 is an application, language, and network architecture agnostic web server
+	  that focuses on web applications using modern browser technologies.
+
+	  Mongrel2 supports 17 languages and platforms, HTTP, Flash sockets, WebSockets,
+	  Long Polling, and many ways to deploy and hack on it.
+
+	  Mongrel2 depends on sqlite3 and zeromq.
+
+	  http://www.mongrel2.org
diff --git a/package/mongrel2/mongrel2-001-fix-procer-compiler.patch b/package/mongrel2/mongrel2-001-fix-procer-compiler.patch
new file mode 100644
index 0000000..81f4690
--- /dev/null
+++ b/package/mongrel2/mongrel2-001-fix-procer-compiler.patch
@@ -0,0 +1,11 @@
+--- a/tools/procer/Makefile	2012-07-26 07:57:52.000000000 +0200
++++ b/tools/procer/Makefile	2013-03-26 11:04:26.881184128 +0100
+@@ -8,7 +8,7 @@
+ 
+ 
+ procer: ../../build/libm2.a ${OBJECTS}
+-	gcc $(OPTFLAGS) $(OPTLIBS) -o $@ ${OBJECTS} ../../build/libm2.a ${LIBS}
++	$(CC) $(OPTFLAGS) $(OPTLIBS) -o $@ ${OBJECTS} ../../build/libm2.a ${LIBS}
+ 
+ clean:
+ 	rm -f *.o procer
diff --git a/package/mongrel2/mongrel2-002-do-not-run-tests.patch b/package/mongrel2/mongrel2-002-do-not-run-tests.patch
new file mode 100644
index 0000000..87ef30e
--- /dev/null
+++ b/package/mongrel2/mongrel2-002-do-not-run-tests.patch
@@ -0,0 +1,22 @@
+--- a/Makefile	2013-03-26 10:56:47.315241223 +0100
++++ b/Makefile	2013-03-26 10:57:24.578499095 +0100
+@@ -16,7 +16,7 @@
+ TESTS=$(patsubst %.c,%,${TEST_SRC})
+ MAKEOPTS=OPTFLAGS="${NOEXTCFLAGS} ${OPTFLAGS}" OPTLIBS="${OPTLIBS}" LIBS="${LIBS}" DESTDIR="${DESTDIR}" PREFIX="${PREFIX}"
+ 
+-all: bin/mongrel2 tests m2sh procer
++all: bin/mongrel2 m2sh procer filters config_modules
+ 
+ dev: CFLAGS=-g -Wall -Isrc -Wall -Wextra $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
+ dev: all
+--- a/tools/m2sh/Makefile	2013-03-26 11:01:57.221103774 +0100
++++ b/tools/m2sh/Makefile	2013-03-26 11:02:14.300772505 +0100
+@@ -9,7 +9,7 @@
+ LIB_SRC=$(filter-out src/m2sh.c,${SOURCES})
+ LIB_OBJ=$(filter-out src/m2sh.o,${OBJECTS})
+ 
+-all: ../lemon/lemon tests build/m2sh
++all: ../lemon/lemon build/m2sh
+ 
+ dev: CFLAGS=-g -Wall -Wextra -Isrc -I../../src $(OPTFLAGS)
+ dev: all
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
new file mode 100644
index 0000000..a7593ad
--- /dev/null
+++ b/package/mongrel2/mongrel2.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# Mongrel2
+#
+#############################################################
+MONGREL2_VERSION = 1.8.0
+MONGREL2_SOURCE = mongrel2_$(MONGREL2_VERSION).tar.gz
+MONGREL2_SITE = https://github.com/zedshaw/mongrel2/tarball/v1.8.0
+MONGREL2_LICENSE = BSD-3c
+MONGREL2_LICENSE_FILES = LICENSE
+MONGREL2_DEPENDENCIES = sqlite zeromq
+
+export OPTFLAGS = $(TARGET_CFLAGS) -ffunction-sections -fdata-sections
+export OPTLIBS = $(TARGET_LDFLAGS) -Wl,--gc-sections
+
+define MONGREL2_CLEAN_CMDS
+	$(MAKE1) -C $(@D) clean
+endef
+
+define MONGREL2_BUILD_CMDS
+	export CC="$(TARGET_CC)" && \
+		export CXX="$(TARGET_CXX)" && \
+		$(MAKE1) -C $(@D) PREFIX=/usr all
+endef
+
+define MONGREL2_INSTALL_TARGET_CMDS
+	export CC="$(TARGET_CC)" && \
+		export CXX="$(TARGET_CXX)" && \
+		$(MAKE1) -C $(@D) PREFIX=/usr install DESTDIR=$(TARGET_DIR)
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/mongrel2
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/m2sh
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/procer
+	find $(TARGET_DIR)/usr/lib/mongrel2 -type f -name '*.so' -exec $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) {} \;
+endef
+
+define MONGREL2_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/mongrel2
+	rm -f $(TARGET_DIR)/usr/bin/m2sh
+	rm -f $(TARGET_DIR)/usr/bin/procer
+endef
+
+$(eval $(generic-package))
+
-- 
1.8.1.4
