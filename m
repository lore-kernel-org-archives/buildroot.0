From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jul 2010 13:57:12 +0200
Subject: [Buildroot] [git commit master 1/1] Remove $(TOOLCHAIN_DIR)/bin and
	$(STAGING_DIR)/{usr/bin, bin} from the PATH
Message-ID: <20100708115825.CB1C38269B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0ab16a01bbe02d37ad2daa007fdb5a0de0ff9eab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These shouldn't be needed. Even when the cross-compiler is in
$(STAGING_DIR)/usr/bin, we anyway use an absolute path for TARGET_CC,
TARGET_LD and al.

Not having $(STAGING_DIR)/{usr/bin,bin} in the PATH will avoid having
Buildroot trying to run target binaries.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0d80a2a..1c965c9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -103,17 +103,16 @@ endif
 REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-
-# Quotes are needed for spaces et al in path components.
-TARGET_PATH="$(TOOLCHAIN_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
-TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 endif
 
+# Quotes are needed for spaces et al in path components.
+TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
+
 # Define TARGET_xx variables for all common binutils/gcc tools by
 # including the --sysroot option where necessary.
 TARGET_AR       = $(TARGET_CROSS)ar
-- 
1.7.1
