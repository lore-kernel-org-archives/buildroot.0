From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:05:17 +0200
Subject: [Buildroot] [git commit] package/go: Add HOST_GO_CGO_ENABLED
Message-ID: <20160526191312.36D2B7F93D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1f14a78978d65a44685375939586a3a2c8d6e41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
set, build in cgo support for any go programs that may need it.  Note that
any target package needing cgo support must include
'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.

Fixes build errors like these:

  error: #warning requested reentrant code

  http://autobuild.buildroot.net/results/42a8d07101d8d954511d1c884ecb66e8d861899e

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/go/go.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index 090c5e4..7a8ebf4 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -44,6 +44,16 @@ HOST_GO_TARGET_ENV = \
 	CXX=$(TARGET_CXX) \
 	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
 
+# The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
+# set, build in cgo support for any go programs that may need it.  Note that
+# any target package needing cgo support must include
+# 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
+ifeq (BR2_TOOLCHAIN_HAS_THREADS,y)
+HOST_GO_CGO_ENABLED = 1
+else
+HOST_GO_CGO_ENABLED = 0
+endif
+
 # The go build system doesn't have the notion of cross compiling, but just the
 # notion of architecture.  When the host and target architectures are different
 # it expects to be given a target cross compiler in CC_FOR_TARGET.  When the
@@ -60,7 +70,7 @@ HOST_GO_MAKE_ENV = \
 	GOARCH=$(GO_GOARCH) \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	GOOS=linux \
-	CGO_ENABLED=1 \
+	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
 	CC=$(HOSTCC_NOCCACHE)
 
 HOST_GO_TARGET_CC = \
