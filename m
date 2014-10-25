From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:48:17 +0200
Subject: [Buildroot] [git commit] system/skeleton: make nsswitch install
	conditional
Message-ID: <20141025104850.7E6D7AD377@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1eba3d97c5d435ed1b88fdb6b6989871aa2c9eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't blindly install the /etc/nsswitch.conf file, it's useless for
toolchains that aren't (e)glibc-based and misleading.
Make the installation conditional on a (e)glibc toolchain.

[Thomas: use $(INSTALL) instead of cp.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../skeleton/etc => package/glibc}/nsswitch.conf   |    0
 toolchain/toolchain.mk                             |   10 ++++++++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/system/skeleton/etc/nsswitch.conf b/package/glibc/nsswitch.conf
similarity index 100%
rename from system/skeleton/etc/nsswitch.conf
rename to package/glibc/nsswitch.conf
diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index 8fe06ff..3f9900b 100644
--- a/toolchain/toolchain.mk
+++ b/toolchain/toolchain.mk
@@ -3,6 +3,16 @@
 # TARGET_FINALIZE_HOOKS, to be applied just after all packages
 # have been built.
 
+# Install default nsswitch.conf file if the skeleton doesn't provide it
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+define GLIBC_COPY_NSSWITCH_FILE
+	$(Q)if [ ! -f "$(TARGET_DIR)/etc/nsswitch.conf" ]; then \
+		$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf ; \
+	fi
+endef
+TARGET_FINALIZE_HOOKS += GLIBC_COPY_NSSWITCH_FILE
+endif
+
 # Install the gconv modules
 ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
 GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
