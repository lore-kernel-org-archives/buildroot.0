From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 11:22:45 +0200
Subject: [Buildroot] [git commit branch/next] libpam-tacplus: new package
Message-ID: <20150828092433.CD56E81EAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b2990217e22cea11bfc72d6913e3bc6615c5650
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - change the inclusion location in package/Config.in to be with the
    other linux-pam plugins.
  - fix indentation of the Config.in file.
  - fix build of the package when a toolchain without SSP support is
    used.
  - fix installation location of the PAM module: it was installed in
    /usr/lib/security, while all other PAM modules are in
    /lib/security.
  - adjust the ordering of the variables in the .mk file to be a bit
    more logical.
  - remove passing of $(TARGET_CONFIGURE_OPTS) in <pkg>_CONF_ENV as it
    is not needed: it is already done by the autotools-package
    infrastructure.]

Signed-off-by: Giovanni Zantedeschi <giovanni.zantedeschi@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/libpam-tacplus/Config.in         |    9 +++++++++
 package/libpam-tacplus/libpam-tacplus.mk |   21 +++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b92dc05..1bc31fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1096,6 +1096,7 @@ menu "Other"
 if BR2_PACKAGE_LINUX_PAM
 comment "linux-pam plugins"
 	source "package/libpam-radius-auth/Config.in"
+	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/lttng-libust/Config.in"
 	source "package/mpc/Config.in"
diff --git a/package/libpam-tacplus/Config.in b/package/libpam-tacplus/Config.in
new file mode 100644
index 0000000..2d80809
--- /dev/null
+++ b/package/libpam-tacplus/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBPAM_TACPLUS
+	bool "libpam-tacplus"
+	help
+	  TACACS+ protocol client library and PAM module in C. This
+	  PAM module support authentication, authorization (account
+	  management) and accounting (session management)performed
+	  using TACACS+ protocol designed by Cisco.
+
+	  https://github.com/jeroennijhof/pam_tacplus
diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
new file mode 100644
index 0000000..6696d89
--- /dev/null
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# libpam-tacplus
+#
+################################################################################
+
+LIBPAM_TACPLUS_VERSION = 1.3.9
+LIBPAM_TACPLUS_SITE = $(call github,jeroennijhof,pam_tacplus,$(LIBPAM_TACPLUS_VERSION))
+LIBPAM_TACPLUS_LICENSE = GPLv2+
+LIBPAM_TACPLUS_LICENSE_FILES = COPYING
+LIBPAM_TACPLUS_DEPENDENCIES = linux-pam
+# Fetching from github, we need to generate the configure script
+LIBPAM_TACPLUS_AUTORECONF = YES
+LIBPAM_TACPLUS_AUTORECONF_OPTS = -I m4
+LIBPAM_TACPLUS_INSTALL_STAGING = YES
+LIBPAM_TACPLUS_CONF_ENV = \
+	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+LIBPAM_TACPLUS_CONF_OPTS = \
+	--enable-pamdir=/lib/security
+
+$(eval $(autotools-package))
