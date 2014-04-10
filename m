From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 10 Apr 2014 16:59:25 +0100
Subject: [Buildroot] [PATCH 1/2] systemd: Build legacy pc files when
	liblogging is
Message-ID: <1397145566-11243-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The liblogging package stills searching for "libsystemd-journal.pc" in
the configure phase. The default behaviour from systemd-209 and later
versions is to merge the libraries and ".pc" files into single
libsystemd{.pc} files, so the old "libsystemd-*{.pc}" files don't exist
anymore and liblogging fails at configure phase with a message like this
one:

........................................................................
checking for LIBSYSTEMD_JOURNAL... no
configure: error: Package requirements (libsystemd-journal >= 197) were
not met:

Package libsystemd-journal was not found in the pkg-config search path.
Perhaps you should add the directory containing `libsystemd-journal.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libsystemd-journal' found
........................................................................

Passing the "--enable-compat-libs" option to the systemd configure
script will install the separate libraries and ".pc" files, so we add
that option just in case the liblogging package had been selected.  We
can revert this change when liblogging upstream fixes it's configure
script to check for "libsystemd.pc" instead of "libsystemd-journal.pc".

Fixes:
   http://autobuild.buildroot.net/results/32c/32c636020600aa3f378d326c84fac82eb1fb2871/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/systemd/systemd.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ecedfce..3d7f42e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -46,6 +46,12 @@ SYSTEMD_CONF_OPT += \
 	--disable-dbus \
 	--without-python
 
+# liblogging still needs the old-style libsystemd-*.pc files
+# remove this block when liblogging upstream fix it
+ifeq ($(BR2_PACKAGE_LIBLOGGING),y)
+SYSTEMD_CONF_OPT += --enable-compat-libs
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_CONF_OPT += --enable-acl
 SYSTEMD_DEPENDENCIES += acl
-- 
1.7.1
