From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 Apr 2014 00:20:04 +0200
Subject: [Buildroot] [PATCH 3/5] snmppp: add option to enable logging
In-Reply-To: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net>
References: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1396822806-32655-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SNMP++ logging can be overly verbose, and according to the SNMP++
documentation, disabling logging "increases performance drastically and
minimizes memory consumption".

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/snmppp/Config.in | 11 +++++++++++
 package/snmppp/snmppp.mk |  1 +
 2 files changed, 12 insertions(+)

diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index 5d6d749..1d5113f 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -8,5 +8,16 @@ config BR2_PACKAGE_SNMPPP
 
 	  http://www.agentpp.com/snmp_pp3_x/snmp_pp3_x.html
 
+if BR2_PACKAGE_SNMPPP
+
+config BR2_PACKAGE_SNMPPP_LOGGING
+	bool "enable logging"
+	help
+	  Enable logging output for SNMP++.
+	  According to the SNMP++ documentation, disabling logging "increases
+	  performance drastically and minimizes memory consumption".
+
+endif
+
 comment "snmp++ needs a toolchain w/ threads, C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 78d7dc9..3f3018d 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -11,6 +11,7 @@ SNMPPP_DEPENDENCIES = openssl host-pkgconf
 SNMPPP_INSTALL_STAGING = YES
 # no configure script in tarball
 SNMPPP_AUTORECONF = YES
+SNMPPP_CONF_OPT = $(if $(BR2_PACKAGE_SNMPPP_LOGGING),--enable-logging,--disable-logging)
 SNMPPP_LICENSE = SNMP++
 SNMPPP_LICENSE_FILES = src/v3.cpp
 
-- 
1.8.3.2
