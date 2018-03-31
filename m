From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 15:27:29 +0200
Subject: [Buildroot] [PATCH v4 1/8] docker-containerd: remove symlink to
 $(RUNC_SRCDIR)
In-Reply-To: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
References: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180331132736.21105-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The DOCKER_CONTAINERD_CONFIGURE_CMDS creates a symlink to runc's
source directory, but it does not build depend on runc, which means
that the runc package may not have been extracted/built before
docker-containerd.

Therefore, when doing a build with "make docker-containerd", this
symbolic link is broken, but it doesn't prevent docker-containerd from
building.

Therefore, this symlink is not necessary and be dropped.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/docker-containerd.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index ffbadb0c3f..8f0822b77f 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -27,8 +27,6 @@ endif
 define DOCKER_CONTAINERD_CONFIGURE_CMDS
 	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker
 	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
-	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers
-	ln -s $(RUNC_SRCDIR) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers/runc
 endef
 
 define DOCKER_CONTAINERD_BUILD_CMDS
-- 
2.14.3
