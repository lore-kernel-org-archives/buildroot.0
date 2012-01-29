From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Jan 2012 21:31:28 +0100
Subject: [Buildroot] [git commit] libedje: Add new package
Message-ID: <20120129222324.E993D90042@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbceb3c9ea5aa341e66785727155e2f1f54f3ada
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add upstream URL, remove redundant _INSTALL_TARGET]
Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/Config.in          |    1 +
 package/efl/libedje/Config.in  |   21 +++++++++++++++++++++
 package/efl/libedje/libedje.mk |   24 ++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 0e27dab..7d9c1ff 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -13,6 +13,7 @@ source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
+source "package/efl/libedje/Config.in"
 
 endif # BR2_PACKAGE_EFL
 
diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
new file mode 100644
index 0000000..f0985dd
--- /dev/null
+++ b/package/efl/libedje/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_LIBEDJE
+	bool "libedje"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEET
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_LIBECORE_EVAS
+	select BR2_PACKAGE_LIBEMBRYO
+	select BR2_PACKAGE_LIBEVAS
+	select BR2_PACKAGE_LUA
+	help
+	  A graphical layout and animation library for animated
+	  resizable, compressed and scalable themes.
+
+	  http://trac.enlightenment.org/e/wiki/Edje
+
+config BR2_PACKAGE_LIBEDJE_CC
+	bool "build edje_cc"
+	depends on BR2_PACKAGE_LIBEDJE
+	help
+	  Build and install the Edje compiler for the target. Normally this
+	  is not required.
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
new file mode 100644
index 0000000..5252d6e
--- /dev/null
+++ b/package/efl/libedje/libedje.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# libedje
+#
+#############################################################
+
+LIBEDJE_VERSION = 1.1.0
+LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
+LIBEDJE_SITE =  http://download.enlightenment.org/releases/
+LIBEDJE_INSTALL_STAGING = YES
+
+LIBEDJE_DEPENDENCIES = host-pkg-config lua libeina libeet libecore libevas \
+			libembryo
+
+ifeq ($(BR2_PACKAGE_LIBEDJE_CC),y)
+LIBEDJE_CONF_OPT += --enable-edje-cc
+else
+LIBEDJE_CONF_OPT += --disable-edje-cc
+endif
+
+HOST_LIBEDJE_CONF_OPT = --enable-edje-cc
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
