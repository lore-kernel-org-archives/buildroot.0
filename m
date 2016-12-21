From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 21 Dec 2016 17:01:34 +0100
Subject: [Buildroot] [PATCH] package/monit: security bump to version 5.20.0
Message-ID: <20161221160134.3858-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2016-7067.

Note that since version 5.20.0 monit optionally depends on zlib.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/monit/monit.hash | 4 ++--
 package/monit/monit.mk   | 9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 04f8790..8eb02fc 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,2 +1,2 @@
-# From https://mmonit.com/monit/dist/monit-5.17.tar.gz.sha256:
-sha256  2fbcdea79ae39228791a0aaa685ebbf650f2b58d086eaf77a33226e972cb216e  monit-5.17.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.20.0.tar.gz.sha256:
+sha256  ebac395ec50c1ae64d568db1260bc049d0e0e624c00e79d7b1b9a59c2679b98d  monit-5.20.0.tar.gz
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 1d5904b..f4899c3 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.17
+MONIT_VERSION = 5.20.0
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPLv3 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
@@ -27,4 +27,11 @@ else
 MONIT_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+MONIT_CONF_OPTS += --with-zlib
+MONIT_DEPENDENCIES += zlib
+else
+MONIT_CONF_OPTS += --without-zlib
+endif
+
 $(eval $(autotools-package))
-- 
2.10.2
