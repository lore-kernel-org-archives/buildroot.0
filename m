From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 Jan 2015 20:06:37 -0300
Subject: [Buildroot] [PATCH] openntpd: bump to version 5.7p1
Message-ID: <1420758397-13511-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:

* Add hash file
* Tweak the initscript to use a pidfile to avoid nasty warnings

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0001-switch-ntp_adjtime-to-adjtimex.patch      | 36 ++++++++++++++++++++++
 package/openntpd/Config.in                         |  6 ++++
 package/openntpd/S49ntp                            |  4 +--
 package/openntpd/openntpd.hash                     |  2 ++
 package/openntpd/openntpd.mk                       |  5 ++-
 5 files changed, 48 insertions(+), 5 deletions(-)
 create mode 100644 package/openntpd/0001-switch-ntp_adjtime-to-adjtimex.patch
 create mode 100644 package/openntpd/openntpd.hash

diff --git a/package/openntpd/0001-switch-ntp_adjtime-to-adjtimex.patch b/package/openntpd/0001-switch-ntp_adjtime-to-adjtimex.patch
new file mode 100644
index 0000000..ac8f22a
--- /dev/null
+++ b/package/openntpd/0001-switch-ntp_adjtime-to-adjtimex.patch
@@ -0,0 +1,36 @@
+uClibc considers ntp_* functions deprecated and only enabled via
+UCLIBC_NTP_LEGACY which isn't the default or in BR configs so switch
+to adjtimex which is basically the same.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura openntpd-5.7p1.orig/compat/adjfreq_linux.c openntpd-5.7p1/compat/adjfreq_linux.c
+--- openntpd-5.7p1.orig/compat/adjfreq_linux.c	2015-01-08 19:45:15.482915628 -0300
++++ openntpd-5.7p1/compat/adjfreq_linux.c	2015-01-08 19:45:50.972864070 -0300
+@@ -37,20 +37,20 @@
+ 		txc.modes = ADJ_FREQUENCY;
+ 		txc.freq = *freq / 1e3 / (1LL << 16);
+ 
+-		if ((ntp_adjtime(&txc)) == -1)
+-			log_warn("ntp_adjtime (2) failed");
++		if ((adjtimex(&txc)) == -1)
++			log_warn("adjtimex (2) failed");
+ 
+-		log_debug("ntp_adjtime adjusted frequency by %fppm",
++		log_debug("adjtimex adjusted frequency by %fppm",
+ 			  ((txc.freq * 1e3) *  (1LL<<16) / 1e3 / (1LL << 32)));
+ 	}
+ 	if (oldfreq != NULL) {
+ 		txc.modes = 0;
+-		if ((ntp_adjtime(&txc)) == -1) {
+-			log_warn("ntp_adjtime (1) failed");
++		if ((adjtimex(&txc)) == -1) {
++			log_warn("adjtimex (1) failed");
+ 			return -1;
+ 		}
+ 		newfreq = (txc.freq * 1e3) *  (1LL<<16);
+-		log_debug("ntp_adjtime returns frequency of %fppm",
++		log_debug("adjtimex returns frequency of %fppm",
+ 			  newfreq / 1e3 / (1LL << 32));
+ 		*oldfreq = newfreq;
+ 	}
diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index a8ef807..3d545e4 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_OPENNTPD
 	bool "openntpd"
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork ()
 	depends on !BR2_PACKAGE_NTP # conflicting binaries
 	help
@@ -9,3 +11,7 @@ config BR2_PACKAGE_OPENNTPD
 	  redistributing the local clock. It just works.
 
 	  http://www.openntpd.org/
+
+comment "openntpd needs a toolchain w/ threads, IPv6"
+	depends on BR2_USE_MMU
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/openntpd/S49ntp b/package/openntpd/S49ntp
index 8bbe795..2654f82 100755
--- a/package/openntpd/S49ntp
+++ b/package/openntpd/S49ntp
@@ -6,12 +6,12 @@
 case "$1" in
 	start)
 		echo -n "Starting openntpd: "
-		start-stop-daemon -S -x /usr/sbin/ntpd
+		start-stop-daemon -S -x /usr/sbin/ntpd -- -p /run/ntpd.pid
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		echo -n "Stopping openntpd: "
-		start-stop-daemon -K -x /usr/sbin/ntpd
+		start-stop-daemon -K -q -p /run/ntpd.pid
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart)
diff --git a/package/openntpd/openntpd.hash b/package/openntpd/openntpd.hash
new file mode 100644
index 0000000..a7007ed
--- /dev/null
+++ b/package/openntpd/openntpd.hash
@@ -0,0 +1,2 @@
+# From http://www.openntpd.org/txt/release-5.7p1.txt
+sha256	071cfdcfc179c481568a2b8262945243a3123abfc7fa8831da1bbff3729b8307	openntpd-5.7p1.tar.gz
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 38526dd..c23b613 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-OPENNTPD_VERSION = 3.9p1
-OPENNTPD_SITE = ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
-OPENNTPD_CONF_OPTS = --with-builtin-arc4random --disable-strip
+OPENNTPD_VERSION = 5.7p1
+OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
 OPENNTPD_LICENSE_FILES = LICENCE
 
-- 
2.0.5
