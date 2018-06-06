From: =?UTF-8?Q?Refik_Tuzakl=c4=b1?= <refik.tuzakli@savronik.com.tr>
Date: Wed, 6 Jun 2018 08:29:48 +0300
Subject: [Buildroot] [BUILDROOT][PATCHv2 2/3]balena: new package
Message-ID: <8bd86ff6-5a83-c2b9-f64d-eb30f73adb56@savronik.com.tr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Refik Tuzakli <refik.tuzakli@savronik.com.tr>
Date: Tue, 5 Jun 2018 17:53:32 +0300
Subject: [PATCH v2 2/3] balena: new package

Signed-off-by: Refik Tuzakli <refik.tuzakli@savronik.com.tr>
---
 ?DEVELOPERS???????????????? |? 3 +++
 ?package/Config.in????????? |? 1 +
 ?package/balena/Config.in?? | 17 ++++++++++++++++
 ?package/balena/balena.hash |? 2 ++
 ?package/balena/balena.mk?? | 51 
++++++++++++++++++++++++++++++++++++++++++++++
 ?5 files changed, 74 insertions(+)
 ?create mode 100644 package/balena/Config.in
 ?create mode 100644 package/balena/balena.hash
 ?create mode 100644 package/balena/balena.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ad3edc..ae3abe1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1613,6 +1613,9 @@ N:??? Rahul Jain <rahul.jain@imgtec.com>
 ?F:??? package/uhttpd/
 ?F:??? package/ustream-ssl/

+N:??? Refik Tuzakli <refik.tuzakli@savronik.com.tr>
+F:??? package/balena/
+
 ?N:??? Renaud Aubin <root@renaud.io>
 ?F:??? package/libhttpparser/

diff --git a/package/Config.in b/package/Config.in
index 1730201..21c980c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1984,6 +1984,7 @@ menu "System tools"
 ???? source "package/atop/Config.in"
 ???? source "package/attr/Config.in"
 ???? source "package/audit/Config.in"
+??? source "package/balena/Config.in"
 ???? source "package/bootutils/Config.in"
 ???? source "package/cgroupfs-mount/Config.in"
 ???? source "package/circus/Config.in"
diff --git a/package/balena/Config.in b/package/balena/Config.in
new file mode 100644
index 0000000..773cf1d
--- /dev/null
+++ b/package/balena/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_BALENA
+??? bool "balena"
+??? depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+??? depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+??? depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
+??? depends on BR2_INIT_SYSTEMD
+??? depends on BR2_USE_MMU # lvm2
+??? depends on !BR2_STATIC_LIBS # lvm2
+??? select BR2_PACKAGE_LVM2
+??? select BR2_PACKAGE_LVM2_STANDARD_INSTALL # libdevmapper
+??? help
+??? ? Moby-based Container Engine for Embedded, IoT, and Edge uses
+
+??? ? https://github.com/resin-os/balena
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
index 0000000..bce32c3
--- /dev/null
+++ b/package/balena/balena.mk
@@ -0,0 +1,51 @@
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
+BALENA_DEPENDENCIES = host-pkgconf systemd lvm2
+
+BALENA_CONFIGURE_ENV = GOPATH="$(@D)/$(BALENA_WORKSPACE)" \
+??? DOCKER_GITCOMMIT=$(BALENA_COMMIT) \
+??? DOCKER_BUILDTAGS='exclude_graphdriver_btrfs exclude_graphdirver_zfs 
exclude_graphdriver_devicemapper'
+
+BALENA_LDFLAGS += -extldflags '-static'
+
+BALENA_SRC_SUBDIR = github.com/docker/docker
+
+define BALENA_MAKE_DYNBINARY_BALENA
+??? cd $(@D) && \
+??? ??? $(GO_TARGET_ENV) \
+??? ??? $(BALENA_CONFIGURE_ENV) \
+??? ??? bash ./hack/make.sh dynbinary-balena
+endef
+
+BALENA_POST_CONFIGURE_HOOKS += BALENA_MAKE_DYNBINARY_BALENA
+
+define BALENA_BUILD_CMDS
+??? cd $(@D)/$(BALENA_WORKSPACE)/src/$(BALENA_SRC_SUBDIR)/cmd/mobynit; \
+??? GOPATH="$(@D)/$(BALENA_WORKSPACE)" \
+??? $(HOST_DIR)/bin/go build -v\
+??? ??? $(BALENA_BUILD_OPTS)
+endef
+
+define BALENA_INSTALL_TARGET_CMDS
+??? $(INSTALL) -D -m 0755 
$(@D)/bundles/17.06.0-dev/dynbinary-balena/balena \
+??? ??? $(TARGET_DIR)/usr/bin/balena
+??? ln -sf balena $(TARGET_DIR)/usr/bin/balenad
+??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-containerd
+??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-containerd-shim
+??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-containerd-ctr
+??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-runc
+??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-proxy
+endef
+
+$(eval $(golang-package))
-- 
1.9.1


-- 

Refik Tuzakl?
Embedded Software Engineer
IT and Simulation Group

Savronik A.?.

Organize Sanayi B?lgesi

20. Cadde No: 19 26110

Eski?ehir Turkey

Tel   : (+90 222) 236 1590

Faks: (+90 222) 236 1589
www.savronik.com.tr

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180606/b59c7eaa/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: refik_tuzakli.vcf
Type: text/x-vcard
Size: 4 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180606/b59c7eaa/attachment.vcf>
