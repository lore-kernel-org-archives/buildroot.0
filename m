From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Jan 2011 13:54:33 -0300
Subject: [Buildroot] [PATCH 03/10] libmad: install pkgconfig file
In-Reply-To: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1295369680-24816-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make libmad install mad.pc into staging and target.

Needed for mpd.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
index 0000000..d1b4801
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
+Libs: -L${libdir} -lmad -lm
+Cflags: -I${includedir}
-- 
1.7.3.4
