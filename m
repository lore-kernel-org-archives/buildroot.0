From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun,  1 Mar 2015 22:06:52 +0100
Subject: [Buildroot] [PATCH v3 1/2] popt: add to the "popt.pc" file the
	libintl library
In-Reply-To: <1425244013-2509-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425244013-2509-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425244013-2509-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change permits through pkg-config to retrive even the depenencies
that is useful for a static linking.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 ...-the-libintl-library-to-the-Libs.private-.patch | 47 ++++++++++++++++++++++
 package/popt/popt.mk                               |  4 ++
 2 files changed, 51 insertions(+)
 create mode 100644 package/popt/0004-popt.pc-add-the-libintl-library-to-the-Libs.private-.patch

diff --git a/package/popt/0004-popt.pc-add-the-libintl-library-to-the-Libs.private-.patch b/package/popt/0004-popt.pc-add-the-libintl-library-to-the-Libs.private-.patch
new file mode 100644
index 0000000..9b0b07e
--- /dev/null
+++ b/package/popt/0004-popt.pc-add-the-libintl-library-to-the-Libs.private-.patch
@@ -0,0 +1,47 @@
+From 470755ccc353b59107c957972d908cbde4942c8d Mon Sep 17 00:00:00 2001
+From: Fabio Porcedda <fabio.porcedda@gmail.com>
+Date: Sun, 1 Mar 2015 21:13:48 +0100
+Subject: [PATCH] popt.pc: add the libintl library to the Libs.private field
+
+If static linking and libintl is used, the program that uses the popt
+library needs to link to the libintl library too so add the libintl
+library to the libs.private field because is useful for programs that call
+  pkg-config --static --libs popt
+they get the libintl library too:
+  -L<...> -lpopt -lintl
+
+This patch was already sent upstream:
+http://rpm5.org/community/popt-devel/0294.html
+
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
+---
+ configure.ac | 1 +
+ popt.pc.in   | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index e8eb238..816d272 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -90,6 +90,7 @@ popt_sysconfdir="${sysconfdir}"
+ eval "popt_sysconfdir=\"${popt_sysconfdir}\"" # expand contained ${prefix}
+ AC_DEFINE_UNQUOTED([POPT_SYSCONFDIR], ["$popt_sysconfdir"], [Full path to default POPT configuration directory])
+ 
++AC_SUBST([POPT_PKGCONFIG_LIBS_PRIVATE],"$LIBINTL")
+ 
+ # Define a (hope) portable Libs pkgconfig directive that 
+ # - Don't harm if the default library search path include ${libdir}
+diff --git a/popt.pc.in b/popt.pc.in
+index a86437c..0acfdb9 100644
+--- a/popt.pc.in
++++ b/popt.pc.in
+@@ -6,5 +6,6 @@ includedir=@includedir@
+ Name: popt
+ Version: @VERSION@
+ Description: popt library.
++Libs.private: @POPT_PKGCONFIG_LIBS_PRIVATE@
+ Libs: @POPT_PKGCONFIG_LIBS@
+ Cflags: -I${includedir}
+-- 
+2.3.1
+
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 8ce64d4..605649b 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -13,6 +13,10 @@ POPT_LICENSE_FILES = COPYING
 POPT_AUTORECONF = YES
 POPT_GETTEXTIZE = YES
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+POPT_DEPENDENCIES += gettext
+endif
+
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-- 
2.3.1
