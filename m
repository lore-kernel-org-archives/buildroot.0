From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 16:57:44 +0200
Subject: [Buildroot] [git commit] package/flashbench: remove old toolchain
 microblaze & sh2a workaround
Message-ID: <20190620145658.EC66B82611@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc7fa8491c633a112709a038ba44cd9999be33b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old binary Microblaze and Sh2a toolchains were affected by Glibc
Bug 1228: https://sourceware.org/bugzilla/show_bug.cgi?id=1228 that
has been fixed in 2005, so let's remove actual work around:
'FLASHBENCH_CFLAGS += -std=gnu99' for both BR2_microblaze and BR2_sh2a
and remove local FLASHBENCH_CFLAGS in favour of TARGET_CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashbench/flashbench.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index cbcf9ea2d1..e89a250aa3 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -9,16 +9,9 @@ FLASHBENCH_SITE = git://git.linaro.org/people/arnd/flashbench.git
 FLASHBENCH_LICENSE = GPL-2.0
 FLASHBENCH_LICENSE_FILES = COPYING
 
-FLASHBENCH_CFLAGS = $(TARGET_CFLAGS)
-
-ifeq ($(BR2_microblaze)$(BR2_sh2a),y)
-# microblaze and sh2a toolchains only provide LLONG_MAX when used with gnu99 dialect
-FLASHBENCH_CFLAGS += -std=gnu99
-endif
-
 define FLASHBENCH_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(FLASHBENCH_CFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS) -lrt"
 endef
 
