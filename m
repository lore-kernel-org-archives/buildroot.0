From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed,  6 Dec 2017 11:56:56 +0100
Subject: [Buildroot] [PATCH 4/5] package/runc: converting to golang
 infrastructure
In-Reply-To: <1512557817-431-1-git-send-email-angelo@amarulasolutions.com>
References: <1512557817-431-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1512557817-431-5-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch converts the runc package to the new golang
infrastructure.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/runc/runc.mk | 37 +++++--------------------------------
 1 file changed, 5 insertions(+), 32 deletions(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index fb3fec2..f497b6d 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -9,42 +9,15 @@ RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 
-RUNC_DEPENDENCIES = host-go
+RUNC_GOPATH = Godeps/_workspace
 
-RUNC_GOPATH = "$(@D)/Godeps/_workspace"
-RUNC_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
-	CGO_ENABLED=1 \
-	GOBIN="$(@D)/bin" \
-	GOPATH="$(RUNC_GOPATH)" \
-	PATH=$(BR_PATH)
+RUNC_GO_LDFLAGS = -X main.gitCommit=$(RUNC_VERSION)
 
-RUNC_GLDFLAGS = \
-	-X main.gitCommit=$(RUNC_VERSION)
-
-ifeq ($(BR2_STATIC_LIBS),y)
-RUNC_GLDFLAGS += -extldflags '-static'
-endif
-
-RUNC_GOTAGS = cgo static_build
+RUNC_GO_TAGS = cgo static_build
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-RUNC_GOTAGS += seccomp
+RUNC_GO_TAGS += seccomp
 RUNC_DEPENDENCIES += libseccomp host-pkgconf
 endif
 
-define RUNC_CONFIGURE_CMDS
-	mkdir -p $(RUNC_GOPATH)/src/github.com/opencontainers
-	ln -s $(@D) $(RUNC_GOPATH)/src/github.com/opencontainers/runc
-endef
-
-define RUNC_BUILD_CMDS
-	cd $(@D) && $(RUNC_MAKE_ENV) $(HOST_DIR)/bin/go \
-		build -v -o $(@D)/bin/runc \
-		-tags "$(RUNC_GOTAGS)" -ldflags "$(RUNC_GLDFLAGS)" .
-endef
-
-define RUNC_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bin/runc $(TARGET_DIR)/usr/bin/runc
-endef
-
-$(eval $(generic-package))
+$(eval $(golang-package))
-- 
2.7.4
