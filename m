From: Anisse Astier <anisse@astier.eu>
Date: Sat,  6 Apr 2019 15:20:59 +0200
Subject: [Buildroot] [PATCH] package/go: fix building host go toolchain when
 target isn't supported
Message-ID: <20190406132059.2601-1-anisse@astier.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The go toolchain can cross-compile by default. So most of the time,
building a toolchain that supports a target, allows us to also build go
binaries for the host. This is how support for host go packages was
added: we use the same toolchain that was initially built only for
target.

But we might want to build a go binary for the host, when compiling a
target for which go isn't supported. Then, building host-go will fail:
by default, we build go for a specific target, and give the toolchain
bootstrap scripts the cross compiler we'll use.

This change modifies this behaviour: we only assume the go toolchain is
cross-capable if we know the current target is supported. Otherwise this
is a simple host go tool. For the host, only x86_64, i386 and arm are
supported, to mimic the limitation of the go-bootstrap package.

Fixes:
http://autobuild.buildroot.net/results/98b9c7aaff2af4d19adfedac00b768d92530ce94
http://autobuild.buildroot.net/results/bed228995ce3778720f991df9b41345a7c724a46
http://autobuild.buildroot.net/results/3b3ea148165b96513ea511ee0d4adb334a6afac8

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 package/go/go.mk | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index c27f161f48..86f60b8514 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -62,6 +62,22 @@ else
 HOST_GO_CGO_ENABLED = 0
 endif
 
+HOST_GO_CROSS_ENV = \
+	CC_FOR_TARGET="$(TARGET_CC)" \
+	CXX_FOR_TARGET="$(TARGET_CXX)" \
+	GO_ASSUME_CROSSCOMPILING=1
+
+ifneq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
+HOST_GO_CROSS_ENV =
+GO_GOARM =
+ifeq ($(HOSTARCH),x86_64)
+GO_GOARCH = amd64
+else ifeq ($(HOSTARCH),i386)
+GO_GOARCH = 386
+else ifeq ($(HOSTARCH),arm)
+GO_GOARCH = arm
+endif
+endif
 # The go build system is not compatible with ccache, so use
 # HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
 HOST_GO_MAKE_ENV = \
@@ -75,16 +91,12 @@ HOST_GO_MAKE_ENV = \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	GOOS=linux \
 	CC=$(HOSTCC_NOCCACHE) \
-	CXX=$(HOSTCXX_NOCCACHE) \
-	GO_ASSUME_CROSSCOMPILING=1
+	CXX=$(HOSTCXX_NOCCACHE)
 
-HOST_GO_TARGET_CC = \
-	CC_FOR_TARGET="$(TARGET_CC)" \
-	CXX_FOR_TARGET="$(TARGET_CXX)"
 
 define HOST_GO_BUILD_CMDS
 	cd $(@D)/src && \
-		$(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
+		$(HOST_GO_MAKE_ENV) $(HOST_GO_CROSS_ENV) CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
 		./make.bash $(if $(VERBOSE),-v)
 endef
 
-- 
2.20.1
