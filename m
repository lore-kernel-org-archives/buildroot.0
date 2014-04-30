From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Apr 2014 21:18:57 +0200
Subject: [Buildroot] [PATCH] uclibc: re-add uclibc-update-config target
Message-ID: <ffb59038c33cd78676d8.1398885537@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit a5e92d92e7ee413157aae7cecf1f354e718731e1 converted uClibc to the
package infrastructure, but while doing so removed support for the
documented uclibc-update-config make target. This make target copies the
uclibc .config file back to the original (typically version-controlled)
configuration file.

As this was an unintentional removal, this patch re-adds the
uclibc-update-config target.

Reported-by: Dan Moulding <dan.moulding@rackwareinc.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/uclibc/uclibc.mk |  5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)


Note: while I was at it, I fixed a small typo in uclibc.mk

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -211,7 +211,7 @@ endef
 endif
 
 #
-# Endianess
+# Endianness
 #
 
 ifeq ($(call qstrip,$(BR2_ENDIAN)),BIG)
@@ -553,5 +553,8 @@ uclibc-menuconfig: uclibc-patch
 
 $(eval $(generic-package))
 
+uclibc-update-config: $(UCLIBC_DIR)/.stamp_configured
+	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
+
 # Before uClibc is built, we must have the second stage cross-compiler
 $(UCLIBC_TARGET_BUILD): | host-gcc-intermediate
