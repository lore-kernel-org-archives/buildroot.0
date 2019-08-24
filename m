From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 24 Aug 2019 10:16:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.10.7
Message-ID: <20190824081633.18557-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes of this bugfix release:
https://www.samba.org/samba/history/samba-4.10.7.html

Removed 0005-disable_gnutls_build_fix.patch, applied upstream:
https://git.samba.org/samba.git/?p=samba.git;a=commitdiff;h=8128ceceb8702e596183dd509dd6f952a2f4efc2

Renumbered remaining patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0005-disable_gnutls_build_fix.patch       | 37 -------------------
 ..._incl.patch => 0005-fix_unistd_incl.patch} |  0
 ...ript_build-do-not-add-host-include-.patch} |  0
 package/samba4/samba4.hash                    |  4 +-
 package/samba4/samba4.mk                      |  2 +-
 5 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 package/samba4/0005-disable_gnutls_build_fix.patch
 rename package/samba4/{0006-fix_unistd_incl.patch => 0005-fix_unistd_incl.patch} (100%)
 rename package/samba4/{0007-heimdal_build-wscript_build-do-not-add-host-include-.patch => 0006-heimdal_build-wscript_build-do-not-add-host-include-.patch} (100%)

diff --git a/package/samba4/0005-disable_gnutls_build_fix.patch b/package/samba4/0005-disable_gnutls_build_fix.patch
deleted file mode 100644
index 5ea0f26124..0000000000
--- a/package/samba4/0005-disable_gnutls_build_fix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 41eeabcb0175659aebf6d480c43fb64310f37d9c Mon Sep 17 00:00:00 2001
-From: Andrew Bartlett <abartlet@samba.org>
-Date: Wed, 20 Mar 2019 13:57:50 +1300
-Subject: [PATCH] build: Allow build when --disable-gnutls is set
-
-BUG: https://bugzilla.samba.org/show_bug.cgi?id=13844
-
-Signed-off-by: Andrew Bartlett <abartlet@samba.org>
-
-Downloaded from
-https://github.com/openwrt/packages/blob/master/net/samba4/patches/005-samba-4.10-disable_gnutls_build_fix.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- lib/mscat/wscript | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/lib/mscat/wscript b/lib/mscat/wscript
-index 7ca9ef567ee..4d1f752a3c1 100644
---- a/lib/mscat/wscript
-+++ b/lib/mscat/wscript
-@@ -12,7 +12,11 @@ def configure(conf):
-         if not conf.find_program('asn1Parser', var='ASN1PARSER'):
-             Logs.warn('WARNING: ans1Parser hasn\'t been found! Please install it (e.g. libtasn1-bin)')
- 
--    conf.CHECK_FUNCS_IN('gnutls_pkcs7_get_embedded_data_oid', 'gnutls')
-+    # GnuTLS is currently able to be disabled
-+    if conf.env.enable_gnutls:
-+        conf.CHECK_FUNCS_IN('gnutls_pkcs7_get_embedded_data_oid', 'gnutls')
-+    else:
-+        Logs.warn('WARNING: gnutls disabled so dumpmscat will not be built')
- 
- def build(bld):
-     if (bld.CONFIG_SET('HAVE_LIBTASN1') and
--- 
-2.11.0
-
diff --git a/package/samba4/0006-fix_unistd_incl.patch b/package/samba4/0005-fix_unistd_incl.patch
similarity index 100%
rename from package/samba4/0006-fix_unistd_incl.patch
rename to package/samba4/0005-fix_unistd_incl.patch
diff --git a/package/samba4/0007-heimdal_build-wscript_build-do-not-add-host-include-.patch b/package/samba4/0006-heimdal_build-wscript_build-do-not-add-host-include-.patch
similarity index 100%
rename from package/samba4/0007-heimdal_build-wscript_build-do-not-add-host-include-.patch
rename to package/samba4/0006-heimdal_build-wscript_build-do-not-add-host-include-.patch
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 399fa28159..fbc680cb32 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.10.6.tar.asc
-sha256 9efbeb52db1203dc779b118f1c48c161e569f7a6af5101e745497ee6296eef42  samba-4.10.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.10.7.tar.asc
+sha256 34f30494b6b63700f54be22be636e8a6e0430577166a76a017075e11c02a1ebb  samba-4.10.7.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 072bb2c7c0..1d097f1d48 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.10.6
+SAMBA4_VERSION = 4.10.7
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.20.1
