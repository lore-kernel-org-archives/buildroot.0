From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 20 Mar 2019 21:36:17 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] package/jq: add oniguruma optional dependency
In-Reply-To: <20190320203617.27496-1-fontaine.fabrice@gmail.com>
References: <20190320203617.27496-1-fontaine.fabrice@gmail.com>
Message-ID: <20190320203617.27496-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Always enable oniguruma on host-jq

 package/jq/jq.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index aebe8c86e4..d8cab80c9a 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -17,8 +17,18 @@ JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99 -D_GNU_SOURCE"
 HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99 -D_GNU_SOURCE"
 
 # jq explicitly enables maintainer mode, which we don't need/want
-JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
-HOST_JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
+JQ_CONF_OPTS += --disable-maintainer-mode
+HOST_JQ_CONF_OPTS += --disable-maintainer-mode
+
+HOST_JQ_CONF_OPTS += --with-oniguruma
+HOST_JQ_DEPENDENCIES += host-oniguruma
+
+ifeq ($(BR2_PACKAGE_ONIGURUMA),y)
+JQ_DEPENDENCIES += oniguruma
+JQ_CONF_OPTS += --with-oniguruma
+else
+JQ_CONF_OPTS += --without-oniguruma
+endif
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.14.1
