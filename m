From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:35:49 +0200
Subject: [Buildroot] [git commit branch/next] package/go: re-integrate
 GO_COMMON_ENV into HOST_GO_COMMON_ENV
Message-ID: <20200829124232.B914E8152D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a17e4ae996c4c6727a29f049892be5ae57d7e89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There is no point in having some common Go env variables defined in
pkg-golang.mk:GO_COMMON_ENV, and some in
package/go/go.mk:HOST_GO_COMMON_ENV. Let's move all of them to
package/go/go.mk:HOST_GO_COMMON_ENV.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.mk      |  7 ++++++-
 package/pkg-golang.mk | 13 ++-----------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index af1548a65e..8dfd96c88a 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -16,9 +16,14 @@ HOST_GO_HOST_CACHE = $(HOST_DIR)/usr/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
 HOST_GO_TARGET_CACHE = $(HOST_DIR)/usr/share/go-cache
 
+# We pass an empty GOBIN, otherwise "go install: cannot install
+# cross-compiled binaries when GOBIN is set"
 HOST_GO_COMMON_ENV = \
 	GO111MODULE=off \
-	GOROOT="$(HOST_GO_ROOT)"
+	GOROOT="$(HOST_GO_ROOT)" \
+	PATH=$(BR_PATH) \
+	GOBIN= \
+	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
 
 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
 
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 79c27b855f..9904ddcc1a 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -23,20 +23,11 @@
 
 GO_BIN = $(HOST_DIR)/bin/go
 
-# We pass an empty GOBIN, otherwise "go install: cannot install
-# cross-compiled binaries when GOBIN is set"
-GO_COMMON_ENV = \
-	PATH=$(BR_PATH) \
-	GOBIN= \
-	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
-
 GO_TARGET_ENV = \
-	$(HOST_GO_TARGET_ENV) \
-	$(GO_COMMON_ENV)
+	$(HOST_GO_TARGET_ENV)
 
 GO_HOST_ENV = \
-	$(HOST_GO_HOST_ENV) \
-	$(GO_COMMON_ENV)
+	$(HOST_GO_HOST_ENV)
 
 ################################################################################
 # inner-golang-package -- defines how the configuration, compilation and
