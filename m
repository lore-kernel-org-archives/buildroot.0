From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Apr 2018 13:51:36 +0200
Subject: [Buildroot] [PATCH 2/2] package/pkg-golang: drop the fixed
 <pkg>_BINDIR variable
In-Reply-To: <20180401115136.1345-1-thomas.petazzoni@bootlin.com>
References: <20180401115136.1345-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180401115136.1345-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that <pkg>_BINDIR is always "bin", having it as a package variable
doesn't make much sense, so get rid of this variable completely, and
use "bin".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-proxy/docker-proxy.mk | 2 +-
 package/flannel/flannel.mk           | 2 +-
 package/pkg-golang.mk                | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
index a90271fc35..dfa9d4347d 100644
--- a/package/docker-proxy/docker-proxy.mk
+++ b/package/docker-proxy/docker-proxy.mk
@@ -17,7 +17,7 @@ DOCKER_PROXY_WORKSPACE = gopath
 DOCKER_PROXY_BUILD_TARGETS = cmd/proxy
 
 define DOCKER_PROXY_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/$(DOCKER_PROXY_BINDIR)/proxy $(TARGET_DIR)/usr/bin/docker-proxy
+	$(INSTALL) -D -m 0755 $(@D)/bin/proxy $(TARGET_DIR)/usr/bin/docker-proxy
 endef
 
 $(eval $(golang-package))
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 07d5d0dfd6..d00d2df92c 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -15,7 +15,7 @@ FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION
 
 # Install flannel to its well known location.
 define FLANNEL_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/$(FLANNEL_BINDIR)/flannel $(TARGET_DIR)/opt/bin/flanneld
+	$(INSTALL) -D -m 0755 $(@D)/bin/flannel $(TARGET_DIR)/opt/bin/flanneld
 	$(INSTALL) -D -m 0755 $(@D)/dist/mk-docker-opts.sh $(TARGET_DIR)/opt/bin/mk-docker-opts.sh
 endef
 
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index c21be86a55..5891317b60 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -70,7 +70,6 @@ ifeq ($$($(2)_BUILD_TARGETS),.)
 $(2)_BIN_NAME ?= $(1)
 endif
 
-$(2)_BINDIR = bin
 $(2)_INSTALL_BINS ?= $(1)
 
 # Source files in Go should be extracted in a precise folder in the hierarchy
@@ -103,7 +102,7 @@ define $(2)_BUILD_CMDS
 			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
 			$$($(2)_GO_ENV) \
 			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
-			-o $$(@D)/$$($(2)_BINDIR)/$$(if $$($(2)_BIN_NAME),$$($(2)_BIN_NAME),$$(notdir $$(d))) \
+			-o $$(@D)/bin/$$(if $$($(2)_BIN_NAME),$$($(2)_BIN_NAME),$$(notdir $$(d))) \
 			./$$(d)
 	)
 endef
@@ -114,7 +113,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	$$(foreach d,$$($(2)_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $$(@D)/$$($(2)_BINDIR)/$$(d) $(TARGET_DIR)/usr/bin/$$(d)
+		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(TARGET_DIR)/usr/bin/$$(d)
 	)
 endef
 endif
-- 
2.14.3
