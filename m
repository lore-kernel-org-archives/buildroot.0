From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 May 2020 16:16:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/libusb-compat: set LIBUSB_1_0_SONAME
Message-ID: <20200531141623.28171-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LIBUSB_1_0_SONAME is detected since version 0.1.6 and
https://github.com/libusb/libusb-compat-0.1/commit/b6f5a2fe12ca19d658d7180e106254b31cf1f8f5

The detection mechanism is based on sed, here are the more relevant
parts:

 shrext_regexp=`echo "$shrext_cmds" | sed 's/\./\\\\./'`
[...]
 [AS_VAR_SET([ac_Lib_SONAME], [`ldd conftest$ac_exeext | grep 'lib[$2]'$shrext_regexp | sed 's/^@<:@ \t@:>@*lib[$2]'$shrext_regexp'/lib[$2]'$shrext_regexp'/;s/@<:@ \t@:>@.*$//'`])])

However, this mechanism is broken with sed 4.7 and will return the
following 'silent' error:

checking for SONAME of libusb-1.0... sed: -e expression #1, char 40: Invalid back reference
unknown

Moreover, it also raises the following build failure on one of the
autobuilder because an empty line is added to LIBUSB_1_0_SONAME:

checking for SONAME of libusb-1.0... checking
libusb-1.0.so.0
checking for GNU extensions of errno.h... no
configure: WARNING: cache variable au_cv_lib_soname_LIBUSB_1_0 contains a newline
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating libusb.pc
config.status: creating libusb-config
config.status: creating Makefile
config.status: creating libusb/Makefile
config.status: creating examples/Makefile
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing default commands
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls
configure: WARNING: cache variable au_cv_lib_soname_LIBUSB_1_0 contains a newline
[7m>>> libusb-compat 0.1.7 Building[27m
PATH="/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/bin:/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/sbin:/accts/mlweber1/bin:/accts/mlweber1/libexec/git-core:/accts/mlweber1/usr/bin:/accts/mlweber1/usr/local/bin:/accts/mlweber1/bin:/accts/mlweber1/libexec/git-core:/accts/mlweber1/usr/bin:/accts/mlweber1/usr/local/bin:/accts/mlweber1/bin:/accts/mlweber1/libexec/git-core:/accts/mlweber1/usr/bin:/accts/mlweber1/usr/local/bin:/accts/mlweber1/bin:/accts/mlweber1/libexec/git-core:/accts/mlweber1/usr/bin:/accts/mlweber1/usr/local/bin:/accts/mlweber1/bin:/accts/mlweber1/libexec/git-core:/accts/mlweber1/usr/bin:/accts/mlweber1/usr/local/bin:/accts/mlweber1/bin:/accts/mlweber1/libexec/git-core:/accts/mlweber1/usr/bin:/accts/mlweber1/usr/local/bin:/accts/mlweber1/bin:/accts/mlweber1/libexec/git-core:/accts/mlweber1/usr/bin:/accts/mlweber1/usr/local/bin:/accts/mlweber1/bin:/accts/mlweber1/libexec/git-core:/accts/mlweber1/usr/bin:/accts/mlweber1/usr/local/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin"  /usr/bin/make -j8  -C /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/libusb-compat-0.1.7/
make[1]: Entering directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/libusb-compat-0.1.7'
Makefile:284: *** missing separator.  Stop.

We could patch patch m4/au_check_lib_soname.m4 to fix the mechanism
however this is difficult without reproducing the autobuilder failure
and upstream seems dead so just set LIBUSB_1_0_SONAME

Fixes:
 - http://autobuild.buildroot.org/results/12d771d85d30594929cfe3e1c783fc70857e7f5f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libusb-compat/libusb-compat.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index f94aa96ada..73ee9ec241 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -15,5 +15,9 @@ LIBUSB_COMPAT_CONFIG_SCRIPTS = libusb-config
 LIBUSB_COMPAT_LICENSE = LGPL-2.1+
 LIBUSB_COMPAT_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_STATIC_LIBS),)
+LIBUSB_COMPAT_CONF_ENV += LIBUSB_1_0_SONAME=libusb-1.0.so.0
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.26.2
