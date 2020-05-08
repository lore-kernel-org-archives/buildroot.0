From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 11:41:46 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/apache: fixing
 apxs path mangling
Message-ID: <20200508093729.B977391052@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9580c835b9cb36ef3264ebee82fca2c6fe4ce60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Latest version of Apache introduce a new apxs with a slightly modified
path handling logic. In order to simplify the crosscompilation, the
software removes the common prefix from bin install dir and build
install dir, but for this to work they both should have a common prefix.

So we introduce a new regexp to fix /usr/bin to staging dir, the regexps
are also fixed to replace only the exact path between double quotes, to
avoid replacing the she-bang line.

Fixes:
http://autobuild.buildroot.net/results/c41f31566974209897a3a1ec35afe2536fb248cc
http://autobuild.buildroot.net/results/b93f19976ce96e79ea159c25ed74a7377c78f334

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr:
  - add the last few words about the she-bang blurb
  - do not use quotes in the existing /sur/bin regexp
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit aa04edab77c75bc04ffb52755430bcdeb19c6d74)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 48a64eae0e..068f36e325 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -99,6 +99,7 @@ APACHE_CONF_OPTS += --disable-deflate
 endif
 
 define APACHE_FIX_STAGING_APACHE_CONFIG
+	$(SED) 's%"/usr/bin"%"$(STAGING_DIR)/usr/bin"%' $(STAGING_DIR)/usr/bin/apxs
 	$(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%' $(STAGING_DIR)/usr/bin/apxs
 	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' $(STAGING_DIR)/usr/build/config_vars.mk
 endef
