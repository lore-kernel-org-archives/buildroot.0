From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:29:12 +0200
Subject: [Buildroot] [git commit] openvmtools: disable -Werror
Message-ID: <20140921172937.E3CD69D69C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bec0a1af57165081dc275f813c8c5c74ff12c14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable the mandatory flag -Werror in configure.ac.
This also makes -Wno-deprecated-declarations flag unnecessary.

Fixes:
  http://autobuild.buildroot.net/results/440/4400abc17115d0f5eb65c4eb012f11766cbe5a56/
  http://autobuild.buildroot.net/results/02b/02b24a012dbc76e366c10d3758978eba5e597499/

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../openvmtools-04-no_cflags_werror.patch          |   17 +++++++++++++++++
 package/openvmtools/openvmtools.mk                 |    4 ----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/package/openvmtools/openvmtools-04-no_cflags_werror.patch b/package/openvmtools/openvmtools-04-no_cflags_werror.patch
new file mode 100644
index 0000000..96bd355
--- /dev/null
+++ b/package/openvmtools/openvmtools-04-no_cflags_werror.patch
@@ -0,0 +1,17 @@
+configure.ac: disable -Werror
+
+Disable the mandatory flag -Werror in configure.ac.
+
+Signed-off-by: Karoly Kasza <kaszak@gmail.com>
+
+--- open-vm-tools-9.4.6-1770165.orig/configure.ac	2014-07-02 00:21:14.000000000 +0200
++++ open-vm-tools-9.4.6-1770165/configure.ac	2014-09-15 16:03:47.565900402 +0200
+@@ -832,7 +832,7 @@
+ 
+ ### General flags / actions
+ CFLAGS="$CFLAGS -Wall"
+-CFLAGS="$CFLAGS -Werror"
++# CFLAGS="$CFLAGS -Werror"
+ 
+ # -Wno-unknown-pragmas is due to gcc not understanding '#pragma ident' in Xlib.h on OpenSolaris.
+ for TEST_CFLAG in -Wno-pointer-sign -Wno-unused-value -fno-strict-aliasing \
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 6361d6b..9191643 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -13,10 +13,6 @@ OPENVMTOOLS_LICENSE_FILES = COPYING
 # See http://sourceforge.net/p/open-vm-tools/mailman/message/32550385/
 OPENVMTOOLS_AUTORECONF = YES
 OPENVMTOOLS_CONF_OPT = --without-icu --without-x --without-gtk2 --without-gtkmm --without-kernel-modules
-# -Wno-deprecated-declarations is a workaround for a bug in open-vm-tools
-# See http://sourceforge.net/p/open-vm-tools/mailman/message/31473171/
-OPENVMTOOLS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-deprecated-declarations"
-
 OPENVMTOOLS_DEPENDENCIES = libglib2
 
 # When libfuse is available, openvmtools can build vmblock-fuse, so
