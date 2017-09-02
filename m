From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:13:52 +0200
Subject: [Buildroot] [git commit] wsapi-fcgi: new package
Message-ID: <20170902200654.6104B7FA57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=011a1add73ca1f0c65b48f8786fcdc46193cbd55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: add entry to DEVELOPERS file, add <pkg>_LICENSE = MIT]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/wsapi-fcgi/Config.in       | 11 +++++++++++
 package/wsapi-fcgi/wsapi-fcgi.hash |  2 ++
 package/wsapi-fcgi/wsapi-fcgi.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 91da321..cc9c1ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -618,6 +618,7 @@ F:	package/qemu/
 F:	package/sdl2_mixer/
 F:	package/sdl2_net/
 F:	package/tekui/
+F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
 F:	utils/scancpan
 
diff --git a/package/Config.in b/package/Config.in
index bb94ae8..66ce307 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -606,6 +606,7 @@ menu "Lua libraries/modules"
 	source "package/rings/Config.in"
 	source "package/turbolua/Config.in"
 	source "package/wsapi/Config.in"
+	source "package/wsapi-fcgi/Config.in"
 	source "package/wsapi-xavante/Config.in"
 	source "package/xavante/Config.in"
 endmenu
diff --git a/package/wsapi-fcgi/Config.in b/package/wsapi-fcgi/Config.in
new file mode 100644
index 0000000..6349038
--- /dev/null
+++ b/package/wsapi-fcgi/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_WSAPI_FCGI
+	bool "wsapi-fcgi"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBFCGI
+	# Runtime dependency only
+	select BR2_PACKAGE_WSAPI
+	help
+	  WSAPI is an API that abstracts the web server from Lua web
+	  applications. This is the rock that contains the FCGI module lfcgi.
+
+	  http://keplerproject.github.com/wsapi/
diff --git a/package/wsapi-fcgi/wsapi-fcgi.hash b/package/wsapi-fcgi/wsapi-fcgi.hash
new file mode 100644
index 0000000..f82ce9c
--- /dev/null
+++ b/package/wsapi-fcgi/wsapi-fcgi.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 73dc200889bc185953cd3a7c5350c998c090f901fcd10771273b7a63a3ffcdcf  wsapi-fcgi-1.6.1-1.src.rock
diff --git a/package/wsapi-fcgi/wsapi-fcgi.mk b/package/wsapi-fcgi/wsapi-fcgi.mk
new file mode 100644
index 0000000..fe4a424
--- /dev/null
+++ b/package/wsapi-fcgi/wsapi-fcgi.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# wsapi-fcgi
+#
+################################################################################
+
+WSAPI_FCGI_VERSION_MAJOR = 1.6.1
+WSAPI_FCGI_VERSION = $(WSAPI_FCGI_VERSION_MAJOR)-1
+WSAPI_FCGI_SUBDIR = wsapi-$(WSAPI_FCGI_VERSION_MAJOR)
+WSAPI_FCGI_DEPENDENCIES = libfcgi
+WSAPI_FCGI_LICENSE = MIT
+
+$(eval $(luarocks-package))
