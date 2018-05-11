From: Anisse Astier <anisse@astier.eu>
Date: Fri, 11 May 2018 22:50:34 +0200
Subject: [Buildroot] [PATCH v2 2/5] go: cleanup cross-compilation support
In-Reply-To: <20180511205037.10078-1-anisse@astier.eu>
References: <20180511205037.10078-1-anisse@astier.eu>
Message-ID: <20180511205037.10078-3-anisse@astier.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we fixed cross-compilation in the go package, cleanup the build
to remove the workaround added in 60c5c96ae109dcea48e0997b5e6e6645ac9b86
"package/go: Build host tools with host CC". We only need a single pass
to build the go toolchain.

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 package/go/go.mk | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index 6af58f04be..b70c5d49d8 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -58,13 +58,7 @@ else
 HOST_GO_CGO_ENABLED = 0
 endif
 
-# The go build system doesn't have the notion of cross compiling, but just the
-# notion of architecture.  When the host and target architectures are different
-# it expects to be given a target cross compiler in CC_FOR_TARGET.  When the
-# architectures are the same it will use CC_FOR_TARGET for both host and target
-# compilation.  To work around this limitation build and install a set of
-# compiler and tool binaries built with CC_FOR_TARGET set to the host compiler.
-# Also, the go build system is not compatible with ccache, so use
+# The go build system is not compatible with ccache, so use
 # HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
 HOST_GO_MAKE_ENV = \
 	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
@@ -82,25 +76,14 @@ HOST_GO_TARGET_CC = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
 	CXX_FOR_TARGET="$(TARGET_CXX)"
 
-HOST_GO_HOST_CC = \
-	CC_FOR_TARGET=$(HOSTCC_NOCCACHE) \
-	CXX_FOR_TARGET=$(HOSTCXX_NOCCACHE)
-
-HOST_GO_TMP = $(@D)/host-go-tmp
-
 define HOST_GO_BUILD_CMDS
-	cd $(@D)/src && \
-		$(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) CGO_ENABLED=0 ./make.bash
-	mkdir -p $(HOST_GO_TMP)
-	mv $(@D)/pkg/tool $(HOST_GO_TMP)/
-	mv $(@D)/bin/ $(HOST_GO_TMP)/
 	cd $(@D)/src && \
 		$(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) CGO_ENABLED=$(HOST_GO_CGO_ENABLED) ./make.bash
 endef
 
 define HOST_GO_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(HOST_GO_TMP)/bin/go $(HOST_GO_ROOT)/bin/go
-	$(INSTALL) -D -m 0755 $(HOST_GO_TMP)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
 
 	ln -sf ../lib/go/bin/go $(HOST_DIR)/bin/
 	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/bin/
@@ -109,7 +92,7 @@ define HOST_GO_INSTALL_CMDS
 
 	mkdir -p $(HOST_GO_ROOT)/pkg
 	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
-	cp -a $(HOST_GO_TMP)/tool $(HOST_GO_ROOT)/pkg/
+	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
 
 	# There is a known issue which requires the go sources to be installed
 	# https://golang.org/issue/2775
@@ -117,7 +100,7 @@ define HOST_GO_INSTALL_CMDS
 
 	# Set all file timestamps to prevent the go compiler from rebuilding any
 	# built in packages when programs are built.
-	find $(HOST_GO_ROOT) -type f -exec touch -r $(HOST_GO_TMP)/bin/go {} \;
+	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef
 
 $(eval $(host-generic-package))
-- 
2.14.3
