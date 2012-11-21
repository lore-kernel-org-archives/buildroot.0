From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Nov 2012 11:07:35 +0100
Subject: [Buildroot] [git commit] busybox: fix link with tirpc
Message-ID: <20121121101539.7D1E1953ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e0f1e1fcfbaca2b33397b3076a55b23b0e02cd8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Busybox does partial linking of its modules before linking everything
together into the binary.  Those partial links are done without the
standard libraries, but that also means -ltirpc can't be found.  In
addition, this probably fails horribly with static linking (untested).

The problem is that the LDFLAGS are also used in the partial links.
So instead, use CFLAGS_busybox, which is only used for the busybox
link step.  Also make sure that this is passed through the environment,
not on the command line, so the busybox Makefile can still append to
it.

Fixes e.g.
http://autobuild.buildroot.net/results/e8351e3ba86fdcdb2999548658271a6fde0526a9

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 549e150..9154c08 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -27,12 +27,17 @@ BUSYBOX_LDFLAGS = \
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 BUSYBOX_DEPENDENCIES += libtirpc
 BUSYBOX_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
-BUSYBOX_LDFLAGS += -ltirpc
+# Don't use LDFLAGS for -ltirpc, because LDFLAGS is used for
+# the non-final link of modules as well.
+BUSYBOX_CFLAGS_busybox += -ltirpc
 endif
 
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
 # Allows the build system to tweak CFLAGS
-BUSYBOX_MAKE_ENV = $(TARGET_MAKE_ENV) CFLAGS="$(BUSYBOX_CFLAGS)"
+BUSYBOX_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	CFLAGS="$(BUSYBOX_CFLAGS)" \
+	CFLAGS_busybox="$(BUSYBOX_CFLAGS_busybox)"
 BUSYBOX_MAKE_OPTS = \
 	CC="$(TARGET_CC)" \
 	ARCH=$(KERNEL_ARCH) \
