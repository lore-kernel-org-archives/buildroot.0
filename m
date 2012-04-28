From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 28 Apr 2012 23:16:20 +0200
Subject: [Buildroot] [PATCH 2/3] avahi: use CONF_ENABLE and CONF_PKG_ENABLE
In-Reply-To: <1335647781-16536-1-git-send-email-arnout@mind.be>
References: <1335647781-16536-1-git-send-email-arnout@mind.be>
Message-ID: <1335647781-16536-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/avahi/avahi.mk |   34 +++++-----------------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 32e3df7..64a83db 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -91,31 +91,12 @@ else
 AVAHI_CONF_OPT += --disable-libdaemon
 endif
 
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
-AVAHI_DEPENDENCIES += expat
-AVAHI_CONF_OPT += --with-xml=expat
-else
-AVAHI_CONF_OPT += --with-xml=none
-endif
-
-ifeq ($(BR2_PACKAGE_DBUS),y)
-AVAHI_DEPENDENCIES += dbus
-else
-AVAHI_CONF_OPT += --disable-dbus
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-AVAHI_DEPENDENCIES += libglib2
-else
-AVAHI_CONF_OPT += --disable-glib --disable-gobject
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGLADE),y)
-AVAHI_DEPENDENCIES += libglade
-else
-AVAHI_CONF_OPT += --disable-gtk
-endif
+$(eval $(call CONF_ENABLE,AVAHI,$(BR2_PACKAGE_AVAHI_DAEMON),expat,--with-xml=expat,--with-xml=none))
+$(eval $(call CONF_PKG_ENABLE,AVAHI,dbus))
+$(eval $(call CONF_PKG_ENABLE,AVAHI,libglib2,--enable-glib --enable-gobject,--disable-glib --disable-gobject))
+$(eval $(call CONF_PKG_ENABLE,AVAHI,libglade,gtk))
 
+$(eval $(call CONF_PKG_ENABLE,AVAHI,python))
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 AVAHI_CONF_ENV += am_cv_pathless_PYTHON=python \
 		am_cv_path_PYTHON=$(PYTHON_TARGET_BINARY) \
@@ -124,11 +105,6 @@ AVAHI_CONF_ENV += am_cv_pathless_PYTHON=python \
 		am_cv_python_pythondir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
 		am_cv_python_pyexecdir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
 		py_cv_mod_socket_=yes
-
-AVAHI_DEPENDENCIES += python
-AVAHI_CONF_OPT += --enable-python
-else
-AVAHI_CONF_OPT += --disable-python
 endif
 
 ifeq ($(BR2_PACKAGE_LIBINTL),y)
-- 
1.7.10
