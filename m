From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 19 Oct 2012 15:13:52 +0200
Subject: [Buildroot] [PATCH v11 7/9] perl: prepare the removal of microperl
In-Reply-To: <1350652434-32020-1-git-send-email-francois.perrad@gadz.org>
References: <1350652434-32020-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1350652434-32020-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/autoconf/Config.in   |    2 +-
 package/autoconf/autoconf.mk |    2 +-
 package/automake/Config.in   |    2 +-
 package/automake/automake.mk |    2 +-
 package/microperl/Config.in  |    1 +
 package/ntp/Config.in        |    4 ++--
 package/samba/Config.in      |    4 ++--
 7 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
index 00b3e2c..5f2f148 100644
--- a/package/autoconf/Config.in
+++ b/package/autoconf/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf"
-	select BR2_PACKAGE_MICROPERL
+	select BR2_PACKAGE_PERL
 	help
 	  Extensible program for developing configure scripts.  These
 	  scripts handle all the mundane system/feature detection.
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 3f84e3e..0cb50db 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -10,7 +10,7 @@ AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 		    ac_cv_prog_gnu_m4_gnu=no
 
-AUTOCONF_DEPENDENCIES = microperl host-m4
+AUTOCONF_DEPENDENCIES = host-m4 perl
 
 HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 			ac_cv_prog_gnu_m4_gnu=no
diff --git a/package/automake/Config.in b/package/automake/Config.in
index 935f1f1..9a9673a 100644
--- a/package/automake/Config.in
+++ b/package/automake/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake"
 	select BR2_PACKAGE_AUTOCONF
-	select BR2_PACKAGE_MICROPERL
+	select BR2_PACKAGE_PERL
 	help
 	  Tool for automatically generating Makefile's for input to
 	  configure scripts (made by autoconf).
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 3c19085..8be56c3 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -7,7 +7,7 @@
 AUTOMAKE_VERSION = 1.11.5
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 
-AUTOMAKE_DEPENDENCIES = host-autoconf autoconf microperl
+AUTOMAKE_DEPENDENCIES = host-autoconf autoconf perl
 
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
diff --git a/package/microperl/Config.in b/package/microperl/Config.in
index 66bbedd..19d104a 100644
--- a/package/microperl/Config.in
+++ b/package/microperl/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MICROPERL
 	bool "microperl"
 	# needs fork()
 	depends on BR2_USE_MMU
+	depends on BR2_DEPRECATED
 	help
 	  Perl without operating-specific functions such as readdir.
 
diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 5996596..ec5dbbb 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_NTP_NTP_KEYGEN
 
 config BR2_PACKAGE_NTP_NTP_WAIT
 	bool "ntp-wait"
-	depends on BR2_PACKAGE_MICROPERL
+	depends on BR2_PACKAGE_PERL
 	help
 	  ntp-wait waits until the locally running ntpd is in state 4
 	  (synchronized). This could be useful at boot time, to delay the
@@ -59,7 +59,7 @@ config BR2_PACKAGE_NTP_NTPSNMPD
 
 config BR2_PACKAGE_NTP_NTPTRACE
 	bool "ntptrace"
-	depends on BR2_PACKAGE_MICROPERL
+	depends on BR2_PACKAGE_PERL
 	help
 	  ntptrace is a perl script that uses the ntpq utility program to
 	  follow the chain of NTP servers from a given host back to the
diff --git a/package/samba/Config.in b/package/samba/Config.in
index e88b360..92714d7 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -36,12 +36,12 @@ config BR2_PACKAGE_SAMBA_FINDSMB
 	default y
 	depends on BR2_PACKAGE_SAMBA_SMBCLIENT
 	depends on BR2_PACKAGE_SAMBA_NMBLOOKUP
-	depends on BR2_PACKAGE_MICROPERL
+	depends on BR2_PACKAGE_PERL
 	help
 	  Script to browse network
 
 comment "findsmb       - disabled (requires nmblookup, smbclient and perl)"
-	depends on !BR2_PACKAGE_SAMBA_SMBCLIENT || !BR2_PACKAGE_SAMBA_NMBLOOKUP || !BR2_PACKAGE_MICROPERL
+	depends on !BR2_PACKAGE_SAMBA_SMBCLIENT || !BR2_PACKAGE_SAMBA_NMBLOOKUP || !BR2_PACKAGE_PERL
 
 config BR2_PACKAGE_SAMBA_NET
 	bool "net"
-- 
1.7.9.5
