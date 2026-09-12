Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5D2C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 14:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56E4380E52;
	Sat, 12 Sep 2026 14:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9Wiqylrnm-x; Sat, 12 Sep 2026 14:57:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0774B80E6E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789225058;
	b=UjULljKnTuTDrW0IZ5dOJCklH4soVn08NT+ubrBUalw43OeghuKQrdnFABfLlBmwlvbL
	 Bft3/hbul10UUuwcUjOfvtRuAjFL7fgRFQp4bcZI0DloICRuz8D6WcIlUiueC28e1NRiL
	 MtupSyZ2jfvPhehzuJ1JM6o92KrhnmiZYf2rhwJfg8LItWHLz70U+oIf1GPkSt0LHqYhl
	 R12jJdPCXpsDFdTFZBE3X9WLR9aJfks+7xd7x4eN2iY9FsW6c1Em+qNZK9hBsJJRrwFZ/
	 Ck8zSq0vJ7NoH5qTeNx1oraHgh+C5x+/+LT1sg1a+k0UNHWjM6p8g/tfbrB/JlrMWaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789225058;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rgY2jwvedZeE3OAM+RuCz1t44UIDl8zjKM9BgNuwVd0=;
	b=nOCi4LE40Aq3fTfAhkVW/6V1CvJCTFGPL+jdMsJis6Cm/uvsPU9DrMgqeSjQoPpS6D/A
	 aW23yrx9R5taeF2LuA//YxzvycSilXGoxwX9TVdshtTiO+9CG2OB1uCwD8DLJn1mA4icc
	 E52EIchUPvBRU2xHysQRAEPtc2Z5FSWB4txzBylGI5vLhHX5BpEBZ2NrqJIg/kLVAMS9n
	 l9PYv0a32MGRNRS6wkYQrXxADzP08RI2CBSMElQBP6pjPyMvV/tbNwd4YtUj9cKAHGL2U
	 mpXnNOoVs/5j7dgnN7Q74nGoq7qctI6BSBMVTe+UJahy4kHaiWdSdExVR1qpB2iDaWQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789225058;
	bh=rgY2jwvedZeE3OAM+RuCz1t44UIDl8zjKM9BgNuwVd0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sSW3DE0v0OPK817n5RMCO3LdqmhI7vBZ/4kwSfRVz4lCnG5o5LwhB2XxBBCmI4tmI
	 yivvxw0LkyT5Ej+ucOHyJZzIAF+LFPHL5XnIAhOSIhB+wXdrURMYAyPJogde9MhDia
	 E86mXYQmunEfgGqs5tFmoJ4/K7KnDQbvuRVhMty9n1XO+mMGjll2Jjy56zV/qdfQfn
	 LTtdQNAbGT2pNfjkJgfAmqEzFq+FR5M1r0A2XyDzXD7+SFvbhV27uwNJlhi8MEH3ve
	 W385trei9LFKvLwlun5F6tQ4bwseiV/ZVsY0TVzQCVM06KKFr8G2WnwRP2QUa5ewaS
	 0rwic1gLO2mZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0774B80E6E;
	Sat, 12 Sep 2026 14:57:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B0F232F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9919560602
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Taw6nKCYt6Xu for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 14:57:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4AA3C605EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789225053;
 b=FVMCElbjdONjbmgU6XA1/5QTHNBY9x76jG/Dq/4Hj+r/ed5WRjlB+D9BOCQVTsztcEHn
 +SFtJWLyvBsV4VJG0BnjmirIxHPeAh8HIoY/dzCpIm6yE1tul9Iawd6vLZPaWbzMbS96U
 NyAeyemEVExNEVR969yDhU8gKtAo2V1P08KkO3EDyDeIdoVLtnLmOwDpDYUBQrroYbotU
 ZXXzqSPkIaGJfjt+AmLfPZyTeoER/BAGeAQ6mGCBS1z57AFANdZJpVYQ+ByJHOmxyqK9X
 +j5ehmHCizfDu2YhEqjKe4N31eLU1qA0J51S4k1FQ4JjYKruBAmm2gVtsFifzFW0ULw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789225053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uBrPv6Cr0k8gIJDeKyDt+oL/YPbU1X9V1idH1Jab8ag=;
 b=Tk/laXhm7kze7YUesEjkOfoTS9fo6Sw7MnXcuUjWjGFFFpz4x3b3DT2sQYA+3bbPVaC4
 9FHYnygn7vTMglsCUImPB5ISxZx0cRnJ+HVf3/DDO71/slCNd6RJPDcXxgL3KilIICc+3
 VxbLTW7OEnff7IgFAFqDDEqblQh0uk7Ost3KcIJUeWUt7a3CqyJXTOQeidxAht78kYeRG
 RIMgUhe3/u6F6m3Fg2UnMdfiRl9KZVsTcPpBHaMF9267hKvn2ELql5/HDsp7slfIVO+H/
 pdRy91EkP43k7ClHaELoFiWR7JVW/cpVJ/RA6TwXnY7NqP6ULiI2KgR6RAEuk/A2hzw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AA3C605EA
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:57:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCA5995993; Sat, 12 Sep 2026 14:56:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 16:22:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a63b6269ea4702ee4c239ff77f5425b23b4ef30
X-Git-Newrev: cf7cd535dae5e7c3b31e57e322f08f8fb3ccb37d
X-Patchwork-Hint: ignore
Message-Id: <20260912145628.CCA5995993@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ibm-sw-tpm2: bump version to
 rev183-2026-08-26
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf7cd535dae5e7c3b31e57e322f08f8fb3ccb37d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Rebased patch 0001 and added Upstream: tag.

Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 .../0001-Use-LONG_BIT-to-define-RADIX_BITS.patch   | 10 +++--
 ...ToOsslMath.h-fix-build-with-openssl-3.3.x.patch | 40 -------------------
 ...ToOsslMath.h-fix-build-with-openssl-3.4.x.patch | 45 ----------------------
 .../0004-tpm-Update-to-OpenSSL-3.5.patch           | 39 -------------------
 .../0005-tpm-Update-to-OpenSSL-3.6.patch           | 25 ------------
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash               |  2 +-
 package/ibm-sw-tpm2/ibm-sw-tpm2.mk                 |  2 +-
 8 files changed, 8 insertions(+), 156 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2b61ff3bab..2fc8349f1e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -402,7 +402,6 @@ package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch lib_patch.Upstr
 package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch lib_patch.Upstream
 package/i2pd/S99i2pd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/i7z/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch lib_patch.Upstream
 package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch lib_patch.Upstream
 package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch lib_patch.Upstream
 package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch lib_patch.Upstream
diff --git a/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch b/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
index 8d83116dfc..225d70e00d 100644
--- a/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
+++ b/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
@@ -10,9 +10,11 @@ Also, add the necessary defines in the makefile to expose
 LONG_BIT. Adding those defines end up requiring using <sys/select.h>
 as we're now using >= POSIX.1-2001 definitions of fd_set and friends.
 
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/16 (rejected)
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[Bernd: rebased for git rev 5452af422edeff70fcae8ea99dd28a0922051d7b]
+[Bernd: rebase for rev183-2026-08-26]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [Fabrice: rebase for rev183-2024-03-27]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
@@ -37,7 +39,7 @@ index 5055560..48b1e16 100644
 -    || defined(__powerpc64__) || defined(__ppc64__)
 -#    define RADIX_BITS 64
 -#  elif defined(__i386__) || defined(__i386) || defined(i386) || defined(_WIN32) \
--    || defined(_M_IX86)
+-    || defined(_M_IX86) || defined(__PPC__)
 -#    define RADIX_BITS 32
 -#  elif defined(_M_ARM) || defined(__arm__) || defined(__thumb__)
 -#    define RADIX_BITS 32
@@ -61,7 +63,7 @@ diff --git a/src/TcpServerPosix.c b/src/TcpServerPosix.c
 index cad0402..6293cdd 100644
 --- a/src/TcpServerPosix.c
 +++ b/src/TcpServerPosix.c
-@@ -66,6 +66,7 @@
+@@ -67,6 +67,7 @@
  
  #include <stdio.h>
  #include <stdbool.h>
@@ -79,7 +81,7 @@ index f124e78..6ee128e 100644
  	-D_POSIX_			\
 +	-D_DEFAULT_SOURCE		\
 +	-D_XOPEN_SOURCE=500		\
- 	-DTPM_NUVOTON
+ 	-DTPM_NUVOTON $(CFLAGS)
  
  # add this line for big endian platforms
 -- 
diff --git a/package/ibm-sw-tpm2/0002-src-BnToOsslMath.h-fix-build-with-openssl-3.3.x.patch b/package/ibm-sw-tpm2/0002-src-BnToOsslMath.h-fix-build-with-openssl-3.3.x.patch
deleted file mode 100644
index a349c05d4c..0000000000
--- a/package/ibm-sw-tpm2/0002-src-BnToOsslMath.h-fix-build-with-openssl-3.3.x.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 1b5d9eb91f0d24d09d711ef839d301ee8b640d61 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Jul 2024 09:08:39 +0200
-Subject: [PATCH] src/BnToOsslMath.h: fix build with openssl 3.3.x
-
-Fix the following build failure with openssl 3.3.x:
-
-In file included from BnValues.h:327,
-                 from Global.h:80,
-                 from Tpm.h:78,
-                 from AuditCommands.c:62:
-TpmToOsslMath.h:83:5: error: #error Untested OpenSSL version
-   83 | #   error Untested OpenSSL version
-      |     ^~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/2fb5e1cb792fe25ef860ff8111622cd1ff3770bf
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/kgoldman/ibmswtpm2/pull/15
----
- src/BnToOsslMath.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
-index df4bcfb..72939ea 100644
---- a/src/BnToOsslMath.h
-+++ b/src/BnToOsslMath.h
-@@ -77,7 +77,7 @@
- #include <openssl/ec.h>
- #include <openssl/bn.h>
- 
--#if OPENSSL_VERSION_NUMBER >= 0x30200ff0L
-+#if OPENSSL_VERSION_NUMBER >= 0x30300ff0L
- // Check the bignum_st definition against the one below and either update the
- // version check or provide the new definition for this version.
- #  error Untested OpenSSL version
--- 
-2.43.0
-
diff --git a/package/ibm-sw-tpm2/0003-src-BnToOsslMath.h-fix-build-with-openssl-3.4.x.patch b/package/ibm-sw-tpm2/0003-src-BnToOsslMath.h-fix-build-with-openssl-3.4.x.patch
deleted file mode 100644
index e65c1c898b..0000000000
--- a/package/ibm-sw-tpm2/0003-src-BnToOsslMath.h-fix-build-with-openssl-3.4.x.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d59535c8c605f0b23abbefd9b23200b1a5e937fe Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Fri, 6 Dec 2024 20:35:35 +0100
-Subject: [PATCH] src/BnToOsslMath.h: fix build with openssl 3.4.x
-
-Openssl 3.4.x is out:
-https://github.com/openssl/openssl/blob/openssl-3.4.0/NEWS.md#openssl-34
-
-So bump the max supported version number similar to how it was done by
-commit 89a4cb9cf8 "src/BnToOsslMath.h: fix build with openssl 3.3.x" to fix
-build failures with 3.4.x:
-
-    In file included from BnValues.h:327,
-                     from Global.h:80,
-                     from Tpm.h:78,
-                     from AuditCommands.c:62:
-    TpmToOsslMath.h:83:5: error: #error Untested OpenSSL version
-       83 | #   error Untested OpenSSL version
-          |     ^~~~~
-
-Fixes:
-- http://autobuild.buildroot.net/results/be6c679b821183b4385c74471e26d9ad7d3d8967
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-Upstream: https://github.com/kgoldman/ibmswtpm2/pull/17
----
- src/BnToOsslMath.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
-index 72939ea..165304d 100644
---- a/src/BnToOsslMath.h
-+++ b/src/BnToOsslMath.h
-@@ -77,7 +77,7 @@
- #include <openssl/ec.h>
- #include <openssl/bn.h>
- 
--#if OPENSSL_VERSION_NUMBER >= 0x30300ff0L
-+#if OPENSSL_VERSION_NUMBER >= 0x30400ff0L
- // Check the bignum_st definition against the one below and either update the
- // version check or provide the new definition for this version.
- #  error Untested OpenSSL version
--- 
-2.39.5
-
diff --git a/package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch b/package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch
deleted file mode 100644
index 36a9cb97dc..0000000000
--- a/package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 720ed4b8c74c3b517a46b442be9482319ed027dd Mon Sep 17 00:00:00 2001
-From: Ken Goldman <kgold@linux.ibm.com>
-Date: Fri, 18 Apr 2025 13:41:59 -0400
-Subject: [PATCH] tpm: Update to OpenSSL 3.5
-
-Accept 3.5 as a supported version
-
-Signed-off-by: Ken Goldman <kgold@linux.ibm.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-Upstream: https://github.com/kgoldman/ibmswtpm2/commit/720ed4b8c74c3b517a46b442be9482319ed027dd
----
- src/BnToOsslMath.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
-index 165304d..5fd5323 100644
---- a/src/BnToOsslMath.h
-+++ b/src/BnToOsslMath.h
-@@ -54,7 +54,7 @@
- /*    arising in any way out of use or reliance upon this specification or any 	*/
- /*    information herein.							*/
- /*										*/
--/*  (c) Copyright IBM Corp. and others, 2023				  	*/
-+/*  (c) Copyright IBM Corp. and others, 2023 - 2025			  	*/
- /*										*/
- /********************************************************************************/
- 
-@@ -77,7 +77,7 @@
- #include <openssl/ec.h>
- #include <openssl/bn.h>
- 
--#if OPENSSL_VERSION_NUMBER >= 0x30400ff0L
-+#if OPENSSL_VERSION_NUMBER >= 0x30500ff0L
- // Check the bignum_st definition against the one below and either update the
- // version check or provide the new definition for this version.
- #  error Untested OpenSSL version
--- 
-2.39.5
-
diff --git a/package/ibm-sw-tpm2/0005-tpm-Update-to-OpenSSL-3.6.patch b/package/ibm-sw-tpm2/0005-tpm-Update-to-OpenSSL-3.6.patch
deleted file mode 100644
index a2a54717e2..0000000000
--- a/package/ibm-sw-tpm2/0005-tpm-Update-to-OpenSSL-3.6.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 7f727710326bc0a6d6f28397253ec3a89000300e Mon Sep 17 00:00:00 2001
-From: Pedro Monreal <pmonrealgonzalez@suse.com>
-Date: Fri, 3 Oct 2025 10:35:46 +0200
-Subject: [PATCH] tpm: Update to OpenSSL 3.6
-
-Upstream: https://github.com/kgoldman/ibmswtpm2/pull/22
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/BnToOsslMath.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
-index 26828d0..731957e 100644
---- a/src/BnToOsslMath.h
-+++ b/src/BnToOsslMath.h
-@@ -77,7 +77,7 @@
- #include <openssl/ec.h>
- #include <openssl/bn.h>
- 
--#if OPENSSL_VERSION_NUMBER >= 0x30500ff0L
-+#if OPENSSL_VERSION_NUMBER >= 0x30600ff0L
- // Check the bignum_st definition against the one below and either update the
- // version check or provide the new definition for this version.
- #  error Untested OpenSSL version
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
index 3c2d0e758f..e7b652adcf 100644
--- a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  239cea3ec99cb31fb25c1ba4fe9b98a862bb20daefefeba8908d370bedd42a31  ibm-sw-tpm2-rev183-2024-03-27-git4.tar.gz
+sha256  8a19b5aab8aaf24ec953e860d2497584a3ff5747510968bbf222523ebade911c  ibm-sw-tpm2-rev183-2026-08-26-git4.tar.gz
 sha256  dd2d31b560011ea673e197251e710e52669d911367d83cd3cfd018f8ed58bde9  LICENSE
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
index 67ecd45923..1f23bf7d83 100644
--- a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IBM_SW_TPM2_VERSION = rev183-2024-03-27
+IBM_SW_TPM2_VERSION = rev183-2026-08-26
 IBM_SW_TPM2_SITE = https://git.code.sf.net/p/ibmswtpm2/tpm2
 IBM_SW_TPM2_SITE_METHOD = git
 IBM_SW_TPM2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
