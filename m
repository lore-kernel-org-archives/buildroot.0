From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:38:38 +0200
Subject: [Buildroot] [git commit] sispmctl: new package
Message-ID: <20140609123933.A16859CF77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b0a4a0a99d40a968960af9350923946eb69f696
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Add missing select of BR2_PACKAGE_LIBUSB, since
   BR2_PACKAGE_LIBUSB_COMPAT depends on it
 - Add missing thread dependency, since libusb requires threads.
 - Add missing wide-char dependency. Without wide char support,
   sispmctl doesn't build.
 - Rewrap the Config.in help text, and remove trailing whitespaces.
 - License is GPLv2+, not GPLv2.
 - Remove --disable-dependency-tracking from <pkg>_CONF_OPT. That's a
   global, standard, autoconf option, and there's no reason to pass it
   at the per-package level.]

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/sispmctl/Config.in   |   17 +++++++++++++++++
 package/sispmctl/sispmctl.mk |   16 ++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0440ce8..e234054 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -343,6 +343,7 @@ source "package/sane-backends/Config.in"
 source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
 source "package/sg3_utils/Config.in"
+source "package/sispmctl/Config.in"
 source "package/smartmontools/Config.in"
 source "package/smstools3/Config.in"
 source "package/snowball-hdmiservice/Config.in"
diff --git a/package/sispmctl/Config.in b/package/sispmctl/Config.in
new file mode 100644
index 0000000..8070802
--- /dev/null
+++ b/package/sispmctl/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_SISPMCTL
+	bool "sispmctl"
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
+	help
+	  sispmctl is an application enabling the use of the GEMBIRD
+	  SiS-PM and mSiS(sispm) USB-controlled power-outlet device
+	  under Linux.  Note that the device is also sold under
+	  different Names, i.e. as "IntelliPlug" in Germany.
+
+	  http://sispmctl.sourceforge.net/
+
+comment "sispmctl needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/sispmctl/sispmctl.mk b/package/sispmctl/sispmctl.mk
new file mode 100644
index 0000000..2d2becf
--- /dev/null
+++ b/package/sispmctl/sispmctl.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# sispmctl
+#
+################################################################################
+
+SISPMCTL_VERSION = 3.1
+SISPMCTL_SITE = http://downloads.sourceforge.net/project/sispmctl/sispmctl/sispmctl-$(SISPMCTL_VERSION)
+SISPMCTL_LICENSE = GPLv2+
+SISPMCTL_LICENSE_FILES = LICENCE
+SISPMCTL_DEPENDENCIES = libusb-compat
+
+SISPMCTL_CONF_ENV = HAVELIBUSB=$(STAGING_DIR)/usr/bin/libusb-config
+SISPMCTL_CONF_OPT = --enable-webless
+
+$(eval $(autotools-package))
