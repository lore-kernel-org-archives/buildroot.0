From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 16:54:01 +0100
Subject: [Buildroot] [git commit] sconeserver: fix depends
Message-ID: <20121228155606.BF7D59703D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bbd1204a69dcbdd86bb5a97fb20add667df5a81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sconeserver selects packages that have other depends that aren't taken
account of.
Fixes
http://autobuild.buildroot.net/results/6e858387cfcb3f8d7422a29855a6a3c770d70c0e
among probably others.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sconeserver/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index a7e5c75..0fc3a13 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -32,12 +32,16 @@ config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
 
 config BR2_PACKAGE_SCONESERVER_MYSQL
 	bool "mysql"
+	depends on BR2_USE_MMU # mysql
 	select BR2_PACKAGE_MYSQL_CLIENT
 	help
 	  MySQL module for Sconeserver
 
 config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	bool "bluetooth"
+	depends on BR2_USE_WCHAR # bluez->libglib2
+	depends on BR2_USE_MMU # bluez->dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez->dbus
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth module for Sconeserver
@@ -50,6 +54,8 @@ config BR2_PACKAGE_SCONESERVER_RSS
 
 config BR2_PACKAGE_SCONESERVER_LOCATION
 	bool "location"
+	depends on BR2_USE_MMU # gpsd
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gpsd
 	select BR2_PACKAGE_GPSD
 	help
 	  Location module for Sconeserver
