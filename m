From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 15:07:48 +0200
Subject: [Buildroot] [git commit] package/go-bootstrap: Build host tools
	with host CC
Message-ID: <20160704132446.1ADCC82135@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94fdf6bcb9e194b58d2d36380956391c2f5ba8ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the host compiler when building host tools.

The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE
here.  See https://github.com/golang/go/issues/11685.

Signed-off-by: Geoff Levand <geoff@infradead.org>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go-bootstrap/go-bootstrap.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
index 47f5013..29f2b03 100644
--- a/package/go-bootstrap/go-bootstrap.mk
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -19,11 +19,14 @@ HOST_GO_BOOTSTRAP_DEPENDENCIES = toolchain
 
 HOST_GO_BOOTSTRAP_ROOT = $(HOST_DIR)/usr/lib/go-$(GO_BOOTSTRAP_VERSION)
 
+# The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE
+# here.  See https://github.com/golang/go/issues/11685.
 HOST_GO_BOOTSTRAP_MAKE_ENV = \
 	GOOS=linux \
 	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_ROOT)" \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
+	CC=$(HOSTCC_NOCCACHE) \
 	CGO_ENABLED=0
 
 define HOST_GO_BOOTSTRAP_BUILD_CMDS
