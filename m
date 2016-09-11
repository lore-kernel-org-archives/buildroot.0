From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:43:57 +0200
Subject: [Buildroot] [git commit] package/docker-engine: fix unmet
	dependencies
Message-ID: <20160911134931.49140802EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8cc37fc7a9533e06c1fb0547be87875b8fd70fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Properly propagate dependencies from docker-containerd to fix the
following unmet dependencies:

    warning: (BR2_PACKAGE_DOCKER_ENGINE_DAEMON) selects
    BR2_PACKAGE_DOCKER_CONTAINERD which has unmet direct dependencies
    (BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS &&
    BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS && BR2_TOOLCHAIN_HAS_THREADS &&
    BR2_USE_MMU && BR2_USE_WCHAR)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker-engine/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index a22786a..b9b9aac 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -13,6 +13,7 @@ if BR2_PACKAGE_DOCKER_ENGINE
 
 config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 	bool "docker daemon"
+	depends on BR2_USE_MMU # docker-containerd
 	depends on BR2_USE_WCHAR # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_SQLITE # runtime dependency
