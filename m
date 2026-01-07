Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E2CD0D16F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 535748231A;
	Wed,  7 Jan 2026 20:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5U9XFiH6tos9; Wed,  7 Jan 2026 20:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E8A582328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816033;
	bh=kjcGBOd7o1L3cBZm2/WK2+Qe27VR3twlu+kcC6MMuGE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Y5TJnntZDBiwaMVVaecYzYxbQQZvTVHuEYuH7+IeC5HPoWNG9ryfI6T6PTvsjSx/v
	 mlVHSciQNi2kY6rjPjb2sJMuYlVEl0TatadAizPcWwc3t+/vqzvHVgyYydhT+mxoWq
	 8dxAt89H4q5uPQhNwVsT5VMnMuw7ooSptnffI7Rxn9WYxNc/WH4zubic/09r5HTCTM
	 rVTp89ifl65j5t5t7NEPqneZT3CCgRZ31Ip3H2Ma6K9VES1uZU4JqrrGAnkZAgSASM
	 UCvhPQKQiuL7eysrqn3xSFFlaQBfoGrZf/gjJC2Jfvvz8+SY8iCFXiVZEILrenWhAV
	 W+e2bhPBrNkYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E8A582328;
	Wed,  7 Jan 2026 20:00:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C9E69ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E339F82322
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VrktLyYi91Y for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBBC482311
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBBC482311
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBBC482311
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47d182a8c6cso15845335e9.1
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816025; x=1768420825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D6P/fMc+Rz3MSwFtJtOEdKTc4bm3RsaSyRf51qT0n+M=;
 b=KVHUnR95/4f3UZKQYCE+wgPaSs8AAqvaTZsN4tanikr+I8UI/S18/2GIuQvPnKUqbL
 plSS6vR/dYPhf3NvWJPTVcurzPn8gAAf6o40u8GCGtXBp3psHGKqQzVsf5T1h3mRMVsL
 DihIFQpqF9nCDk2I4QO75ewNol5Zz1S42sU6HrvljLEJfKYs0VlV5VTXqwjEfhjHelOK
 xanR8edCRUg9Nyz//U5LUe3yXBGlF50XPbs6lDJ4fBIln0jdeuSUjv9JX0DmVyBXohFR
 9IFCVrov0dU+38opUJKW4hRmCNHhwyDnTOdgogCuXeQy/HP7sM1J08GDSJiO7cWFBlGc
 qMMw==
X-Gm-Message-State: AOJu0YwD9ayeLJ7Md/ANcOrjTBHhLIDu7O9ziK8P6u0y/8JL1htiFfp0
 QcaDvasDVP6yDIlSrRzSiJKJA2ghsNT/RWhRkeOpYoeqY8d4r440Pqz38bYgOGr3V2bOcPK+eG/
 S7jOFpg==
X-Gm-Gg: AY/fxX5ktTIX051tXe8bmz9PNp4qq3fq7I0vO3x1GggRYklmVXCb7uKQiFpl6CivARw
 hoGVzdGZ4TfxwTLMt5jeBzq5T2d3MhHcdeUTk0uTFiTWxTM/SpG7xcDSBfBslUVTcXYEw3e/rSp
 V/WeubtdqReOyXXnkGSnt+BpCK86aQT+Bji6emWVsKENJP46WmD256pk9FAcN864H51CdoicsSU
 1oh5YNnXL4YxS+QQs+SJ6WJ0jreDyRdsvJIA6mpeHrJ+bPM71Oj+/SsHamC/KDBHRPJ+V4Dm/E1
 zoWNgOzjcnu8sRLNKbA5zR+nID2UHs07VA9nXHfASnu3ou0sJ/Btd4XWSYIADdXKSA/20WZQul5
 lSSftIgACSKfyXI2isLuQETEYePBSJvXJ6fD4cfGpxc43o9Epd5uQMnxwUdqgjQtUXVvmRiYvpo
 Qbi3ZG9VggGIVVrbN6JkOsI/uTxeMDQDu780U=
X-Google-Smtp-Source: AGHT+IE0Rq69Ar0V4PQvcnUUQEb+1ABJ931bFqIy+Ueu1tAAb3ILACcDKFpNLgnjqAjaI9cM7JwT2A==
X-Received: by 2002:a05:600c:1d14:b0:477:9a28:b0a4 with SMTP id
 5b1f17b1804b1-47d849c7aa8mr44720825e9.0.1767816024557; 
 Wed, 07 Jan 2026 12:00:24 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:24 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 20:59:56 +0100
Message-ID: <20260107200004.665611-9-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816025; x=1768420825; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D6P/fMc+Rz3MSwFtJtOEdKTc4bm3RsaSyRf51qT0n+M=;
 b=pRoipst1RbKYmgWqZG3SGnsLHmd/rJ5Dvs6AXOALKlx+qNgE5rjHjzrM7GbCug6gF2
 Bg2nMwnp22lsNP0wlR1GF4ZGAKGTr4wWVeFBR1LDhqzEEtjO1+Y9qTsfwF9gU9pgTjM2
 ZrgqPLkgD3w1u/JeHyir8xNR5k58NwsEaj06l+B5BxgEeQfmKnCUPRgFtBAXLqvtaVFH
 V43sMPDxFJOvVOQdVAqcwR+TfFUAwvxiGdazqDzqCoW2sQOHsiQaP6RBn+s4D/oZ34Pl
 bZ/4G7YCStYfpMXGMqmPrdSVXc7ZZID9vgRx/36ZEo9+xLvo75D1FWiwuS7aV2lglWuD
 I5UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=pRoipst1
Subject: [Buildroot] [PATCH 09/16] package/perl-datetime-tiny: bump to
 version 1.08
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

diff LICENSE: use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/DAGOLDEN/DateTime-Tiny-1.08/diff/DAGOLDEN/DateTime-Tiny-1.07#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-datetime-tiny/perl-datetime-tiny.hash | 8 ++++----
 package/perl-datetime-tiny/perl-datetime-tiny.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.hash b/package/perl-datetime-tiny/perl-datetime-tiny.hash
index 8dc076575..eab7aa405 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.hash
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  5ac2924652edb0cf5fda7c9d52162b3f  DateTime-Tiny-1.07.tar.gz
-sha256  83568a22838cb518fbeb9e060460ec7f59d5a0b0a1cc06562954c3674d7cf7e4  DateTime-Tiny-1.07.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  da729efd2fc3331f623e2f8ef41508f7  DateTime-Tiny-1.08.tar.gz
+sha256  eaff931132fa8aa7a2e1688fd3d6d7ec55ea6eb071cacd4aaeb0cf91ce1af7d6  DateTime-Tiny-1.08.tar.gz
 
 # computed by scancpan
-sha256  21cda7a55a8d4b32a43c654f0d4d4a1587096b35bf2a93ea12a2e3a8c2c0b88f  LICENSE
+sha256  2993a1ab6fe37cf97f35487f2e3fe7142aed0a50781feb5c4832fe9a95eccee7  LICENSE
diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.mk b/package/perl-datetime-tiny/perl-datetime-tiny.mk
index 2a4264261..6a43b8dc7 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.mk
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATETIME_TINY_VERSION = 1.07
+PERL_DATETIME_TINY_VERSION = 1.08
 PERL_DATETIME_TINY_SOURCE = DateTime-Tiny-$(PERL_DATETIME_TINY_VERSION).tar.gz
 PERL_DATETIME_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_DATETIME_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
