From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Apr 2011 11:39:48 +0200
Subject: [Buildroot] [git commit] package: add bonnie++
Message-ID: <20110426094058.C2D1582A59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4bc799856b3ba9378b1d03dac7069d15500cbeeb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3379

A good filesystem performance benchmark program

Signed-off-by: Martin Hicks <mort@bork.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    3 ++-
 package/Config.in        |    1 +
 package/bonnie/Config.in |   10 ++++++++++
 package/bonnie/bonnie.mk |   18 ++++++++++++++++++
 4 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 package/bonnie/Config.in
 create mode 100644 package/bonnie/bonnie.mk

diff --git a/CHANGES b/CHANGES
index 19d2cc5..0b11898 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,10 +9,11 @@
 	quagga, readline, rsync, samba, squid, socat, squashfs, tslib,
 	webkit, xerces, xlib_xtrans, xorg-server, xterm, xz
 
-	New packages: can-utils, htop, libv4l
+	New packages: bonnie++, can-utils, htop, libv4l
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#3379: New Package: bonnie++
 	#3445: Not working openssl-10.0.0d on 386sx
 	#3451: fakeroot package: wrong FAKEROOT_SITE variable
 	#3457: alsamixergui: broken URL
diff --git a/package/Config.in b/package/Config.in
index 71dc0a8..b5a1ee4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -17,6 +17,7 @@ source "package/xz/Config.in"
 endmenu
 
 menu "Debugging, profiling and benchmark"
+source "package/bonnie/Config.in"
 source "package/dhrystone/Config.in"
 source "package/dmalloc/Config.in"
 source "package/kexec/Config.in"
diff --git a/package/bonnie/Config.in b/package/bonnie/Config.in
new file mode 100644
index 0000000..9dda4b6
--- /dev/null
+++ b/package/bonnie/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_BONNIE
+	bool "bonnie++"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Filesystem tester
+
+	  http://www.coker.com.au/bonnie++/
+
+comment "bonnie++ requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
new file mode 100644
index 0000000..9a6188f
--- /dev/null
+++ b/package/bonnie/bonnie.mk
@@ -0,0 +1,18 @@
+#
+# bonnie++
+#
+
+BONNIE_VERSION = 1.03e
+BONNIE_SOURCE = bonnie++-$(BONNIE_VERSION).tgz
+BONNIE_SITE = http://www.coker.com.au/bonnie++/
+
+define BONNIE_INSTALL_TARGET_CMDS
+	install -D -m 755 $(@D)/bonnie++ $(TARGET_DIR)/usr/sbin/bonnie++
+	install -D -m 755 $(@D)/zcav $(TARGET_DIR)/usr/sbin/zcav
+endef
+
+define BONNIE_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/bonnie++ $(TARGET_DIR)/usr/sbin/zcav
+endef
+
+$(eval $(call AUTOTARGETS,package,bonnie))
-- 
1.7.3.4
