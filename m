From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Oct 2018 22:13:08 +0200
Subject: [Buildroot] [PATCH 1/1] xerces: enable threads if available
Message-ID: <20181006201308.20461-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xerces/xerces.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index a25641fb45..da088d8e1c 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -10,9 +10,7 @@ XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
 XERCES_INSTALL_STAGING = YES
-XERCES_CONF_OPTS = \
-	--disable-threads \
-	--with-gnu-ld
+XERCES_CONF_OPTS = --with-gnu-ld
 
 define XERCES_DISABLE_SAMPLES
 	$(SED) 's/ samples//' $(@D)/Makefile.in
@@ -39,4 +37,10 @@ else
 XERCES_CONF_OPTS += --disable-network
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+XERCES_CONF_OPTS += --enable-threads
+else
+XERCES_CONF_OPTS += --disable-threads
+endif
+
 $(eval $(autotools-package))
-- 
2.17.1
