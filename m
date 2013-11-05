From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Nov 2013 14:25:51 +0100
Subject: [Buildroot] [git commit] dropwatch: fix avr32 build failure
Message-ID: <20131105132710.F1327994C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da1ca5c0a24e12bff1157fbd9275b5150f2ab620
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On avr32, dropwatch needs libiberty to avoid build failures such as

  http://autobuild.buildroot.net/results/cd5/cd5e22fb5c9b0fc5d396bc85a5e253a1a65054da/

Also test built on ARM.

[Peter: pass TARGET_LDFLAGS as well, append -lintl in gettext case]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropwatch/dropwatch.mk |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 5d65d86..6bbcb23 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -13,13 +13,18 @@ DROPWATCH_LICENSE_FILES = COPYING
 
 # libbfd may be linked to libintl
 # Ugly... but LDFLAGS are hardcoded anyway
+#
+# Also: always need to add -liberty to hardcoded LDFLAGS for avr32
+DROPWATCH_LDFLAGS = \
+	$(TARGET_LDFLAGS) -lbfd -liberty -lreadline -lnl-3 -lnl-genl-3
+
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-DROPWATCH_LDFLAGS = LDFLAGS="-lintl -lbfd -lreadline -lnl-3 -lnl-genl-3"
+DROPWATCH_LDFLAGS += -lintl
 endif
 
 define DROPWATCH_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(DROPWATCH_LDFLAGS) build
+		LDFLAGS="$(DROPWATCH_LDFLAGS)" build
 endef
 
 define DROPWATCH_CLEAN_CMDS
