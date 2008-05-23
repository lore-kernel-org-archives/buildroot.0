From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Fri, 23 May 2008 06:40:56 -0700 (PDT)
Subject: [Buildroot] [PATCH]: ATK may not need X support (i.e directfb only)
Message-ID: <17425855.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


support building ATK without X support:

Dan Laird

--- buildroot/package/atk/atk.mk
+++ buildroot.new/package/atk/atk.mk 
@@ -42,6 +42,14 @@
 		gl_cv_c_restrict=no ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
 		ac_cv_prog_F77=no ac_cv_prog_CXX=no 
 
+ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+        ATK_CONF_OPT_X = --with-x \
+		--x-includes=$(STAGING_DIR)/usr/include/X11 \
+		--x-libraries=$(STAGING_DIR)/usr/lib --disable-glibtest
+else
+        ATK_CONF_OPT_X = --without-x 
+endif
+
 ATK_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(REAL_GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) --prefix=/usr \
 		--exec-prefix=/usr --bindir=/usr/bin \
@@ -50,9 +58,7 @@
 		--datadir=/usr/share --localstatedir=/var \
 		--includedir=/usr/include --mandir=/usr/man \
 		--infodir=/usr/info --enable-shared \
-		--enable-static --with-x \
-		--x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib \
+		--enable-static $(ATK_CONF_OPT_X) \
 		--disable-glibtest --enable-explicit-deps=no \
 		--disable-debug 
 

-- 
View this message in context: http://www.nabble.com/-PATCH-%3A-ATK-may-not-need-X-support-%28i.e-directfb-only%29-tp17425855p17425855.html
Sent from the BuildRoot mailing list archive at Nabble.com.
