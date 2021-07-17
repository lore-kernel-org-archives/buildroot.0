From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 16 Jul 2021 21:58:53 -0600
Subject: [Buildroot] [PATCH v5 1/1] package/systemd: bump to version 249
Message-ID: <20210717035854.2113295-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add config option for systemd-sysext.

Add config option for systemd-oomd.

Add new host-python3-jinja2 dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - don't enable systemd-oomd by default
Changes v3 -> v4:
  - add transient user/groups nsswitch.conf support
Changes v2 -> v3:
  - add oomd and sysext configuration options
Changes v1 -> v2:
  - add host-python3-jinja2 host-systemd dependency
---
 package/systemd/Config.in    | 24 ++++++++++++++++++++++++
 package/systemd/systemd.hash |  4 ++--
 package/systemd/systemd.mk   | 22 ++++++++++++++++++++--
 3 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d658308213..60ae007dbc 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -318,6 +318,15 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
+config BR2_PACKAGE_SYSTEMD_OOMD
+	bool "enable out-of-memory killer"
+	help
+	  systemd-oomd is a system service that uses cgroups-v2 and
+	  pressure stall information (PSI) to monitor and take action
+	  on processes before an OOM occurs in kernel space.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-oomd.html
+
 config BR2_PACKAGE_SYSTEMD_POLKIT
 	bool "enable polkit support"
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # polkit
@@ -424,6 +433,21 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	  When this feature is enabled, Systemd mounts smackfs and
 	  manages security labels for sockets.
 
+config BR2_PACKAGE_SYSTEMD_SYSEXT
+	bool "enable sysext support"
+	help
+	  systemd-sysext activates/deactivates system extension images.
+
+	  System extension images may ? dynamically at runtime ? extend
+	  the /usr/ and /opt/ directory hierarchies with additional files.
+
+	  This is particularly useful on immutable system images where a
+	  /usr/ and/or /opt/ hierarchy residing on a read-only file system
+	  shall be extended temporarily at runtime without making any
+	  persistent modifications.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-sysext.html
+
 config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	bool "enable sysusers support"
 	help
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 20cd922259..82741d1996 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,6 +1,6 @@
 # sha256 locally computed
-sha256  2869986e219a8dfc96cc0dffac66e0c13bb70a89e16b85a3948876c146cfa3e0  systemd-247.3.tar.gz
+sha256  0d9d45140e95f2d0ee79005ccf867f2706976c30391b932a8c3b9b198a801fad  systemd-249.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
-sha256  6f22d19d35b00f35e0444e0bc9139e6d3bdf7277978f89c4e175e37b18c43f3d  README
+sha256  f5645b4b846479859d6618fa7a5a1722681aa7fc43c1e45f8bf8e1fe5738d618  README
 sha256  83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  tools/chromiumos/LICENSE
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 74c561e67e..5562703a89 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 247.3
+SYSTEMD_VERSION = 249
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
@@ -14,6 +14,7 @@ SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	host-gperf \
+	host-python3-jinja2 \
 	kmod \
 	libcap \
 	util-linux-libs \
@@ -411,6 +412,12 @@ else
 SYSTEMD_CONF_OPTS += -Dpstore=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_OOMD),y)
+SYSTEMD_CONF_OPTS += -Doomd=true
+else
+SYSTEMD_CONF_OPTS += -Doomd=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
 SYSTEMD_CONF_OPTS += -Dpolkit=true
 SYSTEMD_DEPENDENCIES += polkit
@@ -424,6 +431,12 @@ else
 SYSTEMD_CONF_OPTS += -Dportabled=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSEXT),y)
+SYSTEMD_CONF_OPTS += -Dsysext=true
+else
+SYSTEMD_CONF_OPTS += -Dsysext=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
@@ -543,6 +556,8 @@ endef
 define SYSTEMD_INSTALL_NSSCONFIG_HOOK
 	$(SED) '/^passwd:/ {/systemd/! s/$$/ systemd/}' \
 		-e '/^group:/ {/systemd/! s/$$/ [SUCCESS=merge] systemd/}' \
+		-e '/^shadow:/ {/systemd/! s/$$/ systemd/}' \
+		-e '/^gshadow:/ {/systemd/! s/$$/ systemd/}' \
 		$(if $(BR2_PACKAGE_SYSTEMD_RESOLVED), \
 			-e '/^hosts:/ s/[[:space:]]*mymachines//' \
 			-e '/^hosts:/ {/resolve/! s/files/files resolve [!UNAVAIL=return]/}' ) \
@@ -663,11 +678,13 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Drepart=false \
 	-Dcoredump=false \
 	-Dpstore=false \
+	-Doomd=false \
 	-Dlogind=false \
 	-Dhostnamed=false \
 	-Dlocaled=false \
 	-Dmachined=false \
 	-Dportabled=false \
+	-Dsysext=false \
 	-Duserdb=false \
 	-Dhomed=false \
 	-Dnetworkd=false \
@@ -717,7 +734,8 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-util-linux \
 	host-patchelf \
 	host-libcap \
-	host-gperf
+	host-gperf \
+	host-python3-jinja2
 
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 
-- 
2.25.1
