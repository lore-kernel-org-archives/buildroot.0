From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 14:46:45 +0200
Subject: [Buildroot] [git commit] bird: new package
Message-ID: <20181009124615.4FE9C8E5FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3f296a53ec739c81417238baf1b8060e89bc513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BIRD project aims to develop a dynamic IP routing daemon with full
support of all modern routing protocols, easy to use configuration
interface and powerful route filtering language

Signed-off-by: Adrien Gallou??t <adrien@gallouet.fr>
[Thomas:
 - Do not make ncurses/readline mandatory dependencies, since they are
   not. They are only needed when building the BIRD client. Added a
   Config.in sub-option to enable/disable the client. As part of this,
   added ncurses/readline to <pkg>_DEPENDENCIES.
 - Add a patch to fix the installation when the BIRD client is
   disabled, the patch has been submitted upstream.
 - Added host-flex and host-bison to <pkg>_DEPENDENCIES since
   flex/bison are used during the build process.
 - Add BR2_USE_MMU dependency, the code uses fork()
 - Fix alphabetic ordering in DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...e.in-fix-installation-with-disable-client.patch | 41 ++++++++++++++++++++++
 package/bird/Config.in                             | 23 ++++++++++++
 package/bird/bird.hash                             |  2 ++
 package/bird/bird.mk                               | 22 ++++++++++++
 6 files changed, 90 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b4294e2c48..b54d3a9bc2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -71,6 +71,7 @@ F:	package/webkitgtk/
 F:	package/woff2/
 
 N:	Adrien Gallou??t <adrien@gallouet.fr>
+F:	package/bird/
 F:	package/glorytun/
 
 N:	Aleksander Morgado <aleksander@aleksander.es>
diff --git a/package/Config.in b/package/Config.in
index 1f3c7e7f4e..700afea688 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1761,6 +1761,7 @@ menu "Networking applications"
 	source "package/batctl/Config.in"
 	source "package/bcusdk/Config.in"
 	source "package/bind/Config.in"
+	source "package/bird/Config.in"
 	source "package/bluez-tools/Config.in"
 	source "package/bluez_utils/Config.in"
 	source "package/bluez5_utils/Config.in"
diff --git a/package/bird/0001-Makefile.in-fix-installation-with-disable-client.patch b/package/bird/0001-Makefile.in-fix-installation-with-disable-client.patch
new file mode 100644
index 0000000000..c0faec21b0
--- /dev/null
+++ b/package/bird/0001-Makefile.in-fix-installation-with-disable-client.patch
@@ -0,0 +1,41 @@
+From 6cb15abfc00cb5e492175a9efc71bfdfd1aa457c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 9 Oct 2018 12:51:08 +0200
+Subject: [PATCH] Makefile.in: fix installation with --disable-client
+
+The configure.ac script initializes the CLIENT variable this way:
+
+CLIENT=birdcl
+if client enabled
+ CLIENT=$CLIENT birdc
+fi
+
+This means that checking if @CLIENT@ is empty to decide whether birdc
+should be installed or not doesn't work, and causes a failure at
+installation time when --disable-client is passed.
+
+Instead, check if the birdc binary has been produced or not to decide
+whether it should be installed.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream-status: http://trubka.network.cz/pipermail/bird-users/2018-October/012763.html
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index c8168bbe..fea3683e 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -171,7 +171,7 @@ install: all
+ 	$(INSTALL) -d $(DESTDIR)/$(sbindir) $(DESTDIR)/$(sysconfdir) $(DESTDIR)/@runtimedir@
+ 	$(INSTALL_PROGRAM) $(exedir)/bird $(DESTDIR)/$(sbindir)/bird
+ 	$(INSTALL_PROGRAM) $(exedir)/birdcl $(DESTDIR)/$(sbindir)/birdcl
+-	if test -n "@CLIENT@" ; then								\
++	if test -f $(exedir)/birdc ; then							\
+ 		$(INSTALL_PROGRAM) $(exedir)/birdc $(DESTDIR)/$(sbindir)/birdc ;		\
+ 	fi
+ 	if ! test -f $(DESTDIR)/@CONFIG_FILE@ ; then						\
+-- 
+2.14.4
+
diff --git a/package/bird/Config.in b/package/bird/Config.in
new file mode 100644
index 0000000000..a69551f94e
--- /dev/null
+++ b/package/bird/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_BIRD
+	bool "bird"
+	depends on BR2_USE_MMU # fork()
+	help
+	  BIRD Internet Routing Daemon
+
+	  The BIRD project aims to develop a dynamic IP routing daemon
+	  with full support of all modern routing protocols, easy to
+	  use configuration interface and powerful route filtering
+	  language
+
+	  http://bird.network.cz/
+
+if BR2_PACKAGE_BIRD
+
+config BR2_PACKAGE_BIRD_CLIENT
+	bool "birdc"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	help
+	  Enable the BIRD client
+
+endif
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
index 0000000000..297e21dd95
--- /dev/null
+++ b/package/bird/bird.mk
@@ -0,0 +1,22 @@
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
+# autoreconf is needed since the package is fetched from github
+BIRD_AUTORECONF = YES
+BIRD_DEPENDENCIES = host-flex host-bison
+
+ifeq ($(BR2_PACKAGE_BIRD_CLIENT),y)
+BIRD_CONF_OPTS += --enable-client
+BIRD_DEPENDENCIES += ncurses readline
+else
+BIRD_CONF_OPTS += --disable-client
+endif
+
+$(eval $(autotools-package))
