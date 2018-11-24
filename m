From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Nov 2018 22:52:01 +0100
Subject: [Buildroot] [PATCH 3/3] package: hide golang packages for
 toolchains with binutils bug 20006
In-Reply-To: <cover.1543096295.git.yann.morin.1998@free.fr>
References: <cover.1543096295.git.yann.morin.1998@free.fr>
Message-ID: <3eaf225466a426cf89218531a5c9d685c2224a18.1543096295.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/020/02039969b16534d4020ecd4574bae71b91c1e6b8/ (flannel)
    http://autobuild.buildroot.org/results/e95/e9528b06b350ef84c1e2cb59fba87b4db77b4660/ (docker-engine)
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>
---
 package/docker-containerd/Config.in | 4 ++++
 package/docker-engine/Config.in     | 4 ++++
 package/docker-proxy/Config.in      | 4 ++++
 package/flannel/Config.in           | 4 ++++
 package/mender/Config.in            | 4 ++++
 package/runc/Config.in              | 4 ++++
 6 files changed, 24 insertions(+)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 851345f73e..39f6ea8ee8 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # util-linux
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
 	select BR2_PACKAGE_RUNC # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
@@ -32,3 +33,6 @@ comment "docker-containerd needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "docker-containerd needs a toolchain not affected by binutils bug 20006"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 8feb11b48c..4393c93b90 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
 	help
 	  Docker is a platform to build, ship,
 	  and run applications as lightweight containers.
@@ -70,3 +71,6 @@ comment "docker-engine needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "docker-engine needs a toolchain not affected by binutils bug 20006"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
diff --git a/package/docker-proxy/Config.in b/package/docker-proxy/Config.in
index 596e18a3f3..6e244f6abf 100644
--- a/package/docker-proxy/Config.in
+++ b/package/docker-proxy/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER_PROXY
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
 	help
 	  Libnetwork is a Container Network Model that provides a
 	  consistent programming interface and the required network
@@ -17,3 +18,6 @@ comment "docker-proxy needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "docker-proxy needs a toolchain not affected by binutils bug 20006"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index 134111b1c0..4f96a6daa0 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -3,11 +3,15 @@ comment "flannel needs a toolchain w/ threads"
 		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
+comment "flannel needs a toolchain not affected by binutils bug 20006"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
+
 config BR2_PACKAGE_FLANNEL
 	bool "flannel"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
 	help
 	  Flannel is a virtual network that gives a subnet to each
 	  host for use with container runtimes.
diff --git a/package/mender/Config.in b/package/mender/Config.in
index aeb0b2694f..086c9773c9 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
 	select BR2_PACKAGE_UBOOT_TOOLS # runtime
 	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
 	help
@@ -17,3 +18,6 @@ comment "mender needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "mender needs a toolchain not affected by binutils bug 20006"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
diff --git a/package/runc/Config.in b/package/runc/Config.in
index fd5dee7c5b..e867e2a230 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RUNC
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
 	help
 	  runC is a CLI tool for spawning and running containers
 	  according to the OCP specification.
@@ -13,3 +14,6 @@ comment "runc needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
 		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "runc needs a toolchain not affected by binutils bug 20006"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
-- 
2.14.1
