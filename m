Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434C1CA9EC5
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 06:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7658540596;
	Mon, 12 Oct 2026 06:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbPFq77wCfpQ; Mon, 12 Oct 2026 06:25:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 307C040613
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791786350;
	b=iFAc84osUllvcUTYBYmJDqm2dN26TF7yMuMT8nWB9kBL3iNBuw9wvKSNigmmejckEWvR
	 22MUHOvlVRyD+3dMgWjtjyZXxN3TAFzbANhL7iFH3X0kHZNZ1HHy+7kQGN+Tis0us1WZO
	 GL1MJv4PmBitWShh/Zu1KgL67Wo+4nUdss+OGuxeTofF9tmyS3ZOJ9YZJG7Y0triKrrNW
	 9EdgIx+LubAcpLJuxhMW9cHboui3QlGpmsl02bvVqiebizknjLpwCQaltZJEHHgLolJ3M
	 gNmjMiNioH1pLyXHC1zkTPShQmokZ0Svj2knMtqWlUE5WZvHcfnk4tILHWnk968+07w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791786350;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1qigDvK2CwjbqyievjSNl4AQdfY3TljeqeyTHOhRx+k=;
	b=W/I48nr1s30jBtBzzKe7EEhzbVOtNDFd5QRIwBZh54TWlg+kHt4LBkhQ4N1+QZIVuAg7
	 bWH0h7VIE9i4TBmDQuEDyB/Sb1TFNyD0qWfG37Ta/xSJnVavG8pghk3/ReZMXaTAn/4Bi
	 rBysrdAtx8e0wZhQgM3bUJL2yrFedDY9PpfVw1Pwnuq8xAnxjjj9F24sDnaXZ1ft1eQLC
	 LHFsCTf+byu3ga7NrbC+D+EZbBCbacbe5ymgcNMu3oWw6MztTDoMMVzmTvXxI7wHTK6wE
	 tyoz6qmshnS0LUGhuNnPS4cGXfnLF7GVijBFweA3i4gNgyC0tQI9UbE6ZPyw7aN7IAw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791786350;
	bh=1qigDvK2CwjbqyievjSNl4AQdfY3TljeqeyTHOhRx+k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aMcuqBLtWYVJ7LlEp6XHmOBFIq7NvDGt4B8tMOA+1hTg3RFuWOaE8Tz9p4b72kZhI
	 S9cvR3uCdG7yyU4Gq+Mz3WF2Rrl5GbOw8/IMS0Z7g1MDj4e8UrgO9GWjJHyLtv0p8y
	 6VVTuOzeKw0e2MlFdSAd8dgv8ArTwcnW5WDYvAIKROwqe8o+JHWZLu0eZQ1MVA6Yj3
	 skvBe3q/zcNGuLG2mNgBDsZ40PIXNFXImvuO6X3bQnEXUhFbZ/qelK92XPaRNMEEia
	 sxJtpGJK7iEoG6UrlS7OSqOkj7/6D47Z5oa8Ai8UMcPRPmQ4HwhaKb5gug+nLPE3wh
	 srlLaJEYexzOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 307C040613;
	Mon, 12 Oct 2026 06:25:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B17B380
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50F3280CF0
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8jfO5GGnpCX for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 06:25:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3D32380CEE
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791786347;
 b=S3TVBb0t85DV0QcX2vAobp8q2YnBPspBMlGh8VrIzLWI3hHTqhCNmr5+EUQHIhKUPrRT
 llkJWlqCx9WJSTF5Cs90helnEHR7KL3HjGqNWpkIDJqKG5KKFjGzHLEze8R6Tr43MJxHq
 pCB4ZObuQemO+nWBYf2uX99hJ87gaols9kASCr09I/qDMzML0IdfCj0TrS+F5/WRfue22
 ajDoAG6rZm+Awb3gmcFiXXdY/HXYj8rPSZ4IJKIAyTZg5jgooqFS0q2EAG7U8RO7LImMa
 Vxg5xWsB+kwWGVsfwGGy1ZnsxAhnHBMCa9XZa/eQu6oYM2w4L2HLWByzIM7vaDNgb2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791786347;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=7KjpqjWpmOMj4SECTaXXfGNuDnxQ3pd0GTugPBiTfE4=;
 b=tLf2eqm0a70SArBcP4hGJdm3PtQI+Sy08WBBF1i/6sp582FRqBJVVj9T1vHADmLW3xHL
 Aai4x2UEFVxsu2RlMnZwevQtmIhvWIX65RYrxPibTKtOZ2nDPHLBBzM0h+Dy3r09oZXKO
 Ql5Uf520QqLUBByJTHWYvxfEuOZMdpgQsNnH2pTnF2u+RQsq7GUg9++6DGp6QI8COZwp8
 /y0zzR1k6ofmOOjFKG1vMWRr83uDavBwuRNfoQzOAe5AvQ40DQmkdJPZ2b8Nqei9QvwVK
 Zcxaks1NnuI+23U1KBf3K7csWZbRkwdGIDUj2OZuppGErrJ0BFOzHeRotU2uLAZY4NA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sls1aKCH; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=sls1aKCH
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D32380CEE
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 06:25:46 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso832697f8f.2
 for <buildroot@busybox.net>; Sun, 11 Oct 2026 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791786345; x=1792391145; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7KjpqjWpmOMj4SECTaXXfGNuDnxQ3pd0GTugPBiTfE4=;
 b=sls1aKCHLcVWALhH8Q/RyKBzxErT6/tyQSTS+vwEmmSV6fu+ij/5wn2jSIY2Aa2SVr
 InilexBdJvrRwLl7cACmXGqMG+kjEax/CSz3Xa+uaKLI1slkiKcG93A+jP32BkKnQ8eI
 9+fXkNBt/rK+JIG9pxqG9UKMF8zIo9Zh/WS0vhDeBBkaHFKVbcxu7q44fAxnu8VbVYqV
 5/l9O4x6Thl1Zopl+ioZ/dVqEf/Gp3+HER1c/JzGxr/enCexxBuS0hNKNDutZndlMXan
 pjpUu6KCOl53DyyPEJdAM6EbRs4PUI+56myXMs389pz2ohH7PHdw6jdinQDUYAbBkpfA
 ta9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791786345; x=1792391145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7KjpqjWpmOMj4SECTaXXfGNuDnxQ3pd0GTugPBiTfE4=;
 b=uPystbl8gni6h8lX7OT8w7VOTbtnj/EuOtE2kjeDM0cLq2OEGnYp9fiQFCg7pl1KUA
 7RQoVkSZ37VIISpLiLhj/j/d/6dNGB36dY6T58FjrrV7s3U0wKoe5tTGhchRth+RwtG3
 mat3++ORuVo+pYPx9Fmmns3of388T7OQFDDL4zEyf0JEtrJjet0V4b1A+PrGUJLMihbC
 +sTuY7r3YWe8FPKMFi7hLpfpLVAmd/f3LB6rV79GwAUQuHgjQEbUxNuzNcmrzz4kIW+5
 T8s8MSgwCgWErnrENMvPQs0tIrpdG31BzdMTJa4+b8B9F92dP3DiFx6p52XRtjSJ6/Bf
 FndA==
X-Gm-Message-State: AFq9FYKaHkBbvw4AewtQOrehHRr4sI4aNvMZwUnnp5CS6XREL13SlzbM
 T9pjrbYfzaRJxiiJDG04QKEc8Y+EJ85IEkvsSxJwqTcf2MaO1LUFIbrjAoNZ1A==
X-Gm-Gg: AYBFou20Ipxi0rUHYMEg3YrKKXxk/qzomsB2bb636j+0aAngyoJ+ZtPAdb7LbJAYVi4
 6DocUwr8ormIb/r9/nBYK9atcxmlkWBECXTXlPoW/ShvFE+9k7JsAnYfG/s8V8wClbuhNIM4AjC
 CG3vsWkG4BL3IRQKNitztdc01noC9LkcM7GyRIeTmJTb0ByqJ886tAWNmYJvlzPDdT2lr+lNzSM
 Ld8xOwZKZNBkLNZEQ9XCoTIDZGrzQgohQxTcdY+FMCfMbFWwDhC9Q2LGFvIj0Z+EQF97w2Ph1hx
 iKlJ1MnLHaFbE0QFePU5Tonj+dXBWbZnb/Ya9DDip3D0FvEthIAkXwmXb1k8mIAj+wVAOX50OIu
 d84IdjW3T0wUTCx2JOD6gOMEZMfcZ04qpxv868hV4OTQs+II0aCos/3J0gvbDCX82tATCeBhVGj
 uCMjk6kQac5Vr1QEbZMJY5y5rDtpoXNUAsZmM4HyNZURcHzy7QUVIHExuCCYTzRcO3O3/8B6gf4
 hyoLOG3LImqgvl13jKcYddE6zqCb+6QqkwTmmuT
X-Received: by 2002:a05:600c:4f42:b0:4a0:b6:4619 with SMTP id
 5b1f17b1804b1-4a18e3ecfc8mr187761065e9.0.1791786344630; 
 Sun, 11 Oct 2026 23:25:44 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm421486625e9.4.2026.10.11.23.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 23:25:44 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 12 Oct 2026 08:25:27 +0200
Message-ID: <20261012062536.78874-2-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062536.78874-1-francois.perrad.86@gmail.com>
References: <20261012062536.78874-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 02/10] package/perl-devel-size: bump to version
 0.87
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-devel-size/perl-devel-size.hash | 4 ++--
 package/perl-devel-size/perl-devel-size.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-devel-size/perl-devel-size.hash b/package/perl-devel-size/perl-devel-size.hash
index 8bf9d5d4d..1c1011c10 100644
--- a/package/perl-devel-size/perl-devel-size.hash
+++ b/package/perl-devel-size/perl-devel-size.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  1a7023c3c595a50443f9201a3081a0eb  Devel-Size-0.85.tar.gz
-sha256  292f98b13edd1aa4a544e3a5cf1d9f2d7019f75c7364d2e8fa8a35ea5451e73e  Devel-Size-0.85.tar.gz
+md5  ee4589a77f854fc582380063dd3d2d0a  Devel-Size-0.87.tar.gz
+sha256  c89fe04c9d0e5ced6c1d334311d576de609f3c8a41220919d4551e9eb0191f47  Devel-Size-0.87.tar.gz
 
 # computed by scancpan
 sha256  fca4ebe3a1f329aa33a4d259c0a5b136a15a40b987c60c2dd6f1007bb01a1513  README
diff --git a/package/perl-devel-size/perl-devel-size.mk b/package/perl-devel-size/perl-devel-size.mk
index 7bab097c0..9b4dab1ec 100644
--- a/package/perl-devel-size/perl-devel-size.mk
+++ b/package/perl-devel-size/perl-devel-size.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DEVEL_SIZE_VERSION = 0.85
+PERL_DEVEL_SIZE_VERSION = 0.87
 PERL_DEVEL_SIZE_SOURCE = Devel-Size-$(PERL_DEVEL_SIZE_VERSION).tar.gz
 PERL_DEVEL_SIZE_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NW/NWCLARK
 PERL_DEVEL_SIZE_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
