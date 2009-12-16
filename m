From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] libglib2: convert to autotools
	infrastructure for host package
Message-ID: <20091216153049.ABE6B77738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e89801a186025b7947d09655366340b67f3baa9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2.mk |   55 +++++++-----------------------------------
 1 files changed, 9 insertions(+), 46 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index ea96707..04e3f2d 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -49,8 +49,16 @@ LIBGLIB2_CONF_ENV =	\
 LIBGLIB2_CONF_OPT = --enable-shared \
 		--enable-static
 
+HOST_LIBGLIB2_CONF_OPT = \
+		--enable-shared \
+		--disable-static \
+		--disable-gtk-doc \
+		--enable-debug=no \
+
 LIBGLIB2_DEPENDENCIES = gettext libintl host-pkg-config host-libglib2
 
+HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config
+
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES+=libiconv
 endif
@@ -61,51 +69,6 @@ LIBGLIB2_DEPENDENCIES+=libiconv
 endif
 
 $(eval $(call AUTOTARGETS,package,libglib2))
+$(eval $(call AUTOTARGETS,package,libglib2,host))
 
-# libglib2 for the host
-LIBGLIB2_HOST_DIR:=$(BUILD_DIR)/libglib2-$(LIBGLIB2_VERSION)-host
 LIBGLIB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/glib-genmarshal
-
-$(DL_DIR)/$(LIBGLIB2_SOURCE):
-	$(call DOWNLOAD,$(LIBGLIB2_SITE),$(LIBGLIB2_SOURCE))
-
-$(STAMP_DIR)/host_libglib2_unpacked: $(DL_DIR)/$(LIBGLIB2_SOURCE)
-	mkdir -p $(LIBGLIB2_HOST_DIR)
-	$(INFLATE$(suffix $(LIBGLIB2_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LIBGLIB2_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_libglib2_configured: $(STAMP_DIR)/host_libglib2_unpacked $(STAMP_DIR)/host_pkgconfig_installed
-	(cd $(LIBGLIB2_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-		--enable-shared \
-		--disable-static \
-		--disable-gtk-doc \
-		--enable-debug=no \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_libglib2_compiled: $(STAMP_DIR)/host_libglib2_configured
-	$(MAKE) -C $(LIBGLIB2_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_libglib2_installed: $(STAMP_DIR)/host_libglib2_compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(LIBGLIB2_HOST_DIR) install
-	touch $@
-
-host-libglib2: $(STAMP_DIR)/host_libglib2_installed
-
-host-libglib2-source: libglib2-source
-
-host-libglib2-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_libglib2_,unpacked configured compiled installed)
-	-$(MAKE) -C $(LIBGLIB2_HOST_DIR) uninstall
-	-$(MAKE) -C $(LIBGLIB2_HOST_DIR) clean
-
-host-libglib2-dirclean:
-	rm -rf $(LIBGLIB2_HOST_DIR)
-- 
1.6.3.3
