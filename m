From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 May 2012 21:19:10 +0200
Subject: [Buildroot] [git commit] heirloom-mailx: run makeconfig in
	configure step
Message-ID: <20120514192114.CCDD096CE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89726baea94bc72fe624cd5ef85b07171db0a7ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The heirloom-mailx Makefile runs makeconfig if this has not been done
before.  In a parallel build, this means makeconfig may be run several
times in parallel because there are two targets that depend on makeconfig.
See for instance
http://autobuild.buildroot.net/results/d24854be69961f71db189f9d804d4bd2cfa078da

To avoid this, run makeconfig in the configure step, which is not parallel.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/heirloom-mailx/heirloom-mailx.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index 2b28a3f..b1779c0 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -12,6 +12,10 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 HEIRLOOM_MAILX_DEPENDENCIES += openssl
 endif
 
+define HEIRLOOM_MAILX_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SHELL) ./makeconfig)
+endef
+
 define HEIRLOOM_MAILX_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
