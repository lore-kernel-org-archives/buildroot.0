From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Feb 2021 14:02:11 +0100
Subject: [Buildroot] [PATCH] package/netsnmp: bump version to 5.9
In-Reply-To: <20210205100021.3110944-2-stefan.sorensen@spectralink.com>
References: <20210205100021.3110944-1-stefan.sorensen@spectralink.com>
 <20210205100021.3110944-2-stefan.sorensen@spectralink.com>
Message-ID: <20210205130211.GV2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2021-02-05 11:00 +0100, stefan at astylos.dk spake thusly:
> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> 
> - Rebased patches 1 and 4

I know you are only rebasing existing patches, but something isfishy
with patches 1 and: they both touch the file 'configure', but we do have
NETSNMP_AUTORECONF = YES

But the hunk in configure seems to really only be the expansion of the
hunk in configure.d/config_os_libs2

So, the hunk about configure is useless and should be dropped, I
believe...

Could please look into that and respin?

Regards,
Yann E. MORIN.

> - Dropped upstreamed patches 5 and 6
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  ...figure-static-linking-Fix-SSL-checks.patch |  6 +--
>  ..._CHECK_FUNCS-TLS_method-TLSv1_method.patch |  4 +-
>  ...once-that-opening-proc-net-if_inet6-.patch | 30 ---------------
>  ...x-Fix-a-memory-leak-in-an-error-path.patch | 37 -------------------
>  package/netsnmp/netsnmp.hash                  | 10 ++---
>  package/netsnmp/netsnmp.mk                    |  2 +-
>  6 files changed, 10 insertions(+), 79 deletions(-)
>  delete mode 100644 package/netsnmp/0005-MIB-II-Only-log-once-that-opening-proc-net-if_inet6-.patch
>  delete mode 100644 package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch
> 
> diff --git a/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch b/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch
> index 8431d46868..7334e609e3 100644
> --- a/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch
> +++ b/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch
> @@ -98,7 +98,7 @@ index 6504a8e58..1116cecaa 100755
>           netsnmp_save_LIBS="$LIBS"
>  -        LIBS="-lssl"
>  +        LIBS="-lssl $LIBCRYPTO"
> -         for ac_func in TLS_method TLSv1_method DTLS_method DTLSv1_method                       SSL_library_init SSL_load_error_strings
> +         for ac_func in TLS_method TLSv1_method DTLS_method DTLSv1_method                       SSL_library_init SSL_load_error_strings		       ERR_get_error_all
>   do :
>     as_ac_var=`$as_echo "ac_cv_func_$ac_func" | $as_tr_sh`
>  diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
> @@ -135,8 +135,8 @@ index 4a1ad1551..75214cfff 100644
>  -        LIBS="-lssl"
>  +        LIBS="-lssl $LIBCRYPTO"
>           AC_CHECK_FUNCS([TLS_method TLSv1_method DTLS_method DTLSv1_method]dnl
> -                        [SSL_library_init SSL_load_error_strings])
> -         LIBS="$netsnmp_save_LIBS"
> +                        [SSL_library_init SSL_load_error_strings]dnl
> + 		       [ERR_get_error_all])
>  -- 
>  2.17.1
>  
> diff --git a/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch b/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
> index a731f25761..2618cbee74 100644
> --- a/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
> +++ b/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
> @@ -32,8 +32,8 @@ index 93044000b..c811c63ec 100644
>  -        LIBS="-lssl $LIBCRYPTO"
>  +        LIBS="-lssl $LIBCRYPTO $LIBS"
>           AC_CHECK_FUNCS([TLS_method TLSv1_method DTLS_method DTLSv1_method]dnl
> -                        [SSL_library_init SSL_load_error_strings])
> -         LIBS="$netsnmp_save_LIBS"
> +                        [SSL_library_init SSL_load_error_strings]dnl
> + 		       [ERR_get_error_all])
>  -- 
>  2.17.1
>  
> diff --git a/package/netsnmp/0005-MIB-II-Only-log-once-that-opening-proc-net-if_inet6-.patch b/package/netsnmp/0005-MIB-II-Only-log-once-that-opening-proc-net-if_inet6-.patch
> deleted file mode 100644
> index 2d5b38eb32..0000000000
> --- a/package/netsnmp/0005-MIB-II-Only-log-once-that-opening-proc-net-if_inet6-.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From cd09fd82522861830aaf9d237b26eef5f9ba50d2 Mon Sep 17 00:00:00 2001
> -From: Bart Van Assche <bvanassche@acm.org>
> -Date: Wed, 21 Nov 2018 20:47:42 -0800
> -Subject: [PATCH] MIB-II: Only log once that opening /proc/net/if_inet6 failed
> -
> -If IPv6 has been disabled (ipv6.disable=1) then opening /proc/net/if_inet6
> -fails. Only log this once instead of thousand of times a day.
> -
> -Reported-by: Fif <lefif@users.sourceforge.net>
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - agent/mibgroup/ip-mib/data_access/ipaddress_linux.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
> -index 5ddead3e0c..280575ce39 100644
> ---- a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
> -+++ b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
> -@@ -234,7 +234,7 @@ _load_v6(netsnmp_container *container, int idx_offset)
> - 
> - #define PROCFILE "/proc/net/if_inet6"
> -     if (!(in = fopen(PROCFILE, "r"))) {
> --        snmp_log_perror("ipaddress_linux: could not open " PROCFILE);
> -+        NETSNMP_LOGONCE((LOG_ERR, "ipaddress_linux: could not open " PROCFILE));
> -         return -2;
> -     }
> - 
> --- 
> -2.20.1
> -
> diff --git a/package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch b/package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch
> deleted file mode 100644
> index fb68e175e5..0000000000
> --- a/package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 7c073e3a1b736689135fd2ed44ede5b83790bd37 Mon Sep 17 00:00:00 2001
> -From: Bart Van Assche <bvanassche@acm.org>
> -Date: Mon, 26 Aug 2019 18:32:08 -0700
> -Subject: IP-MIB, Linux: Fix a memory leak in an error path
> -
> -When a Linux system is booted with "ipv6.disable=1" in the kernel command
> -line, the file "/proc/net/snmp6" is not created. Fix the memory leak in
> -_systemstats_v6_load_systemstats() that is triggered with IPv6 disabled.
> -
> -See also https://sourceforge.net/p/net-snmp/bugs/2976/.
> -
> -Reported-by: Mark E Rusk <marker55@users.sourceforge.net>
> ----
> - agent/mibgroup/ip-mib/data_access/systemstats_linux.c | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
> -index e28ff93..f68d122 100644
> ---- a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
> -+++ b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
> -@@ -560,10 +560,12 @@ _systemstats_v6_load_systemstats(netsnmp_container* container, u_int load_flags)
> -      * try to open file. If we can't, that's ok - maybe the module hasn't
> -      * been loaded yet.
> -      */
> --    if (!(devin = fopen(filename, "r"))) {
> -+    devin = fopen(filename, "r");
> -+    if (!devin) {
> -         DEBUGMSGTL(("access:systemstats",
> -                 "Failed to load Systemstats Table (linux1), cannot open %s\n",
> -                 filename));
> -+        netsnmp_access_systemstats_entry_free(entry);
> -         return 0;
> -     }
> -     
> --- 
> -2.7.4
> -
> diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
> index d05a7de9da..e3adb28c6d 100644
> --- a/package/netsnmp/netsnmp.hash
> +++ b/package/netsnmp/netsnmp.hash
> @@ -1,6 +1,4 @@
> -# From http://sourceforge.net/projects/net-snmp/files/net-snmp/5.8/
> -md5	63bfc65fbb86cdb616598df1aff6458a		net-snmp-5.8.tar.gz
> -sha1	78f70731df9dcdb13fe8f60eb7d80d7583da4d2c	net-snmp-5.8.tar.gz
> -# Locally computed
> -sha256 b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf  net-snmp-5.8.tar.gz
> -sha256 ed869ea395a1f125819a56676385ab0557a21507764bf56f2943302011381e59  COPYING
> +# Locally calculated after checking pgp signature at
> +# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9/net-snmp-5.9.tar.gz.asc
> +# using key D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6
> +sha256  04303a66f85d6d8b16d3cc53bde50428877c82ab524e17591dfceaeb94df6071  net-snmp-5.9.tar.gz
> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
> index d8deaaf1b8..5b22d1a063 100644
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NETSNMP_VERSION = 5.8
> +NETSNMP_VERSION = 5.9
>  NETSNMP_SITE = https://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
>  NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
>  NETSNMP_LICENSE = Various BSD-like
> -- 
> 2.29.2
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
