From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 09:31:08 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/go: fix
	cross-compilation settings
Message-ID: <20171025073526.A5EE27F969@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f383d667e9ce89c1220dea22b920b31f7ec8c6d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

This patch fixes a bug with the BR2_TOOLCHAIN_HAS_THREADS variable
handling which causes CGO_ENABLED to be always 0.

Furthermore, it fixes the cross compilation options for the go
compiler: setting CGO_ENABLED should be done only for the target
compiler not the host one.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Christian Stewart <christian@paral.in>
(cherry picked from commit 80ea21bc3c2147adf810731b0b242e94a3ad294e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.mk | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index bd30890..a5ac74b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -52,7 +52,7 @@ HOST_GO_TARGET_ENV = \
 # set, build in cgo support for any go programs that may need it.  Note that
 # any target package needing cgo support must include
 # 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
-ifeq (BR2_TOOLCHAIN_HAS_THREADS,y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 HOST_GO_CGO_ENABLED = 1
 else
 HOST_GO_CGO_ENABLED = 0
@@ -74,8 +74,8 @@ HOST_GO_MAKE_ENV = \
 	GOARCH=$(GO_GOARCH) \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	GOOS=linux \
-	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
-	CC=$(HOSTCC_NOCCACHE)
+	CC=$(HOSTCC_NOCCACHE) \
+	CXX=$(HOSTCXX_NOCCACHE)
 
 HOST_GO_TARGET_CC = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
@@ -83,16 +83,18 @@ HOST_GO_TARGET_CC = \
 
 HOST_GO_HOST_CC = \
 	CC_FOR_TARGET=$(HOSTCC_NOCCACHE) \
-	CXX_FOR_TARGET=$(HOSTCC_NOCCACHE)
+	CXX_FOR_TARGET=$(HOSTCXX_NOCCACHE)
 
 HOST_GO_TMP = $(@D)/host-go-tmp
 
 define HOST_GO_BUILD_CMDS
-	cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) ./make.bash
+	cd $(@D)/src && \
+		$(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) CGO_ENABLED=0 ./make.bash
 	mkdir -p $(HOST_GO_TMP)
 	mv $(@D)/pkg/tool $(HOST_GO_TMP)/
 	mv $(@D)/bin/ $(HOST_GO_TMP)/
-	cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
+	cd $(@D)/src && \
+		$(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) CGO_ENABLED=$(HOST_GO_CGO_ENABLED) ./make.bash
 endef
 
 define HOST_GO_INSTALL_CMDS
