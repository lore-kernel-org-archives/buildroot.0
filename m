From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 22:26:55 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/prboom: avoid
 using hardcoded optimization flags
Message-ID: <20190830202308.4124E88721@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=010c898226523e8db0d46331ac3f263b618a94d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Package prboom builds using -O2 flag ignoring Buildroot settings, this
is due to the fact that -O2 is appended at the end of compiler flags.

Remove -O2 from 'configure.ac' file and set PRBOOM_AUTORECONF to YES,
this way CFLAGS_OPTS will contain Buildroot TARGET_CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 34bcc4c6b003087673cf5faf3a896154b9425f75)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ure-remove-predefined-O2-optimization-flag.patch | 21 +++++++++++++++++++++
 package/prboom/prboom.mk                            |  1 +
 2 files changed, 22 insertions(+)

diff --git a/package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch b/package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch
new file mode 100644
index 0000000000..9260cb6314
--- /dev/null
+++ b/package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch
@@ -0,0 +1,21 @@
+configure: remove predefined -O2 optimization flag
+
+CFLAGS_OPT variable forces to use -O2 optimization flag denying the
+possibility to use different optimization flag values.
+
+Remove -O2 flag from CFLAGS_OPT.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+diff -urpN prboom-2.5.0.orig/configure.ac prboom-2.5.0/configure.ac
+--- prboom-2.5.0.orig/configure.ac	2019-06-20 14:07:45.058481879 +0200
++++ prboom-2.5.0/configure.ac	2019-06-20 14:09:05.066238825 +0200
+@@ -48,7 +48,7 @@ else
+ fi
+ 
+ dnl --- cph: work out flags to pass to compiler
+-CFLAGS_OPT="-O2 -fomit-frame-pointer"
++CFLAGS_OPT="-fomit-frame-pointer"
+ AC_C_COMPILE_FLAGS(-Wall)
+ dnl --- Option to enable debugging
+ AC_ARG_ENABLE(debug,AC_HELP_STRING([--enable-debug],[turns on various debugging features, like range checking and internal heap diagnostics]),,enable_debug="no")
diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index d370ae3fa5..325bf3eb02 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -10,6 +10,7 @@ PRBOOM_CONF_ENV = ac_cv_type_uid_t=yes
 PRBOOM_DEPENDENCIES = sdl sdl_net sdl_mixer
 PRBOOM_LICENSE = GPL-2.0+
 PRBOOM_LICENSE_FILES = COPYING
+PRBOOM_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 PRBOOM_DEPENDENCIES += libpng
