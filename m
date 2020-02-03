From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 11:24:26 +0100
Subject: [Buildroot] [git commit] package/olsr: needs -fPIC to avoid build
 failure
Message-ID: <20200203101435.A13D88869B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=812690fe7b7eeb1bf28b6ad4bae3d5f76b3bc050
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building on Arc, Microblaze, Riscv32, Riscv64, package olsr needs
to be compiled with -fPIC, so append -fPIC to CFLAGS when invoking make
by default, since it seems to be mandatory in general and it's harmless
for other architectures.

Fixes:
http://autobuild.buildroot.net/results/9d6/9d6d69133789aba16daeb6dc53721597e6be9806/
http://autobuild.buildroot.net/results/b85/b85d27b3a4bab5d68460401ff49e624177d55afa/
http://autobuild.buildroot.net/results/0d3/0d3489b14f4f4f0d4837d00209b5c1ee8d6f6a98/
http://autobuild.buildroot.net/results/d9a/d9a143c8e9a175741acfafd17b63544d04744ac9/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/olsr/olsr.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 31c601f80e..f930b3cacf 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -14,10 +14,17 @@ OLSR_LICENSE = BSD-3-Clause, LGPL-2.1+
 OLSR_LICENSE_FILES = license.txt lib/pud/nmealib/LICENSE
 OLSR_DEPENDENCIES = host-flex host-bison
 
+OLSR_CFLAGS = $(TARGET_CFLAGS)
+
+# it needs -fPIC to link on lot of architectures
+OLSR_CFLAGS += -fPIC
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
 
