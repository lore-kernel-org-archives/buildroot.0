From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 16:43:45 +0200
Subject: [Buildroot] [PATCH 1/3] docker-containerd: pass -extldflags
	'-static' on when BR2_STATIC_LIBS=y
Message-ID: <1469371427-25201-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no reason to link Go binaries statically, unless when
BR2_STATIC_LIBS=y.

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
-- 
2.7.4
