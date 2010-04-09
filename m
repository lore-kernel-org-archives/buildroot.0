From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] lzma: convert the host package to
	the autotools infrastructure
Message-ID: <20100409142124.AEC2320E4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=002a31168eca09af788669ce1510a77220b2be80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that we loose the ability to use a lzma command available on the
host and we now always build your own if a package needs it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzma/lzma.mk |   65 +------------------------------------------------
 1 files changed, 2 insertions(+), 63 deletions(-)

diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index c4a735d..9bdcc35 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -11,67 +11,6 @@ LZMA_INSTALL_TARGET = YES
 LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
 $(eval $(call AUTOTARGETS,package,lzma))
+$(eval $(call AUTOTARGETS,package,lzma,host))
 
-######################################################################
-#
-# lzma host
-#
-######################################################################
-
-LZMA_CAT:=$(ZCAT)
-LZMA_HOST_DIR:=$(TOOLCHAIN_DIR)/lzma-$(LZMA_VERSION)
-
-# lzma binary for use on the host
-LZMA=$(TOOLCHAIN_DIR)/bin/lzma
-HOST_LZMA_BINARY=$(shell package/lzma/lzmacheck.sh)
-HOST_LZMA_IF_ANY=$(shell toolchain/dependencies/check-host-lzma.sh)
-
-$(DL_DIR)/$(LZMA_SOURCE):
-	$(call DOWNLOAD,$(LZMA_SITE),$(LZMA_SOURCE))
-
-$(LZMA_HOST_DIR)/.unpacked: $(DL_DIR)/$(LZMA_SOURCE)
-	$(LZMA_CAT) $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LZMA_HOST_DIR) package/lzma/ lzma\*.patch
-	touch $@
-
-$(LZMA_HOST_DIR)/.configured: $(LZMA_HOST_DIR)/.unpacked
-	(cd $(LZMA_HOST_DIR); rm -f config.cache;\
-		CC="$(HOSTCC)" \
-		CXX="$(HOSTCXX)" \
-		./configure $(QUIET) \
-		--prefix=/ \
-	)
-	touch $@
-
-$(LZMA_HOST_DIR)/src/lzma/lzma: $(LZMA_HOST_DIR)/.configured
-	$(MAKE) -C $(LZMA_HOST_DIR) all
-	touch -c $@
-
-$(STAGING_DIR)/bin/lzma: $(LZMA_HOST_DIR)/src/lzma/lzma
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LZMA_HOST_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
-		$(STAGING_DIR)/lib/liblzmadec.la
-
-.PHONY: lzma-host use-lzma-host-binary
-use-lzma-host-binary:
-	if [ ! -f "$(TOOLCHAIN_DIR)/bin/lzma" ]; then \
-		[ -d $(TOOLCHAIN_DIR)/bin ] || mkdir -p $(TOOLCHAIN_DIR)/bin; \
-		ln -sf "$(HOST_LZMA_IF_ANY)" "$(TOOLCHAIN_DIR)/bin/lzma"; \
-	fi
-
-build-lzma-host-binary: $(LZMA_HOST_DIR)/src/lzma/lzma
-	-rm -f $(TOOLCHAIN_DIR)/bin/lzma
-	[ -d $(TOOLCHAIN_DIR)/bin ] || mkdir $(TOOLCHAIN_DIR)/bin
-	cp -pf $(LZMA_HOST_DIR)/src/lzma/lzma $(TOOLCHAIN_DIR)/bin/lzma
-
-host-lzma: $(HOST_LZMA_BINARY)
-
-lzma-host: $(STAGING_DIR)/bin/lzma
-
-lzma-host-clean:
-	rm -f $(STAGING_DIR)/bin/lzma
-	-$(MAKE) -C $(LZMA_HOST_DIR) clean
-lzma-host-dirclean:
-	rm -rf $(LZMA_HOST_DIR)
-
-lzma-host-install: /usr/local/bin/lzma
+LZMA=$(HOST_DIR)/usr/bin/lzma
-- 
1.6.3.3
