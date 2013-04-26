From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Apr 2013 23:08:51 +0200
Subject: [Buildroot] [git commit] mongrel2: new package
Message-ID: <20130426210845.6A76F9B820@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7175ef726ff8b94033a71c756620dc5fbad4fa1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: indent help, use _VERSION in _SITE]
Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/mongrel2/Config.in                         |   18 +++++
 ...l2-0001-use-CC-variable-to-compile-procer.patch |   28 +++++++
 .../mongrel2/mongrel2-0002-Do-not-run-tests.patch  |   43 +++++++++++
 ...-0003-Fix-Makefiles-for-cross-compilation.patch |   75 ++++++++++++++++++++
 package/mongrel2/mongrel2.mk                       |   31 ++++++++
 6 files changed, 196 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0b095d4..bcd3d8d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -700,6 +700,7 @@ source "package/linphone/Config.in"
 source "package/lrzsz/Config.in"
 source "package/macchanger/Config.in"
 source "package/mii-diag/Config.in"
+source "package/mongrel2/Config.in"
 source "package/mrouted/Config.in"
 source "package/msmtp/Config.in"
 source "package/mutt/Config.in"
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
new file mode 100644
index 0000000..05d10d7
--- /dev/null
+++ b/package/mongrel2/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_MONGREL2
+	bool "mongrel2"
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZEROMQ
+	depends on BR2_INSTALL_LIBSTDCPP # zeromq
+	depends on BR2_INET_IPV6 # zeromq
+	depends on BR2_LARGEFILE # zeromq -> util-linux
+	depends on BR2_USE_WCHAR # zeromq -> util-linux
+	help
+	  Mongrel2 is an application, language, and network architecture
+	  agnostic web server that focuses on web applications using
+	  modern browser technologies.
+
+	  Mongrel2 supports 17 languages and platforms, HTTP, Flash
+	  sockets, WebSockets, Long Polling, and many ways to deploy
+	  and hack on it.
+
+	  http://www.mongrel2.org
diff --git a/package/mongrel2/mongrel2-0001-use-CC-variable-to-compile-procer.patch b/package/mongrel2/mongrel2-0001-use-CC-variable-to-compile-procer.patch
new file mode 100644
index 0000000..310177a
--- /dev/null
+++ b/package/mongrel2/mongrel2-0001-use-CC-variable-to-compile-procer.patch
@@ -0,0 +1,28 @@
+From d30cf797af4828e49fd3c0f25841e669dec05ed5 Mon Sep 17 00:00:00 2001
+From: Lionel Orry <lionel.orry@gmail.com>
+Date: Wed, 27 Mar 2013 14:02:00 +0100
+Subject: [PATCH 3/4] use CC variable to compile procer.
+
+This fixes procer tool cross-compilation issues.
+
+Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
+---
+ tools/procer/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/procer/Makefile b/tools/procer/Makefile
+index d0d7de0..bb9aa31 100644
+--- a/tools/procer/Makefile
++++ b/tools/procer/Makefile
+@@ -8,7 +8,7 @@ all: procer
+ 
+ 
+ procer: ../../build/libm2.a ${OBJECTS}
+-	gcc $(OPTFLAGS) $(OPTLIBS) -o $@ ${OBJECTS} ../../build/libm2.a ${LIBS}
++	$(CC) $(OPTFLAGS) $(OPTLIBS) -o $@ ${OBJECTS} ../../build/libm2.a ${LIBS}
+ 
+ clean:
+ 	rm -f *.o procer
+-- 
+1.8.1.4
+
diff --git a/package/mongrel2/mongrel2-0002-Do-not-run-tests.patch b/package/mongrel2/mongrel2-0002-Do-not-run-tests.patch
new file mode 100644
index 0000000..557c27e
--- /dev/null
+++ b/package/mongrel2/mongrel2-0002-Do-not-run-tests.patch
@@ -0,0 +1,43 @@
+From 3cbef2195533f357c8a80c2840108662461273b7 Mon Sep 17 00:00:00 2001
+From: Lionel Orry <lionel.orry@gmail.com>
+Date: Wed, 27 Mar 2013 14:48:19 +0100
+Subject: [PATCH 4/4] Do not run tests.
+
+This patch is specific to cross-compiled environments and avoids running
+the tests on the host. It is not meant to be applied upstream.
+
+Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
+---
+ Makefile            | 2 +-
+ tools/m2sh/Makefile | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7dc4089..ca72630 100644
+--- a/Makefile
++++ b/Makefile
+@@ -16,7 +16,7 @@ TEST_SRC=$(wildcard tests/*_tests.c)
+ TESTS=$(patsubst %.c,%,${TEST_SRC})
+ MAKEOPTS=OPTFLAGS="${NOEXTCFLAGS} ${OPTFLAGS}" OPTLIBS="${OPTLIBS}" LIBS="${LIBS}" DESTDIR="${DESTDIR}" PREFIX="${PREFIX}"
+ 
+-all: bin/mongrel2 tests m2sh procer
++all: bin/mongrel2 m2sh procer filters config_modules
+ 
+ dev: CFLAGS=-g -Wall -Isrc -Wall -Wextra $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
+ dev: all
+diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
+index b50d8a0..334e4da 100644
+--- a/tools/m2sh/Makefile
++++ b/tools/m2sh/Makefile
+@@ -9,7 +9,7 @@ TESTS=$(patsubst %.c,%,${TEST_SRC})
+ LIB_SRC=$(filter-out src/m2sh.c,${SOURCES})
+ LIB_OBJ=$(filter-out src/m2sh.o,${OBJECTS})
+ 
+-all: ../lemon/lemon tests build/m2sh
++all: ../lemon/lemon build/m2sh
+ 
+ dev: CFLAGS=-g -Wall -Wextra -Isrc -I../../src $(OPTFLAGS)
+ dev: all
+-- 
+1.8.1.4
+
diff --git a/package/mongrel2/mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch b/package/mongrel2/mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch
new file mode 100644
index 0000000..164d7f9
--- /dev/null
+++ b/package/mongrel2/mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch
@@ -0,0 +1,75 @@
+From 298356c44a7df2b34c4e307c531d2010e2cb4b79 Mon Sep 17 00:00:00 2001
+From: Lionel Orry <lionel.orry@gmail.com>
+Date: Wed, 27 Mar 2013 15:56:56 +0100
+Subject: [PATCH 1/1] Fix Makefiles for cross-compilation
+
+The CFLAGS handling in mongrel2 is really messy and it is hard to make
+it behave correctly with cross-compiling environments. This patch
+restricts the Makefiles syntax to GNU Make, but help cross-compiling.
+
+This is not meant to be applied upstream.
+
+Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
+---
+ Makefile                      | 2 +-
+ tools/config_modules/Makefile | 2 +-
+ tools/filters/Makefile        | 2 +-
+ tools/m2sh/Makefile           | 2 +-
+ tools/procer/Makefile         | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 6dce4a6..d48e05e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,4 @@
+-CFLAGS=-g -O2 -Wall -Wextra -Isrc -pthread -rdynamic -DNDEBUG $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
++override CFLAGS += -g -O2 -Wall -Wextra -Isrc -pthread -rdynamic -DNDEBUG $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
+ LIBS=-lzmq -ldl -lsqlite3 $(OPTLIBS)
+ PREFIX?=/usr/local
+ 
+diff --git a/tools/config_modules/Makefile b/tools/config_modules/Makefile
+index 398490c..53f2255 100644
+--- a/tools/config_modules/Makefile
++++ b/tools/config_modules/Makefile
+@@ -1,5 +1,5 @@
+ PREFIX?=/usr/local
+-CFLAGS=-I../../src $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
++override CFLAGS += -I../../src $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
+ LDFLAGS=$(OPTLIBS)
+ 
+ MONGO_SRC = mongo-c-driver/src/bson.c \
+diff --git a/tools/filters/Makefile b/tools/filters/Makefile
+index f9f4556..6077b79 100644
+--- a/tools/filters/Makefile
++++ b/tools/filters/Makefile
+@@ -1,5 +1,5 @@
+ PREFIX?=/usr/local
+-CFLAGS=-I../../src $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
++override CFLAGS += -I../../src $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
+ LDFLAGS=$(OPTLIBS)
+ 
+ all: null.so
+diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
+index b50d8a0..ba378c5 100644
+--- a/tools/m2sh/Makefile
++++ b/tools/m2sh/Makefile
+@@ -1,4 +1,4 @@
+-CFLAGS=-DNDEBUG -DNO_LINENOS -pthread -g -I../../src -Isrc -Wall $(OPTFLAGS)
++override CFLAGS += -DNDEBUG -DNO_LINENOS -pthread -g -I../../src -Isrc -Wall $(OPTFLAGS)
+ LIBS=-lzmq -lsqlite3 ../../build/libm2.a $(OPTLIBS)
+ 
+ PREFIX?=/usr/local
+diff --git a/tools/procer/Makefile b/tools/procer/Makefile
+index d0d7de0..629b2e9 100644
+--- a/tools/procer/Makefile
++++ b/tools/procer/Makefile
+@@ -1,4 +1,4 @@
+-CFLAGS=-DNDEBUG -pthread -g -I../../src -Wall $(OPTFLAGS)
++override CFLAGS += -DNDEBUG -pthread -g -I../../src -Wall $(OPTFLAGS)
+ PREFIX?=/usr/local
+ LIBS?=-lzmq 
+ SOURCES=$(wildcard *.c)
+-- 
+1.8.1.4
+
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
new file mode 100644
index 0000000..c135437
--- /dev/null
+++ b/package/mongrel2/mongrel2.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# Mongrel2
+#
+#############################################################
+
+MONGREL2_VERSION = 1.8.0
+MONGREL2_SOURCE = mongrel2_$(MONGREL2_VERSION).tar.gz
+MONGREL2_SITE = https://github.com/zedshaw/mongrel2/tarball/v$(MONGREL2_VERSION)
+MONGREL2_LICENSE = BSD-3c
+MONGREL2_LICENSE_FILES = LICENSE
+MONGREL2_DEPENDENCIES = sqlite zeromq
+
+define MONGREL2_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		PREFIX=/usr all
+endef
+
+define MONGREL2_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		PREFIX=/usr DESTDIR=$(TARGET_DIR) install
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
