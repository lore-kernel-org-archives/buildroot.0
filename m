From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 30 Jun 2017 07:48:34 +0300
Subject: [Buildroot] [PATCH] dropwatch: fix static link
Message-ID: <ac1c987b7db40c08775f3f8d61be85e33a411195.1498798114.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use LDLIBS for the list of libraries, since LDFLAGS appear before the source
files in the link command, and the upstream LDLIBS lacks -lncurses which is a
dependency of readline. We already pass target LDFLAGS in
TARGET_CONFIGURE_OPTS, so drop that part.

Fixes:
http://autobuild.buildroot.net/results/ce4/ce436bdd7e7950c801edac01f311b89110d87d62/
http://autobuild.buildroot.net/results/691/691d61d13849150c3616b1c74c964f50118ff1d9/
http://autobuild.buildroot.net/results/291/2918c75e473c5a2434e72f2e409becc5b4d07908/

Cc: Tzu-Jung Lee <roylee17@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dropwatch/dropwatch.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index bb91fd784737..e08a0c1357bf 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -11,18 +11,17 @@ DROPWATCH_LICENSE = GPL-2.0
 DROPWATCH_LICENSE_FILES = COPYING
 
 # libbfd may be linked to libintl
-# Ugly... but LDFLAGS are hardcoded anyway
-DROPWATCH_LDFLAGS = \
-	$(TARGET_LDFLAGS) -lbfd -lreadline -lnl-3 -lnl-genl-3 \
-		-lpthread -lncurses -lm
+# Ugly... but LDLIBS are hardcoded anyway
+DROPWATCH_LDLIBS = \
+	-lbfd -lreadline -lnl-3 -lnl-genl-3 -lpthread -lncurses -lm
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-DROPWATCH_LDFLAGS += -lintl
+DROPWATCH_LDLIBS += -lintl
 endif
 
 define DROPWATCH_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		LDFLAGS="$(DROPWATCH_LDFLAGS)" build
+		LDLIBS="$(DROPWATCH_LDLIBS)" build
 endef
 
 define DROPWATCH_INSTALL_TARGET_CMDS
-- 
2.11.0
