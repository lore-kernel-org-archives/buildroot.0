From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 23:09:34 +0200
Subject: [Buildroot] [git commit branch/next] lxc: new package
Message-ID: <20130813210929.944369B349@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f62a006639bb4222027415bee7193061ca1c514c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Linux Containers (LXC), provides the ability to group and isolate
of a set of processes in a jail by virtualizing and accounting the
kernel resources. It is similar to Linux-Vserver or Openvz.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in     |    1 +
 package/lxc/Config.in |   14 ++++++++++++++
 package/lxc/lxc.mk    |   14 ++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2ee843e..2347229 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -903,6 +903,7 @@ source "package/cpuload/Config.in"
 source "package/htop/Config.in"
 source "package/keyutils/Config.in"
 source "package/kmod/Config.in"
+source "package/lxc/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 endif
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
new file mode 100644
index 0000000..5e6e208
--- /dev/null
+++ b/package/lxc/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LXC
+	bool "lxc"
+	select BR2_PACKAGE_LIBCAP
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Linux Containers (LXC), provides the ability to group and isolate
+	  of a set of processes in a jail by virtualizing and accounting the
+	  kernel resources. It is similar to Linux-Vserver or Openvz.
+
+	  http://lxc.sourceforge.net/
+
+comment "lxc requires a toolchain with IPv6 and thread support"
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
new file mode 100644
index 0000000..4e06902
--- /dev/null
+++ b/package/lxc/lxc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lxc
+#
+################################################################################
+
+LXC_VERSION = 0.9.0
+LXC_SITE = http://downloads.sourceforge.net/project/lxc/lxc/lxc-$(LXC_VERSION)
+LXC_LICENSE = LGPLv2.1+
+LXC_LICENSE_FILES = COPYING
+LXC_DEPENDENCIES = libcap
+LXC_CONF_OPT = --disable-apparmor
+
+$(eval $(autotools-package))
