From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 May 2017 22:01:45 +0200
Subject: [Buildroot] [PATCH] fxload: do not pass -g on Microblaze
Message-ID: <1494878505-27111-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc on Microblaze is affected by PR63261, which causes a build failure
when optimization *and* debugging symbols are enabled. As a
work-around, do not build fxload with debugging symbols.

Fixes:

  http://autobuild.buildroot.net/results/24640a042d84f45339246c0a18e10905494b2199/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
A possible alternate solution is to disable fxload on Microblaze
entirely. If you prefer this option, let me know, and I'll send a
different patch.
---
 package/fxload/fxload.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/fxload/fxload.mk b/package/fxload/fxload.mk
index 94b11d0..04adbad 100644
--- a/package/fxload/fxload.mk
+++ b/package/fxload/fxload.mk
@@ -9,8 +9,18 @@ FXLOAD_SITE = http://downloads.sourceforge.net/project/linux-hotplug/fxload/$(FX
 FXLOAD_LICENSE = GPL-2.0+
 FXLOAD_LICENSE_FILES = COPYING
 
+# Gcc on Microblaze is affected by PR63261, which causes a build
+# failure when -g is passed.
+ifeq ($(BR2_microblaze),y)
+FXLOAD_CFLAGS = $(filter-out $(TARGET_DEBUGGING),$(TARGET_CFLAGS))
+else
+FXLOAD_CFLAGS = $(TARGET_CFLAGS)
+endif
+
 define FXLOAD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(FXLOAD_CFLAGS)" \
+		-C $(@D) all
 endef
 
 define FXLOAD_INSTALL_TARGET_CMDS
-- 
2.7.4
