From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 26 Sep 2020 21:13:29 +0200
Subject: [Buildroot] [PATCH 1/2] linux: introduce LINUX_KCFLAGS to add
 additional options to the C compiler
Message-ID: <20200926191330.96074-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 9a50447b5d4b2ab0162e3235395ab9a4c8a647d5 KCFLAGS is set
to disable a compiler warning but doesn't allow to provide
more flags.

This refactoring introduce LINUX_KCFLAGS to provide more
options to the C compiler.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 linux/linux.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e07e014d1e..b9b223e3f3 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -71,7 +71,8 @@ LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
 # host-pkgconf will look for host libraries and not target ones.
 LINUX_MAKE_ENV = \
 	$(HOST_MAKE_ENV) \
-	BR_BINARIES_DIR=$(BINARIES_DIR)
+	BR_BINARIES_DIR=$(BINARIES_DIR) \
+	KCFLAGS="$(LINUX_KCFLAGS)"
 
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES = host-kmod \
@@ -154,7 +155,7 @@ endif
 # sanitize the arguments passed from user space in registers.
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
-LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
+LINUX_KCFLAGS += -Wno-attribute-alias
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT),y)
-- 
2.25.4
