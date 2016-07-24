From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:59:23 +0200
Subject: [Buildroot] [git commit] docker-containerd: pass -extldflags
	'-static' on when BR2_STATIC_LIBS=y
Message-ID: <20160724200005.6243D81E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98cc1cbeb69e894723c59ac6d510d5e66d525ea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no reason to link Go binaries statically, unless when
BR2_STATIC_LIBS=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker-containerd/docker-containerd.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index b1acd44..06432e9 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -18,8 +18,11 @@ DOCKER_CONTAINERD_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 	GOPATH="$(DOCKER_CONTAINERD_GOPATH)"
 
 DOCKER_CONTAINERD_GLDFLAGS = \
-	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION) \
-	-extldflags '-static'
+	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
+
+ifeq ($(BR2_STATIC_LIBS),y)
+DOCKER_CONTAINERD_GLDFLAGS += -extldflags '-static'
+endif
 
 define DOCKER_CONTAINERD_CONFIGURE_CMDS
 	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker
