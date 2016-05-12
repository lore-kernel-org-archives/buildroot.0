From: Geoff Levand <geoff@infradead.org>
Date: Thu, 12 May 2016 00:08:48 +0000
Subject: [Buildroot] [PATCH 8/9] package/go: Build special host binaries
In-Reply-To: <cover.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
Message-ID: <5bc0cf8e34e53eee49c11c7b4fc9b523530ad393.1463010772.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To work around cross compile limitations of go's build scripts, when the
host and target arches are the same build the host go binaries with
CC_FOR_TARGET set to the host compiler.

Fixes build errors like these:

  host/usr/bin/go: No such file or directory

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go/go.mk | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index 4a99144..e2ad864 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -40,20 +40,47 @@ HOST_GO_DEPENDENCIES = host-go-bootstrap
 HOST_GO_ROOT = $(HOST_DIR)/usr/lib/go
 HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 
-HOST_GO_MAKE_ENV = \
+# To work around cross compile limitations of go's build scripts, when the
+# host and target arches are the same build the host go binaries with
+# CC_FOR_TARGET set to the host compiler.
+ifeq ($(ARCH),$(HOSTARCH))
+	HOST_GO_BUILD_SPECIAL = y
+endif
+
+HOST_GO_ENV_COMMON = \
 	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
-	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
 	GOARCH=$(GO_GOARCH) \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	GOOS=linux \
 	CGO_ENABLED=1 \
+	CC=$(HOSTCC_NOCCACHE)
+
+HOST_GO_MAKE_ENV = \
+	$(HOST_GO_ENV_COMMON) \
+	GOROOT="$(@D)" \
 	CC_FOR_TARGET=$(TARGET_CC) \
 	CXX_FOR_TARGET=$(TARGET_CXX)
 
+HOST_GO_MAKE_ENV_SPECIAL = \
+	$(HOST_GO_ENV_COMMON) \
+	GOROOT="$(@D).host" \
+	CC_FOR_TARGET=$(HOSTCC_NOCCACHE) \
+	CXX_FOR_TARGET=$(HOSTCC_NOCCACHE) \
+
+define HOST_GO_CONFIGURE_CMDS
+	if [ "$(HOST_GO_BUILD_SPECIAL)" ]; then \
+		cp -a $(@D) $(@D).host; \
+	fi
+endef
+
 define HOST_GO_BUILD_CMDS
 	cd $(@D)/src && $(HOST_GO_MAKE_ENV) ./make.bash
+	if [ "$(HOST_GO_BUILD_SPECIAL)" ]; then \
+		rm -f $(@D)/bin/go $(@D)/bin/gofmt; \
+		cd $(@D).host/src && $(HOST_GO_MAKE_ENV_SPECIAL) ./make.bash; \
+	fi
 endef
 
 define HOST_GO_INSTALL_CMDS
@@ -66,7 +93,8 @@ define HOST_GO_INSTALL_CMDS
 	cp -a $(@D)/lib $(HOST_GO_ROOT)/
 
 	mkdir -p $(HOST_GO_ROOT)/pkg
-	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
+	cp -a $(@D)/pkg/include $(HOST_GO_ROOT)/pkg/
+	cp -a $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
 	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
 
 	# There is a known issue which requires the go sources to be installed
-- 
2.5.0
