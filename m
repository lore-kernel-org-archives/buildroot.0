From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 15:04:07 +0200
Subject: [Buildroot] [git commit] libaio: work-around for PowerPC issue
Message-ID: <20160811130418.CEDAC81EB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce6536ae500fc4ac0c201d5cb4edf39dd1b4d386
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both the blktrace and gadgetfs-test packages were failing to build on
PowerPC due to the mysterious:

  hidden symbol `_rest32gpr_30_x' in libgcc.a(e500crtresx32gpr.o) is referenced by DSO

Due to this error, we disabled blktrace on PowerPC in commit
0d8158fc619ce849b531d07b27da4ba9748d4ea4. However, gadgetfs-test
continued to fail with the same error. As Romain Naour pointed out, the
problem seems in fact to come from a common dependency of blktrace and
gadgetfs-test: libaio. As Romain investigated, the problem started
appearing after the last bump of libaio, from version 0.3.109 to
0.3.110.

A quick bisect through the libaio changes between 0.3.109 and 0.3.110
has revealed that the problematic change is one in the libaio build
system, which now obeys to the CFLAGS provided in the environment,
rather than overriding them. So the CFLAGS provided by Buildroot cause
this problem. It turns out that the problematic CFLAGS is -Os, which is
indeed known to cause issues on PowerPC in some corner cases.

Even though it would probably be a better long-term solution to switch
to -O2 by default, and mark -Os as not available on PowerPC, it is a too
radical change so close to 2016.08. So we simply adjust the libaio
package so that it uses -O2 instead of -Os.

Fixes:

  http://autobuild.buildroot.net/results/5e6cc4c432ce6c964ac285026978ad14d9eae97c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libaio/libaio.mk | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 9b28f05..0854fc5 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -11,16 +11,24 @@ LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPLv2.1+
 LIBAIO_LICENSE_FILES = COPYING
 
+LIBAIO_CONFIGURE_OPTS = $(TARGET_CONFIGURE_OPTS)
+
+# On PowerPC, a weird toolchain issue causes -Os builds to produce
+# references to hidden symbols, so we're forcing -O2
+ifeq ($(BR2_powerpc),y)
+LIBAIO_CONFIGURE_OPTS += CFLAGS="$(subst -Os,-O2,$(TARGET_CFLAGS))"
+endif
+
 define LIBAIO_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(LIBAIO_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define LIBAIO_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(LIBAIO_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define LIBAIO_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(LIBAIO_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
