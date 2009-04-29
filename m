From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Wed, 29 Apr 2009 07:13:21 +0000 (UTC)
Subject: [Buildroot] svn commit: [26235] trunk/buildroot/package/libxml2
Message-ID: <20090429071321.BBFE27646C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2009-04-29 07:13:20 +0000 (Wed, 29 Apr 2009)
New Revision: 26235

Log:
Add libxml2 for the host

Some other packages, such as shared-mime-info, might need libxml2 and
related tools (xmllint, etc.) to be available on the host. This patch
modifies tthe libxml2 Makefile to compile libxml2 for the host, in
$(HOST_DIR).

Patch from Sven Neumann <s.neumann@raumfeld.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Modified:
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2009-04-28 21:12:23 UTC (rev 26234)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2009-04-29 07:13:20 UTC (rev 26235)
@@ -34,3 +34,49 @@
 	       $(TARGET_DIR)/usr/share/doc/libxml2-$(LIBXML2_VERSION) \
 	       $(TARGET_DIR)/usr/share/gtk-doc
 	touch $@
+
+# libxml2 for the host
+LIBXML2_HOST_DIR:=$(BUILD_DIR)/libxml2-$(LIBXML2_VERSION)-host
+LIBXML2_HOST_BINARY:=$(HOST_DIR)/usr/bin/xmllint
+
+$(DL_DIR)/$(LIBXML2_SOURCE):
+	$(call DOWNLOAD,$(LIBXML2_SITE),$(LIBXML2_SOURCE))
+
+$(STAMP_DIR)/host_libxml2_unpacked: $(DL_DIR)/$(LIBXML2_SOURCE)
+	mkdir -p $(LIBXML2_HOST_DIR)
+	$(INFLATE$(suffix $(LIBXML2_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LIBXML2_HOST_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+$(STAMP_DIR)/host_libxml2_configured: $(STAMP_DIR)/host_libxml2_unpacked $(STAMP_DIR)/host_pkgconfig_installed
+	(cd $(LIBXML2_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+		--enable-shared --without-debugging --without-python \
+		--without-threads \
+	)
+	touch $@
+
+$(STAMP_DIR)/host_libxml2_compiled: $(STAMP_DIR)/host_libxml2_configured
+	$(MAKE) -C $(LIBXML2_HOST_DIR)
+	touch $@
+
+$(STAMP_DIR)/host_libxml2_installed: $(STAMP_DIR)/host_libxml2_compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(LIBXML2_HOST_DIR) install
+	touch $@
+
+host-libxml2: $(STAMP_DIR)/host_libxml2_installed
+
+host-libxml2-source: libxml2-source
+
+host-libxml2-clean:
+	rm -f $(addprefix $(STAMP_DIR)/host_libxml2_,unpacked configured compiled installed)
+	-$(MAKE) -C $(LIBXML2_HOST_DIR) uninstall
+	-$(MAKE) -C $(LIBXML2_HOST_DIR) clean
+
+host-libxml2-dirclean:
+	rm -rf $(LIBXML2_HOST_DIR)
