From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 16:21:00 +0200
Subject: [Buildroot] [git commit] core: distclean is a noconfig target
Message-ID: <20160917142106.B387180835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e76b4fd103cd18c374ea7aa1e7f2e76ab02c00ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the .config contains invalid configuration *(e.g. two providers for
a same virtual package), it is not possible to run "make distclean"
because the .config file is sourced and packages interpreted in this
case.

Add distclean to the noconfig list, so that we can run it in all cases.

However, this meand that DL_DIR is no longer set, and thus the default
download location never removed. We fix that by always removing the
download location, so that if it is the one configured we still remove
it (no change) and if it is not the one configured, we remove an
non-existing location and leave the user's location intact (no change
either).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index dfef021..92feff3 100644
--- a/Makefile
+++ b/Makefile
@@ -86,7 +86,7 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig
+	print-version olddefconfig distclean
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -905,13 +905,10 @@ clean:
 		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
 
 distclean: clean
-ifeq ($(DL_DIR),$(TOPDIR)/dl)
-	rm -rf $(DL_DIR)
-endif
 ifeq ($(O),output)
 	rm -rf $(O)
 endif
-	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
+	rm -rf $(TOPDIR)/dl $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
 		$(CONFIG_DIR)/.auto.deps $(BR2_EXTERNAL_FILE)
 
 help:
