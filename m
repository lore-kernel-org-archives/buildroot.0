From: Stefan Agner <stefan@agner.ch>
Date: Wed, 23 Dec 2020 11:13:34 +0100
Subject: [Buildroot] [PATCH] docker: add AppArmor support
Message-ID: <dd83e231779b8daaeaa0a78d6686b80eeb49c12b.1608718340.git.stefan@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pascal Vizeli <pvizeli@syshack.ch>

Signed-off-by: Pascal Vizeli <pvizeli@syshack.ch>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/docker-containerd/docker-containerd.mk | 5 +++++
 package/docker-engine/docker-engine.mk         | 5 +++++
 package/runc/runc.mk                           | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index d9a0eb28a6..c68e3818a8 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -18,6 +18,11 @@ DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
 
 DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
 
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+DOCKER_CONTAINERD_DEPENDENCIES += libapparmor
+DOCKER_CONTAINERD_TAGS += apparmor
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 DOCKER_CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf
 DOCKER_CONTAINERD_TAGS += seccomp
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 8cedf307ba..7f898680b7 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -20,6 +20,11 @@ DOCKER_ENGINE_LDFLAGS = \
 DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs autogen
 DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd
 
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+DOCKER_ENGINE_DEPENDENCIES += libapparmor
+DOCKER_ENGINE_TAGS += apparmor
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 DOCKER_ENGINE_TAGS += seccomp
 DOCKER_ENGINE_DEPENDENCIES += libseccomp
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 3d177d23d5..c559244e83 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -12,6 +12,11 @@ RUNC_LICENSE_FILES = LICENSE
 RUNC_LDFLAGS = -X main.gitCommit=$(RUNC_VERSION)
 RUNC_TAGS = cgo static_build
 
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+RUNC_DEPENDENCIES += libapparmor
+RUNC_TAGS += apparmor
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 RUNC_TAGS += seccomp
 RUNC_DEPENDENCIES += libseccomp host-pkgconf
-- 
2.29.2
