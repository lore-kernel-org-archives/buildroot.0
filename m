From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 09:00:12 -0500
Subject: [Buildroot] [PATCH 5/5] ntp: bump to version 4.2.8p9
In-Reply-To: <20170206140012.1029-1-aduskett@codeblue.com>
References: <20170206140012.1029-1-aduskett@codeblue.com>
Message-ID: <20170206140012.1029-5-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version of ntp fixes several vulnerabilities.

CVE-2016-9311
CVE-2016-9310
CVE-2016-7427
CVE-2016-7428
CVE-2016-9312
CVE-2016-7431
CVE-2016-7434
CVE-2016-7429
CVE-2016-7426
CVE-2016-7433

http://www.kb.cert.org/vuls/id/633847

In addition, libssl_compat.h is now included in many files, which
references openssl/evp.h, openssl/dsa.h, and openssl/rsa.h.
Even if a you pass --disable-ssl as a configuration option, these
files are now required.

As such, I have also added openssl as a dependency, and it is now
automatically selected when you select ntp.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/ntp/Config.in | 1 +
 package/ntp/ntp.hash  | 6 +++---
 package/ntp/ntp.mk    | 5 ++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 8ce9a5b..1af02db 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NTP
 	bool "ntp"
 	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Network Time Protocol suite/programs.
 	  Provides things like ntpd, ntpdate, ntpq, etc...
diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 2a1155b..c6838d8 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,4 +1,4 @@
-# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p8.tar.gz.md5
-md5	4a8636260435b230636f053ffd070e34	ntp-4.2.8p8.tar.gz
+# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p9.tar.gz.md5
+md5	857452b05f5f2e033786f77ade1974ed	ntp-4.2.8p9.tar.gz
 # Calculated based on the hash above
-sha256	2ab3d0b5f0456e6311dda1cc27ab75da108762773a19e46abd938bd9407b97ee	ntp-4.2.8p8.tar.gz
+sha256	b724287778e1bac625b447327c9851eedef020517a3545625e9f652a90f30b72	ntp-4.2.8p9.tar.gz
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 7f9e0d6..08875be 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p8
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p9
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
-NTP_DEPENDENCIES = host-pkgconf libevent $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+NTP_DEPENDENCIES = host-pkgconf libevent openssl $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 NTP_LICENSE = ntp license
 NTP_LICENSE_FILES = COPYRIGHT
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
@@ -23,7 +23,6 @@ NTP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NTP_CONF_OPTS += --with-crypto
-NTP_DEPENDENCIES += openssl
 else
 NTP_CONF_OPTS += --without-crypto --disable-openssl-random
 endif
-- 
2.9.3
