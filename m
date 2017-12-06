From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed,  6 Dec 2017 11:56:55 +0100
Subject: [Buildroot] [PATCH 3/5] package/flannel: converting to golang
 infrastructure
In-Reply-To: <1512557817-431-1-git-send-email-angelo@amarulasolutions.com>
References: <1512557817-431-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1512557817-431-4-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch converts the flannel package to the new golang
infrastructure.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/flannel/flannel.mk | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index bbb2c72..6c9d9dd 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -11,36 +11,12 @@ FLANNEL_SOURCE = $(FLANNEL_VERSION).tar.gz
 FLANNEL_LICENSE = Apache-2.0
 FLANNEL_LICENSE_FILES = LICENSE
 
-FLANNEL_DEPENDENCIES = host-go
-
-FLANNEL_MAKE_ENV = \
-	$(HOST_GO_TARGET_ENV) \
-	GOBIN="$(@D)/bin" \
-	GOPATH="$(@D)/gopath" \
-	CGO_ENABLED=1
-
-FLANNEL_GLDFLAGS = \
-	-X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION)
-
-ifeq ($(BR2_STATIC_LIBS),y)
-FLANNEL_GLDFLAGS += -extldflags '-static'
-endif
-
-define FLANNEL_CONFIGURE_CMDS
-	# Put sources at prescribed GOPATH location.
-	mkdir -p $(@D)/gopath/src/github.com/coreos
-	ln -s $(@D) $(@D)/gopath/src/github.com/coreos/flannel
-endef
-
-define FLANNEL_BUILD_CMDS
-	cd $(@D) && $(FLANNEL_MAKE_ENV) $(HOST_DIR)/bin/go \
-		build -v -o $(@D)/bin/flanneld -ldflags "$(FLANNEL_GLDFLAGS)" .
-endef
+FLANNEL_GO_LDFLAGS = -X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION)
 
+# Install flannel to its well known location.
 define FLANNEL_INSTALL_TARGET_CMDS
-	# Install flannel to its well known location.
-	$(INSTALL) -D -m 0755 $(@D)/bin/flanneld $(TARGET_DIR)/opt/bin/flanneld
+	$(INSTALL) -D -m 0755 $(FLANNEL_BINDIR)/flannel $(TARGET_DIR)/opt/bin/flanneld
 	$(INSTALL) -D -m 0755 $(@D)/dist/mk-docker-opts.sh $(TARGET_DIR)/opt/bin/mk-docker-opts.sh
 endef
 
-$(eval $(generic-package))
+$(eval $(golang-package))
-- 
2.7.4
