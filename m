From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Aug 2018 07:21:36 +0200
Subject: [Buildroot] [git commit] json-c: drop host-autoconf dependency
Message-ID: <20180829052145.EA199815F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98af0fa066fd0afedd94350027980b1988e5c670
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It turns out that the configure script attempts to run autoheader
because the configure.ac timestamp is slightly later than that of
config.h.in. Update the config.h.in timestamp after tarball extract to
avoid autoheader run. With that we can drop the host-autoconf
dependency.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-c/json-c.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index bee57577ce..2788fe563b 100644
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
