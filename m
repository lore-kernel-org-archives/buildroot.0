From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  6 May 2014 20:59:50 +0200
Subject: [Buildroot] [PATCH] popt: fix build issue due to glob functions on
	Blackfin
Message-ID: <1399402790-7465-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While the Blackfin external uClibc toolchains have <glob.h>, they
don't implement all the functions needed by popt, causing build
failures. One solution would have been to disable popt with such
toolchains, but this would have meant propagating this additional
dependency to the numerous reverse dependencies of popt. Instead, this
commit chooses to make popt build on Blackfin external toolchains by
disabling the usage of <glob.h> functions altogether.

Fixes:

  http://autobuild.buildroot.org/results/bfc/bfcb2ed27debafc584e133f5ae11ad2061ad2b16/build-end.log
  http://autobuild.buildroot.org/results/410/410c8f3a0c7ca2c7098a47c30088038411635ae4/build-end.log

and gazillion of similar failures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/popt/popt.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 180972a..9f2d070 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -13,6 +13,13 @@ POPT_LICENSE_FILES = COPYING
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
+# The external Blackfin toolchains have <glob.h>, but not all the
+# necessary uClibc options for glob functions, so we force disable the
+# usage of the glob functions for these toolchains.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
+POPT_CONF_ENV += ac_cv_header_glob_h=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 POPT_CONF_ENV += am_cv_lib_iconv=yes
 POPT_CONF_OPT += --with-libiconv-prefix=$(STAGING_DIR)/usr
-- 
1.9.2
