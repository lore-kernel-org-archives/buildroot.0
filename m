From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 May 2015 00:59:31 +0200
Subject: [Buildroot] [git commit] host-autoconf-archive: install to a
	non-standard location
Message-ID: <20150514230016.2D0A57FADF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c490f00c8d8a7d34ed6da9130cef8a5e97cef56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-autoconf-archive package was added to provide the necessary
autoconf macros for the libsigrok package, and later also used for the
thrift package.

However, it installs its autoconf macro in
$(HOST_DIR)/usr/share/aclocal, which is part of the include directory
of autoconf macros used for all autoreconf invocations. Unfortunately,
using those macros for all packages is causing a number of
regressions: one on host-ola fixed in commit
884af65fd5ddc548f19a26162f905a32ef0b53b3, and one in snmpp. Those
packages are autoreconf'ed, but if they are autoreconf'ed with the
autoconf-archive macros installed, they no longer work.

To solve this problem, this commit implements a simple solution that
makes using host-autoconf-archive macros an opt-in mechanism. To
achieve this, the autoconf-archive package is modified to install its
macros in a special directory, and only the packages that really want
to use those macros will have to pass a -I flag pointing to this
directory in their <pkg>_AUTORECONF_OPTS variable.

Fixes:

  http://autobuild.buildroot.org/results/712/712c8083b9eeafa41b60790961028c40b28f59ad/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/autoconf-archive/autoconf-archive.mk |    1 +
 package/libsigrok/libsigrok.mk               |    1 +
 package/thrift/thrift.mk                     |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index bd3b0c8..673a57f 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -9,5 +9,6 @@ AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPLv3+ with exception
 AUTOCONF_ARCHIVE_LICENSE_FILES = COPYING COPYING.EXCEPTION
+HOST_AUTOCONF_ARCHIVE_INSTALL_OPTS = aclocaldir=$(HOST_DIR)/usr/share/autoconf-archive install
 
 $(eval $(host-autotools-package))
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 7394f64..21d8259 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -48,6 +48,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
 LIBSIGROK_CONF_OPTS += --enable-cxx
+LIBSIGROK_AUTORECONF_OPTS += -I $(HOST_DIR)/usr/share/autoconf-archive
 LIBSIGROK_DEPENDENCIES += \
 	host-autoconf-archive \
 	glibmm \
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index b4b3a2c..a40ddad 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -21,6 +21,7 @@ HOST_THRIFT_CONF_OPTS = --with-sysroot=$(HOST_DIR) \
 	--disable-tests \
 	--disable-tutorial
 THRIFT_AUTORECONF = YES
+THRIFT_AUTORECONF_OPTS = -I $(HOST_DIR)/usr/share/autoconf-archive
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
 
