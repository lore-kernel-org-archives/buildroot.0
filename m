Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6696C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 21:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A3760F47;
	Sun, 17 Jul 2022 21:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41A3760F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o55AQQIhMndb; Sun, 17 Jul 2022 21:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A0660E2B;
	Sun, 17 Jul 2022 21:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A0660E2B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E176A1BF29D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB54560E2B
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB54560E2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tp2zxO9LZKI for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 21:44:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98CC260BEA
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98CC260BEA
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 21:44:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h17so14675119wrx.0
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 14:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q/wPpVWfNCuJs2R/3KZEc6/51H7zN0LdSXcR/MD3zYs=;
 b=MhwJx8iDwMroR6zqpI4ijxqkXTDPQR3bSvSmLA4VvW9tR4iAbsimgf9NNzdHkvjH2m
 aNLKFlRe6JWywRRZ9s3W5xX8tE2sFlF+FQ2Qw7sEt35UP9DHW0LlsCAxFUVS/MHvhLwc
 yIlcfINAX1+a530Y+jLBNmQUYJpxgDTtF2obuuIGTqzehqMhl9gx375v4eqdBqFrmhFR
 J8KT7osVBjLGnfVkEJ3vTrugxgGjKvOwBy/wtPxkkKVcsjgRKtRFTW8bAJokC0Zr11K9
 LO83nwBNfL2aM1Bpvhvo34WBTgvnVZt7XWMRR7TSkcXyLwxdx++vCSh0zYQvDOqTV1VU
 tUFA==
X-Gm-Message-State: AJIora+KhVvavqwsLIOguGSok9sD6/k2BXfWajxiLkk0grJ401+GScON
 ZAIRLMwhRAp1HRooAlROe56JkOC/SZ4=
X-Google-Smtp-Source: AGRyM1t68/nzq8ylZz8ACoAgjEu+w3+wSvzYEdLVRhGWDQwkbZ/fOpFF6nWa83zh1COCV78cjoJGHg==
X-Received: by 2002:adf:f3c7:0:b0:21d:9349:7a5 with SMTP id
 g7-20020adff3c7000000b0021d934907a5mr20611194wrp.23.1658094281511; 
 Sun, 17 Jul 2022 14:44:41 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b12-20020adff90c000000b0021e150553acsm1560586wrr.14.2022.07.17.14.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 14:44:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 23:41:32 +0200
Message-Id: <20220717214132.2715220-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q/wPpVWfNCuJs2R/3KZEc6/51H7zN0LdSXcR/MD3zYs=;
 b=f8sqbawJ9HLN07sHQfTe+ibcnP8RB/wc4moQzvYDXL2Mk45rZLd8mZwR3S8MRD2VWh
 4qHrg17CjselY4+GhxuDmI2vpXiUpBCVtW5Jn/dvXRF3Q8FYXL7qlm0JjgoHmwk1R5g9
 rCRnZk7hn2h/4mZiY+/QsCyn6519vag09c+Vh/il098+DK5Z/Dg/9C/nsVdvvKz+oLdA
 q4oD1D/2OJ93zPzkWBD/kPY+FsQYKMVpr+RlI0rxTbE6axnkJVWJG83tCuRLTMF7nSmi
 pBoNCEP5z3otYhDHIDxr8T3qIB7ZdLtkUYqBdrdHTLUtbEup06MMu1esfHEtFlSRVBA7
 1u/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f8sqbawJ
Subject: [Buildroot] [PATCH 1/1] package/perl: bump perl-cross to version 1.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following static build failure with berkeleydb
thanks to
https://github.com/arsv/perl-cross/commit/31dac3e264a7f1f53dbf49570771123ebd514055:

/nvmedata/autobuild/instance-6/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: lib/auto/DB_File/DB_File.a(DB_File.o): in function `ParseOpenInfo':
DB_File.c:(.text+0x7d30): undefined reference to `db_create'

Fixes:
 - http://autobuild.buildroot.org/results/e01a042185b2221bee815bb9096c4419eeb6e558

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/perl/perl.hash | 4 ++--
 package/perl/perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index d8344d9754..9ec2b42e34 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -3,8 +3,8 @@ md5  7d2ece7f50775ea1ff739831935a24bd  perl-5.34.1.tar.xz
 sha1  e7dbef3c1ea7caa73e2c705bba9e4bfb92ea98f0  perl-5.34.1.tar.xz
 sha256  6d52cf833ff1af27bb5e986870a2c30cec73c044b41e3458cd991f94374039f7  perl-5.34.1.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.7/perl-cross-1.3.7.hash
-sha256  77f13ca84a63025053852331b72d4046c1f90ded98bd45ccedea738621907335  perl-cross-1.3.7.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.4/perl-cross-1.4.hash
+sha256  be9d9f9f7148edff7a2f9695ba3cb7e3975eff6b25a9a81dd311725fd757aa91  perl-cross-1.4.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 392fb8b6e2..27acfaeff2 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.3.7
+PERL_CROSS_VERSION = 1.4
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
