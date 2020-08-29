From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:35:48 +0200
Subject: [Buildroot] [git commit] package/go: add a HOST_GO_HOST_ENV variable
Message-ID: <20200902161637.A894885EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c3e3cbcf215c56c378a912a6a6ca40edc61d7ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

package/go/go.mk provides a HOST_GO_TARGET_ENV which provides a useful
set of environment variables needed to build target Go packages.

For host packages, we simply have package/pkg-golang.mk defining
GO_HOST_ENV to specify CFLAGS/LDFLAGS, but that's it: we don't pass an
explicit path to the compiler, we don't pass GO111MODULE, GOCACHE,
GOROOT, etc.

This commit introduces a HOST_GO_HOST_ENV variable that provides the
appropriate set of environment variables to use when building host
golang packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.mk      | 12 ++++++++++++
 package/pkg-golang.mk |  3 +--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index 72604a250b..9e9679ccd2 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -77,6 +77,18 @@ else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 HOST_GO_CGO_ENABLED = 1
 endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 
+# For the convenience of host golang packages
+HOST_GO_HOST_ENV = \
+	GO111MODULE=off \
+	GOARCH="" \
+	GOCACHE="$(HOST_GO_HOST_CACHE)" \
+	GOROOT="$(HOST_GO_ROOT)" \
+	CC="$(HOST_CCNOCCACHE)" \
+	CXX="$(HOST_CXXNOCCACHE)" \
+	CGO_CFLAGS="$(HOST_CFLAGS)" \
+	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
+	CGO_LDFLAGS="$(HOST_LDFLAGS)"
+
 # The go build system is not compatible with ccache, so use
 # HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
 HOST_GO_MAKE_ENV = \
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 2494ce028c..79c27b855f 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -35,8 +35,7 @@ GO_TARGET_ENV = \
 	$(GO_COMMON_ENV)
 
 GO_HOST_ENV = \
-	CGO_CFLAGS="$(HOST_CFLAGS)" \
-	CGO_LDFLAGS="$(HOST_LDFLAGS)" \
+	$(HOST_GO_HOST_ENV) \
 	$(GO_COMMON_ENV)
 
 ################################################################################
