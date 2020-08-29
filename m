From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:35:49 +0200
Subject: [Buildroot] [git commit branch/next] package/go: introduce
 HOST_GO_COMMON_ENV
Message-ID: <20200829124232.973088152D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=557282a9c046547daade72fe18e233006716d0b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A few variables are common between HOST_GO_TARGET_ENV and
HOST_GO_HOST_ENV, so let's introduce a HOST_GO_COMMON_ENV variable for
those few common ones (which will increase in follow-up commits).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index 9e9679ccd2..9f86374300 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -16,6 +16,10 @@ HOST_GO_HOST_CACHE = $(HOST_DIR)/usr/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
 HOST_GO_TARGET_CACHE = $(HOST_DIR)/usr/share/go-cache
 
+HOST_GO_COMMON_ENV = \
+	GO111MODULE=off \
+	GOROOT="$(HOST_GO_ROOT)"
+
 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
 
 ifeq ($(BR2_arm),y)
@@ -46,10 +50,9 @@ endif
 # For the convienience of target packages.
 HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 HOST_GO_TARGET_ENV = \
-	GO111MODULE=off \
+	$(HOST_GO_COMMON_ENV) \
 	GOARCH=$(GO_GOARCH) \
 	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
-	GOROOT="$(HOST_GO_ROOT)" \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
 	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
@@ -79,10 +82,9 @@ endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 
 # For the convenience of host golang packages
 HOST_GO_HOST_ENV = \
-	GO111MODULE=off \
+	$(HOST_GO_COMMON_ENV) \
 	GOARCH="" \
 	GOCACHE="$(HOST_GO_HOST_CACHE)" \
-	GOROOT="$(HOST_GO_ROOT)" \
 	CC="$(HOST_CCNOCCACHE)" \
 	CXX="$(HOST_CXXNOCCACHE)" \
 	CGO_CFLAGS="$(HOST_CFLAGS)" \
