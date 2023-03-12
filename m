Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7A7C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB2DE41768;
	Sun, 12 Mar 2023 21:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB2DE41768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lpJ4t5ahjKbT; Sun, 12 Mar 2023 21:59:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0179141CA8;
	Sun, 12 Mar 2023 21:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0179141CA8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78F8E1BF863
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75B0560E58
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75B0560E58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIT9RBOtfIHX for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31E1860BC9
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31E1860BC9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E6CE87006; Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 14:39:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 620098889f74ad924676fca7d8d56eb401a7d0be
X-Git-Newrev: ce952170e1e8229da0bdac81566a627a87e56bee
X-Patchwork-Hint: ignore
Message-Id: <20230312214625.2E6CE87006@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lzop: bump to version 1.04
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5346252943331620576=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5346252943331620576==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ce952170e1e8229da0bdac81566a627a87e56bee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lzop 1.04 uses libtool 2.4.2.418, which is right between 2.4.2 and
2.4.4. While our patch for 2.4 is also supposed to work up to and
including 2.4.2.x, it does not work for libtool 2.4.2.418, which
requires the patch for 2.4.4.

We could change our infra to better pick the appropriate patch, but we
do not know exactly which 2.4.2.x version is actually the cutting
point that requires the 2.4.4 patch. Until we have more data point,
let's handle the case in an ad-hoc manner for lzop.

Additionally, we add a patch from Florian Bäuerle, which allows to set
the mtime of the lzop archive for reproducible build support using
SOURCE_DATE_EPOCH.

Signed-off-by: Casey Reeves <casey@xogium.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-allow-overriding-modification-time.patch  |  42 +++++++++
 package/lzop/0001-build-with-gcc6.patch            |  37 --------
 ...inlines-as-the-external-inline-definition.patch | 102 ---------------------
 package/lzop/lzop.hash                             |   2 +-
 package/lzop/lzop.mk                               |  15 ++-
 5 files changed, 57 insertions(+), 141 deletions(-)

diff --git a/package/lzop/0001-allow-overriding-modification-time.patch b/package/lzop/0001-allow-overriding-modification-time.patch
new file mode 100644
index 0000000000..5ffc64cd30
--- /dev/null
+++ b/package/lzop/0001-allow-overriding-modification-time.patch
@@ -0,0 +1,42 @@
+From: =?UTF-8?q?Florian=20B=C3=A4uerle?= <florian.baeuerle@allegion.com>
+Date: Thu, 25 Oct 2018 17:26:30 +0200
+Subject: [PATCH] allow overriding modification time
+
+This patch allows to set the mtime of the lzop archive to 
+$SOURCE_DATE_EPOCH, required for reproducible build. It was submitted to 
+pengutronix by florian Bäuerle in october 2018.
+
+https://git.pengutronix.de/cgit/ptxdist/tree/patches/lzop-1.04/0002-allow-overriding-modification-time.patch
+
+Signed-off-by: Casey Reeves <casey@xogium.me>
+---
+ src/lzop.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/lzop.c b/src/lzop.c
+index a540ad9c4d33..c2f877d16f92 100644
+--- a/src/lzop.c
++++ b/src/lzop.c
+@@ -712,6 +712,7 @@ void init_compress_header(header_t *h, const file_t *fip, const file_t *fop)
+     assert(opt_method > 0);
+     assert(opt_level > 0);
+     assert(fip->st.st_mode == 0 || S_ISREG(fip->st.st_mode));
++    const char *source_date_epoch = getenv("SOURCE_DATE_EPOCH");
+ 
+     memset(h,0,sizeof(header_t));
+ 
+@@ -748,7 +749,13 @@ void init_compress_header(header_t *h, const file_t *fip, const file_t *fop)
+ 
+     h->mode = fix_mode_for_header(fip->st.st_mode);
+ 
+-    if (fip->st.st_mtime > 0)
++    if (source_date_epoch)
++    {
++        time_t mtime = strtoul(source_date_epoch, NULL, 0);
++        h->mtime_low  = (lzo_uint32) (mtime);
++        h->mtime_high = (lzo_uint32) ((mtime >> 16) >> 16);
++    }
++    else if (fip->st.st_mtime > 0)
+     {
+         h->mtime_low  = (lzo_uint32) (fip->st.st_mtime);
+         h->mtime_high = (lzo_uint32) ((fip->st.st_mtime >> 16) >> 16);
diff --git a/package/lzop/0001-build-with-gcc6.patch b/package/lzop/0001-build-with-gcc6.patch
deleted file mode 100644
index 03bd887d51..0000000000
--- a/package/lzop/0001-build-with-gcc6.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From: Jaap Crezee <jaap@jcz.nl>
-Date: Sat, 25 june 2016 13:13:00 +0200
-Subject: [PATCH] fix compilation host-lzop with gcc-6
-
-This patch allows host-lzop to be compiled with host systems containing gcc-6
-
-Upstream patch found here:
-https://build.opensuse.org/package/view_file/Archiving/lzop/lzop-1.03-gcc6.patch?expand=1
-
-Signed-off-by: Jaap Crezee <jaap@jcz.nl>
-
---- a/src/miniacc.h.orig   2016-02-10 16:09:23.247315866 +0100
-+++ b/src/miniacc.h   2016-02-10 16:12:14.973297054 +0100
-@@ -4469,12 +4469,12 @@
- #if defined(__MSDOS__) && defined(__TURBOC__) && (__TURBOC__ < 0x0150)
- #elif 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
- #else
--    ACCCHK_ASSERT((1   << (8*SIZEOF_INT-1)) < 0)
-+    ACCCHK_ASSERT((int)(1u   << (8*SIZEOF_INT-1)) < 0)
- #endif
-     ACCCHK_ASSERT((1u  << (8*SIZEOF_INT-1)) > 0)
- #if 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
- #else
--    ACCCHK_ASSERT((1l  << (8*SIZEOF_LONG-1)) < 0)
-+    ACCCHK_ASSERT((long)(1ul  << (8*SIZEOF_LONG-1)) < 0)
- #endif
-     ACCCHK_ASSERT((1ul << (8*SIZEOF_LONG-1)) > 0)
- #if defined(acc_int16e_t)
-@@ -4703,7 +4703,7 @@
- #elif 1 && (ACC_CC_LCC || ACC_CC_LCCWIN32) && !defined(ACCCHK_CFG_PEDANTIC)
- #elif 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
- #elif !(ACC_BROKEN_INTEGRAL_PROMOTION) && (SIZEOF_INT > 1)
--    ACCCHK_ASSERT( (((unsigned char)128) << (int)(8*sizeof(int)-8)) < 0)
-+    ACCCHK_ASSERT( (int)((unsigned int)((unsigned char)128) << (int)(8*sizeof(int)-8)) < 0)
- #endif
- #if (ACC_CC_BORLANDC && (__BORLANDC__ >= 0x0530) && (__BORLANDC__ < 0x0560))
- #  pragma option pop
diff --git a/package/lzop/0002-use-static-inlines-as-the-external-inline-definition.patch b/package/lzop/0002-use-static-inlines-as-the-external-inline-definition.patch
deleted file mode 100644
index f6d076a9f7..0000000000
--- a/package/lzop/0002-use-static-inlines-as-the-external-inline-definition.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From ecccbcf66da53779d88e38e2af7f82eff8dde7f8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Aug 2015 10:35:47 -0700
-Subject: [PATCH] use static inlines as the external inline definition has
- changed with gcc5
-
-[Patch from https://raw.githubusercontent.com/openembedded/openembedded-core/master/meta/recipes-support/lzop/lzop/0001-use-static-inlines-as-the-external-inline-definition.patch]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
-Upstream-Status: Pending
-
- src/miniacc.h | 24 ++++++++----------------
- 1 file changed, 8 insertions(+), 16 deletions(-)
-
-diff --git a/src/miniacc.h b/src/miniacc.h
-index 09e6f0c..cae98d1 100644
---- a/src/miniacc.h
-+++ b/src/miniacc.h
-@@ -2880,8 +2880,7 @@ typedef void (__acc_cdecl_sighandler *acc_sighandler_t)(acc_signo_t);
- #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
- #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
- #if !defined(ACC_UA_GET_LE16)
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp);
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
-+static __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
-     __acc_ua_volatile const acc_uint16e_t* p = (__acc_ua_volatile const acc_uint16e_t*) pp;
-     unsigned long v;
-     __asm__ __volatile__("lhbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
-@@ -2890,8 +2889,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const
- #define ACC_UA_GET_LE16(p)      __ACC_UA_GET_LE16(p)
- #endif
- #if !defined(ACC_UA_SET_LE16)
--extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v);
--extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
-+static __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
-     __acc_ua_volatile acc_uint16e_t* p = (__acc_ua_volatile acc_uint16e_t*) pp;
-     __asm__ __volatile__("sthbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
- }
-@@ -2916,8 +2914,7 @@ extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsi
- #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
- #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
- #if !defined(ACC_UA_GET_LE32)
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp);
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
-+static __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
-     __acc_ua_volatile const acc_uint32e_t* p = (__acc_ua_volatile const acc_uint32e_t*) pp;
-     unsigned long v;
-     __asm__ __volatile__("lwbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
-@@ -2926,8 +2923,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const
- #define ACC_UA_GET_LE32(p)      __ACC_UA_GET_LE32(p)
- #endif
- #if !defined(ACC_UA_SET_LE32)
--extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v);
--extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
-+static __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
-     __acc_ua_volatile acc_uint32e_t* p = (__acc_ua_volatile acc_uint32e_t*) pp;
-     __asm__ __volatile__("stwbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
- }
-@@ -3307,8 +3303,7 @@ typedef void (__acc_cdecl_sighandler *acc_sighandler_t)(acc_signo_t);
- #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
- #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
- #if !defined(ACC_UA_GET_LE16)
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp);
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
-+static __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
-     __acc_ua_volatile const acc_uint16e_t* p = (__acc_ua_volatile const acc_uint16e_t*) pp;
-     unsigned long v;
-     __asm__ __volatile__("lhbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
-@@ -3317,8 +3312,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const
- #define ACC_UA_GET_LE16(p)      __ACC_UA_GET_LE16(p)
- #endif
- #if !defined(ACC_UA_SET_LE16)
--extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v);
--extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
-+static __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
-     __acc_ua_volatile acc_uint16e_t* p = (__acc_ua_volatile acc_uint16e_t*) pp;
-     __asm__ __volatile__("sthbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
- }
-@@ -3343,8 +3337,7 @@ extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsi
- #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
- #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
- #if !defined(ACC_UA_GET_LE32)
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp);
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
-+static __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
-     __acc_ua_volatile const acc_uint32e_t* p = (__acc_ua_volatile const acc_uint32e_t*) pp;
-     unsigned long v;
-     __asm__ __volatile__("lwbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
-@@ -3353,8 +3346,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const
- #define ACC_UA_GET_LE32(p)      __ACC_UA_GET_LE32(p)
- #endif
- #if !defined(ACC_UA_SET_LE32)
--extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v);
--extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
-+static __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
-     __acc_ua_volatile acc_uint32e_t* p = (__acc_ua_volatile acc_uint32e_t*) pp;
-     __asm__ __volatile__("stwbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
- }
--- 
-2.5.0
-
diff --git a/package/lzop/lzop.hash b/package/lzop/lzop.hash
index adc20648b6..99796dc8c9 100644
--- a/package/lzop/lzop.hash
+++ b/package/lzop/lzop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909dbb2c9  lzop-1.03.tar.gz
+sha256  7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f305a2f41  lzop-1.04.tar.gz
 sha256  70439f6e2b47057a408d2390ed6663b9875f5a08066a06a060a357ef1df89a8c  COPYING
diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 55157c4d48..d32d2d1d3b 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -4,13 +4,26 @@
 #
 ################################################################################
 
-LZOP_VERSION = 1.03
+LZOP_VERSION = 1.04
 LZOP_SITE = http://www.lzop.org/download
 LZOP_LICENSE = GPL-2.0+
 LZOP_LICENSE_FILES = COPYING
 LZOP_DEPENDENCIES = lzo
 HOST_LZOP_DEPENDENCIES = host-lzo
 
+# lzop uses libtool 2.4.2.418, which is right between 2.4.2 and
+# 2.4.4. While our patch for 2.4 is also supposed to work up to and
+# including 2.4.2.x, it does not work for libtool 2.4.2.418, which
+# requires the patch for 2.4.4. So we disable the libtool patching
+# from autotools-package and do our own.
+LZOP_LIBTOOL_PATCH = NO
+
+define LZOP_LIBTOOL_FIXUP
+	patch -i support/libtool/buildroot-libtool-v2.4.4.patch $(@D)/autoconf/ltmain.sh
+endef
+LZOP_POST_PATCH_HOOKS += LZOP_LIBTOOL_FIXUP
+HOST_LZOP_POST_PATCH_HOOKS += LZOP_LIBTOOL_FIXUP
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 

--===============5346252943331620576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5346252943331620576==--
