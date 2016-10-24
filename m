From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Oct 2016 18:38:51 +0200
Subject: [Buildroot] [PATCH 5/6] package/xdriver_xf86-input-synaptics: fix
	install paths
In-Reply-To: <cover.1477327063.git.yann.morin.1998@free.fr>
References: <cover.1477327063.git.yann.morin.1998@free.fr>
Message-ID: <8b6ab59a4583daa47fbd9e6f1440554f1c91c522.1477327064.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Get rid of the borked sdkdir variable.

Fixes (partially):
    https://bugs.busybox.net/show_bug.cgi?id=8696

Reported-by: buildroot at netsolux.ch
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot at netsolux.ch
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-build-get-rid-of-sdkdir.patch             | 88 ++++++++++++++++++++++
 .../xdriver_xf86-input-synaptics.mk                |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch

diff --git a/package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch b/package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch
new file mode 100644
index 0000000..62950b0
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch
@@ -0,0 +1,88 @@
+From 231a35e99fee8aba23f18cce21dfb5fa8bef0c36 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 23 Oct 2016 23:07:33 +0200
+Subject: [PATCH] build: get rid of sdkdir
+
+Use of sdkdir causes problems during cross-compilation, where the full
+path is then appended to the DESTDIR, leading to host paths being
+appended in the target:
+    https://bugs.busybox.net/show_bug.cgi?id=8696
+
+Other drivers (e.g. keyboard) got rid of sdkdir. Do the same.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ Makefile.am          | 1 -
+ configure.ac         | 9 ---------
+ include/Makefile.am  | 4 +++-
+ xorg-synaptics.pc.in | 5 +++--
+ 4 files changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 678124c..c48c5c8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -21,7 +21,6 @@
+ # During distcheck, system locations (as provided by pkg-config) may
+ # not be writable; provide instead relative locations.
+ DISTCHECK_CONFIGURE_FLAGS = \
+-	--with-sdkdir='$${includedir}/xorg' \
+ 	--with-xorg-conf-dir='$${datadir}/X11/xorg.conf.d'
+ 
+ SUBDIRS = include src man tools conf
+diff --git a/configure.ac b/configure.ac
+index 970dd5f..574353b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,11 +55,6 @@ XORG_DRIVER_CHECK_EXT(RANDR, randrproto)
+ # Obtain compiler/linker options for the Synaptics driver dependencies
+ PKG_CHECK_MODULES(XORG, [inputproto >= 2.1.99.3] [xorg-server >= 1.12] xproto inputproto $REQUIRED_MODULES)
+ 
+-# X Server SDK location is required to install Synaptics header files
+-# This location is also relayed in the xorg-synaptics.pc file
+-sdkdir=`$PKG_CONFIG --variable=sdkdir xorg-server`
+-AC_SUBST([sdkdir])
+-
+ # -----------------------------------------------------------------------------
+ #			Configuration options
+ # -----------------------------------------------------------------------------
+@@ -154,10 +149,6 @@ if test "x$have_libxtst" = "xyes" ; then
+ fi
+ # -----------------------------------------------------------------------------
+ 
+-# Workaround overriding sdkdir to be able to create a tarball when user has no
+-# write permission in sdkdir. See DISTCHECK_CONFIGURE_FLAGS in Makefile.am
+-AC_ARG_WITH([sdkdir], [], [sdkdir="$withval"])
+-
+ AC_CONFIG_FILES([Makefile
+                 src/Makefile
+                 man/Makefile
+diff --git a/include/Makefile.am b/include/Makefile.am
+index 8234020..565868b 100644
+--- a/include/Makefile.am
++++ b/include/Makefile.am
+@@ -18,4 +18,6 @@
+ #  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ #  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ 
+-sdk_HEADERS = synaptics-properties.h
++# Location formerly known as 'sdkdir'
++xorgincludedir = $(includedir)/xorg
++xorginclude_HEADERS = synaptics-properties.h
+diff --git a/xorg-synaptics.pc.in b/xorg-synaptics.pc.in
+index 159cfbf..68e0fbe 100644
+--- a/xorg-synaptics.pc.in
++++ b/xorg-synaptics.pc.in
+@@ -1,6 +1,7 @@
+-sdkdir=@sdkdir@
++prefix=@prefix@
++includedir=@includedir@
+ 
+ Name: synaptics
+ Description: X.Org synaptics input driver.
+ Version: @PACKAGE_VERSION@
+-Cflags: -I${sdkdir}
++Cflags: -I${includedir}/xorg
+-- 
+2.7.4
+
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index b6ade4c..d6164d0 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -10,5 +10,6 @@ XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individ
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE = MIT
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = libevdev xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto mtdev
+XDRIVER_XF86_INPUT_SYNAPTICS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.7.4
