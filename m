From: Mike King <mkwired@gmail.com>
Date: Tue, 12 Jul 2016 15:06:13 -0400
Subject: [Buildroot] help please
Message-ID: <CAAfO8NyXP5-PFMoC3bN7v8NRD+jzcvgtBfgZZXKijGquARhU8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am hoping someone will help me.  I am trying to create a package for
linux-gpib.  I can get it to configure and build but not install.  I
have listed below the package files that I have created.  I am not an
autotools expert.


###Config.in FILE###
config BR2_PACKAGE_LINUX_GPIB
bool "linux-gpib"
help
 The Linux GPIB Package is a support package for GPIB (IEEE 488) hardware.
 The package contains kernel driver modules, and a C user-space library with
 Guile, Perl, PHP, Python and TCL bindings. The API of the C library is intended
 to be compatible with National Instrument's GPIB library.

 http://linux-gpib.sourceforge.net

###linux-gpib.mk FILE###
################################################################################
#
# linux-gpib
#
################################################################################

LINUX_GPIB_VERSION = 4.0.3
LINUX_GPIB_SITE =
http://downloads.sourceforge.net/project/linux-gpib/linux-gpib%20for%203.x.x%20and%202.6.x%20kernels/$(LINUX_GPIB_VERSION)
LINUX_GPIB_SOURCE = linux-gpib-$(LINUX_GPIB_VERSION).tar.gz
LINUX_GPIB_LICENSE = GPLv2
LINUX_GPIB_LICENSE_FILES = COPYING
LINUX_GPIB_INSTALL_STAGING = YES
LINUX_GPIB_AUTORECONF = YES
LINUX_GPIB_CONF_OPTS = --with-linux-srcdir=$(LINUX_DIR)/

$(eval $(autotools-package))


###PATCH FILE###
--- linux-gpib-4.0.3/configure.ac 2016-04-09 13:34:55.000000000 +0000
+++ linux-gpib-4.0.3/configure.ac.new 2016-07-05 01:37:47.524290832 +0000
@@ -30,9 +30,10 @@
 [ISODATE=`date +%Y-%m-%d`]
 AC_SUBST([ISODATE])

-AC_CHECK_FILE([util/.scm_version.tmp],
-  [SCM_VERSION=[$VERSION"\ [r"`cat util/.scm_version.tmp`"]"]],
-  [SCM_VERSION=$VERSION])
+#AC_CHECK_FILE([util/.scm_version.tmp],
+#  [SCM_VERSION=[$VERSION"\ [r"`cat util/.scm_version.tmp`"]"]],
+#  [SCM_VERSION=$VERSION])
+SCM_VERSION=4.0.3

 AC_SUBST(SCM_VERSION)

--- linux-gpib-4.0.3/drivers/Makefile.am 2016-04-09 09:33:14.000000000 -0400
+++ linux-gpib-4.0.3/drivers/Makefile.am.new 2016-07-09 11:13:37.356298300 -0400
@@ -28,7 +28,7 @@
  CC="$(LINUX_CC) -I at abs_top_srcdir@
-I at abs_top_srcdir@/drivers/gpib/include -I at abs_top_srcdir@/include" \
  SUBDIRS="$(GPIB_ABS_MODULE_SUBDIR)"

-install-data-hook: device-file-check /etc/gpib.conf
+install-data-hook:
  $(MAKE) -C $(LINUX_SRCDIR) V=1 modules_install\
  CC="$(LINUX_CC) -I at abs_top_srcdir@ -I at abs_top_srcdir@/driver/include
-I at abs_top_srcdir@/include" \
  SUBDIRS="$(GPIB_ABS_MODULE_SUBDIR)" INSTALL_MOD_DIR="gpib"
