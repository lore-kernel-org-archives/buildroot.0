From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 16 Mar 2020 16:01:05 +0100
Subject: [Buildroot] [PATCH] package/syslog-ng: fix build if net-snmp is
 installed on the host
Message-ID: <20200316150106.8800-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

If syslog-ng is selected in Buildroot and net-snmp is not, but net-snmp is
found on the host machine (at least its net-snmp-config script) then
compilation of syslog-ng fails with:

  CC       modules/snmp-dest/modules_snmp_dest_libsnmpdest_la-snmpdest-grammar.lo
  CC       modules/snmp-dest/modules_snmp_dest_libsnmpdest_la-snmpdest.lo
  CC       modules/snmp-dest/modules_snmp_dest_libsnmpdest_la-snmpdest-plugin.lo
arm-none-linux-gnueabi-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
make[3]: *** [Makefile:17397: modules/snmp-dest/modules_snmp_dest_libsnmpdest_la-snmpdest-grammar.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
arm-none-linux-gnueabi-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
make[3]: *** [Makefile:17404: modules/snmp-dest/modules_snmp_dest_libsnmpdest_la-snmpdest.lo] Error 1
arm-none-linux-gnueabi-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
make[3]: *** [Makefile:17411: modules/snmp-dest/modules_snmp_dest_libsnmpdest_la-snmpdest-plugin.lo] Error 1
make[2]: *** [Makefile:21428: all-recursive] Error 1
make[1]: *** [Makefile:8740: all] Error 2
make[1]: Leaving directory '.../buildroot/output/build/syslog-ng-3.25.1'
make: *** [package/pkg-generic.mk:269: .../buildroot/output/build/syslog-ng-3.25.1/.stamp_built] Error 2

The path /usr/include is obtained via /usr/bin/net-snmp-config.

The fix comprises two parts:
1. only enable net-snmp support in syslog-ng if the net-snmp package is
enabled in Buildroot
2. for the case where net-snmp is selected in Buildroot, fix the configure
script of syslog-ng to allow parsing --with-netsnmp=<path> correctly.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 .../0002-configure.ac-fix-with-netsnmp.patch  | 41 +++++++++++++++++++
 package/syslog-ng/syslog-ng.mk                |  8 ++++
 2 files changed, 49 insertions(+)
 create mode 100644 package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch

diff --git a/package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch b/package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch
new file mode 100644
index 0000000000..f5b2a39bba
--- /dev/null
+++ b/package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch
@@ -0,0 +1,41 @@
+From 39ab118a7e79b223941b50b372c8ed51f0e21f4b Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Mon, 16 Mar 2020 15:41:03 +0100
+Subject: [PATCH] configure.ac: fix --with-netsnmp
+
+The option '--with-net-snmp' did not work, because later checks were using
+the variable '$with_netsnmp' rather than '$with_net_snmp'.
+
+There are two possible solutions:
+- make the option '--with-netsnmp'
+- change the internal variables
+
+Taking into account that latest upstream has moved away from autotools and
+towards cmake, we opt for the first option that has the least amount of
+changes.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Upstream-status: not applicable (latest upstream moved to cmake)
+
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index bfc85c32d..392ab8bf3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -148,8 +148,8 @@ AC_ARG_WITH(libnet,
+    ,
+    [with_libnet=""])
+ 
+-AC_ARG_WITH(net-snmp,
+-   [  --with-net-snmp=path      use path to net-snmp-config script],
++AC_ARG_WITH(netsnmp,
++   [  --with-netsnmp=path      use path to net-snmp-config script],
+    ,
+    [with_netsnmp=""])
+ 
+-- 
+2.24.1
+
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 9b7e9a1317..156bd95593 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -97,6 +97,14 @@ else
 SYSLOG_NG_CONF_OPTS += --disable-systemd
 endif
 
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+SYSLOG_NG_DEPENDENCIES += netsnmp
+SYSLOG_NG_CONF_OPTS += --enable-snmp-dest
+SYSLOG_NG_CONF_OPTS += --with-netsnmp="$(STAGING_DIR)/usr/bin"
+else
+SYSLOG_NG_CONF_OPTS += --disable-snmp-dest
+endif
+
 define SYSLOG_NG_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/syslog-ng/S01syslog-ng \
 		$(TARGET_DIR)/etc/init.d/S01syslog-ng
-- 
2.24.1
