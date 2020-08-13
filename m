From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 13 Aug 2020 16:23:51 -0700
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix building against
 gobject-introspection
Message-ID: <20200813232351.1552307-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Currently, if gobject-introspection is built before avahi, avahi will fail
to build with several undefined reference errors due to several .libs
directories not being in the PATH when linking the .gir file.

To resolve this issue, do the following if gobject-introspection is selected:
  - Add gobject-introspection to AVAHI_DEPENDENCIES
  - Add --enable-gobject to AVAHI_CONF_OPTS
  - Add the appropriate directories to GIR_EXTRA_LIBS_PATH.

Fixes:
http://autobuild.buildroot.net/results/b9bf7cea8be9231552a10e8ea828bf24394402ba
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/avahi/avahi.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 73db37545f..3e858083af 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -94,6 +94,13 @@ else
 AVAHI_CONF_OPTS += --disable-glib --disable-gobject
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+AVAHI_DEPENDENCIES += gobject-introspection
+AVAHI_CONF_OPTS += --enable-gobject
+AVAHI_MAKE_ENV += \
+	GIR_EXTRA_LIBS_PATH="$(@D)/avahi-gobject/.libs:$(@D)/avahi-common/.libs:$(@D)/avahi-client/.libs:$(@D)/avahi-glib/.libs"
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 AVAHI_CONF_ENV += \
 	am_cv_pathless_PYTHON=python \
-- 
2.26.2
