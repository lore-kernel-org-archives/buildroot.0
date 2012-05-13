From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 May 2012 11:44:18 +0200
Subject: [Buildroot] [PATCH] heirloom-mailx: run makeconfig in configure step
Message-ID: <1336902259-31422-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The heirloom-mailx Makefile runs makeconfig if this has not been done
before.  In a parallel build, this means makeconfig may be run several
times in parallel because there are two targets that depend on makeconfig.
See for instance
http://autobuild.buildroot.net/results/d24854be69961f71db189f9d804d4bd2cfa078da

To avoid this, run makeconfig in the configure step, which is not parallel.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I couldn't actually reproduce the build failure, but the build log gives
a good indication that this is what went wrong.

 package/heirloom-mailx/heirloom-mailx.mk |    4 ++++
 1 file changed, 4 insertions(+)

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
-- 
tg: (9f7bf3b..) t/heirloom (depends on: master)
