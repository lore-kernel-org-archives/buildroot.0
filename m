From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Feb 2011 14:17:34 +0100
Subject: [Buildroot] [git commit master 1/1] olsr: fix build
Message-ID: <20110218132038.06A318F5DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a1c787ea6a7428fdfe88fd6c2333f35da5cec44d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass TARGET_CONFIGURE_OPTS in the environment rather than as make arguments,
so the olsr build system can append to CFLAGS / LDFLAGS - Otherwise build
fails when the wrong linker flags are used to create the plugin .so's.

Also pass ARCH, so the olsr build system choses the right libdir / PIC
settings for the target, rather than for the host.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/olsr/olsr.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 75d5d66..03a8a02 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -16,7 +16,7 @@ OLSR_PLUGINS=dot_draw dyn_gw secure
 OLSR_TARGET_PLUGIN=usr/lib/
 
 define OLSR_BUILD_CMDS
- $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) olsrd $(OLSR_PLUGINS)
+ $(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd $(OLSR_PLUGINS)
 endef
 
 define OLSR_INSTALL_TARGET_CMDS
-- 
1.7.3.4
