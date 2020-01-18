From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 18 Jan 2020 23:20:34 +0100
Subject: [Buildroot] [PATCH] package/olsr: needs -fPIC on Microblaze
Message-ID: <20200118222034.48072-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building on Microblaze package olsr needs to be compiled with
-fPIC, so append -fPIC to CFLAGS when invoking make.

Fixes:
http://autobuild.buildroot.net/results/9d6/9d6d69133789aba16daeb6dc53721597e6be9806/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/olsr/olsr.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 53bf874af0..ab4d5f1a76 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -16,10 +16,19 @@ OLSR_LICENSE = BSD-3-Clause, LGPL-2.1+
 OLSR_LICENSE_FILES = license.txt lib/pud/nmealib/LICENSE
 OLSR_DEPENDENCIES = host-flex host-bison
 
+OLSR_CFLAGS = $(TARGET_CFLAGS)
+
+# microblaze needs -fPIC to link
+ifeq ($(BR2_microblaze),y)
+OLSR_CFLAGS += -fPIC
+endif
+
 define OLSR_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) \
+		CFLAGS="$(OLSR_CFLAGS)" -C $(@D) olsrd
 	$(foreach p,$(OLSR_PLUGINS), \
-		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D)/lib/$(p)
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) \
+			CFLAGS="$(OLSR_CFLAGS)" -C $(@D)/lib/$(p)
 	)
 endef
 
-- 
2.20.1
