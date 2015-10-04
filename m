From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 18:30:45 +0100
Subject: [Buildroot] [git commit] util-linux: update tool select options
Message-ID: <20151004173222.6818F8198B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e44edb825b9271b808b82297e28736360228ae9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing app config options:
  - line
  - tunelp

Drop app config options no longer supported by util-linux:
  - arch
  - ddate

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                 |   13 +++++++++++++
 package/util-linux/Config.in     |   21 +++++++++++----------
 package/util-linux/util-linux.mk |    4 ++--
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e031bed..3c7fe36 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -612,6 +612,19 @@ config BR2_PACKAGE_WDCTL
 	  util-linux' wdctl option has been renamed to BR2_PACKAGE_UTIL_LINUX_WDCTL
 	  to be aligned with how the other options are named.
 
+config BR2_PACKAGE_UTIL_LINUX_ARCH
+	bool "util-linux' arch option has been removed"
+	select BR2_LEGACY
+	help
+	  util-linux' arch was dropped in util-linux 2.23, in favor of
+	  the coreutils version.
+
+config BR2_PACKAGE_UTIL_LINUX_DDATE
+	bool "util-linux' ddate option has been removed"
+	select BR2_LEGACY
+	help
+	  util-linux' ddate was dropped in util-linux 2.23.
+
 config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
 	bool "rpm's bzip2 payloads option has been removed"
 	select BR2_LEGACY
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index d5c9812..c3ea190 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -52,11 +52,6 @@ config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	help
 	  Alternative linux getty
 
-config BR2_PACKAGE_UTIL_LINUX_ARCH
-	bool "arch"
-	help
-	  Print machine architecture
-
 config BR2_PACKAGE_UTIL_LINUX_BFS
 	bool "bfs"
 	help
@@ -81,11 +76,6 @@ config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	help
 	  Build fsck.cramfs and mkfs.cramfs
 
-config BR2_PACKAGE_UTIL_LINUX_DDATE
-	bool "ddate"
-	help
-	  Convert Gregorian dates to Discordian dates
-
 config BR2_PACKAGE_UTIL_LINUX_EJECT
 	bool "eject"
 	help
@@ -121,6 +111,11 @@ config BR2_PACKAGE_UTIL_LINUX_LAST
 	help
 	  Show a listing of last logged in users
 
+config BR2_PACKAGE_UTIL_LINUX_LINE
+	bool "line"
+	help
+	  Read one line
+
 config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	bool "login utilities"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
@@ -232,6 +227,12 @@ config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 	help
 	  Switch to another filesystem as the root of the mount tree
 
+config BR2_PACKAGE_UTIL_LINUX_TUNELP
+	bool "tunelp"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Set various parameters for the lp device
+
 config BR2_PACKAGE_UTIL_LINUX_UL
 	bool "ul"
 	select BR2_PACKAGE_NCURSES
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 3669d5c..27d22cb 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -62,11 +62,9 @@ UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
 # Disable/Enable utilities
 UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),--enable-agetty,--disable-agetty) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_ARCH),--enable-arch,--disable-arch) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_BFS),--enable-bfs,--disable-bfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH),--enable-chfn-chsh,--disable-chfn-chsh) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),--enable-cramfs,--disable-cramfs) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_DDATE),--enable-ddate,--disable-ddate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
@@ -78,6 +76,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS),--enable-libsmartcols,--disable-libsmartcols) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
@@ -97,6 +96,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SETPRIV),--enable-setpriv,--disable-setpriv) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SETTERM),--enable-setterm,--disable-setterm) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT),--enable-switch_root,--disable-switch_root) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_TUNELP),--enable-tunelp,--disable-tunelp) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UL),--enable-ul,--disable-ul) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UNSHARE),--enable-unshare,--disable-unshare) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UTMPDUMP),--enable-utmpdump,--disable-utmpdump) \
