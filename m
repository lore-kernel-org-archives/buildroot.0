From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Aug 2019 14:04:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/giflib: security bump to version
 5.2.1
Message-ID: <20190818120432.22829-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch to generic-package (autotools has been dropped since version
  5.1.5)
- Remove hook and instead use dedicated makefile targets to build only
  shared or static library and not binaries or documentation (added by
  an upstreamble patch)
- ac_cv_prog_have_xmlto=no can be removed as doc is not built anymore
- Fix CVE-2018-11490: The DGifDecompressLine function in dgif_lib.c in
  GIFLIB (possibly version 3.0.x), as later shipped in cgif.c in sam2p
  0.49.4, has a heap-based buffer overflow because a certain
  "Private->RunningCode - 2" array index is not checked. This will lead
  to a denial of service or possibly unspecified other impact.
- Fix CVE-2019-15133: In GIFLIB before 2019-02-16, a malformed GIF file
  triggers a divide-by-zero exception in the decoder function DGifSlurp
  in dgif_lib.c if the height field of the ImageSize data structure is
  equal to zero.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...dd-targets-to-manage-static-building.patch | 69 +++++++++++++++++++
 package/giflib/giflib.hash                    |  4 +-
 package/giflib/giflib.mk                      | 47 +++++++++----
 3 files changed, 104 insertions(+), 16 deletions(-)
 create mode 100644 package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch

diff --git a/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch b/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
new file mode 100644
index 0000000000..384457d0bd
--- /dev/null
+++ b/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
@@ -0,0 +1,69 @@
+From 487407d722714f13e8a06d1a9d89f48a5738191e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Jul 2019 12:20:38 +0200
+Subject: [PATCH] Makefile: add targets to manage static building
+
+Add static-lib, shared-lib, install-static-lib and install-shared-lib
+targets to allow the user to build giflib when dynamic library support
+is not available or enable on the toolchain
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/giflib/code/merge-requests/7]
+---
+ Makefile | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index b2bf6de..111f52f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -61,10 +61,17 @@ UTILS = $(INSTALLABLE) \
+ 
+ LDLIBS=libgif.a -lm
+ 
+-all: libgif.so libgif.a libutil.so libutil.a $(UTILS)
++SHARED_LIBS = libgif.so libutil.so
++STATIC_LIBS = libgif.a libutil.a
++
++all: shared-lib static-lib $(UTILS)
+ 	$(MAKE) -C doc
+ 
+-$(UTILS):: libgif.a libutil.a
++$(UTILS):: $(STATIC_LIBS)
++
++shared-lib: $(SHARED_LIBS)
++
++static-lib: $(STATIC_LIBS)
+ 
+ libgif.so: $(OBJECTS) $(HEADERS)
+ 	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname -Wl,libgif.so.$(LIBMAJOR) -o libgif.so $(OBJECTS)
+@@ -79,7 +86,7 @@ libutil.a: $(UOBJECTS) $(UHEADERS)
+ 	$(AR) rcs libutil.a $(UOBJECTS)
+ 
+ clean:
+-	rm -f $(UTILS) $(TARGET) libgetarg.a libgif.a libgif.so libutil.a libutil.so *.o
++	rm -f $(UTILS) $(TARGET) libgetarg.a $(SHARED_LIBS) $(STATIC_LIBS) *.o
+ 	rm -f libgif.so.$(LIBMAJOR).$(LIBMINOR).$(LIBPOINT)
+ 	rm -f libgif.so.$(LIBMAJOR)
+ 	rm -fr doc/*.1 *.html doc/staging
+@@ -96,12 +103,15 @@ install-bin: $(INSTALLABLE)
+ install-include:
+ 	$(INSTALL) -d "$(DESTDIR)$(INCDIR)"
+ 	$(INSTALL) -m 644 gif_lib.h "$(DESTDIR)$(INCDIR)"
+-install-lib:
++install-static-lib:
+ 	$(INSTALL) -d "$(DESTDIR)$(LIBDIR)"
+ 	$(INSTALL) -m 644 libgif.a "$(DESTDIR)$(LIBDIR)/libgif.a"
++install-shared-lib:
++	$(INSTALL) -d "$(DESTDIR)$(LIBDIR)"
+ 	$(INSTALL) -m 755 libgif.so "$(DESTDIR)$(LIBDIR)/libgif.so.$(LIBVER)"
+ 	ln -sf libgif.so.$(LIBVER) "$(DESTDIR)$(LIBDIR)/libgif.so.$(LIBMAJOR)"
+ 	ln -sf libgif.so.$(LIBMAJOR) "$(DESTDIR)$(LIBDIR)/libgif.so"
++install-lib: install-static-lib install-shared-lib
+ install-man:
+ 	$(INSTALL) -d "$(DESTDIR)$(MANDIR)/man1"
+ 	$(INSTALL) -m 644 doc/*.1 "$(DESTDIR)$(MANDIR)/man1"
+-- 
+2.20.1
+
diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index 189dca9f19..f7db1626df 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,5 +1,5 @@
 # From http://sourceforge.net/projects/giflib/files
-md5	2c171ced93c0e83bb09e6ccad8e3ba2b	giflib-5.1.4.tar.bz2
-sha1	5f1157cfc377916280849e247b8e34fa0446513f	giflib-5.1.4.tar.bz2
+md5	6f03aee4ebe54ac2cc1ab3e4b0a049e5	giflib-5.2.1.tar.gz
+sha1	c3f774dcbdf26afded7788979c8081d33c6426dc	giflib-5.2.1.tar.gz
 # Locally computed
 sha256	0c9b7990ecdca88b676db232c226548ac408b279f550d424d996f0d83591dd8e	COPYING
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 29666eebea..67523abac2 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -4,27 +4,46 @@
 #
 ################################################################################
 
-GIFLIB_VERSION = 5.1.4
-GIFLIB_SOURCE = giflib-$(GIFLIB_VERSION).tar.bz2
+GIFLIB_VERSION = 5.2.1
+GIFLIB_SOURCE = giflib-$(GIFLIB_VERSION).tar.gz
 GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
 GIFLIB_INSTALL_STAGING = YES
 GIFLIB_LICENSE = MIT
 GIFLIB_LICENSE_FILES = COPYING
 
-GIFLIB_BINS = \
-	gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifbuild gifburst gifclip \
-	gifclrmp gifcolor gifcomb gifcompose gifecho giffiltr giffix gifflip \
-	gifhisto gifinfo gifinter gifinto gifovly gifpos gifrotat \
-	gifrsize gifspnge giftext giftool gifwedge icon2gif raw2gif rgb2gif \
-	text2gif
+ifeq ($(BR2_STATIC_LIBS),y)
+GIFLIB_BUILD_LIBS = static-lib
+GIFLIB_INSTALL_LIBS = install-static-lib
+else ifeq ($(BR2_SHARED_LIBS),y)
+GIFLIB_BUILD_LIBS = shared-lib
+GIFLIB_INSTALL_LIBS = install-shared-lib
+else
+GIFLIB_BUILD_LIBS = static-lib shared-lib
+GIFLIB_INSTALL_LIBS = install-lib
+endif
 
-GIFLIB_CONF_ENV = ac_cv_prog_have_xmlto=no
+define GIFLIB_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(GIFLIB_BUILD_LIBS)
+endef
+
+define HOST_GIFLIB_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
 
-define GIFLIB_BINS_CLEANUP
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(GIFLIB_BINS))
+define GIFLIB_INSTALL_STAGING_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) \
+		PREFIX=/usr install-include $(GIFLIB_INSTALL_LIBS)
 endef
 
-GIFLIB_POST_INSTALL_TARGET_HOOKS += GIFLIB_BINS_CLEANUP
+define GIFLIB_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr install-include $(GIFLIB_INSTALL_LIBS)
+endef
+
+define HOST_GIFLIB_INSTALL_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
+		PREFIX=/usr install
+endef
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.20.1
