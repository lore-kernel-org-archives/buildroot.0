From: Jenkins, Lee (ISS Houston) <Lee.Jenkins@hp.com>
Date: Thu, 18 Jul 2013 16:46:14 +0000
Subject: [Buildroot] need help adding apache to buildroot
In-Reply-To: <51D9782E.1060901@relinux.de>
References: <2DD0B9C711CDFC45A3A266C78966CE7F40E3A14E@G4W3291.americas.hpqcorp.net>
 <51D9782E.1060901@relinux.de>
Message-ID: <2DD0B9C711CDFC45A3A266C78966CE7F451B4618@G4W3291.americas.hpqcorp.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday, July 07, 2013 9:16 AM, Stephan Hoffmann wrote:
> Hello Lee,
>
> did you finally manage to build apache? If yes, could you provide a patch?
>
> Kind Regards
>
> Stephan

Stephan,

I did. It's a bit of a hack. Understatement, let me try again. It's a huge hack.

Some parts of buildroot are still pretty opaque to me and unfortunately I don't really have to the time to figure out how to make a proper patch.

I also had trouble with the patch command not recursing sub-directories. The diff file appeared to have the proper paths, but I'm obviously missing something.

Anyway, what I have works, but it clearly needs cleaning up before adding to buildroot and I just don't have the time to do it.

If anyone cares to try, I've included the makefile, Config, and startup script, plus the original patch/diff file and the break-out files that are called out in apache.mk.

Hopefully someone else with a little more expertise with buildroot and patch can clean these up for everyone else's benefit.

grace & peace,
Lee Jenkins

==========[ apache.mk ]==========

#############################################################
#
# apache
#
#############################################################

APACHE_VERSION    = 2.2.23
APACHE_SITE       = http://archive.apache.org/dist/httpd/
APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
APACHE_INSTALL_STAGING = YES
APACHE_PACKAGE_DIR=$(@D)/../../../package/apache

APACHE_CONF_ENV += \
        ac_cv_file__dev_zero=yes \
        ac_cv_func_setpgrp_void=yes \
        apr_cv_tcp_nodelay_with_cork=yes \
        ac_cv_sizeof_struct_iovec=8 \
        apr_cv_process_shared_works=yes \
        apr_cv_mutex_robust_shared=no \
        ac_cv_struct_rlimit=yes \
        ap_cv_void_ptr_lt_long=no \
        CC=/opt/Marvell_toolchain_201201/armv7-marvell-linux-gnueabi-softfp_i686/bin/arm-marvell-linux-gnueabi-gcc

APACHE_CONF_OPT += \
        --build=i686-pc-linux-gnu \
        --host=arm-marvell-linux-gnueabi \
        --enable-so \
        --enable-module=all

# the stock apache package provides two cross-compile options --host and
# --build that get passed into configure to allow make to distinguish between
# the build machine and the target machine, but they don't work as advertised.
#      http://www.devshed.com/c/a/Apache/Building-Apache-the-Way-You-Want-It/10/
# luckily, I found a patch that allows apache to be built using an additional
# variable CC_FOR_BUILD that fixes this problem. the patch was downloaded from
#      http://people.apache.org/~fuankg/diffs/httpd-2.2.x-cross_compile.diff
# strangely, the patch utility on my build machine would not apply patches
# to files in sub-directories. therefore I've divided the patch diff into
# parts for each directory and applied the patches separately.
# also, I tried using the patch hooks, but it appears that X_PRE_PATCH_HOOKS
# is only executing if X_PATCH is defined -- and X_PATCH requires the patch
# to be located at X_SITE and this patch is not located at the same site
# as the apache package. ugh. so the files get patched as the first step in
# the configure process below.

define APACHE_CONFIGURE_CMDS
    ( cd $(@D); ./buildconf )
        ( cd $(@D); patch -i $(APACHE_PACKAGE_DIR)/httpd-2.2.x-cross_compile-apache-root.diff )
        ( cd $(@D)/server; patch -i $(APACHE_PACKAGE_DIR)/httpd-2.2.x-cross_compile-apache-root-server.diff )
        ( cd $(@D)/srclib/pcre; patch -i $(APACHE_PACKAGE_DIR)/httpd-2.2.x-cross_compile-apache-root-srclib-pcre.diff )
        ( cd $(@D) && rm -rf config.cache; \
    $(APACHE_CONF_ENV) \
    ./configure \
    $(APACHE_CONF_OPT) \
    )
endef

APACHE_MAKE_ENV += \
    CC_FOR_BUILD=cc \
    CFLAGS_FOR_BUILD=

define APACHE_INSTALL_INIT_SCRIPT

    $(INSTALL) -m 0755 package/apache/S50apache $(TARGET_DIR)/etc/init.d/S50apache

endef

APACHE_POST_INSTALL_TARGET_HOOKS += APACHE_INSTALL_INIT_SCRIPT

$(eval $(call AUTOTARGETS,package,apache))

==========[ Config.in ]==========

config BR2_PACKAGE_APACHE
    bool "apache"
    help
      Apache web server software.

      http://httpd.apache.org/

==========[ S50apache ]==========

#!/bin/sh
#
# Start the network....
#

APACHE_DIR=/usr/local/apache2/bin

case "$1" in
  start)
    echo "Starting apache web server..."
    $APACHE_DIR/apachectl -k start
    ;;
  stop)
    echo -n "Stopping apache web server..."
    $APACHE_DIR/apachectl -k stop
    ;;
  restart|reload)
    $APACHE_DIR/apachectl -k stop
    $APACHE_DIR/apachectl -k start
    ;;
  *)
    echo $"Usage: $0 {start|stop|restart}"
    exit 1
esac

exit $?

==========[  httpd-2.2.x-cross_compile-apache-root.diff  ]==========

Index: configure.in
===================================================================
--- configure.in    (revision 1328718)
+++ configure.in    (working copy)
@@ -154,6 +154,14 @@
AC_PROG_CC
AC_PROG_CPP
+dnl In case of cross compilation we set CC_FOR_BUILD to cc unless
+dnl we got already CC_FOR_BUILD from environment.
+if test "x${build_alias}" != "x${host_alias}"; then
+  if test "x${CC_FOR_BUILD}" = "x"; then
+    CC_FOR_BUILD=cc
+  fi
+fi
+
if test "x${cache_file}" = "x/dev/null"; then
   # Likewise, ensure that CC and CPP are passed through to the pcre
   # configure script iff caching is disabled (the autoconf 2.5x default).
Index: acinclude.m4
===================================================================
--- acinclude.m4    (revision 1328718)
+++ acinclude.m4    (working copy)
@@ -53,6 +53,8 @@
   APACHE_SUBST(CPPFLAGS)
   APACHE_SUBST(CFLAGS)
   APACHE_SUBST(CXXFLAGS)
+  APACHE_SUBST(CC_FOR_BUILD)
+  APACHE_SUBST(CFLAGS_FOR_BUILD)
   APACHE_SUBST(LTFLAGS)
   APACHE_SUBST(LDFLAGS)
   APACHE_SUBST(LT_LDFLAGS)
@@ -568,7 +570,7 @@
{
     return sizeof(void *) < sizeof(long);
 }], [ap_cv_void_ptr_lt_long=no], [ap_cv_void_ptr_lt_long=yes],
-    [ap_cv_void_ptr_lt_long=yes])])
+    [ap_cv_void_ptr_lt_long="cross compile - not checked"])])
 if test "$ap_cv_void_ptr_lt_long" = "yes"; then
     AC_MSG_ERROR([Size of "void *" is less than size of "long"])

==========[  httpd-2.2.x-cross_compile-apache-root-server.diff  ]==========

Index: server/Makefile.in
===================================================================
--- server/Makefile.in  (revision 1328718)
+++ server/Makefile.in  (working copy)
@@ -21,9 +21,14 @@
include $(top_builddir)/build/rules.mk
include $(top_srcdir)/build/library.mk
+ifdef CC_FOR_BUILD
+gen_test_char: gen_test_char.c
+   $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -DCROSS_COMPILE -o $@ $<
+else
gen_test_char_OBJECTS = gen_test_char.lo
gen_test_char: $(gen_test_char_OBJECTS)
    $(LINK) $(EXTRA_LDFLAGS) $(gen_test_char_OBJECTS) $(EXTRA_LIBS)
+endif
 test_char.h: gen_test_char
    ./gen_test_char > test_char.h


==========[  httpd-2.2.x-cross_compile.diff  ]==========

Index: srclib/pcre/Makefile.in
===================================================================
--- srclib/pcre/Makefile.in (revision 1328718)
+++ srclib/pcre/Makefile.in (working copy)
@@ -11,8 +11,13 @@
 $(LTLIBRARY_OBJECTS) dftables.lo: config.h
+ifdef CC_FOR_BUILD
+dftables: dftables.c
+   $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -o $@ $<
+else
dftables: dftables.lo
    $(LINK) $(EXTRA_LDFLAGS) dftables.lo $(EXTRA_LIBS)
+endif
 $(srcdir)/chartables.c: dftables
    ./dftables $@


==========[  httpd-2.2.x-cross_compile-apache-root-srclib-pcre.diff  ]==========

Index: server/Makefile.in
===================================================================
--- server/Makefile.in  (revision 1328718)
+++ server/Makefile.in  (working copy)
@@ -21,9 +21,14 @@
include $(top_builddir)/build/rules.mk
include $(top_srcdir)/build/library.mk
+ifdef CC_FOR_BUILD
+gen_test_char: gen_test_char.c
+   $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -DCROSS_COMPILE -o $@ $<
+else
gen_test_char_OBJECTS = gen_test_char.lo
gen_test_char: $(gen_test_char_OBJECTS)
    $(LINK) $(EXTRA_LDFLAGS) $(gen_test_char_OBJECTS) $(EXTRA_LIBS)
+endif
 test_char.h: gen_test_char
    ./gen_test_char > test_char.h
Index: srclib/pcre/Makefile.in
===================================================================
--- srclib/pcre/Makefile.in (revision 1328718)
+++ srclib/pcre/Makefile.in (working copy)
@@ -11,8 +11,13 @@
 $(LTLIBRARY_OBJECTS) dftables.lo: config.h
+ifdef CC_FOR_BUILD
+dftables: dftables.c
+   $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -o $@ $<
+else
dftables: dftables.lo
    $(LINK) $(EXTRA_LDFLAGS) dftables.lo $(EXTRA_LIBS)
+endif
 $(srcdir)/chartables.c: dftables
    ./dftables $@
Index: configure.in
===================================================================
--- configure.in    (revision 1328718)
+++ configure.in    (working copy)
@@ -154,6 +154,14 @@
AC_PROG_CC
AC_PROG_CPP
+dnl In case of cross compilation we set CC_FOR_BUILD to cc unless
+dnl we got already CC_FOR_BUILD from environment.
+if test "x${build_alias}" != "x${host_alias}"; then
+  if test "x${CC_FOR_BUILD}" = "x"; then
+    CC_FOR_BUILD=cc
+  fi
+fi
+
if test "x${cache_file}" = "x/dev/null"; then
   # Likewise, ensure that CC and CPP are passed through to the pcre
   # configure script iff caching is disabled (the autoconf 2.5x default).
Index: acinclude.m4
===================================================================
--- acinclude.m4    (revision 1328718)
+++ acinclude.m4    (working copy)
@@ -53,6 +53,8 @@
   APACHE_SUBST(CPPFLAGS)
   APACHE_SUBST(CFLAGS)
   APACHE_SUBST(CXXFLAGS)
+  APACHE_SUBST(CC_FOR_BUILD)
+  APACHE_SUBST(CFLAGS_FOR_BUILD)
   APACHE_SUBST(LTFLAGS)
   APACHE_SUBST(LDFLAGS)
   APACHE_SUBST(LT_LDFLAGS)
@@ -568,7 +570,7 @@
{
     return sizeof(void *) < sizeof(long);
 }], [ap_cv_void_ptr_lt_long=no], [ap_cv_void_ptr_lt_long=yes],
-    [ap_cv_void_ptr_lt_long=yes])])
+    [ap_cv_void_ptr_lt_long="cross compile - not checked"])])
 if test "$ap_cv_void_ptr_lt_long" = "yes"; then
     AC_MSG_ERROR([Size of "void *" is less than size of "long"])

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130718/b1ff1e0b/attachment-0001.html>
