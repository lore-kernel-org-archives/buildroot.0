From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Oct 2014 12:50:49 +0100
Subject: [Buildroot] [git commit] avahi: fix avahi-ui build with libgtk3
Message-ID: <20141031115353.56D52B23C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6c04e6daae674f8983ec2fb106fb897c6803c32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/daa/daad247db16818f25ab33402e26e27257defbe13/
http://autobuild.buildroot.net/results/720/720e2c8a5eab8b47d2510fe03b4a90ec8beafc17/
http://autobuild.buildroot.net/results/02b/02b4ab9ee07707ee4a4d4ea2b9c67bee91b1392d/
http://autobuild.buildroot.net/results/819/81914317ce82dc1321484d8c2b65647f92aa6929/

And many others.

avahi-ui uses deprecated gtk functionality, but explicitly requests to
disable the deprecated API support in gtk - Breaking the build when building
against libgtk3.

Patch is taken from Fedora:
https://bugzilla.redhat.com/show_bug.cgi?id=1001676

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi-no-gtk-deprecations.patch |   31 +++++++++++++++++++++++++
 package/avahi/avahi.mk                        |    1 +
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/avahi/avahi-no-gtk-deprecations.patch b/package/avahi/avahi-no-gtk-deprecations.patch
new file mode 100644
index 0000000..3a284d0
--- /dev/null
+++ b/package/avahi/avahi-no-gtk-deprecations.patch
@@ -0,0 +1,31 @@
+Patch from http://pkgs.fedoraproject.org/cgit/avahi.git/plain/avahi-0.6.31-no-deprecations.patch?id=b3f4de05e331258c5123e3acc144e452595c2112
+
+Don't disable deprecated GTK support, as that breaks builds with modern GTK3
+versions.
+
+For more details, see the Fedora bugzilla:
+https://bugzilla.redhat.com/show_bug.cgi?id=1001676
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+--- avahi-0.6.31/avahi-ui/Makefile.am.orig	2013-09-21 16:47:28.677659361 +0200
++++ avahi-0.6.31/avahi-ui/Makefile.am	2013-09-21 16:47:34.852520537 +0200
+@@ -15,7 +15,7 @@
+ # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+ # USA.
+ 
+-AM_CFLAGS=-I$(top_srcdir) -DG_DISABLE_DEPRECATED=1 -DGDK_DISABLE_DEPRECATED=1 -DGTK_DISABLE_DEPRECATED=1
++AM_CFLAGS=-I$(top_srcdir)
+ 
+ # This cool debug trap works on i386/gcc only
+ AM_CFLAGS+='-DDEBUG_TRAP=__asm__("int $$3")'
+--- avahi-0.6.31/configure.ac.orig	2013-09-21 16:46:43.750669413 +0200
++++ avahi-0.6.31/configure.ac	2013-09-21 16:47:02.566246400 +0200
+@@ -92,7 +92,7 @@
+     AC_MSG_CHECKING([whether stack-smashing protection is available])
+     ssp_old_cflags="$CFLAGS"
+     ssp_old_ldflags="$LDFLAGS"
+-    CFLAGS="$CFLAGS -Werror -fstack-protector-all -fPIC"
++    CFLAGS="$CFLAGS -fstack-protector-all -fPIC"
+     LDFLAGS="$LDFLAGS -Wl,-z,defs"
+     cat confdefs.h > conftest.c
+     cat >>conftest.c <<_ACEOF
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 4e5dbc6..e4c327d 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -16,6 +16,7 @@ AVAHI_SITE = http://www.avahi.org/download
 AVAHI_LICENSE = LGPLv2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_INSTALL_STAGING = YES
+AVAHI_AUTORECONF = YES
 
 AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes \
