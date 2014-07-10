From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Thu, 10 Jul 2014 09:55:16 +0200
Subject: [Buildroot] Migrating libconfuse package from .tar.gz to github
Message-ID: <CAM+bi4vVkn-TivZymaXuKswCLfFewXnAd1L-c-O9o=h7L3VXqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there!

libconfuse is being migrated to github (see http://www.nongnu.org/confuse/)

I'm trying to migrate buildroot's package definition too, but I'm
facing a problem I don't know how to resolve.

I've applied this small patch to get libconfuse source code from github.

Since code inside github doesn't contain autoconf files, autoreconf
must be run, and that's the reason for the new LIBCONFUSE_AUTORECONF =
YES. However, when trying to build it, the following happens:

>>> libconfuse V2_7 Configuring
>>> libconfuse V2_7 Autoreconfiguring
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `support'.
libtoolize: copying file `support/ltmain.sh'
libtoolize: putting macros in `m4'.
libtoolize: copying file `m4/libtool.m4'
libtoolize: copying file `m4/ltoptions.m4'
libtoolize: copying file `m4/ltsugar.m4'
libtoolize: copying file `m4/ltversion.m4'
libtoolize: copying file `m4/lt~obsolete.m4'
libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.ac and
libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
configure.ac:33: error: required file 'support/config.rpath' not found
doc/Makefile.am:8: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
examples/Makefile.am:3: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
autoreconf: /home/sslayer/Proyectos/RADAR/ART3500/buildroot-pi/output/host/usr/bin/automake
failed with exit status: 1
package/pkg-generic.mk:167: recipe for target
'/home/sslayer/Proyectos/RADAR/ART3500/buildroot-pi/output/build/libconfuse-V2_7/.stamp_configured'
failed
make: *** [/home/sslayer/Proyectos/RADAR/ART3500/buildroot-pi/output/build/libconfuse-V2_7/.stamp_configured]
Error 1


I've also tried to run a post extract hook, for an autogen.sh file is
provided. However, this results on host autotools being run, linking
to files outside buildroot hierarchy (such as
/usr/share/gettext/config.rpath, etc) that can't be overwritten, so
this also fails.

Does anybody have any idea on how to solve this?

Regards,


diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 8a0d80f..b24a560 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################

-LIBCONFUSE_VERSION = 2.7
-LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.gz
-LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse/
+LIBCONFUSE_VERSION = V2_7
+LIBCONFUSE_SITE = $(call github,martinh,libconfuse,$(LIBCONFUSE_VERSION))
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPT = --disable-rpath
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = src/confuse.c

+LIBCONFUSE_AUTORECONF = YES
+LIBCONFUSE_DEPENDENCIES += host-gettext
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))


-- 
?lvaro G?mez Machado
