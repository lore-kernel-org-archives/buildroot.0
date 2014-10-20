From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 09:28:05 -0300
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
	conditional
Message-ID: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't blindly install the /etc/nsswitch.conf file, it's useless for
toolchains that aren't (e)glibc-based and misleading.
Make the installation conditional on a (e)glibc toolchain.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 {system/skeleton/etc => package/glibc}/nsswitch.conf |  0
 toolchain/toolchain.mk                               | 10 ++++++++++
 2 files changed, 10 insertions(+)
 rename {system/skeleton/etc => package/glibc}/nsswitch.conf (100%)

diff --git a/system/skeleton/etc/nsswitch.conf b/package/glibc/nsswitch.conf
similarity index 100%
rename from system/skeleton/etc/nsswitch.conf
rename to package/glibc/nsswitch.conf
diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index 8fe06ff..3f3534a 100644
--- a/toolchain/toolchain.mk
+++ b/toolchain/toolchain.mk
@@ -3,6 +3,16 @@
 # TARGET_FINALIZE_HOOKS, to be applied just after all packages
 # have been built.
 
+# Install default nsswitch.conf file if the skeleton doesn't provide it
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+define GLIBC_COPY_NSSWITCH_FILE
+	$(Q)if [ ! -f "$(TARGET_DIR)/etc/nsswitch.conf" ]; then \
+		cp -a package/glibc/nsswitch.conf $(TARGET_DIR)/etc; \
+	fi
+endef
+TARGET_FINALIZE_HOOKS += GLIBC_COPY_NSSWITCH_FILE
+endif
+
 # Install the gconv modules
 ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
 GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
-- 
2.0.4
