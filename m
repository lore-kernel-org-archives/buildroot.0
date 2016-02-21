From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 23:00:16 +0100
Subject: [Buildroot] [git commit] package/pound: new package
Message-ID: <20160302202755.E440D7FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a3b3a8ba5ef719d4aaee84b6d7ed9bb07663804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: pass --with-owner/--with-group instead of SEDing the
Makefile.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |  1 +
 package/pound/Config.in  | 18 ++++++++++++++++++
 package/pound/pound.hash |  2 ++
 package/pound/pound.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c0b3b17..23fd62c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1448,6 +1448,7 @@ endif
 	source "package/p910nd/Config.in"
 	source "package/phidgetwebservice/Config.in"
 	source "package/portmap/Config.in"
+	source "package/pound/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
 	source "package/privoxy/Config.in"
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
index 0000000..4086642
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
+# Force owner/group to us, otherwise it will try proxy:proxy by
+# default.
+POUND_CONF_OPTS = \
+	--with-owner=$(shell id -un) \
+	--with-group=$(shell id -gn)
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+POUND_DEPENDENCIES += pcre
+endif
+
+$(eval $(autotools-package))
