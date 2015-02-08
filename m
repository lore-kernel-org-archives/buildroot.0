From: Romain Naour <romain.naour@openwide.fr>
Date: Mon,  9 Feb 2015 00:22:08 +0100
Subject: [Buildroot] [PATCH 1/3] package/openvmtools: configure fix
	USE_SLASH_PROC
Message-ID: <1423437730-22997-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport a patch from Fedora

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/openvmtools/0006-ip_route_config.patch | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/openvmtools/0006-ip_route_config.patch

diff --git a/package/openvmtools/0006-ip_route_config.patch b/package/openvmtools/0006-ip_route_config.patch
new file mode 100644
index 0000000..2396413
--- /dev/null
+++ b/package/openvmtools/0006-ip_route_config.patch
@@ -0,0 +1,27 @@
+Patch from Fedora:
+
+http://pkgs.fedoraproject.org/cgit/open-vm-tools.git/commit/?id=f86513592cdc468f9af24c7ed29daae48e2cd26e
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+
+--- open-vm-tools-9.4.6-1770165/configure.ac.orig	2015-02-03 18:42:39.431466158 -0800
++++ open-vm-tools-9.4.6-1770165/configure.ac	2015-02-03 18:43:15.338468630 -0800
+@@ -1032,7 +1032,7 @@
+ AM_CONDITIONAL(HAVE_GNU_LD, test "$with_gnu_ld" = "yes")
+ AM_CONDITIONAL(HAVE_GTKMM, test "$have_x" = "yes" -a "$with_gtkmm" = "yes")
+ AM_CONDITIONAL(HAVE_PAM, test "$with_pam" = "yes")
+-AM_CONDITIONAL(USE_SLASH_PROC, test "os" = "linux" -a "$have_glib_2_14" = "yes")
++AM_CONDITIONAL(USE_SLASH_PROC, test "$os" = "linux" -a "$have_glib_2_14" = "yes")
+ AM_CONDITIONAL(USE_PRINTF_WRAPPERS, test "$bsdPrintfWrappers" = "yes")
+ 
+ if test "$have_xsm" != "yes"; then
+--- open-vm-tools-9.4.6-1770165/services/plugins/guestInfo/getlib/Makefile.am.orig	2015-02-03 18:48:55.528772952 -0800
++++ open-vm-tools-9.4.6-1770165/services/plugins/guestInfo/getlib/Makefile.am	2015-02-03 18:52:51.597199001 -0800
+@@ -28,4 +28,6 @@
+ libGuestInfo_la_CPPFLAGS += -I$(srcdir)/..
+ 
+ AM_CFLAGS = $(DNET_CPPFLAGS)
+-
++if USE_SLASH_PROC
++AM_CFLAGS += -DUSE_SLASH_PROC
++endif
-- 
1.9.3
