From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 13:37:42 +0200
Subject: [Buildroot] [git commit] wvdial: new package
Message-ID: <20130506113815.E840599C41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20d371fd12eb9c2cdcaa9b9c68873ac72d4ddbbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: adjust help text]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                               |    1 +
 package/wvdial/Config.in                        |    9 +++++
 package/wvdial/wvdial-0001-uClibc-scandir.patch |   23 ++++++++++++
 package/wvdial/wvdial.mk                        |   42 +++++++++++++++++++++++
 4 files changed, 75 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 426c833..b7f2e4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -789,6 +789,7 @@ source "package/wireless-regdb/Config.in"
 source "package/wireless_tools/Config.in"
 source "package/wireshark/Config.in"
 source "package/wpa_supplicant/Config.in"
+source "package/wvdial/Config.in"
 source "package/xinetd/Config.in"
 source "package/xl2tp/Config.in"
 
diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
new file mode 100644
index 0000000..730d35a
--- /dev/null
+++ b/package/wvdial/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_WVDIAL
+	bool "wvdial"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # wvstreams
+	select BR2_PACKAGE_WVSTREAMS
+	help
+	  wvdial is an intelligent Point-to-Point Protocol dialer
+
+	  http://wvdial.googlecode.com/
diff --git a/package/wvdial/wvdial-0001-uClibc-scandir.patch b/package/wvdial/wvdial-0001-uClibc-scandir.patch
new file mode 100644
index 0000000..b611e94
--- /dev/null
+++ b/package/wvdial/wvdial-0001-uClibc-scandir.patch
@@ -0,0 +1,23 @@
+Fix wvdial so that it works with scandir as defined in uClibc.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/wvmodemscan.cc b/wvmodemscan.cc
+--- a/wvmodemscan.cc	2009-09-29 18:27:28.000000000 +0100
++++ b/wvmodemscan.cc	2012-07-28 14:03:56.359729660 +0100
+@@ -495,13 +495,13 @@ static int fileselect(const struct diren
+ 	// (no internal ISDN support)   || !strncmp(e->d_name, "ttyI", 4);
+ }
+ 
+-#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 10)
++#if defined(__UCLIBC__) || (defined(__GLIBC__) && __GLIBC_PREREQ(2, 10))
+ static int filesort(const dirent **e1, const dirent **e2)
+ #else
+ static int filesort(const void *_e1, const void *_e2)
+ #endif
+ {
+-#if !(defined(__GLIBC__) && __GLIBC_PREREQ(2, 10))
++#if !(defined(__UCLIBC__) || (defined(__GLIBC__) && __GLIBC_PREREQ(2, 10)))
+     dirent const * const *e1 = (dirent const * const *)_e1;
+     dirent const * const *e2 = (dirent const * const *)_e2;
+ #endif
diff --git a/package/wvdial/wvdial.mk b/package/wvdial/wvdial.mk
new file mode 100644
index 0000000..89888d4
--- /dev/null
+++ b/package/wvdial/wvdial.mk
@@ -0,0 +1,42 @@
+#############################################################
+#
+# wvdial
+#
+#############################################################
+
+WVDIAL_VERSION = 1.61
+WVDIAL_SITE = http://wvdial.googlecode.com/files
+WVDIAL_SOURCE = wvdial-$(WVDIAL_VERSION).tar.bz2
+WVDIAL_DEPENDENCIES = wvstreams
+
+WVDIAL_LICENSE = LGPLv2
+WVDIAL_LICENSE_FILES = COPYING.LIB
+
+# N.B. parallel make fails
+WVDIAL_MAKE = $(MAKE1)
+
+WVDIAL_MAKE_ENV += $(TARGET_CONFIGURE_OPTS) \
+	WVSTREAMS_INC="$(STAGING_DIR)/usr/include" \
+	WVSTREAMS_LIB="$(STAGING_DIR)/usr/lib"
+
+define WVDIAL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(WVDIAL_MAKE_ENV) $(WVDIAL_MAKE) -C $(@D)
+endef
+
+define WVDIAL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(WVDIAL_MAKE_ENV) $(WVDIAL_MAKE) \
+		prefix="$(TARGET_DIR)/usr" PPPDIR="$(TARGET_DIR)/etc/ppp/peers" \
+		install -C $(@D)
+endef
+
+define WVDIAL_UNINSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(WVDIAL_MAKE_ENV) $(WVDIAL_MAKE) \
+		prefix="$(TARGET_DIR)/usr" PPPDIR="$(TARGET_DIR)/etc/ppp/peers" \
+		uninstall -C $(@D)
+endef
+
+define WVDIAL_CLEAN_CMDS
+	$(TARGET_MAKE_ENV) $(WVDIAL_MAKE_ENV) $(WVDIAL_MAKE) clean -C $(@D)
+endef
+
+$(eval $(generic-package))
