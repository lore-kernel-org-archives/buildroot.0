From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Mar 2019 22:15:24 +0100
Subject: [Buildroot] [git commit] go: explicitly disable modules to avoid
 unintended network lookup
Message-ID: <20190303211425.3DE288D463@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7a2870dd1fef9ee41e78ea1bcbb2ec61e82eb67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Go "modules" refers to the dependency fetching, verification (hashing), and
version control system built into Go as of 1.11.

It is not desirable to have Go modules enabled in Buildroot in the normal case,
as Buildroot manages downloading the sources, and third party dependency
managers are typically not used.

In the absence of the GO111MODULE environment variable, the Go compiler will
correctly compile using the "vendor" version of dependencies downloaded by
Buildroot during the compilation process for Go-based packages.

However, if the user sets the GO111MODULE=on environment variable, the Go
compiler will download the Go dependencies for Buildroot packages, using the
modules system. This is potentially unintended behavior from user environment
variables.

This commit sets the GO111MODULE=off variable in the Go target and host
compilation environments, disabling Go modules support for Buildroot mainline
packages.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index 7755a3f785..1558b55e21 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -42,6 +42,7 @@ HOST_GO_ROOT = $(HOST_DIR)/lib/go
 # For the convienience of target packages.
 HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 HOST_GO_TARGET_ENV = \
+	GO111MODULE=off \
 	GOARCH=$(GO_GOARCH) \
 	GOROOT="$(HOST_GO_ROOT)" \
 	CC="$(TARGET_CC)" \
@@ -61,6 +62,7 @@ endif
 # The go build system is not compatible with ccache, so use
 # HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
 HOST_GO_MAKE_ENV = \
+	GO111MODULE=off \
 	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
