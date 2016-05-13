From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:38:57 +0200
Subject: [Buildroot] [git commit] package/quagga: Fix directories and
	permissions
Message-ID: <20160513203912.62B7181E7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f338c69c631faedca4e2da3f8c8379a3a29013f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quagga runs as the "quagga" user, but it also needs to modify files
in /etc and /var - config files, pid files and vty sockets for vtysh.

Tell the configure script the right folders to use, create the
user, fix the permissions, and then let systemd know (if needed).

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/quagga/quagga.mk            | 29 ++++++++++++++++++++++++++++-
 package/quagga/quagga_tmpfiles.conf |  1 +
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 6b98367..22e90ad 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -10,7 +10,15 @@ QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk
 QUAGGA_LICENSE = GPLv2+
 QUAGGA_LICENSE_FILES = COPYING
-QUAGGA_CONF_OPTS = --program-transform-name=''
+
+# We need to override the sysconf and localstate directories so that
+# quagga can create files as the quagga user without extra
+# intervention
+QUAGGA_CONF_OPTS = \
+	--program-transform-name='' \
+	--sysconfdir=/etc/quagga \
+	--localstatedir=/var/run/quagga
+
 # 0002-configure-fix-static-linking-with-readline.patch
 QUAGGA_AUTORECONF = YES
 
@@ -33,6 +41,20 @@ QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ISISD),--enable-isisd,--disable-is
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE),--enable-bgp-announce,--disable-bgp-announce)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_TCP_ZERBRA),--enable-tcp-zebra,--disable-tcp-zebra)
 
+define QUAGGA_USERS
+	quagga -1 quagga -1 * - - - Quagga priv drop user
+endef
+
+# Set the permissions of /etc/quagga such that quagga (through vtysh)
+# can save the configuration - set the folder recursively as the files
+# need to be 600, and then set the folder (non-recursively) to 755 so
+# it can used.  Quagga also needs to write to the folder as it moves
+# and creates, rather than overwriting.
+define QUAGGA_PERMISSIONS
+	/etc/quagga r 600 quagga quagga - - - - -
+	/etc/quagga d 755 quagga quagga - - - - -
+endef
+
 ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
 QUAGGA_CONF_ENV += ac_cv_path_NETSNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
 QUAGGA_CONF_OPTS += --enable-snmp=agentx
@@ -50,4 +72,9 @@ ifeq ($(BR2_arc),y)
 QUAGGA_CONF_OPTS += --disable-pie
 endif
 
+define QUAGGA_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/quagga/quagga_tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/quagga.conf
+endef
+
 $(eval $(autotools-package))
diff --git a/package/quagga/quagga_tmpfiles.conf b/package/quagga/quagga_tmpfiles.conf
new file mode 100644
index 0000000..e16c475
--- /dev/null
+++ b/package/quagga/quagga_tmpfiles.conf
@@ -0,0 +1 @@
+d /var/run/quagga/ 1755 quagga quagga -
