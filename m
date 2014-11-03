From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Nov 2014 22:32:08 +0100
Subject: [Buildroot] [git commit] avahi: fix libgtk3 build issue by patching
	Makefile.in instead of Makefile.am
Message-ID: <20141103213612.5169AB5922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee817f63aa8a67c82bd5c27346d5197a8f3a9552
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f0b/f0b4f8c46eb1de6cf5ed081dacd248c66c591aa3/
http://autobuild.buildroot.net/results/dac/daca5d030b8ecc6d11901e2936fe2151d0930852/
http://autobuild.buildroot.net/results/05e/05e7fb9a888169ba7c4cb28abdb4febb5215354c/
http://autobuild.buildroot.net/results/743/743f30b1816b17a0a1397b7fd8b5a8571c4dde03/

And many others.

So we no longer need to autoreconf the package. Autoreconfing is non-trivial
as it uses m4 macros from glib, but we don't want to unconditionally pull in
glib.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi-no-gtk-deprecations.patch |   39 ++++++++++++-------------
 package/avahi/avahi.mk                        |    1 -
 2 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/package/avahi/avahi-no-gtk-deprecations.patch b/package/avahi/avahi-no-gtk-deprecations.patch
index 3a284d0..d187053 100644
--- a/package/avahi/avahi-no-gtk-deprecations.patch
+++ b/package/avahi/avahi-no-gtk-deprecations.patch
@@ -6,26 +6,25 @@ versions.
 For more details, see the Fedora bugzilla:
 https://bugzilla.redhat.com/show_bug.cgi?id=1001676
 
+[Peter: patch Makefile.in so we don't need autoreconf]
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---- avahi-0.6.31/avahi-ui/Makefile.am.orig	2013-09-21 16:47:28.677659361 +0200
-+++ avahi-0.6.31/avahi-ui/Makefile.am	2013-09-21 16:47:34.852520537 +0200
-@@ -15,7 +15,7 @@
- # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
- # USA.
- 
--AM_CFLAGS=-I$(top_srcdir) -DG_DISABLE_DEPRECATED=1 -DGDK_DISABLE_DEPRECATED=1 -DGTK_DISABLE_DEPRECATED=1
-+AM_CFLAGS=-I$(top_srcdir)
+---
+ avahi-ui/Makefile.am |    2 +-
+ avahi-ui/Makefile.in |    3 +--
+ configure.ac         |    2 +-
+ 3 files changed, 3 insertions(+), 4 deletions(-)
+
+Index: avahi-0.6.31/avahi-ui/Makefile.in
+===================================================================
+--- avahi-0.6.31.orig/avahi-ui/Makefile.in
++++ avahi-0.6.31/avahi-ui/Makefile.in
+@@ -464,8 +464,7 @@
+ top_srcdir = @top_srcdir@
  
  # This cool debug trap works on i386/gcc only
- AM_CFLAGS+='-DDEBUG_TRAP=__asm__("int $$3")'
---- avahi-0.6.31/configure.ac.orig	2013-09-21 16:46:43.750669413 +0200
-+++ avahi-0.6.31/configure.ac	2013-09-21 16:47:02.566246400 +0200
-@@ -92,7 +92,7 @@
-     AC_MSG_CHECKING([whether stack-smashing protection is available])
-     ssp_old_cflags="$CFLAGS"
-     ssp_old_ldflags="$LDFLAGS"
--    CFLAGS="$CFLAGS -Werror -fstack-protector-all -fPIC"
-+    CFLAGS="$CFLAGS -fstack-protector-all -fPIC"
-     LDFLAGS="$LDFLAGS -Wl,-z,defs"
-     cat confdefs.h > conftest.c
-     cat >>conftest.c <<_ACEOF
+-AM_CFLAGS = -I$(top_srcdir) -DG_DISABLE_DEPRECATED=1 \
+-	-DGDK_DISABLE_DEPRECATED=1 -DGTK_DISABLE_DEPRECATED=1 \
++AM_CFLAGS = -I$(top_srcdir) \
+ 	'-DDEBUG_TRAP=__asm__("int $$3")' $(am__append_1)
+ pkglibdatadir = $(libdir)/avahi
+ desktopdir = $(datadir)/applications
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index e4c327d..4e5dbc6 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -16,7 +16,6 @@ AVAHI_SITE = http://www.avahi.org/download
 AVAHI_LICENSE = LGPLv2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_INSTALL_STAGING = YES
-AVAHI_AUTORECONF = YES
 
 AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes \
