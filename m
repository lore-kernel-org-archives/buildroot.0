From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 08:55:35 +0200
Subject: [Buildroot] [PATCH 5 of 5] toolchain-external: use host-tar instead
 of tar to unpack toolchains
In-Reply-To: <patchbomb.1316588130@localhost6.localdomain6>
References: <patchbomb.1316588130@localhost6.localdomain6>
Message-ID: <8a360f47132f5187ec55.1316588135@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some toolchains, like the one built with buildroot itself, use hardlinks (for
example to link between the c++ and g++ binary). Unpacking such a toolchain
with the --strip-components options does not work correctly if the system tar
is too old (<1.17). Even recent releases of RedHat/CentOS still ship with
tar 1.15.
To avoid such problems, always use host-tar instead of tar to unpack
toolchains.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 toolchain/toolchain-external/ext-tool.mk |  11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -156,7 +156,10 @@
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
-TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
+  ifeq (,$(wildcard $(HOST_DIR)/usr/bin/tar))
+    TOOLCHAIN_EXTERNAL_DEPENDENCIES = host-tar
+  endif
+  TOOLCHAIN_EXTERNAL_DEPENDENCIES += $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
 else
 TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(STAMP_DIR)/ext-toolchain-checked
 endif
@@ -228,9 +231,9 @@
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
 	mkdir -p $(@D)
 	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_1))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
+		$(HOST_TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
 	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_2))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2) | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
+		$(HOST_TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
 ifeq ($(TOOLCHAIN_EXTERNAL_PREFIX),bfin-uclinux)
 	rm -rf $(TOOLCHAIN_EXTERNAL_DIR)/bfin-linux-uclibc
 	mv $(TOOLCHAIN_EXTERNAL_DIR)/bfin-uclinux $(TOOLCHAIN_EXTERNAL_DIR)/tmp
@@ -250,7 +253,7 @@
 
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
 	mkdir -p $(@D)
-	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | $(HOST_TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 	$(Q)touch $@
 endif
 
