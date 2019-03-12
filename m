From: Christian Stewart <christian@paral.in>
Date: Mon, 11 Mar 2019 22:41:14 -0700
Subject: [Buildroot] [PATCH 1/1] package/go: set GOCACHE to a host path
Message-ID: <20190312054114.21361-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set the GOCACHE environment variable properly.

It was previously unset, and defaults to $HOME/.cache/go-build.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index 1558b55e21..4daa2fe093 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -37,13 +37,16 @@ GO_GOARCH = mips64le
 endif
 
 HOST_GO_DEPENDENCIES = host-go-bootstrap
+HOST_GO_HOST_CACHE = $(HOST_DIR)/usr/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
+HOST_GO_TARGET_CACHE = $(HOST_DIR)/usr/share/go-cache
 
 # For the convienience of target packages.
 HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 HOST_GO_TARGET_ENV = \
 	GO111MODULE=off \
 	GOARCH=$(GO_GOARCH) \
+	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
 	GOROOT="$(HOST_GO_ROOT)" \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
@@ -63,6 +66,7 @@ endif
 # HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
+	GOCACHE=$(HOST_GO_HOST_CACHE) \
 	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
-- 
2.19.2
