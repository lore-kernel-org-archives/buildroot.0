From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Nov 2013 18:47:27 +0100
Subject: [Buildroot] [PATCH 2/2] libcap: fix static link
In-Reply-To: <1383328047-28945-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383328047-28945-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1383328047-28945-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With BR2_PREFER_STATIC_LINK, libcap fails to build:

  http://autobuild.buildroot.net/results/619bceb3491ecd2ed4e1ae552fdb237a0ed2fa47/build-end.log

This is due to the fact that it still tries to build a shared
library. This commit fixes that by adding a patch that makes libcap
provide install-shared/install-static targets. We also now only build
the $(@D)/libcap subdirectory, so removing the build of the progs
subdirectory is no longer needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libcap-02-split-static-shared-install.patch    | 30 ++++++++++++++++++++++
 package/libcap/libcap.mk                           | 27 +++++++++----------
 2 files changed, 44 insertions(+), 13 deletions(-)
 create mode 100644 package/libcap/libcap-02-split-static-shared-install.patch

diff --git a/package/libcap/libcap-02-split-static-shared-install.patch b/package/libcap/libcap-02-split-static-shared-install.patch
new file mode 100644
index 0000000..21e7f2a
--- /dev/null
+++ b/package/libcap/libcap-02-split-static-shared-install.patch
@@ -0,0 +1,30 @@
+libcap: split install into install-shared/install-static
+
+In order to support static only builds, split the install target into
+install-shared and install-static targets.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/libcap/Makefile
+===================================================================
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -60,11 +60,17 @@
+ cap_text.o: cap_text.c $(USE_GPERF_OUTPUT) $(INCLS)
+ 	$(CC) $(CFLAGS) $(IPATH) $(INCLUDE_GPERF_OUTPUT) -c $< -o $@
+ 
+-install: all
++install: install-shared install-static
++
++install-common:
+ 	mkdir -p -m 0755 $(INCDIR)/sys
+ 	install -m 0644 include/sys/capability.h $(INCDIR)/sys
+ 	mkdir -p -m 0755 $(LIBDIR)
++
++install-static: install-common
+ 	install -m 0644 $(STALIBNAME) $(LIBDIR)/$(STALIBNAME)
++
++install-shared: install-common
+ 	install -m 0755 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
+ 	ln -sf $(MINLIBNAME) $(LIBDIR)/$(MAJLIBNAME)
+ 	ln -sf $(MAJLIBNAME) $(LIBDIR)/$(LIBNAME)
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 16afaef..17e2eb5 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -25,29 +25,30 @@ endif
 # we don't have host-attr
 HOST_LIBCAP_DEPENDENCIES =
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBCAP_MAKE_TARGET = libcap.a
+LIBCAP_MAKE_INSTALL_TARGET = install-static
+else
+LIBCAP_MAKE_TARGET = all
+LIBCAP_MAKE_INSTALL_TARGET = install
+endif
+
 define LIBCAP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/libcap \
 		LIBATTR=$(LIBCAP_HAVE_LIBATTR) BUILD_CC="$(HOSTCC)" \
-		BUILD_CFLAGS="$(HOST_CFLAGS)"
+		BUILD_CFLAGS="$(HOST_CFLAGS)" $(LIBCAP_MAKE_TARGET)
 endef
 
 define LIBCAP_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
-		DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libcap LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
+		DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib $(LIBCAP_MAKE_INSTALL_TARGET)
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
-		DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libcap LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
+		DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib $(LIBCAP_MAKE_INSTALL_TARGET)
 endef
 
-# progs use fork()
-define LIBCAP_DISABLE_PROGS
-	$(SED) '/-C progs/d' $(@D)/Makefile
-endef
-
-LIBCAP_POST_PATCH_HOOKS += LIBCAP_DISABLE_PROGS
-
 define HOST_LIBCAP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
 endef
-- 
1.8.1.2
