From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 19:02:11 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/go: set GOCACHE
 to a host path
Message-ID: <20190325190410.8201E8153A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a0cee96f23e60cd5bbf90c111fe6328536ba2bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Set the GOCACHE environment variable properly.

It was previously unset, and defaults to $HOME/.cache/go-build.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3909423f1ccf186bd064e225ecb064ca1ece0310)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
