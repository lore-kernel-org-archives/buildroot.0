From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 May 2014 11:27:23 +0200
Subject: [Buildroot] [git commit] dvb-apps: fix static linking with libiconv
Message-ID: <20140527092821.C4DF59CDD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b7719f9642fed0de5052b05eff28ec00be67caa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/4b5/4b56b89dd0ccd3b7e4017782e8d48b9c71207ff7/

Pass the libraries to be linked in LDLIBS instead of LDFLAGS so the end up
after the object files on the linker command line.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dvb-apps/dvb-apps.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 2a35d29..98ff7eb 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -10,17 +10,15 @@ DVB_APPS_SITE_METHOD = hg
 DVB_APPS_LICENSE = GPLv2 GPLv2+ LGPLv2.1+
 DVB_APPS_LICENSE_FILES = COPYING COPYING.LGPL
 
-DVB_APPS_LDFLAGS = $(TARGET_LDFLAGS)
-
 ifeq ($(BR2_ENABLE_LOCALE),)
 DVB_APPS_DEPENDENCIES = libiconv
-DVB_APPS_LDFLAGS += -liconv
+DVB_APPS_LDLIBS += -liconv
 endif
 
 DVB_APPS_INSTALL_STAGING = YES
 
 define DVB_APPS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(DVB_APPS_LDFLAGS)" \
+	$(TARGET_CONFIGURE_OPTS) LDLIBS="$(DVB_APPS_LDLIBS)" \
 		$(MAKE) -C $(@D) CROSS_ROOT=$(STAGING_DIR) V=1
 endef
 
