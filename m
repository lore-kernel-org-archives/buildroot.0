From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Dec 2012 10:13:21 +0100
Subject: [Buildroot] [PATCH 1/3] pcmanfm: link against libX11 to avoid build
	failure
Message-ID: <1355908403-27224-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

/home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: fm-desktop.o: undefined reference to symbol 'XSendEvent'
/home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: note: 'XSendEvent' is defined in DSO /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libX11.so.6 so try adding it to the linker command line
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libX11.so.6: could not read symbols: Invalid operation
collect2: error: ld returned 1 exit status
make[4]: *** [pcmanfm] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcmanfm/pcmanfm-link-against-libx11.patch |   20 ++++++++++++++++++++
 package/pcmanfm/pcmanfm.mk                        |    1 +
 2 files changed, 21 insertions(+)
 create mode 100644 package/pcmanfm/pcmanfm-link-against-libx11.patch

diff --git a/package/pcmanfm/pcmanfm-link-against-libx11.patch b/package/pcmanfm/pcmanfm-link-against-libx11.patch
new file mode 100644
index 0000000..f571e77
--- /dev/null
+++ b/package/pcmanfm/pcmanfm-link-against-libx11.patch
@@ -0,0 +1,20 @@
+Link against libX11
+
+fm-desktop.c uses XSendEvent, so we should link against libX11.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.in
+===================================================================
+--- a/configure.in
++++ b/configure.in
+@@ -12,7 +12,8 @@
+ 
+ pkg_modules="gtk+-2.0 >= 2.6.0 \
+              gthread-2.0 \
+-             libstartup-notification-1.0"
++             libstartup-notification-1.0 \
++	     x11"
+ 
+ AC_FUNC_MMAP
+ 
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 1f1a330..e4c23ec 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -8,6 +8,7 @@ PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
 PCMANFM_SITE = http://internap.dl.sourceforge.net/sourceforge/pcmanfm
 PCMANFM_CONF_OPT = --disable-hal
 PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xserver_xorg-server
+PCMANFM_AUTORECONF = YES
 
 $(eval $(autotools-package))
 
-- 
1.7.9.5
