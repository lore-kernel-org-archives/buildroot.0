From: Christian Stewart <christian@paral.in>
Date: Tue, 19 Feb 2019 14:35:30 -0800
Subject: [Buildroot] [PATCH 3/3] docker-engine: propagate runc headers >=
 3.11 dependency
In-Reply-To: <20190219223530.15956-1-christian@paral.in>
References: <20190219223530.15956-1-christian@paral.in>
Message-ID: <20190219223530.15956-3-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add runc dependency on Linux headers >= 3.11 for O_TMPFILE.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 3c97310484..87dc86b35b 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # docker-containerd -> runc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # docker-containerd -> runc
 	depends on BR2_USE_MMU # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
@@ -50,8 +51,9 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 
 endif
 
-comment "docker-engine needs a glibc or musl toolchain w/ threads"
+comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 3.11"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+  	!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_USE_MMU
-- 
2.19.2
