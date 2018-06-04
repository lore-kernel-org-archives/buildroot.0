From: =?UTF-8?Q?Refik_Tuzakl=c4=b1?= <refik.tuzakli@savronik.com.tr>
Date: Mon, 4 Jun 2018 17:22:37 +0300
Subject: [Buildroot] [BALENA PATCH] balena : New Package
Message-ID: <3551d854-8b04-370c-27ca-53394858a921@savronik.com.tr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


From: Refik Tuzakli <refik.tuzakli@savronik.com.tr>
Date: Mon, 4 Jun 2018 16:34:48 +0300

This patch adds balena; Moby-based Container Engine for Embedded, IoT, 
and Edge uses.

Signed-off-by: Refik Tuzakli <refik.tuzakli@savronik.com.tr>
---
 ?package/Config.in????????? |? 1 +
 ?package/balena/Config.in?? | 16 +++++++++++
 ?package/balena/balena.hash |? 2 ++
 ?package/balena/balena.mk?? | 68 
++++++++++++++++++++++++++++++++++++++++++++++
 ?4 files changed, 87 insertions(+)
 ?create mode 100644 package/balena/Config.in
 ?create mode 100644 package/balena/balena.hash
 ?create mode 100644 package/balena/balena.mk

diff --git a/package/Config.in b/package/Config.in
index 6a1606e..41e1986 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1983,6 +1983,7 @@ menu "System tools"
 ???? source "package/atop/Config.in"
 ???? source "package/attr/Config.in"
 ???? source "package/audit/Config.in"
+??? source "package/balena/Config.in"
 ???? source "package/bootutils/Config.in"
 ???? source "package/cgroupfs-mount/Config.in"
 ???? source "package/circus/Config.in"
diff --git a/package/balena/Config.in b/package/balena/Config.in
new file mode 100644
index 0000000..2904d2a
--- /dev/null
+++ b/package/balena/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_BALENA
+??? bool "balena"
+??? depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+??? depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+??? depends on BR2_TOOLCHAIN_HAS_THREADS
+??? depends on BR2_INIT_SYSTEMD
+??? select BR2_PACKAGE_LVM2
+??? select BR2_PACKAGE_LVM2_STANDARD_INSTALL
+??? help
+??? ? Moby-based Container Engine for Embedded, IoT, and Edge uses
+
+??? ? https://github.com/resin-os/balena
+
+
+comment "balena needs systemd"
+??? depends on !BR2_INIT_SYSTEMD
diff --git a/package/balena/balena.hash b/package/balena/balena.hash
new file mode 100644
index 0000000..9d40895
--- /dev/null
+++ b/package/balena/balena.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ae07affea7f50d9754957d972c9957f42938998dffc48cc57fca37e0b187359a 
balena-17.06-resin.tar.gz
diff --git a/package/balena/balena.mk b/package/balena/balena.mk
new file mode 100644
index 0000000..96f2497
--- /dev/null
+++ b/package/balena/balena.mk
@@ -0,0 +1,68 @@
+################################################################################
+#
+# balena
+#
+################################################################################
+
+BALENA_VERSION = 17.06-resin
+BALENA_COMMIT = 73136d1985f28a34705f537e90636cf208734048
+BALENA_SITE = $(call github,resin-os,balena,$(BALENA_VERSION))
+
+BALENA_LICENSE = Apache-2.0
+BALENA_LICENSE_FILES = LICENSE
+
+BALENA_DEPENDENCIES = host-go host-pkgconf systemd lvm2
+
+BALENA_GOPATH = "$(@D)/.gopath"
+
+BALENA_VERSION_DIR = 17.06.0-dev
+BALENA_BUILD_TARGETS = balena
+BALENA_INSTALL_BINS = $(TARGET_DIR)/usr/bin/$(target)
+
+
+BALENA_CONFIGURE_ENV = GOPATH=${BALENA_GOPATH} \
+??? $(TARGET_MAKE_ENV) \
+??? $(HOST_GO_TARGET_ENV) \
+??? DOCKER_GITCOMMIT=${BALENA_COMMIT} \
+??? DOCKER_BUILDTAGS='exclude_graphdriver_btrfs exclude_graphdirver_zfs 
exclude_graphdriver_devicemapper'
+
+BALENA_MAKE_ENV = GOPATH=$(BALENA_GOPATH) \
+??? $(TARGET_MAKE_ENV) \
+??? $(HOST_GO_TARGET_ENV)
+
+BALENA_GLDFLAGS += -extldflags '-static'
+
+define BALENA_CONFIGURE_CMDS
+??? mkdir -p $(BALENA_GOPATH)/src/github.com/docker
+??? ln -fs $(@D) $(BALENA_GOPATH)/src/github.com/docker/docker
+??? cd $(@D) && \
+??? ??? $(BALENA_CONFIGURE_ENV) \
+??? ??? bash ./hack/make.sh dynbinary-balena
+endef
+
+define BALENA_USERS
+??? - - balena -1 * - - - A Moby-based container engine for IoT
+endef
+
+define BALENA_BUILD_CMDS
+??? $(foreach target,$(BALENA_BUILD_TARGETS), \
+??? ??? cd $(BALENA_GOPATH)/src/github.com/docker/docker/cmd/mobynit; \
+??? ??? $(BALENA_MAKE_ENV) \
+??? ??? $(HOST_DIR)/bin/go build -v\
+??? ??? ??? -ldflags "$(BALENA_GLDFLAGS)"
+??? )
+endef
+
+define BALENA_INSTALL_TARGET_CMDS
+??? $(foreach target,$(BALENA_BUILD_TARGETS), \
+??? ??? $(INSTALL) -D -m 0755 
$(@D)/bundles/17.06.0-dev/dynbinary-balena/$(target) $(BALENA_INSTALL_BINS)
+??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balenad
+??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-containerd
+??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-containerd-shim
+??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-containerd-ctr
+??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-runc
+??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-proxy
+??? )
+endef
+
+$(eval $(golang-package))
-- 
1.9.1


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180604/7ff62b62/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: refik_tuzakli.vcf
Type: text/x-vcard
Size: 4 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180604/7ff62b62/attachment.vcf>
