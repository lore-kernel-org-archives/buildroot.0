From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 01:50:35 +0200
Subject: [Buildroot] [git commit] toolchain: move glibc nsswitch.conf
 handling to a post-target hook
Message-ID: <20181020234904.E51C388086@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a181d5de361782f687d7a9f11e9ee8d3b0fafca9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nsswitch.conf is processed both by the toolchain, nss-mdns and
nss-myhostname without any guaranteed ordering in between.

The toolchain package ensures that nsswitch.conf is available, and the two
nss-* packages tweaks the content, so the toolchain processing should run
before the nss-* ones.  Toolchain is a dependency of all the packages, so
ensure this is done by moving the toolchain handling to a
post-target-install hook.

Also move the variable to toolchain/toolchain/toolchain.mk where the virtual
toolchain package is defined for clarity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain.mk           | 10 ----------
 toolchain/toolchain/toolchain.mk | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index e7451e2643..08d1649603 100644
--- a/toolchain/toolchain.mk
+++ b/toolchain/toolchain.mk
@@ -7,16 +7,6 @@
 # Those customisations are added to the TARGET_FINALIZE_HOOKS, to be applied
 # just after all packages have been built.
 
-# Install default nsswitch.conf file if the skeleton doesn't provide it
-ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
-define GLIBC_COPY_NSSWITCH_FILE
-	$(Q)if [ ! -f "$(TARGET_DIR)/etc/nsswitch.conf" ]; then \
-		$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf ; \
-	fi
-endef
-TOOLCHAIN_TARGET_FINALIZE_HOOKS += GLIBC_COPY_NSSWITCH_FILE
-endif
-
 # Install the gconv modules
 ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
 TOOLCHAIN_GLIBC_GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 91c9ca2eff..17fb62147e 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -37,4 +37,14 @@ TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBIL
 TOOLCHAIN_INSTALL_STAGING = YES
 endif
 
+# Install default nsswitch.conf file if the skeleton doesn't provide it
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+define GLIBC_COPY_NSSWITCH_FILE
+	@if [ ! -f "$(TARGET_DIR)/etc/nsswitch.conf" ]; then \
+		$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf ; \
+	fi
+endef
+TOOLCHAIN_POST_INSTALL_TARGET_HOOKS += GLIBC_COPY_NSSWITCH_FILE
+endif
+
 $(eval $(virtual-package))
