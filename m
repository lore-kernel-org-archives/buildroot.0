From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 15 Nov 2016 21:46:58 +0100
Subject: [Buildroot] [PATCH] package/tremor: fix build with Thumb only ARM
	archs
Message-ID: <20161115204658.14288-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some ARM architectures like ARNv7-M only supports Thumb instructions,
but the tremor build configuration enables ARM assembly code
unconditionally for all arm triplets by defining _ARM_ASSEM_.

We are overriding this by undefining this macro for ARM architectures
not supporting ARM instructions.

Fixes:
http://autobuild.buildroot.net/results/054/054f1c77b0e5d46b2dc53769469c0ed03e6b79ef/
http://autobuild.buildroot.net/results/ba1/ba1760b1428584f70e44dbffb8218ff3ee55e702/
http://autobuild.buildroot.net/results/2a6/2a687853cf0bc832fef29f88de0d85bd495fe87d/
http://autobuild.buildroot.net/results/cb6/cb6c560bf31834aadbe3d13a118b31ea8190159b/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/tremor/tremor.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index 97b0ce3..2a791b6 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -16,9 +16,17 @@ TREMOR_DEPENDENCIES = libogg
 
 # tremor has ARM assembly code that cannot be compiled in Thumb2 mode,
 # so we must force the traditional ARM mode.
+# However, some ARM architectures like ARNv7-M only supports Thumb
+# instructions, but the tremor build configuration enables ARM assembly
+# code unconditionally for all arm triplets by defining _ARM_ASSEM_.
+# We are overriding this by undefining this macro for the ARM
+# architectures not supporting ARM instructions.
 ifeq ($(BR2_arm),y)
-TREMOR_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) -marm"
+ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
+TREMOR_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -marm"
+else
+TREMOR_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -U_ARM_ASSEM_"
+endif
 endif
 
 $(eval $(autotools-package))
-- 
2.10.2
