From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 25 May 2021 19:26:49 +0200
Subject: [Buildroot] [PATCH v2 3/5] package/zstd: rework build and install
In-Reply-To: <20210525172652.821351-1-nolange79@gmail.com>
References: <20210525172652.821351-1-nolange79@gmail.com>
Message-ID: <20210525172652.821351-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1.5.0 uses Threads by default for cli tool and DSO,
the build now does the same unless:

If only static libraries are build, then build
that library like the DSO is normally built.

This should ensure that programs requsting the DSO
will always get the multithreaded version.

Signed-off-by: Norbert Lange <nolange79@gmail.com>

---
v1->v2:
*   rebased against upstream/master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/zstd/zstd.mk | 52 ++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 2a876376a2..a7a5ba4e50 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -12,6 +12,8 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
 ZSTD_CPE_ID_VENDOR = facebook
 ZSTD_CPE_ID_PRODUCT = zstandard
 
+ZSTD_OPTS += PREFIX=/usr
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ZSTD_OPTS += HAVE_THREAD=1
 else
@@ -39,43 +41,55 @@ else
 ZSTD_OPTS += HAVE_LZ4=0
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-ZSTD_BUILD_LIBS = libzstd.a
-ZSTD_INSTALL_LIBS = install-static
-else ifeq ($(BR2_SHARED_LIBS),y)
-ZSTD_BUILD_LIBS = libzstd
-ZSTD_INSTALL_LIBS = install-shared
+ZSTD_BUILD_PROG_TARGET := zstd-release
+
+# Since v1.5.0 the dynamic library is built for
+# multithreading, while the static library is not.
+#
+# Keep those defaults, unless Buildroot is not
+# providing the dynamic library and the
+# static library will be automatically used instead.
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+ZSTD_INSTALL_LIBS += install-static
+ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+# Use the static lib as replacement for the mt dynlib
+ZSTD_BUILD_LIBS += libzstd.a-mt
 else
-ZSTD_BUILD_LIBS = libzstd.a libzstd
-ZSTD_INSTALL_LIBS = install-static install-shared
+ZSTD_BUILD_LIBS += libzstd.a-nomt
+endif
 endif
 
-# The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
-# one. Building a multi-threaded binary with a library (which defaults to
-# single-threaded) gives a runtime error when compressing files.
-# The 'lib' makefile provides specific '%-mt' targets for this purpose.
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+ZSTD_INSTALL_LIBS += install-shared
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
+ZSTD_BUILD_LIBS += libzstd-mt
+else
+ZSTD_BUILD_LIBS += libzstd-nomt
+endif
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
+	[ -e $(@D)/programs/zstd ] && [ -e $(@D)/lib/libzstd.pc ]
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		-C $(@D)/lib DESTDIR=$(STAGING_DIR) $(ZSTD_INSTALL_LIBS) \
+		install-pc install-includes
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib \
-		install-pc install-includes $(ZSTD_INSTALL_LIBS)
+		-C $(@D)/programs DESTDIR=$(STAGING_DIR) install
 endef
 
 define ZSTD_INSTALL_TARGET_CMDS
+	[ -e $(@D)/programs/zstd ]
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
+		-C $(@D)/lib DESTDIR=$(TARGET_DIR) $(ZSTD_INSTALL_LIBS)
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
+		-C $(@D)/programs DESTDIR=$(TARGET_DIR) install
 endef
 
 HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
-- 
2.30.2
