From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 22:55:49 +0200
Subject: [Buildroot] [git commit] flannel: new package
Message-ID: <20160420210351.7C68780E58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bfe9295be04bce32fad0e0c963caacfd95f92a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Flannel is a virtual network that gives a subnet to each host for use
with container runtimes.

Cc: Brandon Philips <brandon.philips@coreos.com>
Signed-off-by: Geoff Levand <geoff@infradead.org>
[Thomas:
  - Don't select BR2_PACKAGE_HOST_GO since this option was removed.
  - Take into account the rename of BR2_PACKAGE_GO_ARCH_SUPPORTS to
    BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS.
  - Rewrap Config.in help text, it was slightly too large.
  - Don't use the github function (the link was anyway incorrect), but
    instead a direct link to the tarball, since the tarballs are
    uploaded by the maintainers.
  - Update the hash accordingly.
  - Use $() to reference make variables and not ${}.
  - Call the go compiler from $(HOST_DIR)/usr/bin, rather than from
    HOST_GO_ROOT.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/flannel/Config.in    |  8 ++++++++
 package/flannel/flannel.hash |  2 ++
 package/flannel/flannel.mk   | 43 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ecaf164..5103621 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1380,6 +1380,7 @@ endif
 	source "package/faifa/Config.in"
 	source "package/fastd/Config.in"
 	source "package/fcgiwrap/Config.in"
+	source "package/flannel/Config.in"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
 	source "package/freeswitch/Config.in"
diff --git a/package/flannel/Config.in b/package/flannel/Config.in
new file mode 100644
index 0000000..c6a84ef
--- /dev/null
+++ b/package/flannel/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FLANNEL
+	bool "flannel"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	help
+	  Flannel is a virtual network that gives a subnet to each
+	  host for use with container runtimes.
+
+	  https://github.com/coreos/flannel
diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
new file mode 100644
index 0000000..3e0b25c
--- /dev/null
+++ b/package/flannel/flannel.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 dbbcb08c0e70713b0c920387a9967e5b30ef833c8118c847edbbca4f68ff0562 v0.5.5.tar.gz
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
new file mode 100644
index 0000000..876efe6
--- /dev/null
+++ b/package/flannel/flannel.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# flannel
+#
+################################################################################
+
+FLANNEL_VERSION = v0.5.5
+FLANNEL_SITE = https://github.com/coreos/flannel/archive
+FLANNEL_SOURCE = $(FLANNEL_VERSION).tar.gz
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
+FLANNEL_GLDFLAGS = \
+	-X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION) \
+	-extldflags '-static'
+
+define FLANNEL_CONFIGURE_CMDS
+	# Put sources at prescribed GOPATH location.
+	mkdir -p $(@D)/gopath/src/github.com/coreos
+	ln -s $(@D) $(@D)/gopath/src/github.com/coreos/flannel
+endef
+
+define FLANNEL_BUILD_CMDS
+	cd $(@D) && $(FLANNEL_MAKE_ENV) $(HOST_DIR)/usr/bin/go \
+		build -v -o $(@D)/bin/flanneld -ldflags "$(FLANNEL_GLDFLAGS)" .
+endef
+
+define FLANNEL_INSTALL_TARGET_CMDS
+	# Install flannel to its well known location.
+	$(INSTALL) -D -m 0755 $(@D)/bin/flanneld $(TARGET_DIR)/opt/bin/flanneld
+	$(INSTALL) -D -m 0755 $(@D)/dist/mk-docker-opts.sh $(TARGET_DIR)/opt/bin/mk-docker-opts.sh
+endef
+
+$(eval $(generic-package))
