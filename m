From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Oct 2016 18:38:48 +0200
Subject: [Buildroot] [PATCH 2/6] package/xdriver_xf86-input-joystick: fix
	install paths
In-Reply-To: <cover.1477327063.git.yann.morin.1998@free.fr>
References: <cover.1477327063.git.yann.morin.1998@free.fr>
Message-ID: <d0ee7eab04dc3a4ee01e8ecea6ada791c65bc43b.1477327064.git.yann.morin.1998@free.fr>
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
 .../0001-build-get-rid-of-sdkdir.patch             | 78 ++++++++++++++++++++++
 .../xdriver_xf86-input-joystick.mk                 |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-input-joystick/0001-build-get-rid-of-sdkdir.patch

diff --git a/package/x11r7/xdriver_xf86-input-joystick/0001-build-get-rid-of-sdkdir.patch b/package/x11r7/xdriver_xf86-input-joystick/0001-build-get-rid-of-sdkdir.patch
new file mode 100644
index 0000000..a611f15
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-joystick/0001-build-get-rid-of-sdkdir.patch
@@ -0,0 +1,78 @@
+From 2826691dcd01f470d30dc8eb3bbd24a96cd3a93c Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 23 Oct 2016 22:29:29 +0200
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
+ Makefile.am         | 1 -
+ configure.ac        | 9 ---------
+ include/Makefile.am | 5 ++++-
+ xorg-joystick.pc.in | 2 +-
+ 4 files changed, 5 insertions(+), 12 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 13946b8..c1567ae 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -18,7 +18,6 @@
+ #  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ #  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ 
+-DISTCHECK_CONFIGURE_FLAGS = --with-sdkdir=\$${includedir}/xorg
+ SUBDIRS = src man config include
+ MAINTAINERCLEANFILES = ChangeLog INSTALL
+ 
+diff --git a/configure.ac b/configure.ac
+index b5834a5..44b9d27 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -66,15 +66,6 @@ AC_ARG_WITH(xorg-module-dir,
+ inputdir=${moduledir}/input
+ AC_SUBST(inputdir)
+ 
+-# Define a configure option for an alternate X Server SDK Headers
+-# X Server SDK location is required to install joystick header files
+-AC_ARG_WITH(sdkdir,
+-            AS_HELP_STRING([--with-sdkdir=<path>],
+-                           [Xorg X Server sdk headers (default is autodetected)]),
+-            [sdkdir="$withval"],
+-            [sdkdir=`$PKG_CONFIG --variable=sdkdir xorg-server`])
+-AC_SUBST(sdkdir)
+-
+ # Define a configure option to enable code debugging
+ AC_ARG_ENABLE(debug, AS_HELP_STRING([--disable-debug],
+                                     [Disable debugging code (default: enabled)]),
+diff --git a/include/Makefile.am b/include/Makefile.am
+index ed618c2..d656568 100644
+--- a/include/Makefile.am
++++ b/include/Makefile.am
+@@ -18,4 +18,7 @@
+ #  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ #  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ 
+-sdk_HEADERS = joystick-properties.h
++# Location formerly known as 'sdkdir'
++xorgincludedir = $(includedir)/xorg
++
++xorginclude_HEADERS = joystick-properties.h
+diff --git a/xorg-joystick.pc.in b/xorg-joystick.pc.in
+index 76bb92f..a5972c7 100644
+--- a/xorg-joystick.pc.in
++++ b/xorg-joystick.pc.in
+@@ -4,4 +4,4 @@ includedir=@includedir@
+ Name: xorg-joystick
+ Description: X.Org joystick input driver.
+ Version: @PACKAGE_VERSION@
+-Cflags: -I${includedir}
++Cflags: -I${includedir}/xorg
+-- 
+2.7.4
+
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index 2696e2b..76f2577 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -10,6 +10,7 @@ XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individu
 XDRIVER_XF86_INPUT_JOYSTICK_LICENSE = MIT
 XDRIVER_XF86_INPUT_JOYSTICK_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+XDRIVER_XF86_INPUT_JOYSTICK_AUTORECONF = YES
 
 define XDRIVER_XF86_INPUT_JOYSTICK_CONF
 	$(INSTALL) -m 0644 -D \
-- 
2.7.4
