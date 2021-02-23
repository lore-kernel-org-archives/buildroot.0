From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2021 13:48:27 +0100
Subject: [Buildroot] [git commit branch/next] package/go: bump version to
 1.16
Message-ID: <20210223122654.E739380F3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c035502bf2f44dd7ce5c0dca2e03cdcd4ef3f88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://golang.org/doc/go1.16

The latest Go release, version 1.16, arrives six months after Go 1.15. Most of
its changes are in the implementation of the toolchain, runtime, and libraries.

The linker changes in 1.16 extend the 1.15 improvements to all supported
architecture/OS combinations (the 1.15 performance improvements were primarily
focused on ELF-based OSes and amd64 architectures). For a representative set of
large Go programs, linking is 20-25% faster than 1.15 and requires 5-15% less
memory on average for linux/amd64, with larger improvements for other
architectures and OSes. Most binaries are also smaller as a result of more
aggressive symbol pruning.

According to the release notes, Go 1.16 drops support for x87 mode
compilation (GO386=387).  Support for non-SSE2 processors is now available
using soft float mode.  Buildroot will automatically set GO386=softfloat on
non-SSE2 processors.

Signed-off-by: Christian Stewart <christian@paral.in>

v1 -> v2:

 - added 386=softfloat handling re: Peter's review

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index cbc82a9b64..4181fb52c5 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  540c0ab7781084d124991321ed1458e479982de94454a98afab6acadf38497c2  go1.15.8.src.tar.gz
+sha256  7688063d55656105898f323d90a79a39c378d86fe89ae192eb3b7fc46347c95a  go1.16.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 7b7f173706..f6cb2469a8 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.8
+GO_VERSION = 1.16
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
@@ -49,6 +49,10 @@ else ifeq ($(BR2_aarch64),y)
 GO_GOARCH = arm64
 else ifeq ($(BR2_i386),y)
 GO_GOARCH = 386
+# i386: use softfloat if no SSE2: https://golang.org/doc/go1.16#386
+ifneq ($(BR2_X86_CPU_HAS_SSE2),y)
+GO_GO386 = softfloat
+endif
 else ifeq ($(BR2_x86_64),y)
 GO_GOARCH = amd64
 else ifeq ($(BR2_powerpc64),y)
@@ -90,6 +94,7 @@ HOST_GO_CROSS_ENV = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
 	CXX_FOR_TARGET="$(TARGET_CXX)" \
 	GOARCH=$(GO_GOARCH) \
+	$(if $(GO_GO386),GO386=$(GO_GO386)) \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	GO_ASSUME_CROSSCOMPILING=1
 
