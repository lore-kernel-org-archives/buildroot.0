From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Feb 2021 23:22:04 +0100
Subject: [Buildroot] [git commit] package/netsnmp: bump version to 5.9
Message-ID: <20210205220648.8DF88817FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87bef179222ee8a0b0f39c8f96113a4ecf813085
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Rebased patches 1 and 4
- Dropped upstreamed patches 5 and 6

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
[yann.morin.1998 at free.fr:
  - update patches 1-2 with actual backports, as noticed by Stefan
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...1-configure-static-linking-Fix-SSL-checks.patch | 20 +++++++-----
 .../0002-configure-Fix-lcrypto-lz-test.patch       | 15 +++++----
 ...ix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch |  4 +--
 ...-log-once-that-opening-proc-net-if_inet6-.patch | 30 ------------------
 ...-Linux-Fix-a-memory-leak-in-an-error-path.patch | 37 ----------------------
 package/netsnmp/netsnmp.hash                       | 10 +++---
 package/netsnmp/netsnmp.mk                         |  2 +-
 7 files changed, 28 insertions(+), 90 deletions(-)

diff --git a/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch b/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch
index 8431d46868..bf61fdfe7a 100644
--- a/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch
+++ b/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch
@@ -1,7 +1,7 @@
 From bd59be8e4e339870a1400f6866a7b73ca11f6460 Mon Sep 17 00:00:00 2001
 From: Giulio Benetti <giulio.benetti@micronovasrl.com>
 Date: Wed, 12 Sep 2018 20:16:39 +0200
-Subject: [PATCH 1/3] configure, static linking: Fix SSL checks
+Subject: [PATCH] configure, static linking: Fix SSL checks
 
 During checking of DTLS_method, the stub program is linked only with -ssl
 libssl.a lacks some function from -lcrypto:
@@ -19,13 +19,17 @@ See also https://sourceforge.net/p/net-snmp/patches/1374/.
 
 Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 [bvanassche: Edited subject / rewrote this patch]
+[yann.morin.1998 at free.fr:
+  - use an actual backport of bd59be8e4e339870a1400f6866a7b73ca11f6460
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
  configure                   | 52 ++++++++++++++++++++++++++++++++++---
  configure.d/config_os_libs2 | 14 +++++++---
  2 files changed, 58 insertions(+), 8 deletions(-)
 
 diff --git a/configure b/configure
-index 6504a8e58..1116cecaa 100755
+index 6504a8e58a..1116cecaad 100755
 --- a/configure
 +++ b/configure
 @@ -23228,16 +23228,60 @@ fi
@@ -74,12 +78,12 @@ index 6504a8e58..1116cecaa 100755
 +$as_echo "$ac_cv_lib_crypto_EVP_md5" >&6; }
 +if test "x$ac_cv_lib_crypto_EVP_md5" = xyes; then :
 +  CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"
++fi
++
++
  fi
  
 -        fi
-+
-+fi
-+
 +	else
 +	    LIBCRYPTO="-l${CRYPTO}"
 +	fi
@@ -98,11 +102,11 @@ index 6504a8e58..1116cecaa 100755
          netsnmp_save_LIBS="$LIBS"
 -        LIBS="-lssl"
 +        LIBS="-lssl $LIBCRYPTO"
-         for ac_func in TLS_method TLSv1_method DTLS_method DTLSv1_method                       SSL_library_init SSL_load_error_strings
+         for ac_func in TLS_method TLSv1_method DTLS_method DTLSv1_method                       SSL_library_init SSL_load_error_strings		       ERR_get_error_all
  do :
    as_ac_var=`$as_echo "ac_cv_func_$ac_func" | $as_tr_sh`
 diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
-index 4a1ad1551..75214cfff 100644
+index 4a1ad1551f..75214cfff3 100644
 --- a/configure.d/config_os_libs2
 +++ b/configure.d/config_os_libs2
 @@ -306,13 +306,19 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
@@ -138,5 +142,5 @@ index 4a1ad1551..75214cfff 100644
                         [SSL_library_init SSL_load_error_strings])
          LIBS="$netsnmp_save_LIBS"
 -- 
-2.17.1
+2.25.1
 
diff --git a/package/netsnmp/0002-configure-Fix-lcrypto-lz-test.patch b/package/netsnmp/0002-configure-Fix-lcrypto-lz-test.patch
index 3ec0c2278f..50387c8390 100644
--- a/package/netsnmp/0002-configure-Fix-lcrypto-lz-test.patch
+++ b/package/netsnmp/0002-configure-Fix-lcrypto-lz-test.patch
@@ -1,19 +1,22 @@
-From d8694929b12b47febb0f7f43f46041387874fe52 Mon Sep 17 00:00:00 2001
+From 13da2bcde8e22dd0127a668374fdf79bed04d353 Mon Sep 17 00:00:00 2001
 From: Bart Van Assche <bvanassche@acm.org>
 Date: Mon, 17 Sep 2018 07:33:34 -0700
-Subject: [PATCH 2/3] configure: Fix -lcrypto -lz test
+Subject: [PATCH] configure: Fix -lcrypto -lz test
 
 Avoid that the second crypto library test uses the cached result from
 the first test by explicitly clearing the cached test result.
 
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+[yann.morin.1998 at free.fr:
+  - use an actual backport of 13da2bcde8e22dd0127a668374fdf79bed04d353
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
  configure                   | 1 +
  configure.d/config_os_libs2 | 1 +
  2 files changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index 1116cecaa..33b8c93e5 100755
+index 1116cecaad..33b8c93e57 100755
 --- a/configure
 +++ b/configure
 @@ -23231,6 +23231,7 @@ if test "x$ac_cv_lib_crypto_EVP_md5" = xyes; then :
@@ -25,7 +28,7 @@ index 1116cecaa..33b8c93e5 100755
  $as_echo_n "checking for EVP_md5 in -lcrypto... " >&6; }
  if ${ac_cv_lib_crypto_EVP_md5+:} false; then :
 diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
-index 75214cfff..81788a209 100644
+index 75214cfff3..81788a2096 100644
 --- a/configure.d/config_os_libs2
 +++ b/configure.d/config_os_libs2
 @@ -308,6 +308,7 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
@@ -37,5 +40,5 @@ index 75214cfff..81788a209 100644
  			     [CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"], [],
  			     [-lz])
 -- 
-2.17.1
+2.25.1
 
diff --git a/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch b/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
index a731f25761..2618cbee74 100644
--- a/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
+++ b/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
@@ -32,8 +32,8 @@ index 93044000b..c811c63ec 100644
 -        LIBS="-lssl $LIBCRYPTO"
 +        LIBS="-lssl $LIBCRYPTO $LIBS"
          AC_CHECK_FUNCS([TLS_method TLSv1_method DTLS_method DTLSv1_method]dnl
-                        [SSL_library_init SSL_load_error_strings])
-         LIBS="$netsnmp_save_LIBS"
+                        [SSL_library_init SSL_load_error_strings]dnl
+ 		       [ERR_get_error_all])
 -- 
 2.17.1
 
diff --git a/package/netsnmp/0005-MIB-II-Only-log-once-that-opening-proc-net-if_inet6-.patch b/package/netsnmp/0005-MIB-II-Only-log-once-that-opening-proc-net-if_inet6-.patch
deleted file mode 100644
index 2d5b38eb32..0000000000
--- a/package/netsnmp/0005-MIB-II-Only-log-once-that-opening-proc-net-if_inet6-.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From cd09fd82522861830aaf9d237b26eef5f9ba50d2 Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Wed, 21 Nov 2018 20:47:42 -0800
-Subject: [PATCH] MIB-II: Only log once that opening /proc/net/if_inet6 failed
-
-If IPv6 has been disabled (ipv6.disable=1) then opening /proc/net/if_inet6
-fails. Only log this once instead of thousand of times a day.
-
-Reported-by: Fif <lefif@users.sourceforge.net>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- agent/mibgroup/ip-mib/data_access/ipaddress_linux.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
-index 5ddead3e0c..280575ce39 100644
---- a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
-+++ b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
-@@ -234,7 +234,7 @@ _load_v6(netsnmp_container *container, int idx_offset)
- 
- #define PROCFILE "/proc/net/if_inet6"
-     if (!(in = fopen(PROCFILE, "r"))) {
--        snmp_log_perror("ipaddress_linux: could not open " PROCFILE);
-+        NETSNMP_LOGONCE((LOG_ERR, "ipaddress_linux: could not open " PROCFILE));
-         return -2;
-     }
- 
--- 
-2.20.1
-
diff --git a/package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch b/package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch
deleted file mode 100644
index fb68e175e5..0000000000
--- a/package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7c073e3a1b736689135fd2ed44ede5b83790bd37 Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Mon, 26 Aug 2019 18:32:08 -0700
-Subject: IP-MIB, Linux: Fix a memory leak in an error path
-
-When a Linux system is booted with "ipv6.disable=1" in the kernel command
-line, the file "/proc/net/snmp6" is not created. Fix the memory leak in
-_systemstats_v6_load_systemstats() that is triggered with IPv6 disabled.
-
-See also https://sourceforge.net/p/net-snmp/bugs/2976/.
-
-Reported-by: Mark E Rusk <marker55@users.sourceforge.net>
----
- agent/mibgroup/ip-mib/data_access/systemstats_linux.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
-index e28ff93..f68d122 100644
---- a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
-+++ b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
-@@ -560,10 +560,12 @@ _systemstats_v6_load_systemstats(netsnmp_container* container, u_int load_flags)
-      * try to open file. If we can't, that's ok - maybe the module hasn't
-      * been loaded yet.
-      */
--    if (!(devin = fopen(filename, "r"))) {
-+    devin = fopen(filename, "r");
-+    if (!devin) {
-         DEBUGMSGTL(("access:systemstats",
-                 "Failed to load Systemstats Table (linux1), cannot open %s\n",
-                 filename));
-+        netsnmp_access_systemstats_entry_free(entry);
-         return 0;
-     }
-     
--- 
-2.7.4
-
diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
index d05a7de9da..e3adb28c6d 100644
--- a/package/netsnmp/netsnmp.hash
+++ b/package/netsnmp/netsnmp.hash
@@ -1,6 +1,4 @@
-# From http://sourceforge.net/projects/net-snmp/files/net-snmp/5.8/
-md5	63bfc65fbb86cdb616598df1aff6458a		net-snmp-5.8.tar.gz
-sha1	78f70731df9dcdb13fe8f60eb7d80d7583da4d2c	net-snmp-5.8.tar.gz
-# Locally computed
-sha256 b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf  net-snmp-5.8.tar.gz
-sha256 ed869ea395a1f125819a56676385ab0557a21507764bf56f2943302011381e59  COPYING
+# Locally calculated after checking pgp signature at
+# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9/net-snmp-5.9.tar.gz.asc
+# using key D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6
+sha256  04303a66f85d6d8b16d3cc53bde50428877c82ab524e17591dfceaeb94df6071  net-snmp-5.9.tar.gz
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index d8deaaf1b8..5b22d1a063 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNMP_VERSION = 5.8
+NETSNMP_VERSION = 5.9
 NETSNMP_SITE = https://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
