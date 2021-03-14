From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 18:16:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/openntpd: bump to version 6.8p1
In-Reply-To: <20210314170024.358572-1-fontaine.fabrice@gmail.com>
References: <20210314170024.358572-1-fontaine.fabrice@gmail.com>
Message-ID: <20210314171635.GK2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-14 18:00 +0100, Fabrice Fontaine spake thusly:
> - Drop patches (already in version)
> - Update indentation in hash file (two spaces)
> 
> http://www.openntpd.org/txt/release-6.8p1.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openntpd/0001-fix-musl.patch          | 38 -------------
>  ...ide-fallback-definition-for-__packed.patch | 43 ---------------
>  ...make-ibuf_dns-static-to-avoid-double.patch | 54 -------------------
>  package/openntpd/openntpd.hash                |  4 +-
>  package/openntpd/openntpd.mk                  |  2 +-
>  5 files changed, 3 insertions(+), 138 deletions(-)
>  delete mode 100644 package/openntpd/0001-fix-musl.patch
>  delete mode 100644 package/openntpd/0002-Provide-fallback-definition-for-__packed.patch
>  delete mode 100644 package/openntpd/0003-Zap-double-definition-of-conf-and-make-ibuf_dns-static-to-avoid-double.patch
> 
> diff --git a/package/openntpd/0001-fix-musl.patch b/package/openntpd/0001-fix-musl.patch
> deleted file mode 100644
> index e369d5a8ae..0000000000
> --- a/package/openntpd/0001-fix-musl.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From: Baruch Siach <baruch@tkos.co.il>
> -Date: Fri, 29 Sep 2017 10:06:52 +0300
> -Subject: [PATCH] Fix build with musl and older Linux kernel
> -
> -The musl libc carries its own copy of Linux system calls. When building
> -with Linux headers older than v3.17, musl provides SYS_getrandom
> -definition, but not GRND_NONBLOCK. This causes build failure for
> -libressl and openntpd:
> -
> -getentropy_linux.c: In function 'getentropy_getrandom':
> -getentropy_linux.c:205:42: error: 'GRND_NONBLOCK' undeclared (first use in this function)
> -   ret = syscall(SYS_getrandom, buf, len, GRND_NONBLOCK);
> -                                          ^~~~~~~~~~~~~
> -
> -Define GRND_NONBLOCK locally when its definition is missing to fix the
> -build. There should be no run-time effect. Older kernels return ENOSYS
> -for unsupported syscall().
> -
> -[ from upstream pull request with file location changed ]
> -Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ----
> -Upstream status: https://github.com/libressl-portable/openbsd/pull/82
> -
> -diff -Nuar openntpd-6.2p2-orig/compat/getentropy_linux.c openntpd-6.2p2/compat/getentropy_linux.c
> ---- openntpd-6.2p2-orig/compat/getentropy_linux.c	2017-09-07 22:12:02.000000000 +0300
> -+++ openntpd-6.2p2/compat/getentropy_linux.c	2017-09-29 11:54:54.856245770 +0300
> -@@ -194,6 +194,11 @@
> - }
> - 
> - #ifdef SYS_getrandom
> -+
> -+#ifndef GRND_NONBLOCK
> -+#define GRND_NONBLOCK   0x0001
> -+#endif
> -+
> - static int
> - getentropy_getrandom(void *buf, size_t len)
> - {
> diff --git a/package/openntpd/0002-Provide-fallback-definition-for-__packed.patch b/package/openntpd/0002-Provide-fallback-definition-for-__packed.patch
> deleted file mode 100644
> index 4d8f636b9d..0000000000
> --- a/package/openntpd/0002-Provide-fallback-definition-for-__packed.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From bc2cd89715155fe1fead19338dac5f4059917dfe Mon Sep 17 00:00:00 2001
> -From: Michael Forney <mforney@mforney.org>
> -Date: Thu, 20 Jun 2019 13:52:22 -0700
> -Subject: [PATCH] Provide fallback definition for __packed
> -
> -Otherwise, systems that don't support it will treat it as a name for a
> -global `struct ntp_msg` variable.
> -
> -[Retrieved from:
> -https://github.com/openntpd-portable/openntpd-portable/commit/bc2cd89715155fe1fead19338dac5f4059917dfe]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - include/sys/types.h    | 4 ++++
> - m4/check-os-options.m4 | 1 +
> - 2 files changed, 5 insertions(+)
> -
> -diff --git a/include/sys/types.h b/include/sys/types.h
> -index 86821c7..5492e20 100644
> ---- a/include/sys/types.h
> -+++ b/include/sys/types.h
> -@@ -22,6 +22,10 @@
> - # define __bounded__(x, y, z)
> - #endif
> - 
> -+#if !defined(HAVE_ATTRIBUTE__PACKED) && !defined(__packed)
> -+# define __packed	__attribute__((__packed__))
> -+#endif
> -+
> - /*
> -  * Define BSD-style unsigned bits types for systems that do not have them.
> -  */
> -diff --git a/m4/check-os-options.m4 b/m4/check-os-options.m4
> -index d4d02d9..4883d1f 100644
> ---- a/m4/check-os-options.m4
> -+++ b/m4/check-os-options.m4
> -@@ -69,6 +69,7 @@ case $host_os in
> - 		HOST_ABI=elf
> - 		AC_DEFINE([HAVE_ATTRIBUTE__BOUNDED__], [1], [OpenBSD gcc has bounded])
> - 		AC_DEFINE([HAVE_ATTRIBUTE__DEAD], [1], [OpenBSD gcc has __dead])
> -+		AC_DEFINE([HAVE_ATTRIBUTE__PACKED], [1], [OpenBSD gcc has __packed])
> - 		;;
> - 	*solaris*)
> - 		HOST_OS=solaris
> diff --git a/package/openntpd/0003-Zap-double-definition-of-conf-and-make-ibuf_dns-static-to-avoid-double.patch b/package/openntpd/0003-Zap-double-definition-of-conf-and-make-ibuf_dns-static-to-avoid-double.patch
> deleted file mode 100644
> index f54237e310..0000000000
> --- a/package/openntpd/0003-Zap-double-definition-of-conf-and-make-ibuf_dns-static-to-avoid-double.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 956b4239d919d6922b9ba6ef39be0d1753f8ff34 Mon Sep 17 00:00:00 2001
> -From: otto <>
> -Date: Sat, 11 Apr 2020 07:49:48 +0000
> -Subject: [PATCH] Zap double definition of conf and make ibuf_dns static to
> - avoid double definition; from Michael Forney
> -
> -[Retrieved (and backported by updating paths and dropping date and
> -version updates) from:
> -https://github.com/openntpd-portable/openntpd-openbsd/commit/956b4239d919d6922b9ba6ef39be0d1753f8ff34]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/usr.sbin/ntpd/ntp.c     | 4 ++--
> - src/usr.sbin/ntpd/ntp_dns.c | 4 ++--
> - src/usr.sbin/ntpd/parse.y   | 3 +--
> - 3 files changed, 5 insertions(+), 6 deletions(-)
> -
> -diff --git a/src/ntp.c b/src/ntp.c
> -index ea9a4e922..ec3d6bc43 100644
> ---- a/src/ntp.c
> -+++ b/src/ntp.c
> -@@ -42,7 +42,7 @@
> - 
> - volatile sig_atomic_t	 ntp_quit = 0;
> - struct imsgbuf		*ibuf_main;
> --struct imsgbuf		*ibuf_dns;
> -+static struct imsgbuf	*ibuf_dns;
> - struct ntpd_conf	*conf;
> - struct ctl_conns	 ctl_conns;
> - u_int			 peer_cnt;
> -diff --git a/src/ntp_dns.c b/src/ntp_dns.c
> -index 2e1a97833..88391801c 100644
> ---- a/src/ntp_dns.c
> -+++ b/src/ntp_dns.c
> -@@ -39,7 +39,7 @@
> - #include "ntpd.h"
> - 
> - volatile sig_atomic_t	 quit_dns = 0;
> --struct imsgbuf		*ibuf_dns;
> -+static struct imsgbuf	*ibuf_dns;
> - 
> - void	sighdlr_dns(int);
> - int	dns_dispatch_imsg(struct ntpd_conf *);
> -diff --git a/src/parse.y b/src/uparse.y
> -index 8d7ab09de..81d19bbff 100644
> ---- a/src/parse.y
> -+++ b/src/parse.y
> -@@ -57,7 +57,6 @@ int		 lgetc(int);
> - int		 lungetc(int);
> - int		 findeol(void);
> - 
> --struct ntpd_conf		*conf;
> - struct sockaddr_in		 query_addr4;
> - struct sockaddr_in6		 query_addr6;
> - int				 poolseqnum;
> diff --git a/package/openntpd/openntpd.hash b/package/openntpd/openntpd.hash
> index 4d00b7bb9d..2ef8a619eb 100644
> --- a/package/openntpd/openntpd.hash
> +++ b/package/openntpd/openntpd.hash
> @@ -1,5 +1,5 @@
>  # from http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/SHA256
> -sha256 7b02691524197e01ba6b1b4b7595b33956e657ba6d5c4cf2fc20ea3f4914c13a	openntpd-6.2p3.tar.gz
> +sha256  8582db838a399153d4a17f2a76518b638cc3020f58028575bf54127518f55a46  openntpd-6.8p1.tar.gz
>  
>  # Locally computed
> -sha256 6c1822ee950652c12bb3773849db18794f62c63452a70d018edf23e8cba71839 COPYING
> +sha256  6c1822ee950652c12bb3773849db18794f62c63452a70d018edf23e8cba71839  COPYING
> diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
> index 30c39e45ed..f9409cd90c 100644
> --- a/package/openntpd/openntpd.mk
> +++ b/package/openntpd/openntpd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENNTPD_VERSION = 6.2p3
> +OPENNTPD_VERSION = 6.8p1
>  OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
>  OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
>  OPENNTPD_LICENSE_FILES = COPYING
> -- 
> 2.30.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
