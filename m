From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 23:27:08 +0200
Subject: [Buildroot] [git commit] package/hiredis: ssl needs threads
Message-ID: <20200905211900.0C5457F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36ea6e64a365cdba55f87dde77497374a16a4a7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ssl support which has been added in version 1.0.0 needs threads:

/home/buildroot/autobuild/instance-3/output-1/build/hiredis-1.0.0/ssl.c:42:10: fatal error: pthread.h: No such file or directory
 #include <pthread.h>
          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/80ac7500055d167e5ec9a964046de7cca4b4f9f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hiredis/hiredis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index f1f4c49dab..27a26661cf 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -12,7 +12,7 @@ HIREDIS_LICENSE_FILES = COPYING
 HIREDIS_INSTALL_STAGING = YES
 HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 HIREDIS_CONF_OPTS += -DENABLE_SSL=ON
 HIREDIS_DEPENDENCIES += openssl
 else
