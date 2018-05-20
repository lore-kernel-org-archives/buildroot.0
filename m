From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 12:46:35 +0200
Subject: [Buildroot] [git commit] zmqpp: fix build with or1k and gcc < 6
Message-ID: <20180520104550.58070812EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ab59879c798b56fb0dc203a8d55df712709a34f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use CONFIG variable to disable optimizations when or1k and gcc < 6 are
detected otherwise set CONFIG to release or debug depending on
BR2_ENABLE_DEBUG

Fixes:
 - http://autobuild.buildroot.net/results/523e58eefba7ef23a09ef53160da22190ccbb098

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zmqpp/zmqpp.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index f576527463..e57f7de4ea 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -12,6 +12,15 @@ ZMQPP_LICENSE = MPL-2.0
 ZMQPP_LICENSE_FILES = LICENSE
 ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
 ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
+ZMQPP_CONFIG = $(if $(BR2_ENABLE_DEBUG),debug,release)
+
+# gcc bug internal compiler error: in merge_overlapping_regs, at
+# regrename.c:304. This bug is fixed since gcc 6.
+# By setting CONFIG to empty, all optimizations such as -funroll-loops
+# -ffast-math -finline-functions -fomit-frame-pointer are disabled
+ifeq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
+ZMQPP_CONFIG =
+endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 ZMQPP_LDFLAGS += -latomic
@@ -31,7 +40,7 @@ endif
 
 define ZMQPP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		LDFLAGS="$(ZMQPP_LDFLAGS)" \
+		CONFIG=$(ZMQPP_CONFIG) LDFLAGS="$(ZMQPP_LDFLAGS)" \
 		$(ZMQPP_MAKE_OPTS) $(if $(BR2_PACKAGE_ZMQPP_CLIENT),client,library) -C $(@D)
 endef
 
