From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 15:27:32 +0200
Subject: [Buildroot] [PATCH v4 4/8] package/flannel: convert to golang
 infrastructure
In-Reply-To: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
References: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180331132736.21105-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo@amarulasolutions.com>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flannel/flannel.mk | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index bbb2c72a72..07d5d0dfd6 100644
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
+FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION)
 
+# Install flannel to its well known location.
 define FLANNEL_INSTALL_TARGET_CMDS
-	# Install flannel to its well known location.
-	$(INSTALL) -D -m 0755 $(@D)/bin/flanneld $(TARGET_DIR)/opt/bin/flanneld
+	$(INSTALL) -D -m 0755 $(@D)/$(FLANNEL_BINDIR)/flannel $(TARGET_DIR)/opt/bin/flanneld
 	$(INSTALL) -D -m 0755 $(@D)/dist/mk-docker-opts.sh $(TARGET_DIR)/opt/bin/mk-docker-opts.sh
 endef
 
-$(eval $(generic-package))
+$(eval $(golang-package))
-- 
2.14.3
