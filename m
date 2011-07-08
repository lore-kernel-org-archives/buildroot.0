From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 8 Jul 2011 22:51:37 +0200
Subject: [Buildroot] [PATCH] Add package aiccu
In-Reply-To: <1307884661-3504-1-git-send-email-francis.mendes@gmail.com>
References: <1307884661-3504-1-git-send-email-francis.mendes@gmail.com>
Message-ID: <201107082251.37513.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francis, All,

On Sunday 12 June 2011 15:17:41 Francis M. de P. Mendes wrote:
> As Peter suggested, I'm resubmitting this patch. 

See my comments at the end.

> Signed-off-by: Francis M. de P. Mendes <francis.mendes@gmail.com>
> ---
>  package/Config.in                                |    1 +
>  package/aiccu/Config.in                          |    7 +
>  package/aiccu/aiccu-20070115-cross-compile.patch |  242 ++++++++++++++++++++++
>  package/aiccu/aiccu.mk                           |   20 ++
>  4 files changed, 270 insertions(+), 0 deletions(-)
>  create mode 100644 package/aiccu/Config.in
>  create mode 100644 package/aiccu/aiccu-20070115-cross-compile.patch
>  create mode 100644 package/aiccu/aiccu.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 40f523d..f9c942b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -368,6 +368,7 @@ source "package/shared-mime-info/Config.in"
>  endmenu
>  
>  menu "Networking applications"
> +source "package/aiccu/Config.in"
>  source "package/argus/Config.in"
>  source "package/avahi/Config.in"
>  source "package/axel/Config.in"
> diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
> new file mode 100644
> index 0000000..0a91796
> --- /dev/null
> +++ b/package/aiccu/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_AICCU
> +	bool "aiccu"
> +	depends on BR2_INET_IPV6
> +	help
> +	  SixXS Automatic IPv6 Connectivity Client Utility
> +
> +	  http://www.sixxs.net/tools/aiccu/
> diff --git a/package/aiccu/aiccu-20070115-cross-compile.patch b/package/aiccu/aiccu-20070115-cross-compile.patch
> new file mode 100644
> index 0000000..bfe512a
> --- /dev/null
> +++ b/package/aiccu/aiccu-20070115-cross-compile.patch
> @@ -0,0 +1,242 @@
> +Prepares for cross compiling. Based on patches found on
> +
> +https://dev.openwrt.org/browser/packages/ipv6/aiccu/patches
> +
> +with minor changes
> +
> +Signed-off-by: Francis M. de P. Mendes <francis.mendes@gmail.com>
> +---
> + Makefile              |    1 +
> + common/dn_skipname.c  |   51 +++++++++++++++++++++++++++++++++++++++++++++++++
> + common/resolver.c     |    6 ++--
> + unix-console/Makefile |   33 ++++++++++++++++---------------
> + 4 files changed, 72 insertions(+), 19 deletions(-)
> + create mode 100644 common/dn_skipname.c
> +
> +diff --git a/Makefile b/Makefile
> +index 0e96136..6ec099d 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -58,6 +58,7 @@ export diretc
> + export dirdoc
> + export RPM_OPT_FLAGS
> + export CFLAGS
> ++export STRIP
> + 
> + ####################
> + ## Makefile Targets
> +diff --git a/common/dn_skipname.c b/common/dn_skipname.c
> +new file mode 100644
> +index 0000000..f2219f3
> +--- /dev/null
> ++++ b/common/dn_skipname.c
> +@@ -0,0 +1,51 @@
> ++#include <errno.h>
> ++#include <resolv.h>
> ++
> ++/* Ripped from glibc 2.4 sources. */
> ++
> ++/*
> ++ * ns_name_skip(ptrptr, eom)
> ++ *      Advance *ptrptr to skip over the compressed name it points at.
> ++ * return:
> ++ *      0 on success, -1 (with errno set) on failure.
> ++ */
> ++int ns_name_skip(const u_char **ptrptr, const u_char *eom)
> ++{
> ++	const u_char *cp;
> ++	u_int n;
> ++
> ++	cp = *ptrptr;
> ++	while (cp < eom && (n = *cp++) != 0)
> ++	{
> ++		/* Check for indirection. */
> ++		switch (n & NS_CMPRSFLGS) {
> ++		case 0:                 /* normal case, n == len */
> ++			cp += n;
> ++			continue;
> ++		case NS_CMPRSFLGS:      /* indirection */
> ++			cp++;
> ++			break;
> ++		default:                /* illegal type */
> ++			errno = EMSGSIZE;
> ++			return (-1);
> ++		}
> ++		break;
> ++	}
> ++	if (cp > eom)
> ++	{
> ++		errno = EMSGSIZE;
> ++		return (-1);
> ++	}
> ++	*ptrptr = cp;
> ++	return (0);
> ++}
> ++
> ++int dn_skipname(const u_char *ptr, const u_char *eom)
> ++{
> ++	const u_char *saveptr = ptr;
> ++
> ++	if(ns_name_skip(&ptr, eom) == -1)
> ++		return (-1);
> ++	return (ptr - saveptr);
> ++}
> ++
> +diff --git a/common/resolver.c b/common/resolver.c
> +index 39946a9..fe6d00e 100644
> +--- a/common/resolver.c
> ++++ b/common/resolver.c
> +@@ -26,7 +26,7 @@
> + 
> + int getrrs(const char *label, int rrtype, void gotrec(unsigned int num, int type, const char *record))
> + {
> +-#ifdef _LINUX
> ++#if defined(_LINUX) && !defined(__UCLIBC__)
> + 	struct __res_state	res;
> + #endif
> + 	unsigned char		answer[8192];
> +@@ -38,7 +38,7 @@ int getrrs(const char *label, int rrtype, void gotrec(unsigned int num, int type
> + 	uint16_t		type = 0, class = 0;
> + 	uint32_t		ttl = 0;
> + 
> +-#ifdef _LINUX
> ++#if defined(_LINUX) && !defined(__UCLIBC__)
> + 	memset(&res, 0, sizeof(res));
> + 	res.options = RES_DEBUG;
> + 	res_ninit(&res);
> +@@ -47,7 +47,7 @@ int getrrs(const char *label, int rrtype, void gotrec(unsigned int num, int type
> + #endif
> + 
> + 	memset(answer, 0, sizeof(answer));
> +-#ifdef _LINUX
> ++#if defined(_LINUX) && !defined(__UCLIBC__)
> + 	ret = res_nquery(&res, label, C_IN, rrtype, answer, sizeof(answer));
> + #else
> + 	ret = res_query(label, C_IN, rrtype, answer, sizeof(answer));
> +diff --git a/unix-console/Makefile b/unix-console/Makefile
> +index d5e5c07..67361d2 100755
> +--- a/unix-console/Makefile
> ++++ b/unix-console/Makefile
> +@@ -10,9 +10,9 @@
> + #  $Date: 2007-01-15 11:04:27 $
> + # **********************************************************/
> + 
> +-SRCS	= main.c ../common/tun.c ../common/aiccu.c ../common/hash_md5.c ../common/hash_sha1.c ../common/common.c ../common/heartbeat.c ../common/tic.c ../common/ayiya.c ../common/aiccu_test.c ../common/resolver.c
> ++SRCS	= main.c ../common/tun.c ../common/aiccu.c ../common/hash_md5.c ../common/hash_sha1.c ../common/common.c ../common/heartbeat.c ../common/tic.c ../common/ayiya.c ../common/aiccu_test.c ../common/resolver.c ../common/dn_skipname.c
> + INCS	= ../common/tun.h ../common/aiccu.h ../common/hash_md5.h ../common/hash_sha1.h ../common/common.h ../common/heartbeat.h ../common/tic.h ../common/ayiya.h ../common/resolver.h
> +-OBJS	= main.o ../common/tun.o ../common/aiccu.o ../common/hash_md5.o ../common/hash_sha1.o ../common/common.o ../common/heartbeat.o ../common/tic.o ../common/ayiya.o ../common/aiccu_test.o ../common/resolver.o
> ++OBJS	= main.o ../common/tun.o ../common/aiccu.o ../common/hash_md5.o ../common/hash_sha1.o ../common/common.o ../common/heartbeat.o ../common/tic.o ../common/ayiya.o ../common/aiccu_test.o ../common/resolver.o ../common/dn_skipname.o
> + 
> + # New features not fully implemented and thus disabled for now
> + #CFLAGS	+= -D NEWSTUFF_TSP -D NEWSTUFF_TEEPEE
> +@@ -25,7 +25,8 @@ CWARNS += -W -Wall -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggre
> + # CWARNS += -Wpacked
> + 
> + #CFLAGS	+= $(CWARNS) -D_GNU_SOURCE -D_DEBUG -g3 -O0
> +-CFLAGS	+= $(CWARNS) -D_GNU_SOURCE
> ++CFLAGS	+= $(CWARNS) $(EXTRA_CFLAGS) -D_GNU_SOURCE
> ++LDFLAGS += $(EXTRA_LDFLAGS)
> + CC      = @gcc
> + RM      = rm
> + 
> +@@ -40,25 +41,25 @@ CFLAGS	+= -D AICCU_CONSOLE
> + # GnuTLS Support ?
> + # Used by TIC to secure that communication
> + # Currently defaultly builds only on Linux, but other platforms might easily also support it
> +-ifeq ($(shell uname | grep -c "Linux"),1)
> ++ifneq ($(HAVE_GNUTLS),)
> + CFLAGS	+= -D AICCU_GNUTLS
> + LDFLAGS += -lgnutls
> + endif
> + 
> + # Linux
> +-ifeq ($(shell uname | grep -c "Linux"),1)
> ++ifeq ($(OS_NAME),Linux)
> + CFLAGS  += -D_LINUX -D HAS_IFHEAD -D AICCU_TYPE="\"linux\""
> + SRCS	+= ../common/aiccu_linux.c
> + OBJS	+= ../common/aiccu_linux.o
> +-LDFLAGS	+= -lpthread -lresolv
> ++LDFLAGS	+= -pthread -lresolv
> + endif
> + 
> + # FreeBSD
> +-ifeq ($(shell uname | grep -c "FreeBSD"),1)
> ++ifeq ($(OS_NAME),FreeBSD)
> + CFLAGS	+= -D_FREEBSD
> + 
> + # FreeBSD 4.x
> +-ifeq ($(shell uname -r | cut -c 1),4)
> ++ifeq ($(shell echo $(OS_VERSION) | cut -c 1),4)
> + CFLAGS	+= -D AICCU_TYPE="\"freebsd4\""
> + SRCS	+= ../common/aiccu_freebsd4.c
> + OBJS	+= ../common/aiccu_freebsd4.o
> +@@ -71,7 +72,7 @@ endif
> + endif
> + 
> + # DragonFlyBSD
> +-ifeq ($(shell uname | grep -c "DragonFly"),1)
> ++ifeq ($(OS_NAME),DragonFly)
> + CFLAGS	+= -D_DFBSD -D NEED_IFHEAD -D AICCU_TYPE="\"dragonfly\""
> + SRCS	+= ../common/aiccu_freebsd4.c
> + OBJS	+= ../common/aiccu_freebsd4.o
> +@@ -79,7 +80,7 @@ CFLAGS	+= -pthread
> + endif
> + 
> + # NetBSD
> +-ifeq ($(shell uname | grep -c "NetBSD"),1)
> ++ifeq ($(OS_NAME),NetBSD)
> + CFLAGS	+= -D_NETBSD -D AICCU_TYPE="\"kame\""
> + 
> + # Check if net/if_tun.h has TUNSIFHEAD and enable support for it
> +@@ -97,10 +98,10 @@ CFLAGS	+= -pthread -D_NETBSD_SOURCE
> + endif
> + 
> + # OpenBSD
> +-ifeq ($(shell uname | grep -c "OpenBSD"),1)
> ++ifeq ($(OS_NAME),OpenBSD)
> + CFLAGS	+= -D_OPENBSD -D HAS_IFHEAD
> + # 2.7-2.9
> +-ifeq ($(shell uname -r | cut -c 1),2)
> ++ifeq ($(shell echo $(OS_VERSION) | cut -c 1),2)
> + CFLAGS	+= -D AICCU_TYPE="\"openbsd2\""
> + SRCS	+= ../common/aiccu_openbsd2.c
> + OBJS	+= ../common/aiccu_openbsd2.o
> +@@ -114,7 +115,7 @@ CFLAGS	+= -pthread
> + endif
> + 
> + # Darwin
> +-ifeq ($(shell uname | grep -c "Darwin"),1)
> ++ifeq ($(OS_NAME),Darwin)
> + CFLAGS	+= -D_DARWIN -D NEED_IFHEAD -D AICCU_TYPE="\"darwin\""
> + SRCS	+= ../common/aiccu_darwin.c
> + OBJS	+= ../common/aiccu_darwin.o
> +@@ -122,7 +123,7 @@ LDFLAGS	+= -lresolv
> + endif
> + 
> + # SunOS / Solaris
> +-ifeq ($(shell uname | grep -c "SunOS"),1)
> ++ifeq ($(OS_NAME),SunOS)
> + CFLAGS	+= -D_SUNOS -D AICCU_TYPE="\"sunos\""
> + SRCS	+= ../common/aiccu_sunos.c
> + OBJS	+= ../common/aiccu_sunos.o
> +@@ -130,7 +131,7 @@ LDFLAGS	+= -lsocket -lnsl -lresolv
> + endif
> + 
> + # AIX
> +-ifeq ($(shell uname | grep -c "AIX"),1)
> ++ifeq ($(OS_NAME),AIX)
> + CC	= @/usr/vac/bin/xlc_r
> + CFLAGS	= -qthreaded -q64 -qlanglvl=stdc99 -bmaxdata:0xD0000000 -D_64BIT -g -qdbxextra -qfullpath -qheapdebug -qformat=all -qcheck=all
> + CFLAGS	+= -D AICCU_CONSOLE
> +@@ -147,7 +148,7 @@ aiccu:	$(OBJS) ${SRCS} ${INCS}
> + 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)
> + ifeq ($(shell echo $(CFLAGS) | grep -c "DEBUG"),0)
> + ifeq ($(shell echo "$(RPM_OPT_FLAGS)" | wc -c),1)
> +-	strip $@
> ++	$(STRIP) $@
> + endif
> + endif
> + 
> +-- 
> +1.7.0.4
> +
> diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
> new file mode 100644
> index 0000000..8a996bb
> --- /dev/null
> +++ b/package/aiccu/aiccu.mk
> @@ -0,0 +1,20 @@
> +#############################################################
> +#
> +# aiccu 
> +#
> +#############################################################
> +AICCU_VERSION:=20070115
> +AICCU_SOURCE:=aiccu_$(AICCU_VERSION).tar.gz
> +AICCU_SITE:=http://www.sixxs.net/archive/sixxs/aiccu/unix/

For consistency with the vast majority of packages, use a simple '=', not ':='.

> +
> +define AICCU_BUILD_CMDS
> +	$(MAKE) -C $(@D) CC=$(TARGET_CC) EXTRA_CFLAGS="$(TARGET_CFLAGS)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" STRIP=$(TARGET_STRIP) OS_NAME="Linux" OS_VERSION="$(LINUX_HEADERS_VERSION)" DEBUG=0 all
> +endef

This line is very long. Can't you break it? Eg.:
  AICCU_MKFLAGS  = CC=...
  AICCU_MKFLAGS += EXTRA_CFLAGS="..."
  # And so on...
  define AICCU_BUILD_CMDS
	  $(MAKE) -C $(@D) $(AICCU_MKFLAGS) all
  endef

> +
> +define AICCU_INSTALL_TARGET_CMDS
> +	cp -dpf $(@D)/unix-console/aiccu $(TARGET_DIR)/usr/sbin/aiccu
> +	cp -dpf $(@D)/doc/aiccu.conf $(TARGET_DIR)/etc/aiccu.conf 
> +	cp -dpf $(@D)/doc/aiccu.init $(TARGET_DIR)/etc/init.d/S48aiccu 
> +endef

Use "install -m 0755" for executables, and "install -m 0644" for data.
But that's my opinion. Peter might have another PoV.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
