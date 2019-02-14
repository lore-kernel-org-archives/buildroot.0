From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Feb 2019 09:53:10 +0100
Subject: [Buildroot] [PATCH] package/docker-containerd: fix typo in uclibc
 dependency
Message-ID: <20190214085310.25955-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 6e3f7fbc072c88ab344f2ffa39e402464b566f19 ("package/runc: add
upstream security fix for CVE-2019-5736") added a dependency of
docker-containerd to uclibc (inherited from runc), but the depends on
has a typo that makes it ineffective. Due to this, docker-containerd
can still be selected in uClibc configurations, causing runc to be
build, and failing to build due fexecve() being missing in uClibc.

Fixes:

  http://autobuild.buildroot.net/results/64ecdb1e007106fdb05979b10b42b90591255504/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index bdb5dd7b80..5e0cc1e877 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PACKAGE_TOOLCHAIN_USES_UCLIBC # runc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_RUNC # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
-- 
2.20.1
