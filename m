From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 25 Oct 2017 11:26:48 +0200
Subject: [Buildroot] [RFC v5 4/5] package/runc: converting to golang
	infrastructure
In-Reply-To: <1508923609-2022-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1508923609-2022-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1508923609-2022-4-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch converts the runc package to the new golang
infrastructure.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/runc/runc.mk | 38 ++++----------------------------------
 1 file changed, 4 insertions(+), 34 deletions(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 0b51e11..2855ce3 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -9,43 +9,13 @@ RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 
-RUNC_DEPENDENCIES = host-go
+RUNC_GO_LDFLAGS = -X main.gitCommit=$(RUNC_VERSION)
 
-RUNC_GOPATH = "$(@D)/Godeps/_workspace"
-RUNC_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
-	CGO_ENABLED=1 \
-	GOBIN="$(@D)/bin" \
-	GOPATH="$(RUNC_GOPATH)" \
-	PATH=$(BR_PATH)
-
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
-	cd $(RUNC_GOPATH)/src/github.com/opencontainers/runc && \
-		$(RUNC_MAKE_ENV) $(HOST_DIR)/bin/go \
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
