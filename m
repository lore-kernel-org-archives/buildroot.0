From: Christian Stewart <christian@paral.in>
Date: Fri, 16 Feb 2018 03:26:14 -0500
Subject: [Buildroot] [PATCH 07/10] runc: bump to 9f9c96235cc
In-Reply-To: <20180216082617.12039-1-christian@paral.in>
References: <20180216082617.12039-1-christian@paral.in>
Message-ID: <20180216082617.12039-8-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps runc to the requisite version for Docker 2018.02-ce.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash |  2 +-
 package/runc/runc.mk   | 17 +++++++++++------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 3e188c5c79..475a4fb05a 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	b5c50d7d9a5f610d5424f96196efa306ec708fd9299302dd919545099c16b7c1	runc-9c2d8d184e5da67c95d601382adf14862e4f2228.tar.gz
+sha256	fa9854008f64f71b798ca63aed5be774aa432888bfda0d3ec60f2571647af156	runc-9f9c96235cc97674e935002fc3d78361b696a69e.tar.gz
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index fb3fec20f5..162982f1ad 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-RUNC_VERSION = 9c2d8d184e5da67c95d601382adf14862e4f2228
+RUNC_VERSION = 9f9c96235cc97674e935002fc3d78361b696a69e
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 
 RUNC_DEPENDENCIES = host-go
 
-RUNC_GOPATH = "$(@D)/Godeps/_workspace"
+RUNC_GOPATH = $(@D)/gopath
 RUNC_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 	CGO_ENABLED=1 \
 	GOBIN="$(@D)/bin" \
@@ -23,9 +23,10 @@ RUNC_GLDFLAGS = \
 
 ifeq ($(BR2_STATIC_LIBS),y)
 RUNC_GLDFLAGS += -extldflags '-static'
+RUNC_GOTAGS += static_build
 endif
 
-RUNC_GOTAGS = cgo static_build
+RUNC_GOTAGS = cgo
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 RUNC_GOTAGS += seccomp
@@ -38,9 +39,13 @@ define RUNC_CONFIGURE_CMDS
 endef
 
 define RUNC_BUILD_CMDS
-	cd $(@D) && $(RUNC_MAKE_ENV) $(HOST_DIR)/bin/go \
-		build -v -o $(@D)/bin/runc \
-		-tags "$(RUNC_GOTAGS)" -ldflags "$(RUNC_GLDFLAGS)" .
+	cd $(RUNC_GOPATH)/src/github.com/opencontainers/runc; \
+		$(RUNC_MAKE_ENV) \
+		$(HOST_DIR)/bin/go build -v -i \
+		-o $(@D)/bin/runc \
+		-tags "$(RUNC_GOTAGS)" \
+		-ldflags "$(RUNC_GLDFLAGS)" \
+		./
 endef
 
 define RUNC_INSTALL_TARGET_CMDS
-- 
2.13.6
