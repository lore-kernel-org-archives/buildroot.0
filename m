From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 May 2014 23:36:30 +0200
Subject: [Buildroot] [git commit] uclibc: re-add uclibc-update-config target
Message-ID: <20140501213801.276729CAB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be6a575d2c20a01cf3a6dbb569acfa886f0190f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a5e92d92e7ee413157aae7cecf1f354e718731e1 converted uClibc to the
package infrastructure, but while doing so removed support for the
documented uclibc-update-config make target. This make target copies the
uclibc .config file back to the original (typically version-controlled)
configuration file.

As this was an unintentional removal, this patch re-adds the
uclibc-update-config target.

Reported-by: Dan Moulding <dan.moulding@rackwareinc.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 020e218..717cf53 100644
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
