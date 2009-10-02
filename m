From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri,  2 Oct 2009 14:20:04 +0200
Subject: [Buildroot] [PATCH] directfb: add host-directfb target for
	directfb-csource
In-Reply-To: <8763ay6n3j.fsf@macbook.be.48ers.dk>
References: <8763ay6n3j.fsf@macbook.be.48ers.dk>
Message-ID: <1254486004-21899-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

directfb-csource is a code generation tool that may be needed to build
other packages. Add host-directfb target that installs directfb-csource
in the host_dir.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/directfb/directfb.mk |   52 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 409f791..4175753 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -150,3 +150,55 @@ DIRECTFB_CONF_OPT = \
 DIRECTFB_DEPENDENCIES = $(DIRECTFB_DEP) freetype $(DIRECTFB_FUSION)
 
 $(eval $(call AUTOTARGETS,package,directfb))
+
+
+# directfb-csource for the host
+
+DIRECTFB_HOST_DIR:=$(BUILD_DIR)/directfb-$(DIRECTFB_VERSION)-host
+DIRECTFB_HOST_BINARY:=$(HOST_DIR)/usr/bin/directfb-csource
+
+$(DL_DIR)/$(DIRECTFB_SOURCE):
+        $(call DOWNLOAD,$(DIRECTFB_SITE),$(DIRECTFB_SOURCE))
+
+$(STAMP_DIR)/host_directfb_unpacked: $(DL_DIR)/$(DIRECTFB_SOURCE)
+        mkdir -p $(DIRECTFB_HOST_DIR)
+        $(INFLATE$(suffix $(DIRECTFB_SOURCE))) $< | \
+                $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(DIRECTFB_HOST_DIR) $(TAR_OPTIONS) -
+        touch $@
+
+$(STAMP_DIR)/host_directfb_configured: $(STAMP_DIR)/host_directfb_unpacked $(STAMP_DIR)/host_pkgconfig_installed
+        (cd $(DIRECTFB_HOST_DIR); rm -rf config.cache; \
+                $(HOST_CONFIGURE_OPTS) \
+                CFLAGS="$(HOST_CFLAGS)" \
+                LDFLAGS="$(HOST_LDFLAGS)" \
+                ./configure \
+                --prefix="$(HOST_DIR)/usr" \
+                --sysconfdir="$(HOST_DIR)/etc" \
+                --enable-shared \
+                --disable-static \
+                --disable-debug \
+                --disable-multi \
+                --with-gfxdrivers=none \
+                --with-inputdrivers=none \
+        )
+        touch $@
+
+$(STAMP_DIR)/host_directfb_compiled: $(STAMP_DIR)/host_directfb_configured
+        $(MAKE) -C $(DIRECTFB_HOST_DIR)/tools directfb-csource
+        touch $@
+
+$(STAMP_DIR)/host_directfb_installed: $(STAMP_DIR)/host_directfb_compiled
+        $(INSTALL) -m 0755 $(DIRECTFB_HOST_DIR)/tools/directfb-csource $(HOST_DIR)/usr/bin
+        touch $@
+
+host-directfb: $(STAMP_DIR)/host_directfb_installed
+
+host-directfb-source: directfb-source
+
+host-directfb-clean:
+        rm -f $(addprefix $(STAMP_DIR)/host_directfb_,unpacked configured compiled installed)
+        rm -f $(HOST_DIR)/usr/bin/directfb-csource
+        -$(MAKE) -C $(DIRECTFB_HOST_DIR)/tools clean
+
+host-directfb-dirclean:
+        rm -rf $(DIRECTFB_HOST_DIR)
-- 
1.6.0.4
