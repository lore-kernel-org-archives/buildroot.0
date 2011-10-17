From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Oct 2011 23:29:14 +0200
Subject: [Buildroot] [git commit] ntp: bump to version 4.2.6p4 and enhance
Message-ID: <20111018052252.623EA8D1BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a83a8a03599d1ebdf8237a879693975a95e95fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Bump to version 4.2.6p4
* Add new ntpsnmpd option
* Fix style

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ntp/Config.in |   18 +++++++++---------
 package/ntp/ntp.mk    |   25 ++++++++++++++++---------
 2 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 1b2ab4b..5996596 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -6,22 +6,21 @@ config BR2_PACKAGE_NTP
 
 	  http://www.ntp.org/
 
+if BR2_PACKAGE_NTP
+
 config BR2_PACKAGE_NTP_SNTP
 	bool "sntp"
-	depends on BR2_PACKAGE_NTP
 	help
 	  Simple network time protocol program
 
 config BR2_PACKAGE_NTP_NTP_KEYGEN
 	bool "ntp-keygen"
-	depends on BR2_PACKAGE_NTP
 	help
 	  Create a NTP host key
 
 config BR2_PACKAGE_NTP_NTP_WAIT
 	bool "ntp-wait"
 	depends on BR2_PACKAGE_MICROPERL
-	depends on BR2_PACKAGE_NTP
 	help
 	  ntp-wait waits until the locally running ntpd is in state 4
 	  (synchronized). This could be useful at boot time, to delay the
@@ -29,7 +28,6 @@ config BR2_PACKAGE_NTP_NTP_WAIT
 
 config BR2_PACKAGE_NTP_NTPD
 	bool "ntpd"
-	depends on BR2_PACKAGE_NTP
 	default y
 	help
 	  ntpd is the time synchronization daemon keeping your local
@@ -38,29 +36,30 @@ config BR2_PACKAGE_NTP_NTPD
 
 config BR2_PACKAGE_NTP_NTPDATE
 	bool "ntpdate"
-	depends on BR2_PACKAGE_NTP
 	help
 	  The ntpdate utility program is used to set the local date and time
 	  from an NTP server given as an argument.
 
 config BR2_PACKAGE_NTP_NTPDC
 	bool "ntpdc"
-	depends on BR2_PACKAGE_NTP
 	help
 	  The ntpdc utility program is used to query an NTP daemon about
 	  its current state and to request changes in that state.
 
 config BR2_PACKAGE_NTP_NTPQ
 	bool "ntpq"
-	depends on BR2_PACKAGE_NTP
 	help
 	  The ntpq utility program is used to query NTP servers requesting
 	  information about current state and/or changes in that state.
 
+config BR2_PACKAGE_NTP_NTPSNMPD
+	bool "ntpsnmpd"
+	help
+	  Install ntpsnmpd NTP SNMP MIB agent.
+
 config BR2_PACKAGE_NTP_NTPTRACE
 	bool "ntptrace"
 	depends on BR2_PACKAGE_MICROPERL
-	depends on BR2_PACKAGE_NTP
 	help
 	  ntptrace is a perl script that uses the ntpq utility program to
 	  follow the chain of NTP servers from a given host back to the
@@ -68,6 +67,7 @@ config BR2_PACKAGE_NTP_NTPTRACE
 
 config BR2_PACKAGE_NTP_TICKADJ
 	bool "tickadj"
-	depends on BR2_PACKAGE_NTP
 	help
 	  set time-related kernel variables
+
+endif
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 5f2f993..f17193f 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -3,26 +3,32 @@
 # ntp
 #
 #############################################################
-NTP_VERSION = 4.2.6p3
-NTP_SOURCE = ntp-$(NTP_VERSION).tar.gz
-NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
 
+NTP_VERSION = 4.2.6p4
+NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
 
 ifneq ($(BR2_INET_IPV6),y)
-NTP_CONF_ENV += isc_cv_have_in6addr_any=no
+	NTP_CONF_ENV += isc_cv_have_in6addr_any=no
 endif
 
 NTP_CONF_OPT = --with-shared \
 		--program-transform-name=s,,, \
-		--disable-tickadj \
-		--without-ntpsnmpd
+		--disable-tickadj
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NTP_CONF_OPT += --with-crypto
-NTP_DEPENDENCIES += openssl
+	NTP_CONF_OPT += --with-crypto
+	NTP_DEPENDENCIES += openssl
+else
+	NTP_CONF_OPT += --without-crypto
+endif
+
+ifeq ($(BR2_PACKAGE_NTP_NTPSNMPD),y)
+	NTP_CONF_OPT += \
+		--with-net-snmp-config=$(STAGING_DIR)/usr/bin/net-snmp-config
+	NTP_DEPENDENCIES += netsnmp
 else
-NTP_CONF_OPT += --without-crypto
+	NTP_CONF_OPT += --without-ntpsnmpd
 endif
 
 define NTP_PATCH_FIXUPS
@@ -35,6 +41,7 @@ NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_WAIT) += scripts/ntp-wait
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDATE) += ntpdate/ntpdate
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDC) += ntpdc/ntpdc
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPQ) += ntpq/ntpq
+NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPSNMPD) += ntpsnmpd/ntpsnmpd
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPTRACE) += scripts/ntptrace
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_SNTP) += sntp/sntp
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_TICKADJ) += util/tickadj
