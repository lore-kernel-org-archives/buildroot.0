From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 15:06:30 +0200
Subject: [Buildroot] [git commit] xerces: enable threads if available
Message-ID: <20181009130524.642FC8E612@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cbafdd388f1d62844381ecdb97d52343f203323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Matt Weber &lt;<a href="mailto:matthew.weber@rockwellcollins.com" target="_blank">matthew.weber at rockwellcollins.com</a>&gt;<br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
