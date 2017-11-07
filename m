From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Nov 2017 23:10:59 +0100
Subject: [Buildroot] [PATCH] go-bootstrap: add
 BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
Message-ID: <20171107221059.25796-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

go-bootstrap is a host package that builds a first stage Go compiler,
later used to build the final Go compiler. However, this first stage
compiler only supports building on x86, x86-64 and arm as host
architectures, so we need to add the relevant architecture
dependencies to avoid having go-bootstrap built on other unsupported
platforms.

We do this by introducing BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
in a new package/go-bootstrap/Config.in.host file. This option is then
used by BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS to make sure we can't enable
Go packages when the host architecture doesn't allow building the Go
compiler.

Fixes:

  http://autobuild.buildroot.net/results/cbd419c6ab6fa8a6d18dc137c91f895867e53b8a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host              | 1 +
 package/go-bootstrap/Config.in.host | 7 +++++++
 package/go/Config.in.host           | 1 +
 3 files changed, 9 insertions(+)
 create mode 100644 package/go-bootstrap/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 3755310de4..59be666143 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -19,6 +19,7 @@ menu "Host utilities"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
 	source "package/go/Config.in.host"
+	source "package/go-bootstrap/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
diff --git a/package/go-bootstrap/Config.in.host b/package/go-bootstrap/Config.in.host
new file mode 100644
index 0000000000..fab80d24b4
--- /dev/null
+++ b/package/go-bootstrap/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
+	bool
+	# See src/cmd/dist/unix.c for the list of support
+	# architectures
+	default y if BR2_HOSTARCH = "x86"
+	default y if BR2_HOSTARCH = "x86_64"
+	default y if BR2_HOSTARCH = "arm"
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index a210033efd..c871ac4196 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	bool
 	default y
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el
-- 
2.13.6
