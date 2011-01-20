From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jan 2011 09:57:56 +0100
Subject: [Buildroot] [git commit master 1/1] libmad: install pkgconfig file
Message-ID: <20110120085839.3D6718B531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7e21e098db7e36344d076018c82cef866510c599
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make libmad install mad.pc into staging and target.

Needed for mpd.

[Peter: remove -lm from mad.pc]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libmad/libmad.mk |   21 ++++++++++++++++-----
 package/multimedia/libmad/mad.pc    |   11 +++++++++++
 2 files changed, 27 insertions(+), 5 deletions(-)
 create mode 100644 package/multimedia/libmad/mad.pc

diff --git a/package/multimedia/libmad/libmad.mk b/package/multimedia/libmad/libmad.mk
index ae83725..d129aad 100644
--- a/package/multimedia/libmad/libmad.mk
+++ b/package/multimedia/libmad/libmad.mk
@@ -4,18 +4,29 @@
 #
 #############################################################
 
-LIBMAD_VERSION=0.15.1b
-LIBMAD_SOURCE=libmad-$(LIBMAD_VERSION).tar.gz
-LIBMAD_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad/
-LIBMAD_INSTALL_STAGING=YES
-LIBMAD_LIBTOOL_PATCH=NO
+LIBMAD_VERSION = 0.15.1b
+LIBMAD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad/
+LIBMAD_INSTALL_STAGING = YES
+LIBMAD_LIBTOOL_PATCH = NO
 
 define LIBMAD_PREVENT_AUTOMAKE
 	# Prevent automake from running.
 	(cd $(@D); touch -c config* aclocal.m4 Makefile*);
 endef
 
+define LIBMAD_INSTALL_STAGING_PC
+	$(INSTALL) -D package/multimedia/libmad/mad.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/mad.pc
+endef
+
+define LIBMAD_INSTALL_TARGET_PC
+	$(INSTALL) -D package/multimedia/libmad/mad.pc \
+		$(TARGET_DIR)/usr/lib/pkgconfig/mad.pc
+endef
+
 LIBMAD_POST_PATCH_HOOKS += LIBMAD_PREVENT_AUTOMAKE
+LIBMAD_POST_INSTALL_STAGING_HOOKS += LIBMAD_INSTALL_STAGING_PC
+LIBMAD_POST_INSTALL_TARGET_HOOKS += LIBMAD_INSTALL_TARGET_PC
 
 LIBMAD_CONF_OPT = \
 		--disable-debugging \
diff --git a/package/multimedia/libmad/mad.pc b/package/multimedia/libmad/mad.pc
new file mode 100644
index 0000000..14af388
--- /dev/null
+++ b/package/multimedia/libmad/mad.pc
@@ -0,0 +1,11 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: mad
+Description: MPEG Audio Decoder
+Requires:
+Version: 0.15.1b
+Libs: -L${libdir} -lmad
+Cflags: -I${includedir}
-- 
1.7.3.4
