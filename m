Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C1ACD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A37774129E;
	Fri, 12 Jun 2026 11:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEfLcz8M28fz; Fri, 12 Jun 2026 11:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB2EC412B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264297;
	bh=FJhBI7Hj/fdjB5M0qNbyQRdLHP6m/HALBO1Dd070q+U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bdMZnzAZ4QaHv0FOLDHZBe4l6H3Ta/kmLqNsxNk+i7ljsGtvqCx8+uIIk+R8XjMGi
	 MwN8H0wFExEeMupFiVGxrlicIwTig4pnEK+XQAVLQMs0TDq3YxFdvApP8c/1nMVzeJ
	 Sfw/0mjLJUub3ygkmfikBOOn0SvEM8UCRPNHMKTMzkTRMhbjaVLI0xDoW0t0e6BwFM
	 uAC7je5rLI80vMs/xZVrEJvzKyoJmWJB5y2+CUs/QbTydZspAmOuAUYmurg4aSMsq1
	 eRw1Q+3LaMhcR1wU1G7EqVZ/gXDCmc58Zr6CfKo9wNq5a+ZnIYjZcecBDXqZh6Zlfl
	 sc+zy1ygg7bfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB2EC412B7;
	Fri, 12 Jun 2026 11:38:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85E70237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76C4161338
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybPRQXxZ_8v9 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 110ED612A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 110ED612A3
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 110ED612A3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:06 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45efa80e0afso682271f8f.2
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264284; x=1781869084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zHtYxA8sC+3nKYBUg3xCtxluAbzdmTz3g11Eh2L8IbI=;
 b=FnfEYzCjYJd9OBtA4oikg9qj5hJJy86FTXwKNj5B8xl6N3nyyKUoGCudjfLjL18AZq
 9LnKYi7jDzkSRD/JrmTChJuyJYYTNkP1R/FQmV9BlQLkUBhKLAtFP8DySp+52s2rbyft
 ZSaxOvX6/Dqz4HOTbpkgruHvfmpYC/cLebBRkjDDl+5uBp7i534P0PTo4bOCae6a1ApQ
 kr2n1pJovxYZ5W6WGSsmZCEfdjZA+n/p3AgPHZ7whGaYbfpLFIyo4lD0ZINToBEei86B
 li+CJMhBTCSWyagEqTBtk3V1X4Wxi3H/hGzrrL167B8QIvFUWFQTI9DRfPHoX13PhqUZ
 CYaQ==
X-Gm-Message-State: AOJu0YzL2behh4RgsvWcYNmPb+8ioUoffCevolHLLnSUHDKp1bTlzAy7
 LdHV+966/M1JcxU//ni+vmSOIon97XQrc2u5Y9XHNuKQ87gAB929NSLyfhxMFawP4gMImn32T0Q
 0HPwI
X-Gm-Gg: Acq92OFK4AgWp/GVFW1m4IEcdNCDPKnMWwRH6tbWCr9sp+U+qJqAs5eLW+82C8BGCN5
 amW5+HphbcF4Fii/cpFL9tRb/3bqEgDXsZZOMBB5fBWy3gMnrY7ctmO1l92/MFIg0/VvRWMVBuP
 Sxnl3Gdhv665gQJCiUY6Q+brN96FrralsQJCeP+Jdl/0Go+o0HxeMiKBz750O5Ud6EGPtuDNB45
 s4JcEaMS0yb525wJqfamj+pKy6xmxu3jbjgMaMcAn1WOOQt+Vnlm+9echAXiaJvycE4OSUn7ZUz
 zMw2M6A4o6klgubd/7ZfDbt7t4INjT05pUUgrqvmFyYnMGNChF5LaHej9f1MkyUZxKI9skLCpTS
 gHWTS66iBkLU+KKTzhpI0j0f8xzRyhYCoDhmZw7kwcVapnDMwHE7/XZE/Hmkb1cw24aACkUvTaX
 HZI2tCccXzEBwftiai+NMF4v+Pbg==
X-Received: by 2002:adf:e002:0:20b0:45e:ec27:b4b0 with SMTP id
 ffacd0b85a97d-4606dba924bmr2520452f8f.18.1781264284062; 
 Fri, 12 Jun 2026 04:38:04 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f1cdsm5257467f8f.11.2026.06.12.04.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:03 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:03 +0200
Message-ID: <20260612113803.252798-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602124023.287483-1-thomas.perale@mind.be>
References: <20260602124023.287483-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264284; x=1781869084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zHtYxA8sC+3nKYBUg3xCtxluAbzdmTz3g11Eh2L8IbI=;
 b=SoWpOIDRXblG86p7/jVw/iuNg30WxKHLCpD4vfCOFVDvSPKDwQ74msCdtazfhTFboo
 Y9qt8sanT3HaBwY/0rkewAB3sUAFTGbUe/JI14ngUegLssRmFhPt6YMh35IswkewWj5X
 vsfbTyyybdoAUa6hC+WWqYAD92Pli0u25E07JiCve9HqxxtVtuXOTecJaap1NlonjVRQ
 Ep9oAFoZXlM/5nF72ChYpSyRxW4a3eULA2Ujws8bvkbepcXlVWRBWd2guA7u9avYDiO4
 RPXo7Lw1y6akEXy5PTT4YVj9s/i7e4XEEvPabCr2NTIPeMnKSYDB/bSJoxHRx1T8XdES
 vkeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SoWpOIDR
Subject: Re: [Buildroot] [PATCH] package/faad2: update CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The CPE audiocoding:freeware_advanced_audio_decoder_2 hasn't received
> any new CVEs since 2018 while faad2_project:faad2 received 9 new cves
> [1].
> 
> See the full history in [2].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2023-38857
> [2] https://security-tracker.debian.org/tracker/source-package/faad2
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/faad2/faad2.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
> index 62c469e3ef..3027d44f00 100644
> --- a/package/faad2/faad2.mk
> +++ b/package/faad2/faad2.mk
> @@ -8,8 +8,7 @@ FAAD2_VERSION = 2.11.2
>  FAAD2_SITE = $(call github,knik0,faad2,$(FAAD2_VERSION))
>  FAAD2_LICENSE = GPL-2.0
>  FAAD2_LICENSE_FILES = COPYING
> -FAAD2_CPE_ID_VENDOR = audiocoding
> -FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
> +FAAD2_CPE_ID_VENDOR = faad2_project
>  FAAD2_INSTALL_STAGING = YES
>  
>  # faad2 contains assembly routines using ARM instructions not present in thumb1 mode:
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
