From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 31 Mar 2018 19:57:31 +0200
Subject: [Buildroot] [git commit] package/runc: convert to golang
 infrastructure
Message-ID: <20180331175811.ACB1F832DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30063d57d35c61cddff3047e7f55c221cf1d2709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/runc/runc.mk | 37 +++++--------------------------------
 1 file changed, 5 insertions(+), 32 deletions(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index fb3fec20f5..f1586f32b2 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -9,42 +9,15 @@ RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 
-RUNC_DEPENDENCIES = host-go
+RUNC_WORKSPACE = Godeps/_workspace
 
-RUNC_GOPATH = "$(@D)/Godeps/_workspace"
-RUNC_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
-	CGO_ENABLED=1 \
-	GOBIN="$(@D)/bin" \
-	GOPATH="$(RUNC_GOPATH)" \
-	PATH=$(BR_PATH)
+RUNC_LDFLAGS = -X main.gitCommit=$(RUNC_VERSION)
 
-RUNC_GLDFLAGS = \
-	-X main.gitCommit=$(RUNC_VERSION)
-
-ifeq ($(BR2_STATIC_LIBS),y)
-RUNC_GLDFLAGS += -extldflags '-static'
-endif
-
-RUNC_GOTAGS = cgo static_build
+RUNC_TAGS = cgo static_build
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-RUNC_GOTAGS += seccomp
+RUNC_TAGS += seccomp
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
