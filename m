From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 22:10:52 +0200
Subject: [Buildroot] [git commit] snmppp: new package
Message-ID: <20131014203036.B30709A384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9db8d874d5b44734dca0ee98eacd0aad8a9da00a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add comment about why AUTORECONF is needed]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in        |    1 +
 package/snmppp/Config.in |   12 ++++++++++++
 package/snmppp/snmppp.mk |   17 +++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7af6d42..0e6f86c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -637,6 +637,7 @@ source "package/omniorb/Config.in"
 source "package/openpgm/Config.in"
 source "package/ortp/Config.in"
 source "package/slirp/Config.in"
+source "package/snmppp/Config.in"
 source "package/usbredir/Config.in"
 source "package/wvstreams/Config.in"
 source "package/zeromq/Config.in"
diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
new file mode 100644
index 0000000..9757814
--- /dev/null
+++ b/package/snmppp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SNMPPP
+	bool "snmp++"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  SNMP++v3.x is a C++ API which supports SNMP v1, v2c, and v3.
+
+	  http://www.agentpp.com/snmp_pp3_x/snmp_pp3_x.html
+
+comment "snmp++ requires a toolchain with threads and C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
new file mode 100644
index 0000000..8e8fceb
--- /dev/null
+++ b/package/snmppp/snmppp.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# snmp++
+#
+################################################################################
+
+SNMPPP_VERSION = 3.3.0
+SNMPPP_SOURCE = snmp++v$(SNMPPP_VERSION).tar.gz
+SNMPPP_SITE = http://www.agentpp.com
+SNMPPP_DEPENDENCIES = openssl host-pkgconf
+SNMPPP_INSTALL_STAGING = YES
+# no configure script in tarball
+SNMPPP_AUTORECONF = YES
+SNMPPP_LICENSE = SNMP++
+SNMPPP_LICENSE_FILES = snmp_pp/snmp_pp.cpp
+
+$(eval $(autotools-package))
