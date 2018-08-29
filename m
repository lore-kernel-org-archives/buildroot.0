From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 29 Aug 2018 07:07:09 +0300
Subject: [Buildroot] [PATCH] json-c: drop host-autoconf dependency
Message-ID: <2bff97fa66f9975195481b9b11f1a0688a855d8e.1535515629.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It turns out that the configure script attempts to run autoheader
because the configure.ac timestamp is slightly later than that of
config.h.in. Update the config.h.in timestamp after tarball extract to
avoid autoheader run. With that we can drop the host-autoconf
dependency.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/json-c/json-c.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index bee57577ceec..2788fe563bd5 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -10,9 +10,13 @@ JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 
-# configure requires autoheader
-JSON_C_DEPENDENCIES = host-autoconf
-HOST_JSON_C_DEPENDENCIES = host-autoconf
+# update config.h.in timestamp to avoid autoheader run
+define JSON_C_UPDATE_CONFIG_TIMESTAMP
+	touch $(@D)/config.h.in
+endef
+
+JSON_C_POST_EXTRACT_HOOKS += JSON_C_UPDATE_CONFIG_TIMESTAMP
+HOST_JSON_C_POST_EXTRACT_HOOKS += JSON_C_UPDATE_CONFIG_TIMESTAMP
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.18.0
