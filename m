From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 31 Mar 2018 19:57:31 +0200
Subject: [Buildroot] [git commit] docker-containerd: remove symlink to
 $(RUNC_SRCDIR)
Message-ID: <20180331175811.194EC84045@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8257a8f09fcc1aea7f759362a955a1dff1db7bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DOCKER_CONTAINERD_CONFIGURE_CMDS creates a symlink to runc's
source directory, but it does not build depend on runc, which means
that the runc package may not have been extracted/built before
docker-containerd.

Therefore, when doing a build with "make docker-containerd", this
symbolic link is broken, but it doesn't prevent docker-containerd from
building.

Therefore, this symlink is not necessary and can be dropped.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
