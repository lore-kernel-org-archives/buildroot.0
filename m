From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 19:06:54 +0200
Subject: [Buildroot] [git commit] c-icap: new package
Message-ID: <20150710170739.1239F8191B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97b494b0d33eb8a38b4840eb384872d20bf48b70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Remove trailing whitespace everywhere
 - Rewrap the Config.in help text
 - Fix Config.in comment, the proper text for BR2_PREFER_STATIC_LIB is
   "dynamic library", not "libdl library"
 - Use a PID file in the init script
 - Show OK / FAIL when stopping the service
 - Remove the largefile/IPv6 handling in c-icap.mk, since they are now
   mandatory. We therefore pass --enable-large-files and --enable-ipv6
   unconditionally.
 - Remove the reference to a non-existing
   C_ICAP_INSTALL_TARGET_CONFIGS install target hook.
 - Install the init script unconditionally.
 - Remove unneeded example configuration files (*.default) from /etc,
   and fixup the c-icap.conf so that the default values work with
   Buildroot
 - Properly handle the *-config scripts installed by c-icap.
 - Add hash file.]

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/c-icap/Config.in   |   16 ++++++++++
 package/c-icap/S96cicap    |   27 +++++++++++++++++
 package/c-icap/c-icap.hash |    2 +
 package/c-icap/c-icap.mk   |   70 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 116 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d9b0794..4df5cdb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1159,6 +1159,7 @@ menu "Networking applications"
 	source "package/boa/Config.in"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
+	source "package/c-icap/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
diff --git a/package/c-icap/Config.in b/package/c-icap/Config.in
new file mode 100644
index 0000000..f949c16
--- /dev/null
+++ b/package/c-icap/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_C_ICAP
+	bool "c-icap"
+	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  c-icap is an implementation of an ICAP server. It can be
+	  used with HTTP proxies that support the ICAP protocol to
+	  implement content adaptation and filtering services.  Most
+	  of the commercial HTTP proxies must support the ICAP
+	  protocol.  The open source Squid 3.x proxy server supports
+	  it.
+
+	  http://c-icap.sourceforge.net/
+
+comment "c-icap needs a toolchain w/ threads and dynamic library"
+	depends on BR2_PREFER_STATIC_LIB  || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/c-icap/S96cicap b/package/c-icap/S96cicap
new file mode 100644
index 0000000..baef334
--- /dev/null
+++ b/package/c-icap/S96cicap
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+# (Re)create directories
+mkdir -p /var/run/c-icap
+mkdir -p /var/log/c-icap
+
+case "$1" in
+    start)
+	echo -n "Starting c-icap server: "
+	start-stop-daemon -S -q -b -m -p /var/run/c-icap.pid \
+			  -x /usr/bin/c-icap -- -N
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	;;
+    stop)
+	echo -n "Stopping c-icap server: "
+	start-stop-daemon -K -q -p /var/run/c-icap.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	;;
+    restart|reload)
+	$0 stop
+	sleep 1
+	$0 start
+	;;
+     *)
+	echo "Usage: /etc/init.d/S96cicap {start|stop|restart|reload}"
+	exit 1
+esac
diff --git a/package/c-icap/c-icap.hash b/package/c-icap/c-icap.hash
new file mode 100644
index 0000000..89c70f4
--- /dev/null
+++ b/package/c-icap/c-icap.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 46b97fab73dbb9e8def8e34c3f94048c92f50a5341bb85bec4f6f6349aec529a c_icap-0.3.5.tar.gz
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
new file mode 100644
index 0000000..51c0f5f
--- /dev/null
+++ b/package/c-icap/c-icap.mk
@@ -0,0 +1,70 @@
+################################################################################
+#
+# c-icap
+#
+################################################################################
+
+C_ICAP_VERSION = 0.3.5
+C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
+C_ICAP_SITE = http://downloads.sourceforge.net/c-icap/
+C_ICAP_LICENSE = LGPLv2.1+
+C_ICAP_LICENSE_FILES = COPYING
+C_ICAP_INSTALL_STAGING = YES
+C_ICAP_CONFIG_SCRIPTS = c-icap-config c-icap-libicapapi-config
+C_ICAP_CONF_OPTS = \
+	--with-process-mutexes=posix \
+	--without-ldap \
+	--enable-large-files \
+	--enable-ipv6
+
+ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
+C_ICAP_CONF_OPTS += --with-berkeleydb
+C_ICAP_DEPENDENCIES += berkeleydb
+else
+C_ICAP_CONF_OPTS += --without-berkeleydb
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+C_ICAP_CONF_OPTS += --with-bzip2
+C_ICAP_DEPENDENCIES += bzip2
+else
+C_ICAP_CONF_OPTS += --without-bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_PERL),y)
+C_ICAP_CONF_OPTS += --with-perl
+C_ICAP_DEPENDENCIES += perl
+else
+C_ICAP_CONF_OPTS += --without-perl
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+C_ICAP_CONF_OPTS += --with-zlib
+C_ICAP_DEPENDENCIES += zlib
+else
+C_ICAP_CONF_OPTS += --without-zlib
+endif
+
+define C_ICAP_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/c-icap/S96cicap $(TARGET_DIR)/etc/init.d/S96cicap
+endef
+
+# Tweak the installation:
+#  - Removed unneeded sample configuration files (c-icap.*.default),
+#    since some real ones are also installed
+#  - Tweak some paths in the c-icap.conf configuration file
+#  - Tweak the -config scripts, because the generic
+#    <pkg>_CONFIG_SCRIPTS logic doesn't tweak them enough
+define C_ICAP_TUNE_INSTALLATION
+	$(RM) -f $(TARGET_DIR)/etc/c-icap.*.default
+	$(SED) 's%/usr/etc/%/etc/%' $(TARGET_DIR)/etc/c-icap.conf
+	$(SED) 's%/usr/var/%/var/%' $(TARGET_DIR)/etc/c-icap.conf
+	$(SED) 's%INCDIR=.*%INCDIR=$(STAGING_DIR)/usr/include%' \
+		$(STAGING_DIR)/usr/bin/{c-icap,c-icap-libicapapi}-config
+	$(SED) 's%INCDIR2=.*%INCDIR2=$(STAGING_DIR)/usr/include/c_icap%' \
+		$(STAGING_DIR)/usr/bin/{c-icap,c-icap-libicapapi}-config
+endef
+
+C_ICAP_POST_INSTALL_TARGET_HOOKS += C_ICAP_TUNE_INSTALLATION
+
+$(eval $(autotools-package))
