From: Geoff Levand <geoff@infradead.org>
Date: Thu, 19 May 2016 22:25:02 +0000
Subject: [Buildroot] [PATCH v2 4/6] package/go: Add HOST_GO_CGO_ENABLED
In-Reply-To: <cover.1463696454.git.geoff@infradead.org>
References: <cover.1463696454.git.geoff@infradead.org>
Message-ID: <d9878b4ff3c2a7aa4af903b5a10b343d2a850ab2.1463696454.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
set, build in cgo support for any go programs that may need it.  Note that
any target package needing cgo support must include
'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.

Fixes build errors like these:

  error: #warning requested reentrant code

  http://autobuild.buildroot.net/results/42a8d07101d8d954511d1c884ecb66e8d861899e

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go/go.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index 5e4ee09..8565a86 100644
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
+	HOST_GO_CGO_ENABLED = 1
+else
+	HOST_GO_CGO_ENABLED = 0
+endif
+
 # The go build system doesn't have the notion of cross compiling, but just the
 # notion of architecture.  When the host and target architectures are different
 # it expects to be given a target cross compiler in CC_FOR_TARGET.  When the
@@ -62,7 +72,7 @@ HOST_GO_MAKE_ENV = \
 	GOARCH=$(GO_GOARCH) \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	GOOS=linux \
-	CGO_ENABLED=1 \
+	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
 	CC=$(HOSTCC_NOCCACHE)
 
 HOST_GO_TARGET_CC = \
-- 
2.5.0
