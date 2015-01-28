From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jan 2015 21:40:54 +0100
Subject: [Buildroot] [git commit] openntpd: bump to version 5.7p3
Message-ID: <20150128205818.8044E80E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d79ccae14dd89ed7e035e0682380f8285645f91d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch no longer necessary so drop it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-switch-ntp_adjtime-to-adjtimex.patch      |   36 --------------------
 package/openntpd/openntpd.hash                     |    2 +-
 package/openntpd/openntpd.mk                       |    2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/package/openntpd/0001-switch-ntp_adjtime-to-adjtimex.patch b/package/openntpd/0001-switch-ntp_adjtime-to-adjtimex.patch
deleted file mode 100644
index ac8f22a..0000000
--- a/package/openntpd/0001-switch-ntp_adjtime-to-adjtimex.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-uClibc considers ntp_* functions deprecated and only enabled via
-UCLIBC_NTP_LEGACY which isn't the default or in BR configs so switch
-to adjtimex which is basically the same.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura openntpd-5.7p1.orig/compat/adjfreq_linux.c openntpd-5.7p1/compat/adjfreq_linux.c
---- openntpd-5.7p1.orig/compat/adjfreq_linux.c	2015-01-08 19:45:15.482915628 -0300
-+++ openntpd-5.7p1/compat/adjfreq_linux.c	2015-01-08 19:45:50.972864070 -0300
-@@ -37,20 +37,20 @@
- 		txc.modes = ADJ_FREQUENCY;
- 		txc.freq = *freq / 1e3 / (1LL << 16);
- 
--		if ((ntp_adjtime(&txc)) == -1)
--			log_warn("ntp_adjtime (2) failed");
-+		if ((adjtimex(&txc)) == -1)
-+			log_warn("adjtimex (2) failed");
- 
--		log_debug("ntp_adjtime adjusted frequency by %fppm",
-+		log_debug("adjtimex adjusted frequency by %fppm",
- 			  ((txc.freq * 1e3) *  (1LL<<16) / 1e3 / (1LL << 32)));
- 	}
- 	if (oldfreq != NULL) {
- 		txc.modes = 0;
--		if ((ntp_adjtime(&txc)) == -1) {
--			log_warn("ntp_adjtime (1) failed");
-+		if ((adjtimex(&txc)) == -1) {
-+			log_warn("adjtimex (1) failed");
- 			return -1;
- 		}
- 		newfreq = (txc.freq * 1e3) *  (1LL<<16);
--		log_debug("ntp_adjtime returns frequency of %fppm",
-+		log_debug("adjtimex returns frequency of %fppm",
- 			  newfreq / 1e3 / (1LL << 32));
- 		*oldfreq = newfreq;
- 	}
diff --git a/package/openntpd/openntpd.hash b/package/openntpd/openntpd.hash
index f906dad..4889c5b 100644
--- a/package/openntpd/openntpd.hash
+++ b/package/openntpd/openntpd.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/SHA256
-sha256	1640ad4a6e6475f6065d5f999b17b5dc6ab40dc17309b782b9ae390fe54bd6a5	openntpd-5.7p2.tar.gz
+sha256	4f417c8a4c21ed7ec3811107829f931404f9bf121855b8571a2ca3355695343a	openntpd-5.7p3.tar.gz
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index a6460cb..60f025c 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENNTPD_VERSION = 5.7p2
+OPENNTPD_VERSION = 5.7p3
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
 OPENNTPD_LICENSE_FILES = COPYING
