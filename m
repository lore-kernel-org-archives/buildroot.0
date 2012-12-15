From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 00:49:44 +0100
Subject: [Buildroot] [git commit] flashbench: unbreak build on microblaze
Message-ID: <20121215235440.9827C9A1DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d30e5e4fa462815fddefe40fb8f4cc611c71fd25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/498287519fbb588ed4ee9624ff82002a4766a5f4

The old 4.1.2 binary microblaze toolchain only provides LLONG_MAX when
used with the gnu99 dialect.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flashbench/flashbench.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index ead1346..faf8ae6 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -9,8 +9,16 @@ FLASHBENCH_SITE = git://git.linaro.org/people/arnd/flashbench.git
 FLASHBENCH_LICENSE = GPLv2
 FLASHBENCH_LICENSE_FILES = COPYING
 
+FLASHBENCH_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_microblaze),y)
+# microblaze toolchain only provides LLONG_MAX when used with gnu99 dialect
+FLASHBENCH_CFLAGS += -std=gnu99
+endif
+
 define FLASHBENCH_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(FLASHBENCH_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS) -lrt"
 endef
 
