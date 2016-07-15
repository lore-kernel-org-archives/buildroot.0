From: Mike King <mkwired@gmail.com>
Date: Thu, 14 Jul 2016 21:26:32 -0400
Subject: [Buildroot] help please
In-Reply-To: <20160714180743.GC3737@free.fr>
References: <CAAfO8NyXP5-PFMoC3bN7v8NRD+jzcvgtBfgZZXKijGquARhU8Q@mail.gmail.com>
 <20160712204436.GE3680@free.fr>
 <CAAfO8NykMv=DCdn=rV6tCFOfRvZQf84V82ZrKgtJW-422F9nfQ@mail.gmail.com>
 <20160713182135.GA3687@free.fr>
 <CAAfO8NwwwFGA-gCeFnOYs0HAbDAAnKs6nHnWusA-LzWpTWQ8ag@mail.gmail.com>
 <20160714180743.GC3737@free.fr>
Message-ID: <CAAfO8NyLYAt6ch5WxT0vZJ=DnuLqJz+o=-me5nnv3q7ANZPT3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

I have added an option for the python binding.  It builds but it does
not install into the target filesystem.

I am far outside of my comfort zone.  I have a lot to learn.


diff --git a/package/linux-gpib/0006-fix.patch
b/package/linux-gpib/0006-fix.patch
new file mode 100644
index 0000000..bd8ac7e
--- /dev/null
+++ b/package/linux-gpib/0006-fix.patch
@@ -0,0 +1,112 @@
+--- linux-gpib-4.0.3/configure.ac 2016-07-14 19:42:36.836946372 +0000
++++ linux-gpib-4.0.3/configure.ac.new 2016-07-14 19:47:05.336949101 +0000
+@@ -40,13 +40,13 @@
+ AC_ENABLE_STATIC([no])
+ AC_ARG_ENABLE([isa],[  --enable-isa Enable support for ISA cards in
GPIB kernel drivers],
+ [ENABLE_ISA=$enableval],[ENABLE_ISA="no"])
+-if test "$ENABLE_ISA" == "yes" ; then
++if test "$ENABLE_ISA" = "yes" ; then
+ AC_DEFINE([GPIB_CONFIG_ISA],[1],[Define to enable ISA support in drivers])
+ fi
+ AC_SUBST([ENABLE_ISA])
+ AC_ARG_ENABLE([pcmcia],[  --enable-pcmcia Enable support for PCMCIA
cards in GPIB kernel drivers],
+ [ENABLE_PCMCIA=$enableval],[ENABLE_PCMCIA="no"])
+-if test "$ENABLE_PCMCIA" == "yes" ; then
++if test "$ENABLE_PCMCIA" = "yes" ; then
+ AC_DEFINE([GPIB_CONFIG_PCMCIA],[1],[Define to enable pcmcia support
in drivers])
+ fi
+ AC_ARG_ENABLE(
+@@ -55,7 +55,7 @@
+     [BUILD_DRIVER=$enableval],[BUILD_DRIVER="yes"])
+ AC_ARG_ENABLE([driver-debug],[  --enable-driver-debug Enable debug
spam to console in GPIB kernel drivers],
+ [ENABLE_DRIVER_SPAM=$enableval],[ENABLE_DRIVER_SPAM="no"])
+-if test "$ENABLE_DRIVER_SPAM" == "yes" ; then
++if test "$ENABLE_DRIVER_SPAM" = "yes" ; then
+ AC_DEFINE([GPIB_CONFIG_KERNEL_DEBUG],[1],[Define to enable debug
spam to console in drivers])
+ fi
+ AC_ARG_ENABLE([guile-binding],[  --disable-guile-binding Disable
Guile binding to libgpib],
+@@ -75,7 +75,7 @@
+ AC_ARG_WITH([linux-srcdir],
+ [  --with-linux-srcdir=DIR location of Linux kernel source directory
[[DIR=/lib/modules/$(uname -r)/build/]]],
+ [LINUX_SRCDIR=$withval],[LINUX_SRCDIR=/lib/modules/$(uname -r)/build/])
+-if test "$LINUX_SRCDIR" == "no" ; then
++if test "$LINUX_SRCDIR" = "no" ; then
+ AC_MSG_WARN([A Linux kernel source directory is required to compile
driver modules.  Use --with-linux-srcdir=DIR.])
+ fi
+ AC_SUBST([LINUX_SRCDIR])
+@@ -106,16 +106,16 @@
+ AC_PROG_YACC
+ AC_PROG_LIBTOOL
+ AC_PATH_PROG([JW_PATH], [jw], [no])
+-if test "$JW_PATH" == "no" ; then
++if test "$JW_PATH" = "no" ; then
+ AC_MSG_NOTICE([docbook-tools (jw) not found, disabling documentation])
+ BUILD_DOCS="no"
+ fi
+ AC_PATH_PROG([DEPMOD], [depmod], [true],
[PATH:/sbin:/usr/sbin:/usr/local/sbin])
+-if test "$DEPMOD" == "true" ; then
++if test "$DEPMOD" = "true" ; then
+ AC_MSG_WARN([unable to find the 'depmod' program.  Is it in your path?])
+ fi
+
+-if test "$BIND_PYTHON" == "yes"; then
++if test "$BIND_PYTHON" = "yes"; then
+ AM_PATH_PYTHON()
+ PYTHON_MAJOR_VERSION=$(echo $PYTHON_VERSION | cut -d. -f1 )
+ PYTHON_MINOR_VERSION=$(echo $PYTHON_VERSION | cut -d. -f2 )
+@@ -125,11 +125,11 @@
+ fi
+ fi
+ AC_PATH_PROG([PERL], [perl], [no], [])
+-if test "$PERL" == "no"; then
++if test "$PERL" = "no"; then
+ AC_MSG_NOTICE([perl not found, disabling perl binding])
+ BIND_PERL="no"
+ fi
+-if test "$BIND_TCL" == "yes"; then
++if test "$BIND_TCL" = "yes"; then
+    SC_PATH_TCLCONFIG
+    if [[ $no_tcl ]]; then
+         AC_MSG_NOTICE([TCL config not found, disabling TCL binding])
+@@ -139,7 +139,7 @@
+    fi
+ fi
+ AC_PATH_PROG([PHP_CONFIG], [php-config], [no],[])
+-if test "$PHP_CONFIG" == "no"; then
++if test "$PHP_CONFIG" = "no"; then
+ AC_MSG_NOTICE([php-config not found, disabling PHP binding])
+ BIND_PHP="no"
+ fi
+@@ -161,7 +161,7 @@
+
+ AC_CHECK_HEADER(readline/readline.h,[readline_h=yes])
+ AC_CHECK_HEADER(readline/history.h,[history_h=yes])
+-if test $readline_lib == "yes" -a $readline_h == "yes" -a $history_h
== "yes"; then
++if test $readline_lib = "yes" -a $readline_h = "yes" -a $history_h =
"yes"; then
+    AC_SUBST([LIB_READLINE_CFLAGS], ["-DREADLINE"])
+ fi
+
+@@ -203,17 +203,17 @@
+ echo Configuration:
+ AM_CONDITIONAL([BUILD_DRIVER],[test "$BUILD_DRIVER" = "yes"])
+ echo "Build driver: $BUILD_DRIVER"
+-AM_CONDITIONAL([BUILD_DOCS], [test "$BUILD_DOCS" == "yes"])
++AM_CONDITIONAL([BUILD_DOCS], [test "$BUILD_DOCS" = "yes"])
+ echo "SGML Documentation: $BUILD_DOCS"
+-AM_CONDITIONAL([BIND_GUILE], [test "$BIND_GUILE" == "yes"])
++AM_CONDITIONAL([BIND_GUILE], [test "$BIND_GUILE" = "yes"])
+ echo "Guile binding: $BIND_GUILE"
+-AM_CONDITIONAL([BIND_PERL], [test "$BIND_PERL" == "yes"])
++AM_CONDITIONAL([BIND_PERL], [test "$BIND_PERL" = "yes"])
+ echo "Perl binding: $BIND_PERL"
+-AM_CONDITIONAL([BIND_PHP], [test "$BIND_PHP" == "yes"])
++AM_CONDITIONAL([BIND_PHP], [test "$BIND_PHP" = "yes"])
+ echo "PHP binding: $BIND_PHP"
+-AM_CONDITIONAL([BIND_PYTHON], [test "$BIND_PYTHON" == "yes"])
++AM_CONDITIONAL([BIND_PYTHON], [test "$BIND_PYTHON" = "yes"])
+ echo "Python binding: $BIND_PYTHON"
+-AM_CONDITIONAL([BIND_TCL], [test "$BIND_TCL" == "yes"])
++AM_CONDITIONAL([BIND_TCL], [test "$BIND_TCL" = "yes"])
+ echo "TCL binding: $BIND_TCL"
+
+ AC_OUTPUT([\
diff --git a/package/linux-gpib/Config.in b/package/linux-gpib/Config.in
index 789daa8..a117883 100644
--- a/package/linux-gpib/Config.in
+++ b/package/linux-gpib/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LINUX_GPIB
+menuconfig BR2_PACKAGE_LINUX_GPIB
  bool "linux-gpib"
  depends on BR2_LINUX_KERNEL
  select BR2_LINUX_NEEDS_MODULES
@@ -9,3 +9,15 @@ config BR2_PACKAGE_LINUX_GPIB
   to be compatible with National Instrument's GPIB library.

   http://linux-gpib.sourceforge.net
+
+if BR2_PACKAGE_LINUX_GPIB
+
+config BR2_PACKAGE_LINUX_GPIB_PYTHON
+ bool "Python support for linux-gpib"
+ depends on BR2_PACKAGE_PYTHON3
+ help
+  Adds python support for linux-gpib.
+
+  http://linux-gpib.sourceforge.net
+
+endif
diff --git a/package/linux-gpib/linux-gpib.mk b/package/linux-gpib/linux-gpib.mk
index 7796967..611908e 100644
--- a/package/linux-gpib/linux-gpib.mk
+++ b/package/linux-gpib/linux-gpib.mk
@@ -17,12 +17,24 @@ LINUX_GPIB_CONF_OPTS = \
  --disable-guile-binding \
  --disable-perl-binding \
  --disable-php-binding \
- --disable-python-binding \
  --disable-tcl-binding \
  --disable-driver \
  --disable-isa \
  --with-linux-srcdir=$(LINUX_DIR)

+define LINUX_GPIB_INSTALL_PYTHON_MODULES
+ #$(INSTALL) -m 755 util/templates/gpib.conf $(TARGET_DIR)/etc/gpib.conf
+endef
+
+ifeq ($(BR2_PACKAGE_LINUX_GPIB_PYTHON),y)
+ LINUX_GPIB_DEPENDENCIES += python3
+ LINUX_GPIB_POST_INSTALL_TARGET_HOOKS += \
+ LINUX_GPIB_INSTALL_PYTHON_MODULES
+else
+ LINUX_GPIB_CONF_OPTS += \
+ --disable-python-binding
+endif
+
 define LINUX_GPIB_INCLUDE_SYMLINK
  ln -s . $(@D)/drivers/gpib/include/gpib
 endef


On Thu, Jul 14, 2016 at 2:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Mike, All,
>
> [Please, keep the list in Cc: when you reply]
>
> On 2016-07-14 02:11 -0400, Mike King spake thusly:
>> Buildroot can now build and install the package minus the drivers of
>> course.  Thanks again!
>
> So, I've done some work to build the kernel modules, too. It works now,
> but it was far from being easy.
>
> linux-gpib uses such a weird, deviously-twisted buildsystem, that
> building the kernel modules, especially in cross-compilation, is not
> trivial:
>
>   - they forget to pass correct include paths;
>
>   - they override standard kernel headers because they want to provide
>     legacy handling (but even fail at that).
>
> I've done a few patches to fix that (and the rest of the install
> procedure, btw) so that linux-gpib now should work, except for the
> language bindings, that are yet another challenge to address... :-/
>
> You'll find my branch updated there:
>
>     https://github.com/yann-morin-1998/buildroot/commits/yem/linux-gpib
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
