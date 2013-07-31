From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 19:02:07 +0200
Subject: [Buildroot] [git commit] cppcms: new package
Message-ID: <20130731170244.1803A9AF57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1765637172d31eee63ad955055786d75d8cb4ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: reformat header and Config.in help text, add dependency on
glibc since cppcms uses <monetary.h> functions that aren't available
in uClibc.]

Signed-off-by: Nicolas M??n??gale <nicolas.menegale@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/cppcms/Config.in |   32 ++++++++++++++++++++++++++++++++
 package/cppcms/cppcms.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6171693..7069d77 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -605,6 +605,7 @@ source "package/apr/Config.in"
 source "package/apr-util/Config.in"
 source "package/libcofi/Config.in"
 source "package/classpath/Config.in"
+source "package/cppcms/Config.in"
 source "package/elfutils/Config.in"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
new file mode 100644
index 0000000..14fd974
--- /dev/null
+++ b/package/cppcms/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_CPPCMS
+	bool "cppcms"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_LIBGCRYPT
+	depends on BR2_INSTALL_LIBSTDCPP
+	# cppcms uses <monetary.h> which doesn't exist in uClibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  CppCMS is a Free High Performance Web Development Framework
+	  (not a CMS) aimed for Rapid Web Application Development. It
+	  differs from most of other web development frameworks like:
+	  Python Django or Java Servlets on  the following aspects:
+
+           - It is designed and tuned to handle extremely high loads.
+	   - It uses modern C++ as primary development language in
+	     order to achieve the above goal.
+           - It is aimed on development of both Web Sites and Web
+             Services.
+
+	  http://cppcms.com
+
+config BR2_PACKAGE_CPPCMS_ICU
+	bool "enable icu support"
+	depends on BR2_PACKAGE_CPPCMS
+	select BR2_PACKAGE_ICU
+	help
+	  Using ICU allows advanced localization features into CppCMS,
+	  in another hand ICU is heavier than iconv.
+
+comment "cppcms requires a glibc toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
new file mode 100644
index 0000000..d2b1109
--- /dev/null
+++ b/package/cppcms/cppcms.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# cppcms
+#
+################################################################################
+
+CPPCMS_VERSION = 1.0.3
+CPPCMS_SOURCE = cppcms-$(CPPCMS_VERSION).tar.bz2
+CPPCMS_LICENSE = LGPLv3
+CPPCMS_LICENSE_FILE = COPYING.TXT
+CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
+CPPCMS_INSTALL_STAGING = YES
+
+CPPCMS_DEPENDENCIES = zlib pcre libgcrypt
+
+ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
+CPPCMS_CONF_OPT += -DDISABLE_ICONV=ON
+CPPCMS_DEPENDENCIES += icu
+endif
+
+# We copy cppcms_tmpl_cc from staging to host because this file can be
+# needed for compiling packages using cppcms. And it is not worth
+# creating a host package just for a python script.
+define CPPCMS_INSTALL_HOST_TOOLS
+	cp $(STAGING_DIR)/usr/bin/cppcms_tmpl_cc $(HOST_DIR)/usr/bin/cppcms_tmpl_cc
+endef
+CPPCMS_POST_INSTALL_STAGING_HOOKS += CPPCMS_INSTALL_HOST_TOOLS
+
+$(eval $(cmake-package))
