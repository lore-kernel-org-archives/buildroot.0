From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jan 2021 23:09:33 +0100
Subject: [Buildroot] [git commit] package/lighttpd: bump to version 1.4.58
Message-ID: <20210104215338.8627C811AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cf80c53ae94b56aabb440e7d1bfa129417d0cb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the part concerning pdf is merged upstream

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../lighttpd/0001-Fix-default-config-file.patch    | 27 +++++-----------------
 package/lighttpd/Config.in                         |  2 +-
 package/lighttpd/lighttpd.hash                     |  6 ++---
 package/lighttpd/lighttpd.mk                       |  2 +-
 4 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/package/lighttpd/0001-Fix-default-config-file.patch b/package/lighttpd/0001-Fix-default-config-file.patch
index ada1589760..47a859770d 100644
--- a/package/lighttpd/0001-Fix-default-config-file.patch
+++ b/package/lighttpd/0001-Fix-default-config-file.patch
@@ -3,8 +3,6 @@ Modify the default lighttpd configuration file to have one a starting conf
   * Changed the log path to /var/log and logs filenames
   * Disable IPv6
   * Do not setuid to a user that doesn't exist on the system
-  * Disable pdf ranges fix for Adobe Reader since it uses regex and we
-    don't always have pcre support
   * Change the network backend to writev since linux-sendfile fails on buildroot
 
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
@@ -35,7 +33,7 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
 -var.server_root = "/srv/www"
 +var.log_root    = "/var/log"
 +var.server_root = "/var/www"
- var.state_dir   = "/var/run"
+ var.state_dir   = "/run"
  var.home_dir    = "/var/lib/lighttpd"
  var.conf_dir    = "/etc/lighttpd"
 @@ -90,7 +90,7 @@
@@ -56,9 +54,9 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
 +server.username  = "www-data"
 +server.groupname = "www-data"
  
- ## 
- ## enable core files.
-@@ -112,7 +112,7 @@
+ ##
+ ## Enable lighttpd to serve requests on sockets received from systemd
+@@ -118,7 +118,7 @@
  ##
  ## Document root
  ##
@@ -67,7 +65,7 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  
  ##
  ## The value for the "Server:" response field.
-@@ -138,7 +138,7 @@
+@@ -144,7 +144,7 @@
  ##
  ## Path to the error log file
  ##
@@ -76,7 +74,7 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  
  ##
  ## If you want to log to syslog you have to unset the 
-@@ -188,7 +188,7 @@
+@@ -195,7 +195,7 @@
  ## sendfile       - is recommended for small files.
  ## writev         - is recommended for sending many large files
  ##
@@ -85,16 +83,3 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  
  ##
  ## As lighttpd is a single-threaded server, its main resource limit is
-@@ -311,9 +311,9 @@
- ## disable range requests for pdf files
- ## workaround for a bug in the Acrobat Reader plugin.
- ##
--$HTTP["url"] =~ "\.pdf$" {
--  server.range-requests = "disable"
--}
-+# $HTTP["url"] =~ "\.pdf$" {
-+#  server.range-requests = "disable"
-+# }
- 
- ##
- ## url handling modules (rewrite, redirect)
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 7d75663629..e9a5aa34f0 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_LIGHTTPD
 	  webserver-software for every server that is suffering load
 	  problems.
 
-	  http://www.lighttpd.net/
+	  https://www.lighttpd.net/
 
 if BR2_PACKAGE_LIGHTTPD
 
diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 7f20bf9dce..0a7cdfe3bc 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.55.sha256sum
-sha256 6a0b50e9c9d5cc3d9e48592315c25a2d645858f863e1ccd120507a30ce21e927  lighttpd-1.4.55.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.58.sha256sum
+sha256  267feffda13a190ebdce7b15172d8be16da98008457f30fddecd72832d126d0e  lighttpd-1.4.58.tar.xz
 # Locally calculated
-sha256 5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
+sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 39600ef94b..df05227211 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).55
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).58
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
