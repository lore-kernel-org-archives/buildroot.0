Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B040C88E53
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 21:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC029605ED;
	Fri, 11 Sep 2026 21:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkNPed7cR30j; Fri, 11 Sep 2026 21:15:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 516D66060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789161314;
	b=G0UokikZhKiJXUQ0WLrNPrIjkhUFnpkcSbA/jo5viHf3JlChkZFN6Yi57trgYol4WmKL
	 50tq+BStnel7ptKptoT3oaR4Q76Vq6ETFmeR2iDNMYL96ZzJ0gw8nJigpN5BL93Q8gigL
	 CX8DiQPl5cHzL60ZbXL/ZO+2G97WXyfHdJhTQBzKEKWCyJdItoxe4V4vRfL4H5pQLPgsr
	 bvTm7GTpEWQj/1fHEUFExYVSQ3M6r1IfmAmC3ctzeqspT99zD5ZghkH7YpSZ4Xs44Ef9x
	 nYV4OxZdZomtvzhHfiXK/+xvWGCOvcs6oUpJMOKv+pRQrduV8B41iaiT/feFHHsXXvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789161314;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=tVsH/XnoARNNtfDTOs4cIfOSL4EYTvP+p2vrjBb5m6M=;
	b=PhemAnqBKA9jvv6Xmt3EmrqLkAx5M5PTpyyCOny5DyERrP6ReY6UrKxEKh/ZXKJzoQ9X
	 oSDHsVkwtm2gdNxrmN7rBiXoOHHNjx/0w6mpKrm6/HUBJW/AsJ7QEh4TCPVneneVu2XIA
	 twNj6HMYolE8QlWoxw9T2PRNbrD/F70f0qC5OpBdc066Iooec77lA4jT2Q2SPbHTp/Hcw
	 bUnVrccS+1KGmprwVJOGVlTjsKF5ucI6EsfYMARJIw3hnsdXn3ov+Tt48A+cvQAedv0kd
	 QS1DMpLenIGhrjCNSUr3ftfLXzzEAlU7PaYNiGQut+q7nnsltiu0LnOoJhY6a7gHRAQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789161314;
	bh=tVsH/XnoARNNtfDTOs4cIfOSL4EYTvP+p2vrjBb5m6M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DIzDnaT3siFGCu62uSaMMJ60QMuI6rjlkkwLeX41zFxOezQ0F0/VrpTLSp42Vrc/6
	 YFqoV5TCH1RQE2TQYY+OeIrG8BEQQq6PujBtXxChFyohvvSis/RorjZM2lPn/zZToy
	 RzwlAyBOKYyEvnlK5l+xi18AsAgHERMsJ6cP4Xwoe5J1FgtdypkwR5RzL+HRnl7tnL
	 R1vPLhmnCcrZf4/i8bSROrkL8fIi4YL20X8b/14r9O7qmNmFomN19Fq2IcT0PYdHzu
	 DtNkGx3iDTqC2SfGAytI0LPSptsAqcYTqg9xOdWMsAlE7wLiATnK4KnqNMzkt/xtM1
	 5v/a/hK07869g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 516D66060C;
	Fri, 11 Sep 2026 21:15:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB38432F
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD21E40083
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mcVBpS596C4 for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 21:15:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org AED854007B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789161311;
 b=Co3PJPFlMP+O00jSbW7+ehY/CV8anM1atNfmG3wvmfe2pnw7uKjVA/z/zuLSOi+OBjes
 RMKmLgrdmPbaHYNfqS8AH/nTh4wHpmsRnSbUJS6hnO1bFSE5gcNuZtoqgwUZLo8DwVrGg
 vrzRtZqSdaC2nhQ/NB0R8ZfvQEaJ9cNA6n+KldqFD13OC/Viy7JMLkhZK10wL89Lr4z9g
 oaIFUDeSv0pHA3Fpr80UupNRSiL/aIZJnRU7CMwiHdXR4HMJZ4WA/e12YTX6Id80nL/7U
 1+REjSt6u+JeAFBCdNHLEH4e3jXxPry1jKlPM3CTDw/9ybRkeQxYZLOsdQpGdb6yn9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789161311;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=ECLDe4yITRFfyEVOOMySzNUvNdlm+NV4oO2HoxADG1M=;
 b=hc91SWrCooHTt2W+nHXH0YfdXQ22vDmptFlhMtGhT+w50AbrX1sheBGU1QezEGG6qtdG
 MFZeLHEqsyJ2NVeGOAUCNx7fw/727zx2yM67V8A88gNSvIg/Ik9/7IToXu8OEvyopCXSP
 wJJu3tFsYVkd4gcQvWVdLyQj69f+PqIzqcebbzxXspyQgjgjCel9prXK53OOMV5jXoc9+
 v9ur8632XmC+dyG3AsJjz0MJmLylqT8DyF1tgm5/nRjkXlrlCUY2RJrsv7QC2TfQayoIW
 ss5z66zgiJKx6anRmzE3uWMeYh+jxp63tqWaxsRzsi8Rp2Lz/dZm1PuSqjb1xlqp3mA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Q8rLzC2e; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Q8rLzC2e
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AED854007B
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789161307;
 bh=ECLDe4yITRFfyEVOOMySzNUvNdlm+NV4oO2HoxADG1M=;
 h=From:To:Cc:Subject:Date:From;
 b=Q8rLzC2evdsD0auI9rj8dWLjppe0MBEynilDwA0CoByqJKalhPZc2VbLGfamoILyA
 blq/MPpa0Zd0n94IpRsjfQkFZVNnOzIY9oJlmuYydIYMx3LR8OUFqLQUmIBINLegQo
 Y6Nb5Y0oroJAnw7GTWvu8zqZ2idFCxP3Og62THln9kBEccfnH4GMGs+cqVJRzZvro6
 VQ2nlieEmp/dJkVjOLJeuntCMV+CI/hijBjPAfEaknBoL2hJsuOBBUo3gZRalteWvo
 Ezn+BiNcc+QGJqR/xctUNihmWnlf9qkKqK+Ks/kqGbwUxxQy0SxAJEFRpXk+78/1Kh
 xGkLsO/iGKRnw==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B76F6A4C4041;
 Fri, 11 Sep 2026 23:15:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x58aR-000000005Nf-0lP9;
 Fri, 11 Sep 2026 21:15:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Reynes <philippe.reynes@softathome.com>
Date: Fri, 11 Sep 2026 23:15:07 +0200
Message-ID: <20260911211507.776128-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: bump version to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebased patch 0001 and added Upstream: tag.

Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/9036d3668af97e0c2683b2f54f2f8b52e7152f60

 .checkpackageignore                           |  1 -
 ...01-Use-LONG_BIT-to-define-RADIX_BITS.patch | 10 +++--
 ...lMath.h-fix-build-with-openssl-3.3.x.patch | 40 -----------------
 ...lMath.h-fix-build-with-openssl-3.4.x.patch | 45 -------------------
 .../0004-tpm-Update-to-OpenSSL-3.5.patch      | 39 ----------------
 .../0005-tpm-Update-to-OpenSSL-3.6.patch      | 25 -----------
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash          |  2 +-
 package/ibm-sw-tpm2/ibm-sw-tpm2.mk            |  2 +-
 8 files changed, 8 insertions(+), 156 deletions(-)
 delete mode 100644 package/ibm-sw-tpm2/0002-src-BnToOsslMath.h-fix-build-with-openssl-3.3.x.patch
 delete mode 100644 package/ibm-sw-tpm2/0003-src-BnToOsslMath.h-fix-build-with-openssl-3.4.x.patch
 delete mode 100644 package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch
 delete mode 100644 package/ibm-sw-tpm2/0005-tpm-Update-to-OpenSSL-3.6.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
