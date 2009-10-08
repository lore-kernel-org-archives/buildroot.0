From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu,  8 Oct 2009 11:32:31 +0200
Subject: [Buildroot] [PATCH 06/10] *-menuconfig needs dirs to exist
In-Reply-To: <87my43j6b6.fsf@macbook.be.48ers.dk>
References: <87my43j6b6.fsf@macbook.be.48ers.dk>
Message-ID: <2ab3141d307cc1b3daa8ab8ded7740b1af324336.1254994304.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  In a pristine checkout the -menuconfig targets need their build dirs
  to exist.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 target/linux/Makefile.in   |    4 ++--
 toolchain/uClibc/uclibc.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/linux/Makefile.in b/target/linux/Makefile.in
index c4962bd..f3c7807 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -201,7 +201,7 @@ $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.config
 	fi
 	touch -c $@
 
-linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
+linux26-menuconfig: host-sed dirs $(LINUX26_DIR)/.patched
 	if [ ! -f $(LINUX26_DIR)/.config ]; then \
 		[ -n "$(LINUX26_KCONFIG)" ] && [ -f $(LINUX26_KCONFIG) ] && \
 			cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config || \
@@ -210,7 +210,7 @@ linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
-linux26-xconfig: $(LINUX26_DIR)/.patched host-sed
+linux26-xconfig: host-sed dirs $(LINUX26_DIR)/.patched
 	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 292f895..74b058d 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -463,7 +463,7 @@ $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_initial) $(LIBFLOAT_TA
 		all
 	touch -c $@
 
-uclibc-menuconfig: host-sed $(UCLIBC_DIR)/.config
+uclibc-menuconfig: host-sed dirs $(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
-- 
1.6.3.3
