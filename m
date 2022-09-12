Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3047BECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 03:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96A69842FD;
	Mon, 12 Sep 2022 03:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96A69842FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7IhwCJGumEpK; Mon, 12 Sep 2022 03:35:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4C2784214;
	Mon, 12 Sep 2022 03:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4C2784214
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DDD51BF9AD
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C452841C2
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C452841C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uxk35s4Cqm8k for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 03:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22BCB83F4C
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22BCB83F4C
 for <buildroot@busybox.net>; Mon, 12 Sep 2022 03:34:32 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d2so13311027wrn.1
 for <buildroot@busybox.net>; Sun, 11 Sep 2022 20:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=/n5+w/9tDaAmPj7kMcd1TbnZt96L8twRy5Aw8Qd26e8=;
 b=rhXa+od4keG0M/c3rZhae2oGIoLek0BnFD6eM9GST6Rn7wAROCFAy+GueDudjOavrw
 rTt9v8jsozV8/cQ94R1gy1bpgLa27lKRNlntqLgAo0ElVhb/kXIOhCHY+WdkjMuj5cDN
 JIcxjgvmIh/mR8UpTHtXhcz9Xfk2ip+RbOGrdBiqjJqxE/ObRS+4OWYg92tJSVN5jOTn
 drL+Sumn9KvjFZiZ15ZuIV7Hn64fEgcXvL2XS0cZIgxJhII+Yh60XYMuZDsGxGw+SDZt
 4JNjxFqWAK2qbL6B4NnCugya4YSFmF24t3L3gK3aRG+SFXbPTA8k4cIESaMNWwptPB8F
 wADQ==
X-Gm-Message-State: ACgBeo3WsK6vUiQ0iLAWsyi57ESD/N5j8SoLuxq1rYHNmD2SHa4x/nlb
 MBKW7/ZTeB3qgc468R27JaJBb9GNPjs=
X-Google-Smtp-Source: AA6agR41Zoj3Wx8OHxxlAjQ3rqOuP2RPzkmdPDlSj8S3wZMszCRDvTvngf67TGdyHyZPE6L1seH0Xg==
X-Received: by 2002:a5d:6483:0:b0:226:db59:2f94 with SMTP id
 o3-20020a5d6483000000b00226db592f94mr13662505wri.200.1662953668765; 
 Sun, 11 Sep 2022 20:34:28 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a5d60ce000000b0022862fd933asm6009588wrt.96.2022.09.11.20.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 20:34:28 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 12 Sep 2022 05:34:10 +0200
Message-Id: <20220912033418.2587016-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=/n5+w/9tDaAmPj7kMcd1TbnZt96L8twRy5Aw8Qd26e8=;
 b=N5bHE0BhlbNC6bPn/OLAxpk0fKzFyCpGcAPtZOfzYENOQL1G3RDMKD24S+suqwTJWX
 UojgWqic4yYYU/1WTqb1AsK0T1ZyHAMZkppnTUFbhGRBjT3u4Ys+2+Ap1yQJAF2l25z7
 NHUx2pNvKWFumyGMLuoS0Qnibu9YqSmkWE7TOuScJuB0sVHu8oqeHhKt05kFeTrM98/Z
 9MSd4lbEDQBj/8awz4LhEWtYrOkInmK17lmUZpPB1DxiU6Qegg9o2/OdWNZF76cNRMd/
 exD172Xv7x8+lzHHaqhN6z2yGbfvo2LtERTueB0GpPgeuQKDknRwu8KV7nNv2Md14Xb/
 ekYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=N5bHE0Bh
Subject: [Buildroot] [PATCH 1/9] package/perl-date-manip: bump to version
 6.89
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-date-manip/Config.in            | 2 +-
 package/perl-date-manip/perl-date-manip.hash | 4 ++--
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-date-manip/Config.in b/package/perl-date-manip/Config.in
index 4ebcd4da4..d1aae7efd 100644
--- a/package/perl-date-manip/Config.in
+++ b/package/perl-date-manip/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PERL_DATE_MANIP
 	help
 	  Date manipulation routines.
 
-	  https://metacpan.org/release/Date-Manip
+	  https://github.com/SBECK-github/Date-Manip
diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index dc267f525..9762e7bc6 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  77123a4cc874f72d7188f859626bdd84  Date-Manip-6.86.tar.gz
-sha256  b5203782d03c79aa5822cf33d1828aaa3b4db93a275d4a428c89f56f4713361f  Date-Manip-6.86.tar.gz
+md5  f9fe372c7abaf90e9da2ee7c3a4d32ff  Date-Manip-6.89.tar.gz
+sha256  5caaa9cd1e2b0a1b84124c373e02e89b17c89fdb8fc5bc5f75ac41d304a37617  Date-Manip-6.89.tar.gz
 
 # computed by scancpan
 sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 35bce456e..6eab7790c 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.86
+PERL_DATE_MANIP_VERSION = 6.89
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
