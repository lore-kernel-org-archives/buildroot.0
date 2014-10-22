From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 22:33:43 +0200
Subject: [Buildroot] [git commit] libupnpp: new package
Message-ID: <20141022203443.D2363B0634@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98913307bc7a784469e9868993f7ac0506d33e07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: adjust dependencies on the comment.]

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/libupnpp/Config.in   |   23 +++++++++++++++++++++++
 package/libupnpp/libupnpp.mk |   14 ++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 89b46dc..4626f00 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -816,6 +816,7 @@ menu "Networking"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
 	source "package/libupnp/Config.in"
+	source "package/libupnpp/Config.in"
 	source "package/libvncserver/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/neon/Config.in"
diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
new file mode 100644
index 0000000..5a48f97
--- /dev/null
+++ b/package/libupnpp/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_LIBUPNPP
+	bool "libupnpp"
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBUPNP
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE # libupnp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
+	help
+	  The libupnpp C++ library wraps libupnp for easier use by upmpdcli and
+	  upplay.
+
+	  http://www.lesbonscomptes.com/upmpdcli/
+
+comment "libupnpp needs a toolchain w/ C++, largefile, threads"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
new file mode 100644
index 0000000..d46de14
--- /dev/null
+++ b/package/libupnpp/libupnpp.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libupnpp
+#
+################################################################################
+
+LIBUPNPP_VERSION = 0.8.5
+LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
+LIBUPNPP_LICENSE = GPLv2+
+LIBUPNPP_LICENSE_FILES = COPYING
+LIBUPNPP_INSTALL_STAGING = YES
+LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
+
+$(eval $(autotools-package))
