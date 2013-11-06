From: Laurent GONZALEZ <br2@gezedo.com>
Date: Wed, 06 Nov 2013 20:19:10 +0100
Subject: [Buildroot] [PATCH v3 1/1] Avoid toolchain download when it is
	preinstalled
Message-ID: <527A962E.4090402@gezedo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For configurations using a toolchain that is preinstalled on
the host, <pkg>_SITE and <pkg>_SOURCE variables must be kept
empty to avoid downloading any toolchain package.
The actual implementation has been proposed by Thomas Petazzoni.

Signed-off-by: GONZALEZ Laurent <br2@gezedo.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2722600..e2e9953 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -348,6 +348,14 @@ TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 endif
 
+# In fact, we don't need to download the toolchain, since it is already
+# available on the system, so force the site and source to be empty so
+# that nothing will be downloaded/extracted.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED),y)
+TOOLCHAIN_EXTERNAL_SITE =
+TOOLCHAIN_EXTERNAL_SOURCE =
+endif
+
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
-- 
1.7.10.4
