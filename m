From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 24 Apr 2020 10:31:59 +0200
Subject: [Buildroot] [PATCH] package/apache: fixing apxs path mangling
Message-ID: <1587717119-16710-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Latest version of Apache introduce a new apxs with a slightly modified
path handling logic. In order to simplify the crosscompilation, the
software removes the common prefix from bin install dir and build
install dir, but for this to work they both should have a common
prefix. So we introduce a new regexp to fix /usr/bin to staging dir,
the regexps are also fixed to replace only the exact path between
double quotes.a

Fixes:
http://autobuild.buildroot.net/results/c41f31566974209897a3a1ec35afe2536fb248cc
http://autobuild.buildroot.net/results/b93f19976ce96e79ea159c25ed74a7377c78f334

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/apache/apache.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 48a64ea..f0775e6 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -99,7 +99,8 @@ APACHE_CONF_OPTS += --disable-deflate
 endif
 
 define APACHE_FIX_STAGING_APACHE_CONFIG
-	$(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%' $(STAGING_DIR)/usr/bin/apxs
+	$(SED) 's%"/usr/bin"%"$(STAGING_DIR)/usr/bin"%' $(STAGING_DIR)/usr/bin/apxs
+	$(SED) 's%"/usr/build"%"$(STAGING_DIR)/usr/build"%' $(STAGING_DIR)/usr/bin/apxs
 	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' $(STAGING_DIR)/usr/build/config_vars.mk
 endef
 APACHE_POST_INSTALL_STAGING_HOOKS += APACHE_FIX_STAGING_APACHE_CONFIG
-- 
2.7.4
