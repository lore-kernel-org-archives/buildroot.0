From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 24 Mar 2018 12:35:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.8.0
Message-ID: <20180324113552.31836-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://www.samba.org/samba/history/samba-4.8.0.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-libreplace-disable-libbsd-support.patch   |  6 ++-
 .../samba4/0004-libgpo-fix-build-without-ads.patch | 49 ++++++++++++++++++++++
 package/samba4/samba4.hash                         |  4 +-
 package/samba4/samba4.mk                           |  2 +-
 4 files changed, 56 insertions(+), 5 deletions(-)
 create mode 100644 package/samba4/0004-libgpo-fix-build-without-ads.patch

diff --git a/package/samba4/0001-libreplace-disable-libbsd-support.patch b/package/samba4/0001-libreplace-disable-libbsd-support.patch
index ed6accfca1..4794cb02fd 100644
--- a/package/samba4/0001-libreplace-disable-libbsd-support.patch
+++ b/package/samba4/0001-libreplace-disable-libbsd-support.patch
@@ -9,7 +9,7 @@ This causes redefinition conflicts for link(2) when both standard
 unistd.h and bsd/unistd.h get included.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-(rebased for version 4.7.3)
+(rebased for versions 4.7.3 & 4.8.0)
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  lib/replace/wscript | 12 ------------
@@ -19,7 +19,7 @@ diff --git a/lib/replace/wscript b/lib/replace/wscript
 index 1dfd902..456be9b 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -253,19 +253,6 @@
+@@ -296,21 +296,6 @@
  
      strlcpy_in_bsd = False
  
@@ -32,6 +32,8 @@ index 1dfd902..456be9b 100644
 -        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 -    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
 -        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
+-    if not conf.CHECK_FUNCS('setproctitle_init'):
+-        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
 -
 -    if not conf.CHECK_FUNCS('closefrom'):
 -        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
diff --git a/package/samba4/0004-libgpo-fix-build-without-ads.patch b/package/samba4/0004-libgpo-fix-build-without-ads.patch
new file mode 100644
index 0000000000..5e3af3c322
--- /dev/null
+++ b/package/samba4/0004-libgpo-fix-build-without-ads.patch
@@ -0,0 +1,49 @@
+From a222b7506b53e689708834237f18877231dca589 Mon Sep 17 00:00:00 2001
+From: Volker Lendecke <vl@samba.org>
+Date: Sat, 3 Feb 2018 07:07:55 +0100
+Subject: [PATCH] libgpo: Fix the build --without-ads
+
+Signed-off-by: Volker Lendecke <vl@samba.org>
+Reviewed-by: David Disseldorp <ddiss@samba.org>
+
+Autobuild-User(master): David Disseldorp <ddiss@samba.org>
+Autobuild-Date(master): Tue Feb  6 15:36:01 CET 2018 on sn-devel-144
+
+Downloaded from upstream commit:
+https://git.samba.org/samba.git/?p=samba.git;a=commit;h=a222b7506b53e689708834237f18877231dca589
+
+Fixes https://bugzilla.samba.org/show_bug.cgi?id=13331
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ libgpo/pygpo.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libgpo/pygpo.c b/libgpo/pygpo.c
+index 7a02a0dc2aa..b6b53b76212 100644
+--- a/libgpo/pygpo.c
++++ b/libgpo/pygpo.c
+@@ -319,6 +319,7 @@ static PyObject *py_gpo_get_sysvol_gpt_version(PyObject * self,
+ 	return result;
+ }
+ 
++#ifdef HAVE_ADS
+ static ADS_STATUS find_samaccount(ADS_STRUCT *ads, TALLOC_CTX *mem_ctx,
+ 				  const char *samaccountname,
+ 				  uint32_t *uac_ret, const char **dn_ret)
+@@ -468,11 +469,15 @@ static PyObject *py_ads_get_gpo_list(ADS *self, PyObject *args, PyObject *kwds)
+ 	return ret;
+ }
+ 
++#endif
++
+ static PyMethodDef ADS_methods[] = {
+ 	{ "connect", (PyCFunction)py_ads_connect, METH_NOARGS,
+ 		"Connect to the LDAP server" },
++#ifdef HAVE_ADS
+ 	{ "get_gpo_list", (PyCFunction)py_ads_get_gpo_list, METH_KEYWORDS,
+ 		NULL },
++#endif
+ 	{ NULL }
+ };
+ 
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index dddd132d24..36e2ff79be 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.7.6.tar.asc
-sha256 1eede30fc8ef6504e24602fb72b00baa0a7b73b59f16d25cb0771dc8c7c57d6e  samba-4.7.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.8.0.tar.asc
+sha256 87d9b585dbd8628e79aabb6e621a94bd20a072a00762e78e0899fad22fc18fb7  samba-4.8.0.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index ada03c024f..a5ebe59ef3 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.7.6
+SAMBA4_VERSION = 4.8.0
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.11.0
