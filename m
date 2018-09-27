From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Thu, 27 Sep 2018 22:21:01 +0000
Subject: [Buildroot] [PATCH v2 1/1] bird: new package
In-Reply-To: <20180927204116.29484-1-adrien@gallouet.fr>
References: <20180927204116.29484-1-adrien@gallouet.fr>
Message-ID: <20180927222100.6564-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BIRD project aims to develop a dynamic IP routing daemon with full support
of all modern routing protocols, easy to use configuration interface and
powerful route filtering language

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
Changes v1 -> v2 (after Baruch Siach review)
- Add a comment for the use of autoreconf
- Use github helper

diff --git a/DEVELOPERS b/DEVELOPERS
index 0335aef3b1..a256067004 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -72,6 +72,7 @@ F:	package/woff2/
 
 N:	Adrien Gallou?t <adrien@gallouet.fr>
 F:	package/glorytun/
+F:	package/bird/
 
 N:	Aleksander Morgado <aleksander@aleksander.es>
 F:	package/libmbim/
diff --git a/package/Config.in b/package/Config.in
index 52f11c407a..73bb209c66 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1743,6 +1743,7 @@ menu "Networking applications"
 	source "package/batctl/Config.in"
 	source "package/bcusdk/Config.in"
 	source "package/bind/Config.in"
+	source "package/bird/Config.in"
 	source "package/bluez-tools/Config.in"
 	source "package/bluez_utils/Config.in"
 	source "package/bluez5_utils/Config.in"
diff --git a/package/bird/Config.in b/package/bird/Config.in
new file mode 100644
index 0000000000..6e4e43505a
--- /dev/null
+++ b/package/bird/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_BIRD
+	bool "bird"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	help
+	  BIRD Internet Routing Daemon
+
+	  The BIRD project aims to develop a dynamic IP routing daemon with full support
+	  of all modern routing protocols, easy to use configuration interface and
+	  powerful route filtering language
+
+	  http://bird.network.cz/
diff --git a/package/bird/bird.hash b/package/bird/bird.hash
new file mode 100644
index 0000000000..449e8afd8d
--- /dev/null
+++ b/package/bird/bird.hash
@@ -0,0 +1,2 @@
+sha256 bd42d48fbcc2c0046d544f1183cd98193ff15b792d332ff45f386b0180b09335  bird-v2.0.2.tar.gz
+sha256 f018596a97af0108efc446320631e2fddc0c1d1f3ffab3129327ccdb4f0c29ed  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
new file mode 100644
index 0000000000..f45baadab2
--- /dev/null
+++ b/package/bird/bird.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# bird
+#
+################################################################################
+
+BIRD_VERSION = v2.0.2
+BIRD_SITE = $(call github,BIRD,bird,$(BIRD_VERSION))
+BIRD_LICENSE = GPL-2.0+
+BIRD_LICENSE_FILES = README
+
+# autoreconf is needed since the package is fetched from github
+BIRD_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.19.0
