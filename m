From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  5 Feb 2016 23:43:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/pound: new package
Message-ID: <1454712192-26144-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makefile needs to be fixed to avoid an error during install:

/usr/bin/install: cannot change ownership of
 '/home/bernd/buildroot/buildroot/output/target/usr/sbin/pound':
 Operation not permitted
Makefile:60: recipe for target 'install' failed

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in        |  1 +
 package/pound/Config.in  | 18 ++++++++++++++++++
 package/pound/pound.hash |  2 ++
 package/pound/pound.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/pound/Config.in
 create mode 100644 package/pound/pound.hash
 create mode 100644 package/pound/pound.mk

diff --git a/package/Config.in b/package/Config.in
index 2da3a83..2a231ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1425,6 +1425,7 @@ endif
 	source "package/p910nd/Config.in"
 	source "package/phidgetwebservice/Config.in"
 	source "package/portmap/Config.in"
+	source "package/pound/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
 	source "package/proftpd/Config.in"
diff --git a/package/pound/Config.in b/package/pound/Config.in
new file mode 100644
index 0000000..91c29ea
--- /dev/null
+++ b/package/pound/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_POUND
+	bool "pound"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_OPENSSL
+	help
+	  The Pound program is a reverse proxy, load balancer and HTTPS
+	  front-end for Web server(s). Pound was developed to enable
+	  distributing the load among several Web-servers and to allow
+	  for a convenient SSL wrapper for those Web servers that do not
+	  offer it natively.
+
+	  http://www.apsis.ch/pound
+
+comment "pound needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
diff --git a/package/pound/pound.hash b/package/pound/pound.hash
new file mode 100644
index 0000000..6908b90
--- /dev/null
+++ b/package/pound/pound.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	cdfbf5a7e8dc8fbbe0d6c1e83cd3bd3f2472160aac65684bb01ef661c626a8e4	Pound-2.7.tgz
diff --git a/package/pound/pound.mk b/package/pound/pound.mk
new file mode 100644
index 0000000..46f8244
--- /dev/null
+++ b/package/pound/pound.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# pound
+#
+################################################################################
+
+POUND_VERSION = 2.7
+POUND_SITE = http://www.apsis.ch/pound
+POUND_SOURCE = Pound-$(POUND_VERSION).tgz
+POUND_LICENSE = GPLv3+
+POUND_LICENSE_FILES = GPL.txt
+POUND_DEPENDENCIES = openssl
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+POUND_DEPENDENCIES += pcre
+endif
+
+# Do not set user/group for the installed binaries.
+define POUND_FIX_INSTALL
+	$(SED) 's/-o proxy -g proxy//g' $(@D)/Makefile
+endef
+POUND_POST_CONFIGURE_HOOKS += POUND_FIX_INSTALL
+
+$(eval $(autotools-package))
-- 
2.7.0
