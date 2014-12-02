From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  2 Dec 2014 17:15:01 +0100
Subject: [Buildroot] [PATCH] avahi: add optional dbus-python support
Message-ID: <1417536901-29177-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this, the python support doesn't do anything.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 4e5dbc6..e42f78d 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -71,7 +71,6 @@ AVAHI_CONF_OPTS = \
 		--disable-qt3 \
 		--disable-qt4 \
 		--disable-gdbm \
-		--disable-python-dbus \
 		--disable-pygtk \
 		--disable-mono \
 		--disable-monodoc \
@@ -144,6 +143,14 @@ else
 AVAHI_CONF_OPTS += --disable-python
 endif
 
+ifeq ($(BR2_PACKAGE_DBUS_PYTHON),y)
+AVAHI_CONF_OPTS += --enable-python-dbus
+AVAHI_CONF_ENV  += py_cv_mod_dbus_=yes
+AVAHI_DEPENDENCIES += dbus-python
+else
+AVAHI_CONF_OPTS += --disable-python-dbus
+endif
+
 AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
 
 define AVAHI_USERS
-- 
2.1.3
