From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 21:33:37 +0100
Subject: [Buildroot] [git commit] google-breakpad: take into account host
 architecture dependencies
Message-ID: <20171127202616.66FEC81442@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fadc438393841eced94aa6decfd04c5bf448b255
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building the target google-breakpad requires building the host variant
of google-breakpad. Just like the target google-breakpad only supports
a limited number of architectures, it is the same for the host
google-breakpad.

We therefore introduce a
BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS option that is used
where necessary to prevent the user from choosing Google Breakpad when
building on unsupported host platforms.

Fixes:

  http://autobuild.buildroot.net/results/c7c04483508f9e4d629efa54571afeb1feaa5f73/
  (build on a powerpc64le machine)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                              | 1 +
 package/Config.in.host                 | 1 +
 package/google-breakpad/Config.in      | 2 ++
 package/google-breakpad/Config.in.host | 8 ++++++++
 4 files changed, 12 insertions(+)

diff --git a/Config.in b/Config.in
index 75e5604..62d67ce 100644
--- a/Config.in
+++ b/Config.in
@@ -539,6 +539,7 @@ config BR2_GOOGLE_BREAKPAD_ENABLE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	help
 	  This option will enable the use of google breakpad, a library
 	  and tool suite that allows you to distribute an application to
diff --git a/package/Config.in.host b/package/Config.in.host
index 59be666..48b6f8c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -20,6 +20,7 @@ menu "Host utilities"
 	source "package/genpart/Config.in.host"
 	source "package/go/Config.in.host"
 	source "package/go-bootstrap/Config.in.host"
+	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index e0e9106..91ec9ce 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	select BR2_PACKAGE_LINUX_SYSCALL_SUPPORT
 	help
 	  Google-Breakpad is a library and tool suite that allows you
@@ -36,6 +37,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 
 comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC) || \
diff --git a/package/google-breakpad/Config.in.host b/package/google-breakpad/Config.in.host
new file mode 100644
index 0000000..28d3047
--- /dev/null
+++ b/package/google-breakpad/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "x86_64"
+	default y if BR2_HOSTARCH = "x86"
+	default y if BR2_HOSTARCH = "arm"
+	default y if BR2_HOSTARCH = "aarch64"
+	default y if BR2_HOSTARCH = "mips"
+	default y if BR2_HOSTARCH = "mipsel"
