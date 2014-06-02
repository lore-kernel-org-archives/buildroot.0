From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 22:30:21 +0200
Subject: [Buildroot] [git commit] strongswan: bump to version 5.1.3
Message-ID: <20140602211714.E1A2C9CDCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7de0d049b226bd532062973358d211ac9b993277
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../strongswan-0001-force-tls-when-needed.patch    |   72 --------------------
 ...trongswan-0002-fix-dependency-to-libtnccs.patch |   26 -------
 .../strongswan-0003-CVE-2013-5018-fix.patch        |   29 --------
 .../strongswan-0004-CVE-2013-6075-fix.patch        |   27 -------
 .../strongswan-0005-CVE-2013-6076-fix.patch        |   27 -------
 package/strongswan/strongswan.mk                   |   10 +---
 6 files changed, 1 insertions(+), 190 deletions(-)

diff --git a/package/strongswan/strongswan-0001-force-tls-when-needed.patch b/package/strongswan/strongswan-0001-force-tls-when-needed.patch
deleted file mode 100644
index 8949f62..0000000
--- a/package/strongswan/strongswan-0001-force-tls-when-needed.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Force libtls when libpttls is enabled
-
-The libpttls library expects libtls.la to be present:
-libpttls_la_LIBADD = $(top_builddir)/src/libtls/libtls.la
-but there is no expressed dependency between them. Therefore, it is possible to
-create a configuration where libpttls is enabled and libtls is not, causing a
-build failure:
-
-make[4]: *** No rule to make target `../../src/libtls/libtls.la', needed by `libpttls.la'.  Stop.
-
-libpttls is enabled through USE_PTTLS, set when tnc_tnccs == true.
-  tnc_tnccs is true when any of tnc-imc, tnc_imv, tnccs_11, tnccs_dynamic or eap_tnc is true.
-
-libtls is enabled through USE_TLS, set when tls == true.
-  tls is true when any of eap_tls, eap_ttls or eap_peap is true.
-
-This patch forces tls to true, when tnc_tnccs is true, so that the required libtls.la dependency
-is built before it is used by libpttls.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-Upstream-status: will be submitted
-
-diff --git a/configure b/configure
---- a/configure
-+++ b/configure
-@@ -15900,10 +15900,6 @@ if test x$eap_sim = xtrue; then
- 	simaka=true;
- fi
- 
--if test x$eap_tls = xtrue -o x$eap_ttls = xtrue -o x$eap_peap = xtrue; then
--	tls=true;
--fi
--
- if test x$eap_radius = xtrue -o x$radattr = xtrue -o x$tnc_pdp = xtrue; then
- 	radius=true;
- fi
-@@ -15912,6 +15908,10 @@ if test x$tnc_imc = xtrue -o x$tnc_imv =
- 	tnc_tnccs=true;
- fi
- 
-+if test x$eap_tls = xtrue -o x$eap_ttls = xtrue -o x$eap_peap = xtrue -o x$tnc_tnccs = xtrue; then
-+	tls=true;
-+fi
-+
- if test x$imc_test = xtrue -o x$imv_test = xtrue -o x$imc_scanner = xtrue -o x$imv_scanner = xtrue -o x$imc_os = xtrue -o x$imv_os = xtrue -o x$imc_attestation = xtrue -o x$imv_attestation = xtrue; then
- 	imcv=true;
- fi
-diff --git a/configure.in b/configure.in
---- a/configure.in
-+++ b/configure.in
-@@ -313,10 +313,6 @@ if test x$eap_sim = xtrue; then
- 	simaka=true;
- fi
- 
--if test x$eap_tls = xtrue -o x$eap_ttls = xtrue -o x$eap_peap = xtrue; then
--	tls=true;
--fi
--
- if test x$eap_radius = xtrue -o x$radattr = xtrue -o x$tnc_pdp = xtrue; then
- 	radius=true;
- fi
-@@ -325,6 +321,10 @@ if test x$tnc_imc = xtrue -o x$tnc_imv =
- 	tnc_tnccs=true;
- fi
- 
-+if test x$eap_tls = xtrue -o x$eap_ttls = xtrue -o x$eap_peap = xtrue -o x$tnc_tnccs = xtrue; then
-+	tls=true;
-+fi
-+
- if test x$imc_test = xtrue -o x$imv_test = xtrue -o x$imc_scanner = xtrue -o x$imv_scanner = xtrue -o x$imc_os = xtrue -o x$imv_os = xtrue -o x$imc_attestation = xtrue -o x$imv_attestation = xtrue; then
- 	imcv=true;
- fi
diff --git a/package/strongswan/strongswan-0002-fix-dependency-to-libtnccs.patch b/package/strongswan/strongswan-0002-fix-dependency-to-libtnccs.patch
deleted file mode 100644
index 059fc42..0000000
--- a/package/strongswan/strongswan-0002-fix-dependency-to-libtnccs.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-It looks like there is a typing error in dependencies of tnccs_20.
-
-Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
-
---- a/configure	2013-08-19 12:09:33.934651935 +0200
-+++ b/configure	2013-08-19 11:50:34.465118187 +0200
-@@ -15897,7 +15897,7 @@
- 	radius=true;
- fi
- 
--if test x$tnc_imc = xtrue -o x$tnc_imv = xtrue -o x$tnccs_11 = xtrue -o x$tnccs_11 = xtrue -o x$tnccs_dynamic = xtrue -o x$eap_tnc = xtrue; then
-+if test x$tnc_imc = xtrue -o x$tnc_imv = xtrue -o x$tnccs_11 = xtrue -o x$tnccs_20 = xtrue -o x$tnccs_dynamic = xtrue -o x$eap_tnc = xtrue; then
- 	tnc_tnccs=true;
- fi
- 
---- a/configure.in	2013-08-19 12:08:41.762913778 +0200
-+++ b/configure.in	2013-08-19 11:50:22.222886206 +0200
-@@ -317,7 +317,7 @@
- 	radius=true;
- fi
- 
--if test x$tnc_imc = xtrue -o x$tnc_imv = xtrue -o x$tnccs_11 = xtrue -o x$tnccs_11 = xtrue -o x$tnccs_dynamic = xtrue -o x$eap_tnc = xtrue; then
-+if test x$tnc_imc = xtrue -o x$tnc_imv = xtrue -o x$tnccs_11 = xtrue -o x$tnccs_20 = xtrue -o x$tnccs_dynamic = xtrue -o x$eap_tnc = xtrue; then
- 	tnc_tnccs=true;
- fi
- 
diff --git a/package/strongswan/strongswan-0003-CVE-2013-5018-fix.patch b/package/strongswan/strongswan-0003-CVE-2013-5018-fix.patch
deleted file mode 100644
index e30ac31..0000000
--- a/package/strongswan/strongswan-0003-CVE-2013-5018-fix.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 057265e0183ddf52d56f21adaf0db0f3dc6585a4 Mon Sep 17 00:00:00 2001
-From: Tobias Brunner <tobias@strongswan.org>
-Date: Mon, 29 Jul 2013 23:45:38 +0200
-Subject: [PATCH] asn1: Fix handling of invalid ASN.1 length in is_asn1()
-
-Fixes CVE-2013-5018.
----
- src/libstrongswan/asn1/asn1.c |    5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/libstrongswan/asn1/asn1.c b/src/libstrongswan/asn1/asn1.c
-index 68f37f4..d860ad9 100644
---- a/src/libstrongswan/asn1/asn1.c
-+++ b/src/libstrongswan/asn1/asn1.c
-@@ -642,6 +642,11 @@ bool is_asn1(chunk_t blob)
- 
- 	len = asn1_length(&blob);
- 
-+	if (len == ASN1_INVALID_LENGTH)
-+	{
-+		return FALSE;
-+	}
-+
- 	/* exact match */
- 	if (len == blob.len)
- 	{
--- 
-1.7.10.4
-
diff --git a/package/strongswan/strongswan-0004-CVE-2013-6075-fix.patch b/package/strongswan/strongswan-0004-CVE-2013-6075-fix.patch
deleted file mode 100644
index d50616a..0000000
--- a/package/strongswan/strongswan-0004-CVE-2013-6075-fix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From aa277adfc204b6bda2c3792710138f9a8723a8f1 Mon Sep 17 00:00:00 2001
-From: Martin Willi <martin@revosec.ch>
-Date: Mon, 7 Oct 2013 14:21:57 +0200
-Subject: [PATCH] identification: Properly check length before comparing for
- binary DN equality
-
-Fixes CVE-2013-6075.
----
- src/libstrongswan/utils/identification.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libstrongswan/utils/identification.c b/src/libstrongswan/utils/identification.c
-index 5df3e5f..9c43ad5 100644
---- a/src/libstrongswan/utils/identification.c
-+++ b/src/libstrongswan/utils/identification.c
-@@ -602,7 +602,7 @@ static bool compare_dn(chunk_t t_dn, chunk_t o_dn, int *wc)
- 		}
- 	}
- 	/* try a binary compare */
--	if (memeq(t_dn.ptr, o_dn.ptr, t_dn.len))
-+	if (chunk_equals(t_dn, o_dn))
- 	{
- 		return TRUE;
- 	}
--- 
-1.8.1.2
-
diff --git a/package/strongswan/strongswan-0005-CVE-2013-6076-fix.patch b/package/strongswan/strongswan-0005-CVE-2013-6076-fix.patch
deleted file mode 100644
index 51f0ae3..0000000
--- a/package/strongswan/strongswan-0005-CVE-2013-6076-fix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d8867a8452eece3fffab29605f48e6bed47c42d4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_strongswan@t-online.de>
-Date: Fri, 11 Oct 2013 09:38:24 +0200
-Subject: [PATCH] ikev1: Properly initialize list of fragments in case fragment
- ID is 0
-
-Fixes CVE-2013-6076.
----
- src/libcharon/sa/ikev1/task_manager_v1.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libcharon/sa/ikev1/task_manager_v1.c b/src/libcharon/sa/ikev1/task_manager_v1.c
-index 6d4ef14..597416e 100644
---- a/src/libcharon/sa/ikev1/task_manager_v1.c
-+++ b/src/libcharon/sa/ikev1/task_manager_v1.c
-@@ -1273,7 +1273,7 @@ static status_t handle_fragment(private_task_manager_t *this, message_t *msg)
- 		return FAILED;
- 	}
- 
--	if (this->frag.id != payload->get_id(payload))
-+	if (!this->frag.list || this->frag.id != payload->get_id(payload))
- 	{
- 		clear_fragments(this, payload->get_id(payload));
- 		this->frag.list = linked_list_create();
--- 
-1.8.1.2
-
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 24079c6..5446957 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.0.4
+STRONGSWAN_VERSION = 5.1.3
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
@@ -67,12 +67,4 @@ STRONGSWAN_DEPENDENCIES +=                               \
       $(if $(BR2_PACKAGE_MYSQL),mysql)
 endif
 
-# Strongswan uses AC_LIB_PREFIX, which is relatively new.
-# Avoid make to try reconfiguring due to timestamp changes,
-# after patching configure{,.in}.
-define STRONGSWAN_AVOID_RECONF_HOOK
-	touch $(@D)/aclocal.m4
-endef
-STRONGSWAN_POST_PATCH_HOOKS += STRONGSWAN_AVOID_RECONF_HOOK
-
 $(eval $(autotools-package))
