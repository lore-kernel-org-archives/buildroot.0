From: Geoff Levand <geoff@infradead.org>
Date: Thu, 19 May 2016 22:25:02 +0000
Subject: [Buildroot] [PATCH v2 1/6] package/go: Build host tools with host CC
In-Reply-To: <cover.1463696454.git.geoff@infradead.org>
References: <cover.1463696454.git.geoff@infradead.org>
Message-ID: <aa4ea0467b1c08f0afb3d5ba2cf7af201f6ceeef.1463696454.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The go build system doesn't have the notion of cross compiling, but just the
notion of architecture.  When the host and target architectures are different
it expects to be given a target cross compiler in CC_FOR_TARGET.  When the
architectures are the same it will use CC_FOR_TARGET for both host and target
compilation.  To work around this limitation, when the host and target
architectures are the same build a set of host binaries and tools with
CC_FOR_TARGET set to the host compiler.  Also, the go build system is not
compatible with ccache, so use HOSTCC_NOCCACHE.  See
https://github.com/golang/go/issues/11685.

Fixes build errors like these:

  host/usr/bin/go: No such file or directory

  http://autobuild.buildroot.net/results/6664189a6f3a815978e8d0a1d7ef408ca47e2874/

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go/go.mk | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index a9e16dd..5acd75f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -35,6 +35,16 @@ endif
 HOST_GO_DEPENDENCIES = host-go-bootstrap
 HOST_GO_ROOT = $(HOST_DIR)/usr/lib/go
 
+# The go build system doesn't have the notion of cross compiling, but just the
+# notion of architecture.  When the host and target architectures are different
+# it expects to be given a target cross compiler in CC_FOR_TARGET.  When the
+# architectures are the same it will use CC_FOR_TARGET for both host and target
+# compilation.  To work around this limitation, when the host and target
+# architectures are the same build a set of host binaries and tools with
+# CC_FOR_TARGET set to the host compiler.  Also, the go build system is not
+# compatible with ccache, so use HOSTCC_NOCCACHE.  See
+# https://github.com/golang/go/issues/11685.
+
 HOST_GO_MAKE_ENV = \
 	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
@@ -44,16 +54,39 @@ HOST_GO_MAKE_ENV = \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	GOOS=linux \
 	CGO_ENABLED=1 \
+	CC=$(HOSTCC_NOCCACHE)
+
+HOST_GO_TARGET_CC = \
 	CC_FOR_TARGET=$(TARGET_CC) \
 	CXX_FOR_TARGET=$(TARGET_CXX)
 
+HOST_GO_HOST_CC = \
+	CC_FOR_TARGET=$(HOSTCC_NOCCACHE) \
+	CXX_FOR_TARGET=$(HOSTCC_NOCCACHE)
+
+HOST_GO_TMP = $(@D)/host-go-tmp
+
+ifneq ($(ARCH),$(HOSTARCH))
 define HOST_GO_BUILD_CMDS
-	cd $(@D)/src && $(HOST_GO_MAKE_ENV) ./make.bash
+	cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
+	mkdir -p $(HOST_GO_TMP)
+	mv $(@D)/pkg/tool $(HOST_GO_TMP)/
+	mv $(@D)/bin/ $(HOST_GO_TMP)/
 endef
+else
+define HOST_GO_BUILD_CMDS
+	cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) ./make.bash
+	mkdir -p $(HOST_GO_TMP)
+	cp -a $(@D)/pkg/tool $(HOST_GO_TMP)/
+	cp -a $(@D)/bin/ $(HOST_GO_TMP)/
+	cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
+	cp -a $(@D)/pkg/tool $(HOST_GO_TMP)/
+endef
+endif
 
 define HOST_GO_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
-	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
+	$(INSTALL) -D -m 0755 $(HOST_GO_TMP)/bin/go $(HOST_GO_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(HOST_GO_TMP)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
 
 	ln -sf ../lib/go/bin/go $(HOST_DIR)/usr/bin/
 	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/usr/bin/
@@ -62,7 +95,7 @@ define HOST_GO_INSTALL_CMDS
 
 	mkdir -p $(HOST_GO_ROOT)/pkg
 	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
-	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
+	cp -a $(HOST_GO_TMP)/tool $(HOST_GO_ROOT)/pkg/
 
 	# There is a known issue which requires the go sources to be installed
 	# https://golang.org/issue/2775
-- 
2.5.0
