From: Hiroshi Shinji <hiroshi.shinji@gmail.com>
Date: Tue, 31 Mar 2009 22:29:11 +0900
Subject: [Buildroot] svn commit: [25897] trunk/buildroot/package/iptables
In-Reply-To: <20090330184153.A8590775ED@busybox.osuosl.org>
References: <20090330184153.A8590775ED@busybox.osuosl.org>
Message-ID: <d6a0e5a20903310629t5fd37336s93d0e0c639c43da6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When I build r25899 with iptables and BR2_INET_IPV6=y, the following
error occurred.

<snip>
/mnt/data/work/buildroot-25899-ph/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcc
-Os -pipe -Os -I/mnt/data/work/buildroot-25899-ph/build_powerpc/staging_dir/usr/include
-I/mnt/data/work/buildroot-25899-ph/build_powerpc/staging_dir/include
--sysroot=/mnt/data/work/buildroot-25899-ph/build_powerpc/staging_dir/
-isysroot /mnt/data/work/buildroot-25899-ph/build_powerpc/staging_dir
-mtune=405 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES
-D_FILE_OFFSET_BITS=64 -D_REENTRANT -Wall -Waggregate-return
-Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wshadow
-Wstrict-prototypes -Winline -pipe
-DXTABLES_LIBDIR=\"/usr/lib/xtables\" -DXTABLES_INTERNAL -I./include
-I./include -I /mnt/data/work/buildroot-25899-ph/toolchain_build_powerpc/linux/include
-I /mnt/data/work/buildroot-25899-ph/toolchain_build_powerpc/linux/include
-Os -pipe -Os -I/mnt/data/work/buildroot-25899-ph/build_powerpc/staging_dir/usr/include
-I/mnt/data/work/buildroot-25899-ph/build_powerpc
/staging_dir/include
--sysroot=/mnt/data/work/buildroot-25899-ph/build_powerpc/staging_dir/
-isysroot /mnt/data/work/buildroot-25899-ph/build_powerpc/staging_dir
-mtune=405 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -rdynamic
--sysroot=/mnt/data/work/buildroot-25899-ph/build_powerpc/staging_dir/
-o ip6tables ip6tables-standalone.o ip6tables.o
-L/mnt/data/work/buildroot-25899-ph/build_powerpc/staging_dir/lib
-L/mnt/data/work/buildroot-25899-ph/build_powerpc/staging_dir/usr/lib
-ldl -lm libiptc/libiptc.a extensions/libext6.a ./.libs/libxtables.so
 -Wl,--rpath -Wl,/mnt/data/work/buildroot-25899-ph/build_powerpc/iptables-1.4.2/.libs
ip6tables.o: In function `print_firewall':
ip6tables.c:(.text+0x8b4): undefined reference to `ip6addr_to_numeric'
ip6tables.c:(.text+0x8c0): undefined reference to `ip6addr_to_anyname'
ip6tables.c:(.text+0x8d4): undefined reference to `ip6mask_to_numeric'
ip6tables.c:(.text+0x97c): undefined reference to `ip6addr_to_numeric'
ip6tables.c:(.text+0x988): undefined reference to `ip6addr_to_anyname'
ip6tables.c:(.text+0x99c): undefined reference to `ip6mask_to_numeric'
ip6tables.o: In function `do_command6':
ip6tables.c:(.text+0x26a0): undefined reference to `ip6parse_hostnetworkmask'
ip6tables.c:(.text+0x26bc): undefined reference to `ip6parse_hostnetworkmask'
collect2: ld returned 1 exit status
make[3]: *** [ip6tables] Error 1
make[3]: Leaving directory
`/mnt/data/work/buildroot-25899-ph/build_powerpc/iptables-1.4.2'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/mnt/data/work/buildroot-25899-ph/build_powerpc/iptables-1.4.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/mnt/data/work/buildroot-25899-ph/build_powerpc/iptables-1.4.2'
make: *** [/mnt/data/work/buildroot-25899-ph/build_powerpc/iptables-1.4.2/.stamp_built]
Error 2


I think this error was occurred by the fix of r25897....
Please help me on this.

Thanks.




2009/3/31  <jacmet@uclibc.org>:
> Author: jacmet
> Date: 2009-03-30 18:41:53 +0000 (Mon, 30 Mar 2009)
> New Revision: 25897
>
> Log:
> iptables: fix build without ipv6 support in toolchain
>
> Patch by Steffen Schulz <sf@cbg.dyndns.org>, closes #233.
>
> Added:
> ? trunk/buildroot/package/iptables/iptables-optional-ipv6.patch
>
> Modified:
> ? trunk/buildroot/package/iptables/iptables.mk
>
>
> Changeset:
> Added: trunk/buildroot/package/iptables/iptables-optional-ipv6.patch
> ===================================================================
> --- trunk/buildroot/package/iptables/iptables-optional-ipv6.patch ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? (rev 0)
> +++ trunk/buildroot/package/iptables/iptables-optional-ipv6.patch ? ? ? 2009-03-30 18:41:53 UTC (rev 25897)
> @@ -0,0 +1,70 @@
> +Make ipv6 support optional. Patch by Steffen Schulz <sf@cbg.dyndns.org>
> +
> +Submitted upstream as http://bugzilla.netfilter.org/show_bug.cgi?id=588
> +diff -ru iptables-1.4.2/configure.ac iptables-1.4.2_patched/configure.ac
> +--- iptables-1.4.2/configure.ac ? ? ? ?2009-03-29 15:49:24.764299587 +0000
> ++++ iptables-1.4.2_patched/configure.ac ? ? ? ?2009-03-29 15:38:29.082512186 +0000
> +@@ -37,6 +37,9 @@
> + ? ? ? [enable_devel="$enableval"], [enable_devel="yes"])
> + AC_ARG_ENABLE([libipq],
> + ? ? ? AS_HELP_STRING([--enable-libipq], [Build and install libipq]))
> ++AC_ARG_ENABLE([ipv6],
> ++ ? ?AS_HELP_STRING([--enable-ipv6], [Build and install ip6tables]),
> ++ ? ?[enable_ipv6="$enableval"], [enable_ipv6="yes"])
> + AC_ARG_WITH([pkgconfigdir], AS_HELP_STRING([--with-pkgconfigdir=PATH],
> + ? ? ? [Path to the pkgconfig directory [[LIBDIR/pkgconfig]]]),
> + ? ? ? [pkgconfigdir="$withval"], [pkgconfigdir='${libdir}/pkgconfig'])
> +@@ -53,6 +56,7 @@
> + AM_CONDITIONAL([ENABLE_SHARED], [test "$enable_shared" = "yes"])
> + AM_CONDITIONAL([ENABLE_DEVEL], [test "$enable_devel" = "yes"])
> + AM_CONDITIONAL([ENABLE_LIBIPQ], [test "$enable_libipq" = "yes"])
> ++AM_CONDITIONAL([ENABLE_IPV6], [test "$enable_ipv6" == "yes"])
> +
> + regular_CFLAGS="-D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 \
> + ? ? ? -D_REENTRANT -Wall -Waggregate-return -Wmissing-declarations \
> +Only in iptables-1.4.2: configure.ac.orig
> +Only in iptables-1.4.2: configure.ac.rej
> +diff -ru iptables-1.4.2/Makefile.am iptables-1.4.2_patched/Makefile.am
> +--- iptables-1.4.2/Makefile.am 2008-10-08 16:31:58.000000000 +0000
> ++++ iptables-1.4.2_patched/Makefile.am 2009-03-29 15:38:29.082512186 +0000
> +@@ -80,11 +80,17 @@
> + endif
> +
> + if ENABLE_STATIC
> +-sbin_PROGRAMS += iptables-static ip6tables-static
> ++sbin_PROGRAMS += iptables-static
> ++if ENABLE_IPV6
> ++sbin_PROGRAMS += ip6tables-static
> ++endif
> ++
> + endif
> + if ENABLE_SHARED
> +-sbin_PROGRAMS += iptables iptables-multi iptables-restore iptables-save \
> +- ? ? ? ? ? ? ? ? ip6tables ip6tables-multi ip6tables-restore ip6tables-save
> ++sbin_PROGRAMS += iptables iptables-multi iptables-restore iptables-save
> ++if ENABLE_IPV6
> ++sbin_PROGRAMS += ip6tables ip6tables-multi ip6tables-restore ip6tables-save
> ++endif
> + endif
> +
> + iptables.8: ${srcdir}/iptables.8.in extensions/matches4.man extensions/targets4.man
> +diff -ru iptables-1.4.2/xtables.c iptables-1.4.2_patched/xtables.c
> +--- iptables-1.4.2/xtables.c ? 2008-10-08 16:31:58.000000000 +0000
> ++++ iptables-1.4.2_patched/xtables.c ? 2009-03-29 15:38:29.082512186 +0000
> +@@ -964,6 +964,8 @@
> + ? ? ? }
> + }
> +
> ++#ifdef ENABLE_IPV6
> ++
> + const char *ip6addr_to_numeric(const struct in6_addr *addrp)
> + {
> + ? ? ? /* 0000:0000:0000:0000:0000:000.000.000.000
> +@@ -1189,6 +1191,7 @@
> + ? ? ? ? ? ? ? ? ? ? ? }
> + ? ? ? }
> + }
> ++#endif
> +
> + void save_string(const char *value)
> + {
>
> Modified: trunk/buildroot/package/iptables/iptables.mk
> ===================================================================
> --- trunk/buildroot/package/iptables/iptables.mk ? ? ? ?2009-03-30 13:59:22 UTC (rev 25896)
> +++ trunk/buildroot/package/iptables/iptables.mk ? ? ? ?2009-03-30 18:41:53 UTC (rev 25897)
> @@ -8,6 +8,10 @@
> ?IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
>
> ?IPTABLES_CONF_OPT = --libexecdir=/usr/lib
> +ifneq ($(BR2_INET_IPV6),y)
> +IPTABLES_CONF_OPT += --enable-ipv6=no
> +endif
> +
> ?IPTABLES_INSTALL_TARGET = YES
>
> ?IPTABLES_AUTORECONF = YES
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
