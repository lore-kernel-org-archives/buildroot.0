From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Sep 2016 14:38:53 +0200
Subject: [Buildroot] [PATCH 2/4] package/docker-engine: fix unmet
	dependencies
In-Reply-To: <cover.1473597259.git.yann.morin.1998@free.fr>
References: <cover.1473597259.git.yann.morin.1998@free.fr>
Message-ID: <b49855d48fabd30b725550ab8fd5f8b9a136ade6.1473597259.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Properly propagate dependencies from docker-containerd to fix the
following unmet dependencies:

    warning: (BR2_PACKAGE_DOCKER_ENGINE_DAEMON) selects
    BR2_PACKAGE_DOCKER_CONTAINERD which has unmet direct dependencies
    (BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS &&
    BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS && BR2_TOOLCHAIN_HAS_THREADS &&
    BR2_USE_MMU && BR2_USE_WCHAR)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
2.7.4
