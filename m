Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2102C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 10:10:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A39460F70
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 10:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A39460F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A7E4052D;
	Fri, 12 Nov 2021 10:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMaK5qPKoyW8; Fri, 12 Nov 2021 10:10:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 799F540468;
	Fri, 12 Nov 2021 10:10:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6801BF298
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 10:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D2BF80CCC
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 10:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLeJ8hz9qsfx for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 10:09:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FE4380CC4
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 10:09:56 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d5so14574796wrc.1
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 02:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0s1UfCrcRaTMZaelKec/IWhj0D0B/6zywzhOmRuYow=;
 b=FtkXy6z5KswQcasnYyNjh9W1CRzrd0ZZo5OPeU2PiBtqbYclkknePz+uB9BD9Do5r5
 j2UDQIQoLzwAb13+/G2ZblPz034qVhqQS+35YT1yKw7hnHhEc43xZnrBuXxxbEMFuROA
 MpDvh9tGCZpFD2anbjcckApBDhgLXVGYjo0ipIsEq7gcSfJe65CDU8BfV8GA1BbvUAR/
 9XKnVOnneYibESkPjq/oSxbZ2G9t7ZyjwVu0DKfdXEX65ETK88bLco4cQ2hm17Jet6en
 n+WX6/PuJvEHZALX7thtu8mw0mEWC9W6zwTVHDFlcXzuHS7cuCbwYdnzMsVLomDXhujs
 XyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0s1UfCrcRaTMZaelKec/IWhj0D0B/6zywzhOmRuYow=;
 b=RCYo3dxnXJ4AaVKhZOUSwDf/MHazuCV7DHFwxAEtQW6g8sZU1xG5f/P369Dl0E98fy
 j6Z7Ju9iTOut3m9HSUuroVfBIX63klP33gUMrFOTvnq1I2ok8qJHJDX0a50hru/ZiSAr
 DdBQjCrAOaOsaOZTPRmwuOcJBkPLevNm/fVy2N/U8iA19kbZGFaYyn/XGWZ0qJXxUenY
 CQp+VdFtsIdKFn3gCsTWdMJ1fuDc5Ca1zrrKhRaVHyEhRRc9RQqdS/f2+wz9/a1Az8bJ
 4iApB+i08D/I/G8HznZ6EpNpgmjaUWxDXQ6a6J2HcbEKG8JDeuzO1lHlc7MenYVXYFLC
 B7zA==
X-Gm-Message-State: AOAM530P/6PEpEegTmMcUWo4SUFBg93mTQzMAOx4+ng2kF04JWAnR8Fn
 PChKEj6yTRym53OOf4Yr8CSRmpkE0cc=
X-Google-Smtp-Source: ABdhPJxujNoiaeXAERDMrvFgn22KcpXYbyd8pwxS6hYaVCWfzntivKC/wy87dDCNLIudKk03E1jnSQ==
X-Received: by 2002:a5d:604a:: with SMTP id j10mr17504800wrt.93.1636711794636; 
 Fri, 12 Nov 2021 02:09:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id u2sm6090682wrs.17.2021.11.12.02.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 02:09:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 11:07:49 +0100
Message-Id: <20211112100749.2893614-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sg3_utils: bump to version 1.47
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version) and so autoreconf
- Update hash of COPYING (upodate in date and author's email:
  https://github.com/doug-gilbert/sg3_utils/commit/f0195003bb0c66ba55084b2f7e0fe982f08c5675)
- Fix the following build failure raised on musl since bump to version
  1.46 in commit a00ed30780819c72174ae959bdd6f15ed961e938:

sg_dd.c: At top level:
sg_dd.c:179:28: error: storage size of 'drand' isn't known
  179 | static struct drand48_data drand;/* opaque, used by srand48_r and mrand48_r */
      |                            ^~~~~

https://github.com/doug-gilbert/sg3_utils/blob/r1.47/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/adc20fd52052daadfe1f16ee3f62c30e518cbd16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-support-uclinux-as-a-linux.patch        | 16 ----------------
 package/sg3_utils/sg3_utils.hash                 |  4 ++--
 package/sg3_utils/sg3_utils.mk                   |  5 +----
 3 files changed, 3 insertions(+), 22 deletions(-)
 delete mode 100644 package/sg3_utils/0001-support-uclinux-as-a-linux.patch

diff --git a/package/sg3_utils/0001-support-uclinux-as-a-linux.patch b/package/sg3_utils/0001-support-uclinux-as-a-linux.patch
deleted file mode 100644
index d9106cd9f8..0000000000
--- a/package/sg3_utils/0001-support-uclinux-as-a-linux.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Recognise uclinux as a linux
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN sg3_utils-1.42.orig/configure.ac sg3_utils-1.42/configure.ac
---- sg3_utils-1.42.orig/configure.ac	2015-10-21 01:10:59.000000000 +0200
-+++ sg3_utils-1.42/configure.ac	2016-08-14 19:30:37.841766149 +0200
-@@ -71,7 +71,7 @@
- 
- # Define platform-specific symbol.
- AM_CONDITIONAL(OS_FREEBSD, [echo $host_os | grep 'freebsd' > /dev/null])
--AM_CONDITIONAL(OS_LINUX, [echo $host_os | grep '^linux' > /dev/null])
-+AM_CONDITIONAL(OS_LINUX, [echo $host_os | grep -E '^(uc)?linux' > /dev/null])
- AM_CONDITIONAL(OS_OSF, [echo $host_os | grep '^osf' > /dev/null])
- AM_CONDITIONAL(OS_SOLARIS, [echo $host_os | grep '^solaris' > /dev/null])
- AM_CONDITIONAL(OS_WIN32_MINGW, [echo $host_os | grep '^mingw' > /dev/null])
diff --git a/package/sg3_utils/sg3_utils.hash b/package/sg3_utils/sg3_utils.hash
index 39510b4dc2..ff2ef55180 100644
--- a/package/sg3_utils/sg3_utils.hash
+++ b/package/sg3_utils/sg3_utils.hash
@@ -1,6 +1,6 @@
 # Locally calculated from download (no sig, hash)
-sha256  59c268b10b93ce31a517af13e19c88f285c12b7dd065f50e36b16a7b6fa7b9a0  sg3_utils-1.46.tar.xz
+sha256  ddb0cab85fedd8b0db020f3e3f02f6967a055616bf16ea9d5c7408cde41472b2  sg3_utils-1.47.tar.xz
 
 # Hash for license files
-sha256  256ec2d7e4e79faabb105ed1ddf32aec11d830c3dadb955a4ab2616eb87439ba  COPYING
+sha256  d212debdb0a5d7754c977f6dc53bb6c88b4ace7ab784ddbccd06bb970adb1a37  COPYING
 sha256  8ddd1d82f2be2f5cbd5b5c3b5c2ee94a90d2ca7112958448da74dd78384fd96a  BSD_LICENSE
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 1983a12261..055f7befb9 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.46
+SG3_UTILS_VERSION = 1.47
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-2-Clause (library)
@@ -14,9 +14,6 @@ SG3_UTILS_LICENSE += , GPL-2.0+ (programs), BSD-2-Clause (programs)
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
 
-# Patching configure.ac/Makefile.am
-SG3_UTILS_AUTORECONF = YES
-
 # install the libsgutils2 library
 SG3_UTILS_INSTALL_STAGING = YES
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
