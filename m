From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jan 2011 13:24:10 -0300
Subject: [Buildroot] [PATCH] ntp: bump to version 4.2.6p3 and fix glibc
	build failure
Message-ID: <1296145451-19548-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 4.2.6p3 and fix a build failure with external toolchains
that use certain glibc versions as point out by speakman on IRC.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-4.2.6_p2-adjtimex.patch => ntp-adjtimex.patch} |    0
 package/ntp/ntp-nano.patch                         |   23 ++++++++++++++++++++
 package/ntp/ntp.mk                                 |    2 +-
 3 files changed, 24 insertions(+), 1 deletions(-)
 rename package/ntp/{ntp-4.2.6_p2-adjtimex.patch => ntp-adjtimex.patch} (100%)
 create mode 100644 package/ntp/ntp-nano.patch

diff --git a/package/ntp/ntp-4.2.6_p2-adjtimex.patch b/package/ntp/ntp-adjtimex.patch
similarity index 100%
rename from package/ntp/ntp-4.2.6_p2-adjtimex.patch
rename to package/ntp/ntp-adjtimex.patch
diff --git a/package/ntp/ntp-nano.patch b/package/ntp/ntp-nano.patch
new file mode 100644
index 0000000..d16046c
--- /dev/null
+++ b/package/ntp/ntp-nano.patch
@@ -0,0 +1,23 @@
+Fixes issues with glibc header files, see
+http://bugs.gentoo.org/show_bug.cgi?id=270483
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura ntp-4.2.6p2.orig/include/ntp_syscall.h ntp-4.2.6p2/include/ntp_syscall.h
+--- ntp-4.2.6p2.orig/include/ntp_syscall.h	2009-12-09 04:36:37.000000000 -0300
++++ ntp-4.2.6p2/include/ntp_syscall.h	2011-01-27 13:09:05.072336628 -0300
+@@ -14,6 +14,14 @@
+ # include <sys/timex.h>
+ #endif
+ 
++#if defined(ADJ_NANO) && !defined(MOD_NANO)
++#define MOD_NANO ADJ_NANO
++#endif
++
++#if defined(ADJ_TAI) && !defined(MOD_TAI)
++#define MOD_TAI ADJ_TAI
++#endif
++
+ #ifndef NTP_SYSCALLS_LIBC
+ #ifdef NTP_SYSCALLS_STD
+ # define ntp_adjtime(t)		syscall(SYS_ntp_adjtime, (t))
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 51e3956..7e09b5e 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -3,7 +3,7 @@
 # ntp
 #
 #############################################################
-NTP_VERSION = 4.2.6p2
+NTP_VERSION = 4.2.6p3
 NTP_SOURCE = ntp-$(NTP_VERSION).tar.gz
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
 
-- 
1.7.3.4
