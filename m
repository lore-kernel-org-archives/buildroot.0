From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Oct 2011 15:09:23 +0200
Subject: [Buildroot] [git commit] lighttpd: add lua support
Message-ID: <20111028131045.F31AC8F165@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92bf824b7d71ba735f40d3d43c116dea1cddde72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #4381

Signed-off-by: Danomi Mocelopolis <d_mo1234@yahoo.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    1 +
 package/lighttpd/Config.in   |    7 +++++++
 package/lighttpd/lighttpd.mk |    7 +++++++
 3 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9957d58..74ec64f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -69,6 +69,7 @@
 	#4171: makedevs-unused-but-set-variable.patch
 	#4183: Codesourcery toolchain download site has changed
 	#4231: libneon.so: undefined reference to `SSL_SESSION_cmp'
+	#4381: Add option to lighttpd to enable Lua support
 
 2011.08, Released August 31th, 2011:
 
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index a822d90..cb759ff 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -44,4 +44,11 @@ config BR2_PACKAGE_LIGHTTPD_WEBDAV
 	help
 	  Enable webdav support. Needed to support mod_webdav
 
+config BR2_PACKAGE_LIGHTTPD_LUA
+	bool "lua support"
+	depends on BR2_PACKAGE_LIGHTTPD
+	select BR2_PACKAGE_LUA
+	help
+	  Enable Lua support. Needed to support mod_magnet
+
 endif
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 10aa4c8..3f11be3 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -49,6 +49,13 @@ else
 LIGHTTPD_CONF_OPT += --without-webdav-props --without-webdav-locks
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
+LIGHTTPD_DEPENDENCIES += lua
+LIGHTTPD_CONF_OPT += --with-lua
+else
+LIGHTTPD_CONF_OPT += --without-lua
+endif
+
 define LIGHTTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/lighttpd
 	rm -f $(TARGET_DIR)/usr/sbin/lighttpd-angel
