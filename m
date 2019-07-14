From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 15:43:09 +0200
Subject: [Buildroot] [git commit] package/iputils: bump to version s20190709
Message-ID: <20190714134202.6AFCC836DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2dab90a0abe72906a8f5f562ebee1a5315363f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove all patches (accepted in this release).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...infod-ninfod_name.c-fix-build-with-nettle.patch | 38 -----------
 ...ix-static-build-gcrypt-dependency-gpg-err.patch | 51 --------------
 .../0003-meson.build-fix-build-with-NLS.patch      | 77 ----------------------
 ...004-build-sys-Make-setcap-really-optional.patch | 70 --------------------
 .../0005-traceroute6-fix-build-with-NLS.patch      | 30 ---------
 package/iputils/iputils.hash                       |  3 +-
 package/iputils/iputils.mk                         |  2 +-
 7 files changed, 3 insertions(+), 268 deletions(-)

diff --git a/package/iputils/0001-ninfod-ninfod_name.c-fix-build-with-nettle.patch b/package/iputils/0001-ninfod-ninfod_name.c-fix-build-with-nettle.patch
deleted file mode 100644
index 5d522f53ef..0000000000
--- a/package/iputils/0001-ninfod-ninfod_name.c-fix-build-with-nettle.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From f209ebb91e65980bcdddce8cc12b00ec11623f76 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 21 May 2019 19:14:18 +0200
-Subject: [PATCH] ninfod/ninfod_name.c: fix build with nettle
-
-Build of ninfod with nettle fails on:
-/home/test/autobuild/run/instance-1/output/host/bin/mips64el-linux-gcc  -o ninfod/ninfod 'ninfod/0cb6efe@@ninfod at exe/ni_ifaddrs.c.o' 'ninfod/0cb6efe@@ninfod at exe/ninfod.c.o' 'ninfod/0cb6efe@@ninfod at exe/ninfod_addrs.c.o' 'ninfod/0cb6efe@@ninfod at exe/ninfod_core.c.o' 'ninfod/0cb6efe@@ninfod at exe/ninfod_name.c.o' -Wl,--no-undefined -Wl,--as-needed -Wl,-O1 -Wl,--start-group libcommon.a -lcap /home/test/autobuild/run/instance-1/output/host/usr/bin/../mips64el-buildroot-linux-uclibc/sysroot/usr/lib/libnettle.so -Wl,--end-group -pthread '-Wl,-rpath,$ORIGIN/..:/home/test/autobuild/run/instance-1/output/host/usr/bin/../mips64el-buildroot-linux-uclibc/sysroot/usr/lib' -Wl,-rpath-link,/home/test/autobuild/run/instance-1/output/build/iputils-s20190515/build/:/home/test/autobuild/run/instance-1/output/host/usr/bin/../mips64el-buildroot-linux-uclibc/sysroot/usr/lib
-ninfod/0cb6efe@@ninfod at exe/ninfod_name.c.o: In function `init_nodeinfo_nodename':
-ninfod_name.c:(.text+0x378): undefined reference to `MD5_Init'
-
-This error is raised because MD5_Init is not defined by nettle.
-To fix this error, include iputils_md5dig.h if USE_NETTLE is defined.
-
-Fixes:
- - http://autobuild.buildroot.org/results/e86555090e27b631ba35214ef100aa9331844684
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream status: commit f209ebb91e65980bcdddce8cc12b00ec11623f76
----
- ninfod/ninfod_name.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ninfod/ninfod_name.c b/ninfod/ninfod_name.c
-index daf606d..525c93d 100644
---- a/ninfod/ninfod_name.c
-+++ b/ninfod/ninfod_name.c
-@@ -95,7 +95,7 @@
- 
- #include <arpa/inet.h>
- 
--#if defined(HAVE_GCRYPT_H) || defined(USE_KERNEL_CRYPTO_API)
-+#if defined(HAVE_GCRYPT_H) || defined(USE_KERNEL_CRYPTO_API) || defined(USE_NETTLE)
- # include "iputils_md5dig.h"
- #elif defined(HAVE_GNUTLS_OPENSSL_H)
- # include <gnutls/openssl.h>
--- 
-2.21.0
-
diff --git a/package/iputils/0002-build-sys-fix-static-build-gcrypt-dependency-gpg-err.patch b/package/iputils/0002-build-sys-fix-static-build-gcrypt-dependency-gpg-err.patch
deleted file mode 100644
index aaf6a0d392..0000000000
--- a/package/iputils/0002-build-sys-fix-static-build-gcrypt-dependency-gpg-err.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From eabe21164bbb29dead1a902b6d6e910f6892e3a7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 7 Jun 2019 23:17:13 +0200
-Subject: [PATCH] build-sys: fix static build gcrypt dependency gpg-error
-
-The gcrypt depends on gpg-error, so find it's availability and link with it
-when needed to fix static build.
-
-Fixes:
-- http://autobuild.buildroot.net/results/fb698e3e903869978bd5e69d791ec362317b7981
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream status: commit eabe21164bbb29dead1a902b6d6e910f6892e3a7
----
- meson.build | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 84e4360..3766edc 100644
---- a/meson.build
-+++ b/meson.build
-@@ -101,20 +101,22 @@ else
- endif
-
- crypto = get_option('USE_CRYPTO')
-+crypto_dep = []
- if crypto == 'nettle'
--	crypto_dep = dependency('nettle')
-+	crypto_dep += dependency('nettle')
-	conf.set('USE_NETTLE', 1, description : 'If set use nettle crypto library.')
- elif crypto == 'gcrypt'
--	crypto_dep = cc.find_library('gcrypt')
-+	crypto_dep += cc.find_library('gcrypt')
-+	crypto_dep += dependency('gpg-error', required : true)
-	conf.set('USE_GCRYPT', 1, description : 'If set use gcrypt crypto library.')
- elif crypto == 'openssl'
--	crypto_dep = dependency('openssl')
-+	crypto_dep += dependency('openssl')
-	conf.set('USE_OPENSSL', 1, description : 'if set use openssl crypto library.')
- elif crypto == 'kernel'
--	crypto_dep = dependency('disabler-appears-to-disable-executable-build', required : false)
-+	crypto_dep += dependency('disabler-appears-to-disable-executable-build', required : false)
-	conf.set('USE_KERNEL_CRYPTO_API', 1, description : 'if set use Linux kernel Crypto API.')
- elif crypto == 'none'
--	crypto_dep = dependency('disabler-appears-to-disable-executable-build', required : false)
-+	crypto_dep += dependency('disabler-appears-to-disable-executable-build', required : false)
-	conf.set('PING6_NONCE_MEMORY', 1,
-		description : 'If set RFC6744 random does not use any CRYPTO lib.')
- endif
---
-2.21.0
diff --git a/package/iputils/0003-meson.build-fix-build-with-NLS.patch b/package/iputils/0003-meson.build-fix-build-with-NLS.patch
deleted file mode 100644
index 1c999ba750..0000000000
--- a/package/iputils/0003-meson.build-fix-build-with-NLS.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 418d8bea5424d8a14a21fd7928747a233557618c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 9 Jun 2019 18:38:37 +0200
-Subject: [PATCH] build-sys: fix build with NLS
-
-With some toolchains, intl is needed for NLS support so search for this
-library and use if needed.
-
-Fixes:
- - http://autobuild.buildroot.org/results/0a8a3efe734ac7fb3a68ba505277681857dc0a3d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream status: commit 418d8bea5424d8a14a21fd7928747a233557618c
----
- meson.build | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 3766edc..2b545b6 100644
---- a/meson.build
-+++ b/meson.build
-@@ -77,6 +77,8 @@ if opt != ''
-	conf.set_quoted('DEFAULT_DEVICE', opt, description : 'arping default device.')
- endif
- 
-+# Some systems needs intl for gettext
-+intl_dep = []
- opt = get_option('USE_GETTEXT')
- if opt == true
-	prefix = get_option('prefix')
-@@ -86,6 +88,7 @@ if opt == true
-	conf.set('ENABLE_NLS', 1, description : 'If set enable I18N.')
-	conf.set_quoted('LOCALEDIR', join_paths(prefix, localedir))
-	subdir ('po')
-+	intl_dep += cc.find_library('intl', required : false)
- endif
-
- opt = get_option('USE_IDN')
-@@ -243,7 +246,7 @@ libcommon = static_library(
- 
- if build_ping == true
- 	executable('ping', ['ping.c', 'ping_common.c', 'ping6_common.c', git_version_h],
--		dependencies : [m_dep, cap_dep, idn_dep, crypto_dep, resolv_dep],
-+		dependencies : [m_dep, cap_dep, idn_dep, intl_dep, crypto_dep, resolv_dep],
- 		link_with : [libcommon],
- 		install: true)
- 	meson.add_install_script('build-aux/setcap-setuid.sh',
-@@ -256,7 +259,7 @@ endif
- 
- if build_tracepath == true
- 	executable('tracepath', ['tracepath.c', git_version_h],
--		dependencies : idn_dep,
-+		dependencies : [idn_dep, intl_dep],
- 		link_with : [libcommon],
- 		install: true)
- endif
-@@ -276,7 +279,7 @@ endif
- 
- if build_clockdiff == true
- 	executable('clockdiff', ['clockdiff.c', git_version_h],
--		dependencies : [cap_dep],
-+		dependencies : [cap_dep, intl_dep],
- 		link_with : [libcommon],
- 		install: true)
- 	meson.add_install_script('build-aux/setcap-setuid.sh',
-@@ -306,7 +309,7 @@ endif
- 
- if build_arping == true
- 	executable('arping', ['arping.c', git_version_h],
--		dependencies : [rt_dep, cap_dep, idn_dep],
-+		dependencies : [rt_dep, cap_dep, idn_dep, intl_dep],
- 		link_with : [libcommon],
- 		install: true)
- 	meson.add_install_script('build-aux/setcap-setuid.sh',
--- 
-2.21.0
-
diff --git a/package/iputils/0004-build-sys-Make-setcap-really-optional.patch b/package/iputils/0004-build-sys-Make-setcap-really-optional.patch
deleted file mode 100644
index 5ebd1db026..0000000000
--- a/package/iputils/0004-build-sys-Make-setcap-really-optional.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 473be6467f995865244e7e68b2fa587a4ee79551 Mon Sep 17 00:00:00 2001
-From: Michael Weiss <dev.primeos@gmail.com>
-Date: Thu, 16 May 2019 09:44:27 +0000
-Subject: [PATCH] build-sys: Make setcap really optional
-
-The setcap dependency is marked as optional but meson.build depends on
-setcap.path():
-
-meson.build:246:7: ERROR:  add_install_script args must be strings
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream status: commit 473be6467f995865244e7e68b2fa587a4ee79551
----
- meson.build | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 8af9e18..95c778a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -221,10 +221,13 @@ config_h = configure_file(
- setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
- if get_option('NO_SETCAP_OR_SUID')
- 	perm_type = 'none'
-+	setcap_path = '/dev/null'
- elif cap_dep.found() and setcap.found()
- 	perm_type = 'caps'
-+	setcap_path = setcap.path()
- else
- 	perm_type = 'setuid'
-+	setcap_path = '/dev/null'
- endif
- 
- ############################################################
-@@ -243,7 +246,7 @@ if build_ping == true
- 		join_paths(get_option('prefix'), get_option('bindir')),
- 		'ping',
- 		perm_type,
--		setcap.path()
-+		setcap_path
- 	)
- endif
- 
-@@ -263,7 +266,7 @@ if build_traceroute6 == true
- 		join_paths(get_option('prefix'), get_option('bindir')),
- 		'traceroute6',
- 		perm_type,
--		setcap.path()
-+		setcap_path
- 	)
- endif
- 
-@@ -276,7 +279,7 @@ if build_clockdiff == true
- 		join_paths(get_option('prefix'), get_option('bindir')),
- 		'clockdiff',
- 		perm_type,
--		setcap.path()
-+		setcap_path
- 	)
- endif
- 
-@@ -306,7 +309,7 @@ if build_arping == true
- 		join_paths(get_option('prefix'), get_option('bindir')),
- 		'arping',
- 		perm_type,
--		setcap.path()
-+		setcap_path
- 	)
- endif
- 
diff --git a/package/iputils/0005-traceroute6-fix-build-with-NLS.patch b/package/iputils/0005-traceroute6-fix-build-with-NLS.patch
deleted file mode 100644
index 70315c551b..0000000000
--- a/package/iputils/0005-traceroute6-fix-build-with-NLS.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b18c6c48e4dabaf8bf9b178b3deca631fc79c96e Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Tue, 11 Jun 2019 21:51:58 +0200
-Subject: [PATCH] traceroute6: fix build with NLS
-
-commit 418d8be ("build-sys: fix build with NLS") fixed problems for
-default packages using libintl. Fix also traceroute6 (build it must be
-enabled with -DBUILD_TRACEROUTE6=true)
-
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream status: 81bfb31a714641b70c2a7c7d9ce12cf08f98a372
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 2b545b6..85db8a6 100644
---- a/meson.build
-+++ b/meson.build
-@@ -266,7 +266,7 @@ endif
-
- if build_traceroute6 == true
-	executable('traceroute6', ['traceroute6.c', git_version_h],
--		dependencies : [cap_dep, idn_dep],
-+		dependencies : [cap_dep, intl_dep, idn_dep],
-		link_with : [libcommon],
-		install: true)
-	meson.add_install_script('build-aux/setcap-setuid.sh',
---
-2.21.0
diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 0e2963dda2..3630ae8678 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,6 @@
+# https://github.com/iputils/iputils/releases/download/s20190709/sha256sum.asc
+sha256 a15720dd741d7538dd2645f9f516d193636ae4300ff7dbc8bfca757bf166490a  iputils-20190709.tar.gz
 # Locally computed
-sha256 9b5125eb5ef9f4e947ad8fdddcf77f538f53b8f47b53eb5bc5347cb16d01c8fd  iputils-20190515.tar.gz
 sha256 b8ea785d12fa6a44916601104dd746216957e93f13a26d3eb858b3b5a4ad66ab  LICENSE
 sha256 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/LICENSE.GPL2
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 15ee68be53..8e6a3e2fc5 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,7 +11,7 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = 20190515
+IPUTILS_VERSION = 20190709
 IPUTILS_SITE = $(call github,iputils,iputils,s$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
