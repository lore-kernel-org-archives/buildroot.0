From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 14:43:00 -0700
Subject: [Buildroot] [PATCH 4/7] package/perf: build outside kernel tree
In-Reply-To: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
References: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426714983-24803-4-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is necessary for introducing patches.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/perf/perf.mk | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index f35abc9..68bb430 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -5,10 +5,10 @@
 ################################################################################
 
 # Source taken from the Linux kernel tree
-PERF_SOURCE =
 PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+PERF_SOURCE = linux-$(PERF_VERSION).tar.xz
 
-PERF_DEPENDENCIES = linux host-flex host-bison
+PERF_DEPENDENCIES = host-flex host-bison
 
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
@@ -53,29 +53,29 @@ else
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
