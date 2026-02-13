Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F94EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 749708455E;
	Fri, 13 Feb 2026 19:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljPXYWlWDJTF; Fri, 13 Feb 2026 19:39:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CFD84594
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011595;
	bh=bMxbUZRNuxQhVQzcoqr2Mr6OfuyChsAF5KyAsRkTfCI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gjklUtiACTpotF6o7JGSfVBH380Iv3THzbiSYQwwBENmOKmzwL5WEOWyh1CZiNfye
	 Ujscg+IZEuRbNWJalwhOjBS8210KhiGlzSLlQ59a6yXBs4mm9qdE4nOfR2aBlBx2fb
	 ZeHh2vy0x5HtYI7pKFR6Cq3WrVWgDjDI2attg97Z/OLTWj79w5L8vLh+nLiHN2l1SM
	 C/eE5asm0Q4TG9EJVNJ8Uk+37Q8tcOnT+JnlOv09QD2LhY8GiLpTW/bRnQprMJSYLL
	 ADFgd+pmKRcgfx8Hafl0Qf5PXqOj+2DEstVeWcvttHsD3cDoje66re+mcGAeBq0nud
	 mOkNHZTvqbi7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96CFD84594;
	Fri, 13 Feb 2026 19:39:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8236B283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 710AB42077
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ew9jKWah0qYD for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 583D542078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 583D542078
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 583D542078
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:26 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso10016615e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011504; x=1771616304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6s7RNm30O7+acZZyA2MT39o5EU7zVKWClCOh0cOoc0M=;
 b=WNNeyLaJVWcZkXxIgKM3FSdcMuH9AAe7jkGw3pLZGuG8jdzpT29dz3/5Sof0Lmi2zW
 MvwCbMaJs110nYgtw3KgCmZAEYQheaNvHjN0Evt1cQmqGYKUI4qfkRc8PjDXvOtpjvag
 kZ87pvi1Ofq4eddZrBBEF3LhmYLMR7L4fSMfBZMoMCLYz3hel4VWV4VTJPGLvzjEDCmG
 CBzMDq9F11rkTKbb0RQlDVpTNKrpRkxKTZrYVgiJuhZjJfm2xRTQquJ66XEVRIsxUsUk
 ZFisEcg/HseuU8JWDCEbM/UU5ms9czVlv7wWp2SrdYm/7Fue9n4PIyY+gzOzJsvouncN
 nV3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRXKWutU/8iRlZ0nrHutsoNnz0t2oKzHb1DOy865wuuKqbvm/KXMHP0/ifZmHCElNH2/hS77W7Ig0=@buildroot.org
X-Gm-Message-State: AOJu0Yyxqe8xLHlIsWgR3sUYExezGNOLmGvmfsYgLfgZ89RBCnrJWoqK
 UXXDzW+TZoMsTmz+KtSMVluAmWRQLziYE3GOLE0vKhW5v0F5fdmpnpK/Yv0M17lF+hTvk39sny0
 4yptR
X-Gm-Gg: AZuq6aKZsfKwM1FWOjnqjG9g26yjgiuVKSKk4G6GR1GT0/DzgVYMhJHKeriZJPIvmoI
 9B8BZ7tGgd80uIM2xVjrVdGzkAp6IhF3zELeBViKB6TtLTxDSuWutvt+jcEa71ZIuoxyrIronM9
 54rl8N1sEFWxgvapXwQS6tNMhv1tz4AKyO2Z10TLAuFpogz7ShFs1cKM4XfNeSX1QonL2A9UfVt
 4/Vkf2Z5G9sELRNK0A0o1MayBLY44J37EtScVGEokPxn01BioLL9YAZX42isK8K+zVK1TP6PEeN
 wXJtl5tetZFAqjzZWb6Ol/jiMaE6SvM6etjEugqSMDxQDvvAGN8XM0h4NHehEFvkaFdbDOrNTL5
 Mymae9aP/HeQ68h0d+PU45zUFFU/UA5wp1YWyDpFzf6Plr72KRk+0SzPYx6qsOsHWokfraFvyKr
 ST6B0YG6NNp2wNgpQ=
X-Received: by 2002:a05:600c:1e1d:b0:477:abea:9028 with SMTP id
 5b1f17b1804b1-48373a15f26mr46684715e9.6.1771011504275; 
 Fri, 13 Feb 2026 11:38:24 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483709f6935sm38984225e9.0.2026.02.13.11.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:23 -0800 (PST)
To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:38:23 +0100
Message-ID: <20260213193823.42303-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202141045.1913969-1-jimmy.wesolowski@mobileye.com>
References: <20260202141045.1913969-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011504; x=1771616304; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6s7RNm30O7+acZZyA2MT39o5EU7zVKWClCOh0cOoc0M=;
 b=gJoTBUJs1LZOhY9/9i6ekUpeVpPCsodTy9mkUKgokXiuKU0D2f25hmMASFMi1YFueA
 HoBJPufnHfMzlZnrISb8KmTgx81foiYxsSNl2OHy2dDyByKvg9pYgl6256SjQgh3Tfsc
 Vd/omDTcTEdO51WBK/ejhH0jeGtKULQqBiTyPDfyNMvTp+/cvMJt7xUl6dsOH9KiTW8c
 jTJOlGtFBKooTqJnp+Au4cRN6o5qG/tKaNbP117UrwFNY47BFB/ePezqdImQod49oPgy
 egLFiyf7OiCumOyWhwGrIBU49EyXpNxWI9Bbzm+6eW7j+P2nIf2IbCAEqsOjqUYDFF7+
 XOGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gJoTBUJs
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/run-tests: specify
 multiprocessing method
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
> Since Python 3.14, the multiprocessing library API has changed:
> > On POSIX platforms the default start method was changed from fork to
> > forkserver to retain the performance but avoid common multithreaded
> > process incompatibilities.
> https://docs.python.org/3/library/multiprocessing.html
> 
> Since this is expected to be under "if __name__ == '__main__'", we need
> to have this in support/testing/run-tests regardless of how this will be
> fixed in nose2.
> 
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  support/testing/run-tests | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/run-tests b/support/testing/run-tests
> index 2f670c03b8..1c4d2b4a85 100755
> --- a/support/testing/run-tests
> +++ b/support/testing/run-tests
> @@ -142,4 +142,5 @@ def main():
>  
>  
>  if __name__ == "__main__":
> +    multiprocessing.set_start_method("fork")
>      sys.exit(main())
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
