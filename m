From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 03:57:31 -0700
Subject: [Buildroot] [PATCH v2] package/perf: build outside kernel tree
Message-ID: <1426762651-7734-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is necessary for introducing patches.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---

v2:
  - Running 'make source' made me realize that the PERF_SOURCE variable needed
	to be added, pointing to the same location as e.g. linux-headers.

 package/perf/perf.mk | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index f35abc9..2177ac8 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -5,10 +5,15 @@
 ################################################################################
 
 # Source taken from the Linux kernel tree
-PERF_SOURCE =
 PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+PERF_SOURCE = linux-$(PERF_VERSION).tar.xz
+ifeq ($(findstring x2.6.,x$(PERF_VERSION)),x2.6.)
+PERF_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
+else
+PERF_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
+endif
 
-PERF_DEPENDENCIES = linux host-flex host-bison
+PERF_DEPENDENCIES = host-flex host-bison
 
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
@@ -53,29 +58,29 @@ else
 endif
 
 define PERF_BUILD_CMDS
-	$(Q)if test ! -f $(LINUX_DIR)/tools/perf/Makefile ; then \
+	$(Q)if test ! -f $(@D)/tools/perf/Makefile ; then \
 		echo "Your kernel version is too old and does not have the perf tool." ; \
 		echo "At least kernel 2.6.31 must be used." ; \
 		exit 1 ; \
 	fi
 	$(Q)if test "$(BR2_PACKAGE_ELFUTILS)" = "" ; then \
-		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile* ; then \
-			if ! test -r $(LINUX_DIR)/tools/perf/config/Makefile ; then \
+		if ! grep -q NO_LIBELF $(@D)/tools/perf/Makefile* ; then \
+			if ! test -r $(@D)/tools/perf/config/Makefile ; then \
 				echo "The perf tool in your kernel cannot be built without libelf." ; \
 				echo "Either upgrade your kernel to >= 3.7, or enable the elfutils package." ; \
 				exit 1 ; \
 			fi \
 		fi \
 	fi
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \
-		$(PERF_MAKE_FLAGS) O=$(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools/perf \
+		$(PERF_MAKE_FLAGS)
 endef
 
 # After installation, we remove the Perl and Python scripts from the
 # target.
 define PERF_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \
-		$(PERF_MAKE_FLAGS) O=$(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools/perf \
+		$(PERF_MAKE_FLAGS) install
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 endef
 
-- 
2.3.3
