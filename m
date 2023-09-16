Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B421ECD37BF
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C9F540FBF;
	Sat, 16 Sep 2023 15:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C9F540FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NA8lzCD0BprN; Sat, 16 Sep 2023 15:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EBFD40CC8;
	Sat, 16 Sep 2023 15:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EBFD40CC8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA0D1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 042E281CE3
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 042E281CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L15Jw4GYmC8L for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:14 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2B3381CC3
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2B3381CC3
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31ad9155414so2885252f8f.3
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879052; x=1695483852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkBnMYH2K8qXcekKVKJpvMpVf/5ACczDkm7fMzltEOk=;
 b=e0cSh2LyCQVHoJA7t8B6H0YLtqqekQ9+sUqziNj8jqY/UQq+ZDfHQ/CV3S7K7FcyNL
 UWWXC3adPSsEz4rFVmg3SC7GcBxugLp/UYOYIihOBh82fy/VXHVBqNFIj1XPDiyemC5o
 Of8xf7EbYR8vuKuAEkvmGWq3/dNEJ8q+K0DyO83AEfsv2LJCb5Tdl+PROPbFBPJ53HYa
 8y7DdjvWouvIfPpjGEMaaRLI8kKFRJ24OoPzB0ysViPhdb3hmlIWsc0rcA9jkrM8w/Sz
 6Bxd1Z1433L4mlmen56wAJz7h6YgTTiHEvuslsSbczb9FIUtaxY2uCY9+Ru3JplQ6tzP
 1crg==
X-Gm-Message-State: AOJu0YxhSlAeqfuL7jYtNUvf7EErL/TUq7wDKfONNgiW8iIvaZFx32CR
 10xiISiXL2v2bpzPTLNIDYECCMFX/D0=
X-Google-Smtp-Source: AGHT+IFqX7crpbjVqSc93ZFos5M+RkSqDoLWrU4Tc4cka0u/U1Q6vLamkSJIBBrf/Npjy6Z+D+R5uw==
X-Received: by 2002:a5d:4e4f:0:b0:313:f94f:3b15 with SMTP id
 r15-20020a5d4e4f000000b00313f94f3b15mr4251460wrt.2.1694879052177; 
 Sat, 16 Sep 2023 08:44:12 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:11 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:40 +0200
Message-Id: <20230916154351.2747233-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879052; x=1695483852; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkBnMYH2K8qXcekKVKJpvMpVf/5ACczDkm7fMzltEOk=;
 b=E/x+hzUmFOaiLx+Behxt2aLM1yRe0y7WIWt4hP18ntaCbQvQryWVm5fyontkC1sh4u
 OouolZhf1qiByXf+w/hVjbPgunPGONsxmZX0bf9slOcbLDuz2z10EpedAT9mRuOdqE0E
 8O8co8v2Ofg3gOs5mfYpPbcTpOhe6Wgy14AHs840Y5cWq0qZsAeCmnhCx3u/+SkaT74p
 hstQh/TnAwD07ZCgtl8rWQEun+vVrCzx07uuk8esqfH5fclA0Vj35VfSXZjL4+2Te/qZ
 VkYe8Le9Djj51f7QOnUAjZkaD7GHDcRB0KGEL73lilysWLYH/JREnLEKjX9DQy9j55ER
 ZOqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E/x+hzUm
Subject: [Buildroot] [PATCH 05/16] package/perl-file-sharedir-install: bump
 to version 0.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LICENSE: remove trailing spaces
see https://metacpan.org/release/ETHER/File-ShareDir-Install-0.13/diff/ETHER/File-ShareDir-Install-0.14#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-file-sharedir-install.hash                       | 8 ++++----
 .../perl-file-sharedir-install.mk                         | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-file-sharedir-install/perl-file-sharedir-install.hash b/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
index b462d8e68..bfc06ab22 100644
--- a/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
+++ b/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  5eabd44a5d7d84bf2e8e502491226287  File-ShareDir-Install-0.13.tar.gz
-sha256  45befdf0d95cbefe7c25a1daf293d85f780d6d2576146546e6828aad26e580f9  File-ShareDir-Install-0.13.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  bac4d924f3d863b00648ab56ec0dcbdc  File-ShareDir-Install-0.14.tar.gz
+sha256  8f9533b198f2d4a9a5288cbc7d224f7679ad05a7a8573745599789428bc5aea0  File-ShareDir-Install-0.14.tar.gz
 
 # computed by scancpan
-sha256  c207ca1c71c16a443d875a78d8aeccfbe550da502cd7fda24819548afb04fb5c  LICENSE
+sha256  6b5ade128fd47c452beec6dc31b3386482379fafb88f7f1962c7355db322d2ac  LICENSE
diff --git a/package/perl-file-sharedir-install/perl-file-sharedir-install.mk b/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
index 3653a4bad..4f152e1b5 100644
--- a/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
+++ b/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_SHAREDIR_INSTALL_VERSION = 0.13
+PERL_FILE_SHAREDIR_INSTALL_VERSION = 0.14
 PERL_FILE_SHAREDIR_INSTALL_SOURCE = File-ShareDir-Install-$(PERL_FILE_SHAREDIR_INSTALL_VERSION).tar.gz
 PERL_FILE_SHAREDIR_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_FILE_SHAREDIR_INSTALL_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
