From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Apr 2015 22:29:05 +0200
Subject: [Buildroot] [git commit] civetweb: rename lua option to match
	naming convention
Message-ID: <20150427203640.90BAF7FBE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efd49e3366164a992b76d5e42450dface6c90ffe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suboptions of package foo should be prefixed with BR2_PACKAGE_FOO, not just
BR2_FOO.

Also add Config.in.legacy handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy             |    9 +++++++++
 package/civetweb/Config.in   |    2 +-
 package/civetweb/civetweb.mk |    2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 90f474c..408b5f0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
+config BR2_CIVETWEB_WITH_LUA
+	bool "civetweb lua option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_CIVETWEB_WITH_LUA
+	help
+	  civetweb's lua option has been renamed to
+	  BR2_PACKAGE_CIVETWEB_WITH_LUA to be aligned with how other
+	  packages name options.
+
 config BR2_PACKAGE_TIFF_TIFF2PDF
 	bool "tiff utility-specific option removed"
 	select BR2_LEGACY
diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
index 6eed00d..d68a1ff 100644
--- a/package/civetweb/Config.in
+++ b/package/civetweb/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_CIVETWEB
 
 if BR2_PACKAGE_CIVETWEB
 
-config BR2_CIVETWEB_WITH_LUA
+config BR2_PACKAGE_CIVETWEB_WITH_LUA
 	bool "enable Lua support"
 	# required by the bundled Sqlite3 and Lua code
 	depends on !BR2_STATIC_LIBS
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index eee5cbf..496eef8 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -15,7 +15,7 @@ CIVETWEB_LIBS = -lpthread -lm
 CIVETWEB_SYSCONFDIR = /etc
 CIVETWEB_HTMLDIR = /var/www
 
-ifeq ($(BR2_CIVETWEB_WITH_LUA),y)
+ifeq ($(BR2_PACKAGE_CIVETWEB_WITH_LUA),y)
 CIVETWEB_CONF_OPTS += WITH_LUA=1
 CIVETWEB_LIBS += -ldl
 endif
