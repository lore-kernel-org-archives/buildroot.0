From: Geoff Levand <geoff@infradead.org>
Date: Wed, 02 Mar 2016 19:23:33 +0000
Subject: [Buildroot] [PATCH 4/4] Add package flannel
In-Reply-To: <cover.1456946494.git.geoff@infradead.org>
References: <cover.1456946494.git.geoff@infradead.org>
Message-ID: <1572d192abce3a19798cdfe75f3aef8f9e3e504c.1456946494.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Flannel is a virtual network that gives a subnet to each host for use
with container runtimes.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/Config.in            |  1 +
 package/flannel/Config.in    |  9 +++++++++
 package/flannel/flannel.hash |  3 +++
 package/flannel/flannel.mk   | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/flannel/Config.in
 create mode 100644 package/flannel/flannel.hash
 create mode 100644 package/flannel/flannel.mk

diff --git a/package/Config.in b/package/Config.in
index b9905cf..bb917f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1332,6 +1332,7 @@ endif
 	source "package/faifa/Config.in"
 	source "package/fastd/Config.in"
 	source "package/fcgiwrap/Config.in"
+	source "package/flannel/Config.in"
 	source "package/fmc/Config.in"
 	source "package/foomatic-filters/Config.in"
 	source "package/fping/Config.in"
diff --git a/package/flannel/Config.in b/package/flannel/Config.in
new file mode 100644
index 0000000..0da356d
--- /dev/null
+++ b/package/flannel/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FLANNEL
+	bool "flannel"
+	depends on BR2_PACKAGE_GO_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  Flannel is a virtual network that gives a subnet to each host for use
+	  with container runtimes.
+
+	  https://github.com/coreos/flannel
diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
new file mode 100644
index 0000000..7459298
--- /dev/null
+++ b/package/flannel/flannel.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 c09a76e80647282687b8db36f28dd3aede650f8f71dad0cf9f453f2ae3a0635d flannel-v0.5.5.tar.gz
+
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
new file mode 100644
index 0000000..93347af
--- /dev/null
+++ b/package/flannel/flannel.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# flannel
+#
+################################################################################
+
+FLANNEL_VERSION = v0.5.5
+FLANNEL_SITE = https://github.com/coreos/flannel.git
+FLANNEL_SITE_METHOD = git
+
+FLANNEL_LICENSE = Apache-2.0
+FLANNEL_LICENSE_FILES = LICENSE
+
+FLANNEL_DEPENDENCIES = host-go
+
+FLANNEL_MAKE_ENV = \
+	GOBIN="$(@D)/bin" \
+	GOPATH="$(@D)/gopath" \
+	GOARCH=$(GO_GOARCH) \
+	CGO_ENABLED=1
+
+define FLANNEL_CONFIGURE_CMDS
+	mkdir -p $(@D)/gopath/src/github.com/coreos
+	ln -s $(@D) $(@D)/gopath/src/github.com/coreos/flannel
+endef
+
+define FLANNEL_BUILD_CMDS
+	cd $(@D) && $(FLANNEL_MAKE_ENV) $(HOST_DIR)/usr/bin/go \
+		build -v -o $(@D)/bin/flanneld .
+endef
+
+define FLANNEL_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/flanneld $(TARGET_DIR)/opt/bin/flanneld
+	$(INSTALL) -D -m 0755 $(@D)/dist/mk-docker-opts.sh $(TARGET_DIR)/opt/bin/mk-docker-opts.sh
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
