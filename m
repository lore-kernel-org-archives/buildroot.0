From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2014 22:04:32 +0100
Subject: [Buildroot] [git commit] mtr: new package
Message-ID: <20140202210720.1C19E9C755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22bbca9b91289e063852333ea9044b82cf1de37d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in     |    1 +
 package/mtr/Config.in |    9 +++++++++
 package/mtr/mtr.mk    |   24 ++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 49b3488..93d23cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -876,6 +876,7 @@ source "package/mongoose/Config.in"
 source "package/mongrel2/Config.in"
 source "package/mrouted/Config.in"
 source "package/msmtp/Config.in"
+source "package/mtr/Config.in"
 source "package/mutt/Config.in"
 source "package/nbd/Config.in"
 source "package/ncftp/Config.in"
diff --git a/package/mtr/Config.in b/package/mtr/Config.in
new file mode 100644
index 0000000..842d6ca
--- /dev/null
+++ b/package/mtr/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MTR
+	bool "mtr"
+	# res_mkquery() only available in 0.9.33+
+	depends on !BR2_UCLIBC_VERSION_0_9_31 && !BR2_UCLIBC_VERSION_0_9_32
+	help
+	  mtr combines the functionality of the 'traceroute' and 'ping'
+	  programs in a single network diagnostic tool.
+
+	  http://www.bitwizard.nl/mtr/
diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
new file mode 100644
index 0000000..a96bf0c
--- /dev/null
+++ b/package/mtr/mtr.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# mtr
+#
+################################################################################
+
+MTR_VERSION = 0.85
+MTR_SITE = ftp://ftp.bitwizard.nl/mtr
+MTR_CONF_OPT = --without-gtk --without-glib
+MTR_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_NCURSES),ncurses)
+MTR_LICENSE = GPLv2
+MTR_LICENSE_FILES = COPYING
+
+# uClibc has res_ninit but not res_nmkquery
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+define MTR_DISABLE_RES_NINIT
+	$(SED) 's/#ifdef res_ninit/#if 0/' \
+		$(@D)/dns.c
+endef
+endif
+
+MTR_POST_PATCH_HOOKS += MTR_DISABLE_RES_NINIT
+
+$(eval $(call autotools-package))
