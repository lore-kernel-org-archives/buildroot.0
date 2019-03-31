From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 Mar 2019 17:12:06 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] package/jq: add oniguruma optional dependency
In-Reply-To: <20190331151206.23277-1-fontaine.fabrice@gmail.com>
References: <20190331151206.23277-1-fontaine.fabrice@gmail.com>
Message-ID: <20190331151206.23277-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Don't enable oniguruma on host-jq

 package/jq/jq.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index aebe8c86e4..bf96f0cecb 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -17,8 +17,15 @@ JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99 -D_GNU_SOURCE"
 HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99 -D_GNU_SOURCE"
 
 # jq explicitly enables maintainer mode, which we don't need/want
-JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
+JQ_CONF_OPTS += --disable-maintainer-mode
 HOST_JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
 
+ifeq ($(BR2_PACKAGE_ONIGURUMA),y)
+JQ_DEPENDENCIES += oniguruma
+JQ_CONF_OPTS += --with-oniguruma
+else
+JQ_CONF_OPTS += --without-oniguruma
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.14.1
