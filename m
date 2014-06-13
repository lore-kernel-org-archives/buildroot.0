From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 01:02:31 +0200
Subject: [Buildroot] [PATCH 07/20 RFC] package/libudev: new virtual package
In-Reply-To: <cover.1402699915.git.yann.morin.1998@free.fr>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
Message-ID: <7b678cb3eaedcd5da126fd95ad84dbdecb3466e2.1402699915.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

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
---
 package/Config.in          | 1 +
 package/libudev/Config.in  | 6 ++++++
 package/libudev/libudev.mk | 7 +++++++
 3 files changed, 14 insertions(+)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

diff --git a/package/Config.in b/package/Config.in
index 88705f8..3d02d3d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -637,6 +637,7 @@ menu "Hardware handling"
 	source "package/libraw1394/Config.in"
 	source "package/libserial/Config.in"
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
1.8.3.2
