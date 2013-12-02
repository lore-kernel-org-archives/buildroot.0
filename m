From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Dec 2013 23:29:57 +0100
Subject: [Buildroot] [PATCH 3/3] package/parted: add a host variant
In-Reply-To: <cover.1386023329.git.yann.morin.1998@free.fr>
References: <cover.1386023329.git.yann.morin.1998@free.fr>
Message-ID: <1891fdbc7ad11ce084f2be315871eb10573953b7.1386023329.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Usefull for for-build scripts to call parted, eg. to generate
partition tables and such automatically.

Since the primary gaool is to use parted within scripts, we
do not need readline, so it is forcibly disabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in.host        | 1 +
 package/parted/Config.in.host | 6 ++++++
 package/parted/parted.mk      | 4 ++++
 3 files changed, 11 insertions(+)
 create mode 100644 package/parted/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 5fd2570..34e84bf 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -10,6 +10,7 @@ source "package/lpc3250loader/Config.in.host"
 source "package/mtools/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
+source "package/parted/Config.in.host"
 source "package/sam-ba/Config.in.host"
 source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"
diff --git a/package/parted/Config.in.host b/package/parted/Config.in.host
new file mode 100644
index 0000000..f5d7acc
--- /dev/null
+++ b/package/parted/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PARTED
+	bool "host parted"
+	help
+	  parted, the GNU partition resizing program
+
+	  http://www.gnu.org/software/parted/
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 773e332..a1c0e9e 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -8,8 +8,12 @@ PARTED_VERSION = 3.1
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = readline util-linux lvm2
+HOST_PARTED_DEPENDENCIES = host-util-linux host-lvm2
 PARTED_INSTALL_STAGING = YES
 PARTED_LICENSE = GPLv3+
 PARTED_LICENSE_FILES = COPYING
 
+HOST_PARTED_CONF_OPT += --without-readline
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.1.2
