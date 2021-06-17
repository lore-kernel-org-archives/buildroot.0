From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 17 Jun 2021 11:14:53 +0200
Subject: [Buildroot] [PATCH v4 1/3] package/zstd: rework build and install
In-Reply-To: <20210617091456.272611-1-nolange79@gmail.com>
References: <20210617091456.272611-1-nolange79@gmail.com>
Message-ID: <20210617091456.272611-4-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1.5.0 uses Threads by default for cli tool and DSO,
so override that in case the toolchain has none.

make sure that everything is built in the build step,
and fail the install if files are missing
instead of lazily building them.

Signed-off-by: Norbert Lange <nolange79@gmail.com>

---
v3->v4:
*   revert to previous scheme of BR2_TOOLCHAIN_HAS_THREADS
    fixing build options for both static and shared libs.
v2->v3:
*   use normal = for assignment
v1->v2:
*   rebased against upstream/master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/zstd/zstd.mk | 45 ++++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 2a876376a2..5674e85bfe 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -12,11 +12,7 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
 ZSTD_CPE_ID_VENDOR = facebook
 ZSTD_CPE_ID_PRODUCT = zstandard
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-ZSTD_OPTS += HAVE_THREAD=1
-else
-ZSTD_OPTS += HAVE_THREAD=0
-endif
+ZSTD_OPTS += PREFIX=/usr
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ZSTD_DEPENDENCIES += zlib
@@ -39,43 +35,52 @@ else
 ZSTD_OPTS += HAVE_LZ4=0
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-ZSTD_BUILD_LIBS = libzstd.a
-ZSTD_INSTALL_LIBS = install-static
-else ifeq ($(BR2_SHARED_LIBS),y)
-ZSTD_BUILD_LIBS = libzstd
-ZSTD_INSTALL_LIBS = install-shared
-else
-ZSTD_BUILD_LIBS = libzstd.a libzstd
-ZSTD_INSTALL_LIBS = install-static install-shared
+ZSTD_BUILD_PROG_TARGET = zstd-release
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+ZSTD_BUILD_LIBS += libzstd.a
+ZSTD_INSTALL_LIBS += install-static
+endif
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+ZSTD_BUILD_LIBS += libzstd
+ZSTD_INSTALL_LIBS += install-shared
 endif
 
+# Since v1.5.0 the dynamic library is built for
+# multithreading, while the static library is not.
+#
 # The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
 # one. Building a multi-threaded binary with a library (which defaults to
 # single-threaded) gives a runtime error when compressing files.
 # The 'lib' makefile provides specific '%-mt' targets for this purpose.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ZSTD_OPTS += HAVE_THREAD=1
 ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
+else
+ZSTD_OPTS += HAVE_THREAD=0
+ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
 endif
 
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
+		-C $(@D)/lib $(addsuffix -release,$(ZSTD_BUILD_LIBS) libzstd.pc)
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D) zstd
+		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
 endef
 
 define ZSTD_INSTALL_STAGING_CMDS
+	[ -e $(@D)/lib/libzstd.pc ]
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib \
-		install-pc install-includes $(ZSTD_INSTALL_LIBS)
+		-C $(@D)/lib DESTDIR=$(STAGING_DIR) $(ZSTD_INSTALL_LIBS) \
+		install-pc install-includes
 endef
 
 define ZSTD_INSTALL_TARGET_CMDS
+	[ -e $(@D)/programs/zstd ]
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
+		-C $(@D)/programs DESTDIR=$(TARGET_DIR) install
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
+		-C $(@D)/lib DESTDIR=$(TARGET_DIR) $(ZSTD_INSTALL_LIBS)
 endef
 
 HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
-- 
2.30.2
