From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 16:07:40 +0100
Subject: [Buildroot] [PATCH] package/docker-containerd: add missing
 dependency on host-pkgconf
Message-ID: <20181228150740.29890-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libsseccomp support is enabled, docker-containerd uses pkg-config
to find libsseccomp, so we must depend on host-pkconf.

Fixes the following build issue, detected with per-package directory
support:

pkg-config: exec: "pkg-config": executable file not found in $PATH

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/docker-containerd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 121ef0939e..71bcfcca32 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -19,7 +19,7 @@ DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
 DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-DOCKER_CONTAINERD_DEPENDENCIES += libseccomp
+DOCKER_CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf
 DOCKER_CONTAINERD_TAGS += seccomp
 endif
 
-- 
2.20.1
