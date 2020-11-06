From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Nov 2020 08:13:59 +0100
Subject: [Buildroot] [git commit] package/openntpd: fix build with gcc 10
Message-ID: <20201106070452.585A38127F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f83c87abf2454a342ce8d99a0d908b844e7fcda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/4a7e6b707d061f5f7f5e00f0054f02a0f7fcb452

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Provide-fallback-definition-for-__packed.patch | 43 +++++++++++++++++
 ...-and-make-ibuf_dns-static-to-avoid-double.patch | 54 ++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/package/openntpd/0002-Provide-fallback-definition-for-__packed.patch b/package/openntpd/0002-Provide-fallback-definition-for-__packed.patch
new file mode 100644
index 0000000000..4d8f636b9d
--- /dev/null
+++ b/package/openntpd/0002-Provide-fallback-definition-for-__packed.patch
@@ -0,0 +1,43 @@
+From bc2cd89715155fe1fead19338dac5f4059917dfe Mon Sep 17 00:00:00 2001
+From: Michael Forney <mforney@mforney.org>
+Date: Thu, 20 Jun 2019 13:52:22 -0700
+Subject: [PATCH] Provide fallback definition for __packed
+
+Otherwise, systems that don't support it will treat it as a name for a
+global `struct ntp_msg` variable.
+
+[Retrieved from:
+https://github.com/openntpd-portable/openntpd-portable/commit/bc2cd89715155fe1fead19338dac5f4059917dfe]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/sys/types.h    | 4 ++++
+ m4/check-os-options.m4 | 1 +
+ 2 files changed, 5 insertions(+)
+
+diff --git a/include/sys/types.h b/include/sys/types.h
+index 86821c7..5492e20 100644
+--- a/include/sys/types.h
++++ b/include/sys/types.h
+@@ -22,6 +22,10 @@
+ # define __bounded__(x, y, z)
+ #endif
+ 
++#if !defined(HAVE_ATTRIBUTE__PACKED) && !defined(__packed)
++# define __packed	__attribute__((__packed__))
++#endif
++
+ /*
+  * Define BSD-style unsigned bits types for systems that do not have them.
+  */
+diff --git a/m4/check-os-options.m4 b/m4/check-os-options.m4
+index d4d02d9..4883d1f 100644
+--- a/m4/check-os-options.m4
++++ b/m4/check-os-options.m4
+@@ -69,6 +69,7 @@ case $host_os in
+ 		HOST_ABI=elf
+ 		AC_DEFINE([HAVE_ATTRIBUTE__BOUNDED__], [1], [OpenBSD gcc has bounded])
+ 		AC_DEFINE([HAVE_ATTRIBUTE__DEAD], [1], [OpenBSD gcc has __dead])
++		AC_DEFINE([HAVE_ATTRIBUTE__PACKED], [1], [OpenBSD gcc has __packed])
+ 		;;
+ 	*solaris*)
+ 		HOST_OS=solaris
diff --git a/package/openntpd/0003-Zap-double-definition-of-conf-and-make-ibuf_dns-static-to-avoid-double.patch b/package/openntpd/0003-Zap-double-definition-of-conf-and-make-ibuf_dns-static-to-avoid-double.patch
new file mode 100644
index 0000000000..f54237e310
--- /dev/null
+++ b/package/openntpd/0003-Zap-double-definition-of-conf-and-make-ibuf_dns-static-to-avoid-double.patch
@@ -0,0 +1,54 @@
+From 956b4239d919d6922b9ba6ef39be0d1753f8ff34 Mon Sep 17 00:00:00 2001
+From: otto <>
+Date: Sat, 11 Apr 2020 07:49:48 +0000
+Subject: [PATCH] Zap double definition of conf and make ibuf_dns static to
+ avoid double definition; from Michael Forney
+
+[Retrieved (and backported by updating paths and dropping date and
+version updates) from:
+https://github.com/openntpd-portable/openntpd-openbsd/commit/956b4239d919d6922b9ba6ef39be0d1753f8ff34]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/usr.sbin/ntpd/ntp.c     | 4 ++--
+ src/usr.sbin/ntpd/ntp_dns.c | 4 ++--
+ src/usr.sbin/ntpd/parse.y   | 3 +--
+ 3 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/src/ntp.c b/src/ntp.c
+index ea9a4e922..ec3d6bc43 100644
+--- a/src/ntp.c
++++ b/src/ntp.c
+@@ -42,7 +42,7 @@
+ 
+ volatile sig_atomic_t	 ntp_quit = 0;
+ struct imsgbuf		*ibuf_main;
+-struct imsgbuf		*ibuf_dns;
++static struct imsgbuf	*ibuf_dns;
+ struct ntpd_conf	*conf;
+ struct ctl_conns	 ctl_conns;
+ u_int			 peer_cnt;
+diff --git a/src/ntp_dns.c b/src/ntp_dns.c
+index 2e1a97833..88391801c 100644
+--- a/src/ntp_dns.c
++++ b/src/ntp_dns.c
+@@ -39,7 +39,7 @@
+ #include "ntpd.h"
+ 
+ volatile sig_atomic_t	 quit_dns = 0;
+-struct imsgbuf		*ibuf_dns;
++static struct imsgbuf	*ibuf_dns;
+ 
+ void	sighdlr_dns(int);
+ int	dns_dispatch_imsg(struct ntpd_conf *);
+diff --git a/src/parse.y b/src/uparse.y
+index 8d7ab09de..81d19bbff 100644
+--- a/src/parse.y
++++ b/src/parse.y
+@@ -57,7 +57,6 @@ int		 lgetc(int);
+ int		 lungetc(int);
+ int		 findeol(void);
+ 
+-struct ntpd_conf		*conf;
+ struct sockaddr_in		 query_addr4;
+ struct sockaddr_in6		 query_addr6;
+ int				 poolseqnum;
