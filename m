Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E84D0D16D
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BDCD6064A;
	Wed,  7 Jan 2026 20:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2e_wbFDYd6k; Wed,  7 Jan 2026 20:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A32C8608D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816023;
	bh=IcF62D+ZyawD5R2SJP6ZfjZ+SUA55HjfIppjT3PjnQU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cLGGKtNtL3wzcPaKl8DfHzEr0suVMz4ToQVU2Y7ACKGNhDYiyCLF5I+KZr4j5LOI1
	 nhUtXrUgbTq8CPeW2amArNjCrnCxBo1TYzwlFFCEyLVxkagWpf4vjQaOs1cE5IDjC4
	 U4KDF4IVaRDVcODJ5rkZkzaPDg9ow17c3zoUPazk2KPfnM2YmRSRkQjM2adBEugNsB
	 dcCXFnB9+kazkATqxC+mMzr2rw6URaFCjaOZb9Hj47OIe/tsI+T5otpEZswoIvkuir
	 7//8oygEDfJEIe1IaHGGjfKosPCuo6ecO2SD3zF2ZI30iokVOu1hTL2k2irnkMRhG/
	 eIWKXphu4DQVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A32C8608D0;
	Wed,  7 Jan 2026 20:00:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5879C9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49B868226E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4UYpkgw64Pp for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4387C8220A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4387C8220A
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4387C8220A
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:20 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47d3ffa5f33so12082635e9.2
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816018; x=1768420818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YnVbwi9FFZj6cPmlypGqA3ryWt8zJ4e9/TnIGsaF6fM=;
 b=NosXxMOWaQHYSFg5PUug72t9qJmtZ23mwdMnoVMw048y29xmLz/m5vuPE50LgYAmMJ
 y11ikttK90eV9IxQA9C/bsuuCyst6f8LqbJU2Mz738zzzNJgPlelUIQMnMB7AOH44apx
 0PMxagaFBAOUHM3APzUPqgTzuUYyBZkPY6gbLYCgjl1FcuVe4smhJZTE1SU0TeckLq+e
 xFi6+4Xe09FV6lMWPbjlCVU8kubHxxgimrCqx6gnT6GE+1FND9sFW25bPGiStOLyJDyR
 zEpt8rKTlzJOjdoY+yvNZ14DuY2U9al9Vzw0/fFfEk1KODJ4N2UEs78QfUe0aKvF6fZQ
 gABQ==
X-Gm-Message-State: AOJu0YzB47ydfDCuWN2LDgiWDQHSJbH+LBKQpGwZTtMSnnSJ2ghzZOFr
 S50Mr0fBxJwDmMhU+hXFpexC6FEzIvKeM8l3kog3dvc0JvgRZeHs5P3Tx+5CDOzU83wEr3Ez5IG
 n2Fvu8g==
X-Gm-Gg: AY/fxX6AUwijJfw4Li6e+Ovw321rAPlsLuYHgXT+kx/cmv/4RoWVca+sWEiFkDGlWFA
 +8ZoVdYZ3f1IPdAFuPQbDpsNaTz0TvR6Y28Z8qG/gYRA8J1zymHobzcLlqLYalVMkeaHUsLb48M
 /28p4z+8SWcpCBSI4Ria5/LWdelXWeJAsaOAtad2V7nyMp88GIRKTeyb3j1r4Qo6GQgaZ002qUJ
 UiCuOl13VXDvmOJOXLWmxyLRqA6aktaW/1ur1m3elooFXREfmR9jsnFaRmTPZ6+5fTqVtg/0IUl
 Pf8Xp20z37PA3E8HHePNYfzmj2FwP6DIN8uUWmJJkV/sH9pa5R1/K+dhta3qKAeJzmiQ7KivP0k
 mprVduyPmKbC7RGt4p8eKHmSK3ZNMU3t4w8cDAUO2fC0alm255FnLmBwMrd8uF/yjXtn7a9ylUv
 PfNajs+B4PvzZ75nDlNKOdVq6cfisx7JoUF/bgIVb0jUAzlg==
X-Google-Smtp-Source: AGHT+IFAtdgIec7kp0wMq+dvGNetZdXFfY0hg7Tf1cfO97mpl7pgZ2ag4eEbcOC/ltNL+51lqv8MJQ==
X-Received: by 2002:a05:600c:8b2c:b0:477:8ba7:fe0a with SMTP id
 5b1f17b1804b1-47d84b54c3cmr42175335e9.24.1767816018156; 
 Wed, 07 Jan 2026 12:00:18 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:17 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 20:59:48 +0100
Message-ID: <20260107200004.665611-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816018; x=1768420818; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YnVbwi9FFZj6cPmlypGqA3ryWt8zJ4e9/TnIGsaF6fM=;
 b=UVjGW9EefXaIimFARpRFIzBrp8HZUfsDF+5dgLP5kKJxsJinRqOsDcoDeDZVs4cv0W
 INffzfCfyXubOlRYJmIvQJJs6BHqI0+Up8UUFcoZyazlXKprjThrLPetxMiTkv27F9TD
 UbHfAZGF3y89hzCtOk1ZaS60xkso4naw6Ia89Ov2blkzUfC+Lk/WHlrbhwn8QGX+etPo
 LInWYyPBmiWCwLSmz5l0B8/t5hp/kGuT7QLW4LffdTXAEXldb621hbPhITkpBtvYYBMR
 jpPs+6HJE75ldycu/a/pMu2Obs1v3AiiPyEY9pIk7jkG3qMvywl0Xch4Z4Nb/3zFYNQe
 wLrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=UVjGW9Ee
Subject: [Buildroot] [PATCH 01/16] package/perl-date-manip: bump to version
 6.98
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-date-manip/perl-date-manip.hash | 4 ++--
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index 53f7f6191..e9f686891 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  1dc65dbb042ecab09149a22fbbe9abb4  Date-Manip-6.95.tar.gz
-sha256  92383832311f22083f55d03c8dae8f4bcc387cd902624e5ef9ac680f144cbd4c  Date-Manip-6.95.tar.gz
+md5  322b14e69dc35106b9df4f45a4f520f0  Date-Manip-6.98.tar.gz
+sha256  acfd8a60519ba4cd181c8a67a83d7f029c6d9ab4e8b0212dc47e41d6210fda49  Date-Manip-6.98.tar.gz
 
 # computed by scancpan
 sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index dc55bcff2..a82fcc0a2 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.95
+PERL_DATE_MANIP_VERSION = 6.98
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
