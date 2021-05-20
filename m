From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 May 2021 13:34:36 -0700
Subject: [Buildroot] [PATCH/Master: 1/1] package/mender: the dbus plugin
 requires libglib2
Message-ID: <20210520203436.1656860-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If libglib2 is not build before building the dbus plugin, mender fails to
compile with the following error:
Package 'gio-2.0', required by 'virtual:world', not found

 - Add a check for libglib2 in addition to dbus when enabling the dbus plugin.
 - Depend on libglib2 if both packages are selected.

Fixes:
http://autobuild.buildroot.org/results/1bc5893b88db08612059ad899c2bc3b2abb291fb

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender/mender.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index b4c5761151..a110caf551 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -87,7 +87,8 @@ else
 MENDER_TAGS += nolzma
 endif
 
-ifeq ($(BR2_PACKAGE_DBUS),y)
+ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yy)
+MENDER_DEPENDENCIES += libglib2
 define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
 	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
 		      $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
-- 
2.31.1
