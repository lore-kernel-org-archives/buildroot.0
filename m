From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 10:01:07 +0200
Subject: [Buildroot] [git commit] package/iputils: update upstream status of
 patches
Message-ID: <20190622080502.B719E81677@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbeed94dc07ccf6008682ba0bcbf3f8625857b8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0002-meson.build-fix-static-build-with-gcrypt.patch replaced with
0002-build-sys-fix-static-build-gcrypt-dependency-gpg-err.patch

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...infod-ninfod_name.c-fix-build-with-nettle.patch |  4 +-
 ...ix-static-build-gcrypt-dependency-gpg-err.patch | 51 +++++++++++++++++++
 ...-meson.build-fix-static-build-with-gcrypt.patch | 58 ----------------------
 .../0003-meson.build-fix-build-with-NLS.patch      | 45 ++++++++++-------
 ...004-build-sys-Make-setcap-really-optional.patch |  3 +-
 5 files changed, 80 insertions(+), 81 deletions(-)

diff --git a/package/iputils/0001-ninfod-ninfod_name.c-fix-build-with-nettle.patch b/package/iputils/0001-ninfod-ninfod_name.c-fix-build-with-nettle.patch
index 796185011a..5d522f53ef 100644
--- a/package/iputils/0001-ninfod-ninfod_name.c-fix-build-with-nettle.patch
+++ b/package/iputils/0001-ninfod-ninfod_name.c-fix-build-with-nettle.patch
@@ -15,7 +15,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/e86555090e27b631ba35214ef100aa9331844684
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/iputils/iputils/pull/181]
+Upstream status: commit f209ebb91e65980bcdddce8cc12b00ec11623f76
 ---
  ninfod/ninfod_name.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -34,5 +34,5 @@ index daf606d..525c93d 100644
  #elif defined(HAVE_GNUTLS_OPENSSL_H)
  # include <gnutls/openssl.h>
 -- 
-2.20.1
+2.21.0
 
diff --git a/package/iputils/0002-build-sys-fix-static-build-gcrypt-dependency-gpg-err.patch b/package/iputils/0002-build-sys-fix-static-build-gcrypt-dependency-gpg-err.patch
new file mode 100644
index 0000000000..aaf6a0d392
--- /dev/null
+++ b/package/iputils/0002-build-sys-fix-static-build-gcrypt-dependency-gpg-err.patch
@@ -0,0 +1,51 @@
+From eabe21164bbb29dead1a902b6d6e910f6892e3a7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 7 Jun 2019 23:17:13 +0200
+Subject: [PATCH] build-sys: fix static build gcrypt dependency gpg-error
+
+The gcrypt depends on gpg-error, so find it's availability and link with it
+when needed to fix static build.
+
+Fixes:
+- http://autobuild.buildroot.net/results/fb698e3e903869978bd5e69d791ec362317b7981
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream status: commit eabe21164bbb29dead1a902b6d6e910f6892e3a7
+---
+ meson.build | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 84e4360..3766edc 100644
+--- a/meson.build
++++ b/meson.build
+@@ -101,20 +101,22 @@ else
+ endif
+
+ crypto = get_option('USE_CRYPTO')
++crypto_dep = []
+ if crypto == 'nettle'
+-	crypto_dep = dependency('nettle')
++	crypto_dep += dependency('nettle')
+	conf.set('USE_NETTLE', 1, description : 'If set use nettle crypto library.')
+ elif crypto == 'gcrypt'
+-	crypto_dep = cc.find_library('gcrypt')
++	crypto_dep += cc.find_library('gcrypt')
++	crypto_dep += dependency('gpg-error', required : true)
+	conf.set('USE_GCRYPT', 1, description : 'If set use gcrypt crypto library.')
+ elif crypto == 'openssl'
+-	crypto_dep = dependency('openssl')
++	crypto_dep += dependency('openssl')
+	conf.set('USE_OPENSSL', 1, description : 'if set use openssl crypto library.')
+ elif crypto == 'kernel'
+-	crypto_dep = dependency('disabler-appears-to-disable-executable-build', required : false)
++	crypto_dep += dependency('disabler-appears-to-disable-executable-build', required : false)
+	conf.set('USE_KERNEL_CRYPTO_API', 1, description : 'if set use Linux kernel Crypto API.')
+ elif crypto == 'none'
+-	crypto_dep = dependency('disabler-appears-to-disable-executable-build', required : false)
++	crypto_dep += dependency('disabler-appears-to-disable-executable-build', required : false)
+	conf.set('PING6_NONCE_MEMORY', 1,
+		description : 'If set RFC6744 random does not use any CRYPTO lib.')
+ endif
+--
+2.21.0
diff --git a/package/iputils/0002-meson.build-fix-static-build-with-gcrypt.patch b/package/iputils/0002-meson.build-fix-static-build-with-gcrypt.patch
deleted file mode 100644
index 07bf4387dc..0000000000
--- a/package/iputils/0002-meson.build-fix-static-build-with-gcrypt.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 40123757a799fac0446e33055b33a540bf725589 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 7 Jun 2019 23:17:13 +0200
-Subject: [PATCH] meson.build: fix static build with gcrypt
-
-gcrypt depends on gpg-error so save the result of
-dependency('gpg-error') in gpg_error_dep and use it when needed to fix
-static build
-
-Fixes:
- - http://autobuild.buildroot.net/results/fb698e3e903869978bd5e69d791ec362317b7981
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/iputils/iputils/pull/185]
----
- meson.build        | 5 ++++-
- ninfod/meson.build | 2 +-
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 84e4360..24bda0c 100644
---- a/meson.build
-+++ b/meson.build
-@@ -119,6 +119,9 @@ elif crypto == 'none'
- 		description : 'If set RFC6744 random does not use any CRYPTO lib.')
- endif
- 
-+# gpg-error is a dependency of gcrypt
-+gpg_error_dep = dependency('gpg-error', required : false)
-+
- systemd = dependency('systemd', required : false)
- systemdunitdir = get_option('systemdunitdir')
- if systemdunitdir == '' and systemd.found()
-@@ -241,7 +244,7 @@ libcommon = static_library(
- 
- if build_ping == true
- 	executable('ping', ['ping.c', 'ping_common.c', 'ping6_common.c', git_version_h],
--		dependencies : [m_dep, cap_dep, idn_dep, crypto_dep, resolv_dep],
-+		dependencies : [m_dep, cap_dep, idn_dep, crypto_dep, gpg_error_dep, resolv_dep],
- 		link_with : [libcommon],
- 		install: true)
- 	meson.add_install_script('build-aux/setcap-setuid.sh',
-diff --git a/ninfod/meson.build b/ninfod/meson.build
-index a0ee94d..1e7aa26 100644
---- a/ninfod/meson.build
-+++ b/ninfod/meson.build
-@@ -10,7 +10,7 @@ ninfod_sources = files('''
- 	ninfod_name.c
- '''.split())
- executable('ninfod', [ninfod_sources, git_version_h],
--	dependencies : [cap_dep, crypto_dep, rt_dep, threads],
-+	dependencies : [cap_dep, crypto_dep, gpg_error_dep, rt_dep, threads],
- 	link_with : [libcommon],
- 	include_directories : inc,
- 	install: true,
--- 
-2.20.1
-
diff --git a/package/iputils/0003-meson.build-fix-build-with-NLS.patch b/package/iputils/0003-meson.build-fix-build-with-NLS.patch
index f6fd737f43..1c999ba750 100644
--- a/package/iputils/0003-meson.build-fix-build-with-NLS.patch
+++ b/package/iputils/0003-meson.build-fix-build-with-NLS.patch
@@ -1,44 +1,51 @@
-From 8719555a530a8981214f1a35df4b17838dc5f3e8 Mon Sep 17 00:00:00 2001
+From 418d8bea5424d8a14a21fd7928747a233557618c Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 9 Jun 2019 10:55:35 +0200
-Subject: [PATCH] meson.build: fix build with NLS
+Date: Sun, 9 Jun 2019 18:38:37 +0200
+Subject: [PATCH] build-sys: fix build with NLS
 
 With some toolchains, intl is needed for NLS support so search for this
-library and use if needed
+library and use if needed.
 
 Fixes:
  - http://autobuild.buildroot.org/results/0a8a3efe734ac7fb3a68ba505277681857dc0a3d
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
--[Upstream status: not sent yet]
+Upstream status: commit 418d8bea5424d8a14a21fd7928747a233557618c
 ---
  meson.build | 11 +++++++----
  1 file changed, 7 insertions(+), 4 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 24bda0c..53a3995 100644
+index 3766edc..2b545b6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -88,6 +88,9 @@ if opt == true
- 	subdir ('po')
+@@ -77,6 +77,8 @@ if opt != ''
+	conf.set_quoted('DEFAULT_DEVICE', opt, description : 'arping default device.')
  endif
  
 +# Some systems needs intl for gettext
-+intl_dep = cc.find_library('intl', required : false)
-+
- opt = get_option('USE_IDN')
++intl_dep = []
+ opt = get_option('USE_GETTEXT')
  if opt == true
- 	idn_dep = cc.find_library('idn2', required : false)
-@@ -244,7 +247,7 @@ libcommon = static_library(
+	prefix = get_option('prefix')
+@@ -86,6 +88,7 @@ if opt == true
+	conf.set('ENABLE_NLS', 1, description : 'If set enable I18N.')
+	conf.set_quoted('LOCALEDIR', join_paths(prefix, localedir))
+	subdir ('po')
++	intl_dep += cc.find_library('intl', required : false)
+ endif
+
+ opt = get_option('USE_IDN')
+@@ -243,7 +246,7 @@ libcommon = static_library(
  
  if build_ping == true
  	executable('ping', ['ping.c', 'ping_common.c', 'ping6_common.c', git_version_h],
--		dependencies : [m_dep, cap_dep, idn_dep, crypto_dep, gpg_error_dep, resolv_dep],
-+		dependencies : [m_dep, cap_dep, idn_dep, intl_dep, crypto_dep, gpg_error_dep, resolv_dep],
+-		dependencies : [m_dep, cap_dep, idn_dep, crypto_dep, resolv_dep],
++		dependencies : [m_dep, cap_dep, idn_dep, intl_dep, crypto_dep, resolv_dep],
  		link_with : [libcommon],
  		install: true)
  	meson.add_install_script('build-aux/setcap-setuid.sh',
-@@ -257,7 +260,7 @@ endif
+@@ -256,7 +259,7 @@ endif
  
  if build_tracepath == true
  	executable('tracepath', ['tracepath.c', git_version_h],
@@ -47,7 +54,7 @@ index 24bda0c..53a3995 100644
  		link_with : [libcommon],
  		install: true)
  endif
-@@ -277,7 +280,7 @@ endif
+@@ -276,7 +279,7 @@ endif
  
  if build_clockdiff == true
  	executable('clockdiff', ['clockdiff.c', git_version_h],
@@ -56,7 +63,7 @@ index 24bda0c..53a3995 100644
  		link_with : [libcommon],
  		install: true)
  	meson.add_install_script('build-aux/setcap-setuid.sh',
-@@ -307,7 +310,7 @@ endif
+@@ -306,7 +309,7 @@ endif
  
  if build_arping == true
  	executable('arping', ['arping.c', git_version_h],
@@ -66,5 +73,5 @@ index 24bda0c..53a3995 100644
  		install: true)
  	meson.add_install_script('build-aux/setcap-setuid.sh',
 -- 
-2.20.1
+2.21.0
 
diff --git a/package/iputils/0004-build-sys-Make-setcap-really-optional.patch b/package/iputils/0004-build-sys-Make-setcap-really-optional.patch
index 0024f3fa6f..5ebd1db026 100644
--- a/package/iputils/0004-build-sys-Make-setcap-really-optional.patch
+++ b/package/iputils/0004-build-sys-Make-setcap-really-optional.patch
@@ -8,9 +8,8 @@ setcap.path():
 
 meson.build:246:7: ERROR:  add_install_script args must be strings
 
-[Retrieved from:
-https://github.com/iputils/iputils/commit/473be6467f995865244e7e68b2fa587a4ee79551]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream status: commit 473be6467f995865244e7e68b2fa587a4ee79551
 ---
  meson.build | 11 +++++++----
  1 file changed, 7 insertions(+), 4 deletions(-)
