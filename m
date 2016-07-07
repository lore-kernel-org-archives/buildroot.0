From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  7 Jul 2016 20:39:37 +0200
Subject: [Buildroot] [PATCH 3/3] package/runc: disable for static only build
In-Reply-To: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
References: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1467916777-29220-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When build statically, runc try to link against Scrt1.o which is not
provided by a toolchain for static build only.

[...]arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find Scrt1.o: No such file or directory
collect2: error: ld returned 1 exit status

Add the reverse dependency on docker-containerd.

Remove the static case handling for runc.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Christian Stewart <christian@paral.in>
---
 package/docker-containerd/Config.in | 6 ++++--
 package/runc/Config.in              | 5 +++--
 package/runc/runc.mk                | 5 -----
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 99af917..6615c5f 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+	depends on !BR2_STATIC_LIBS # runc
 	select BR2_PACKAGE_RUNC # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
@@ -16,8 +17,9 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 
 	  https://github.com/docker/containerd
 
-comment "docker-containerd needs a toolchain w/ threads, wchar"
+comment "docker-containerd needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR \
+		 || BR2_STATIC_LIBS
diff --git a/package/runc/Config.in b/package/runc/Config.in
index fd5dee7..8b6d003 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -3,13 +3,14 @@ config BR2_PACKAGE_RUNC
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	help
 	  runC is a CLI tool for spawning and running containers
 	  according to the OCP specification.
 
 	  https://github.com/opencontainers/runc
 
-comment "runc needs a toolchain w/ threads"
+comment "runc needs a toolchain w/ dynamic library, threads"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
 		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 66f234f..0032017 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -23,11 +23,6 @@ RUNC_GLDFLAGS = \
 
 RUNC_GOTAGS = cgo
 
-ifeq ($(BR2_STATIC_LIBS),y)
-RUNC_GOTAGS += static_build
-RUNC_GLDFLAGS += -extldflags '-static'
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 RUNC_GOTAGS += seccomp
 RUNC_DEPENDENCIES += libseccomp host-pkgconf
-- 
2.5.5
