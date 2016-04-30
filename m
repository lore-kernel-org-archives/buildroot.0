From: Ubaldo Porcheddu <ubaldo@eja.it>
Date: Sat, 30 Apr 2016 21:41:21 +0000
Subject: [Buildroot] [PATCH 1/1] eja: new package
Message-ID: <1462052481-9005-1-git-send-email-ubaldo@eja.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

as the new version is approaching I would like to add "eja" which is a
forking and extensible micro web server based on Lua 5.2 with embedded
support for sockets, fork and dirent.  There are several years of
development and it is at the moment on production on small devices based on
Buildroot like the Rpi, Android based STB and Debian/Ubuntu servers.

The source code is available at https://github.com/ubaldus/eja, a Buildroot
based version is also available at https://github.com/ubaldus/box and
precompiled binaries and images are availables at http://get.eja.it .

Any feedback is of course welcome :)


Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>
---
 package/Config.in     |  1 +
 package/eja/Config.in |  4 ++++
 package/eja/eja.mk    | 14 ++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/eja/Config.in
 create mode 100644 package/eja/eja.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..29eafb1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -476,6 +476,7 @@ endif
 endmenu
 
 menu "Interpreter languages and scripting"
+	source "package/eja/Config.in"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
 if BR2_PACKAGE_ERLANG
diff --git a/package/eja/Config.in b/package/eja/Config.in
new file mode 100644
index 0000000..5833a78
--- /dev/null
+++ b/package/eja/Config.in
@@ -0,0 +1,4 @@
+    config BR2_PACKAGE_EJA
+    bool "eja"
+    help
+            eja micro web server
diff --git a/package/eja/eja.mk b/package/eja/eja.mk
new file mode 100644
index 0000000..8e170f6
--- /dev/null
+++ b/package/eja/eja.mk
@@ -0,0 +1,14 @@
+EJA_VERSION:= 9.4.22
+EJA_SOURCE:= $(EJA_VERSION).tar.gz
+EJA_SITE:= https://github.com/ubaldus/eja/archive
+EJA_INSTALL_TARGET:=YES
+
+define EJA_BUILD_CMDS
+        $(MAKE) CC="$(TARGET_CC)" -C $(@D) static
+endef
+
+define EJA_INSTALL_TARGET_CMDS
+        $(INSTALL) -D -m 0755 $(@D)/eja $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
