From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 22:36:36 +0200
Subject: [Buildroot] [git commit] package/xdriver_xf86-input-evdev: fix
	install paths
Message-ID: <20161026203713.4C73B8179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df8534455472b4257d57b88162a8fb8402fc50ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Get rid of the borked sdkdir variable.

Fixes (partially):
    https://bugs.busybox.net/show_bug.cgi?id=8696

Reported-by: buildroot at netsolux.ch
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot at netsolux.ch
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-build-get-rid-of-sdkdir.patch             | 87 ++++++++++++++++++++++
 .../xdriver_xf86-input-evdev.mk                    |  2 +
 2 files changed, 89 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/0001-build-get-rid-of-sdkdir.patch b/package/x11r7/xdriver_xf86-input-evdev/0001-build-get-rid-of-sdkdir.patch
new file mode 100644
index 0000000..b342295
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-evdev/0001-build-get-rid-of-sdkdir.patch
@@ -0,0 +1,87 @@
+From 1ad5e1593556f767150c2ca75176453bee4771e6 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 23 Oct 2016 22:00:10 +0200
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
+ Makefile.am         |  4 ----
+ configure.ac        |  9 ---------
+ include/Makefile.am |  5 ++++-
+ xorg-evdev.pc.in    | 10 ++++++++--
+ 4 files changed, 12 insertions(+), 16 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1cc3ea6..1ae042a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -18,10 +18,6 @@
+ #  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ #  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ 
+-
+-# Provide an sdk location that is writable by the evdev module
+-DISTCHECK_CONFIGURE_FLAGS = --with-sdkdir='$${includedir}/xorg'
+-
+ SUBDIRS = src man include
+ MAINTAINERCLEANFILES = ChangeLog INSTALL
+ 
+diff --git a/configure.ac b/configure.ac
+index e4887a3..4adfa43 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -66,15 +66,6 @@ AC_ARG_WITH(xorg-conf-dir,
+             [xorgconfdir="$prefix/share/X11/xorg.conf.d"])
+ AC_SUBST(xorgconfdir)
+ 
+-# X Server SDK location is required to install evdev header files
+-# This location is also relayed in the xorg-evdev.pc file
+-sdkdir=`$PKG_CONFIG --variable=sdkdir xorg-server`
+-
+-# Workaround overriding sdkdir to be able to create a tarball when user has no
+-# write permission in sdkdir. See DISTCHECK_CONFIGURE_FLAGS in Makefile.am
+-AC_ARG_WITH([sdkdir], [], [sdkdir="$withval"])
+-AC_SUBST([sdkdir])
+-
+ DRIVER_NAME=evdev
+ AC_SUBST([DRIVER_NAME])
+ 
+diff --git a/include/Makefile.am b/include/Makefile.am
+index 0e3fc1b..afc96ed 100644
+--- a/include/Makefile.am
++++ b/include/Makefile.am
+@@ -1 +1,4 @@
+-sdk_HEADERS = evdev-properties.h
++# location formerly known as 'sdkdir':
++xorgincludedir = $(includedir)/xorg
++
++xorginclude_HEADERS = evdev-properties.h
+diff --git a/xorg-evdev.pc.in b/xorg-evdev.pc.in
+index 20710a6..fcbf511 100644
+--- a/xorg-evdev.pc.in
++++ b/xorg-evdev.pc.in
+@@ -1,6 +1,12 @@
+-sdkdir=@sdkdir@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++datarootdir=@datarootdir@
++moduledir=@moduledir@
++sysconfigdir=@sysconfigdir@
+ 
+ Name: xorg-evdev
+ Description: X.Org evdev input driver.
+ Version: @PACKAGE_VERSION@
+-Cflags: -I${sdkdir}
++Cflags: -I${includedir}/xorg
+-- 
+2.7.4
+
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 606f1be..9ec893b 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -9,6 +9,8 @@ XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VE
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
 XDRIVER_XF86_INPUT_EVDEV_LICENSE_FILES = COPYING
+XDRIVER_XF86_INPUT_EVDEV_AUTORECONF = YES
+
 XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = \
 	host-pkgconf \
 	libevdev \
