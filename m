From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 Feb 2015 14:53:18 +0100
Subject: [Buildroot] [PATCH 02/11 v7] package/libudev: new virtual package
In-Reply-To: <cover.1423317174.git.yann.morin.1998@free.fr>
References: <cover.1423317174.git.yann.morin.1998@free.fr>
Message-ID: <9e95d34930cadab8316278331b1a04b2586d0817.1423317174.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not all packages that currently depend on udev really need an udev
daemon; most may only require a libudev.so to be available. For
example, libcec, mesa3d...

Currently, we conflate udev and libudev into a single virtual package.

Introduce a new virtual package 'libudev' that packages can select if
they provide libudev.so (obviously, systemd and eudev are such packages)
and which packages can depend on if they just need libudev.so and not an
udev daemon.

Note: only the virtual package is added for now, providers and users
will be converted in followup patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in          | 1 +
 package/libudev/Config.in  | 6 ++++++
 package/libudev/libudev.mk | 7 +++++++
 3 files changed, 14 insertions(+)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..8234478 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -759,6 +759,7 @@ menu "Hardware handling"
 	source "package/libsigrok/Config.in"
 	source "package/libsigrokdecode/Config.in"
 	source "package/libsoc/Config.in"
+	source "package/libudev/Config.in"
 	source "package/libusb/Config.in"
 	source "package/libusb-compat/Config.in"
 	source "package/libv4l/Config.in"
diff --git a/package/libudev/Config.in b/package/libudev/Config.in
new file mode 100644
index 0000000..2745fcc
--- /dev/null
+++ b/package/libudev/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_LIBUDEV
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
+	string
diff --git a/package/libudev/libudev.mk b/package/libudev/libudev.mk
new file mode 100644
index 0000000..af1b3dd
--- /dev/null
+++ b/package/libudev/libudev.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libudev
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
1.9.1
