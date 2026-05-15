Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAAACD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 488EE41C4F;
	Fri, 15 May 2026 17:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23P7XXWftJam; Fri, 15 May 2026 17:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77DD241C60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867153;
	bh=t5s/TvCuAI7xijzZ89iXMSm9UDNaeqycQoMuzyPlQnQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JFb3hpeQzzC4LQ1X6TSS9PnAtuuI246EfNHKhLCs5fpCimmfzuTGV0YHKLsd3HQMo
	 jgW5ZBKNeUDdvkfG3oIxx+AlmvGMYB9rfKdttqP18w0dDNCOA5XzGWZuAJ4YXwvvgE
	 kOesnxUD02g1sr3yloENui8rPuX2RaNgRiRFxryTDK9VvOUQJ+qkv8oTgvLkne4tSA
	 HXWnO0VlbpamEzRPv7Q1eiOqidu/SvVO0Qohw9VcolY6Ubs99z0Pa0B+WAfdNsYMzS
	 /QXZ6X+X1hA6WEqQ8VsDPaf6Q+eXA/l4XTHIgKQj8LwE6+wC2SigdAARYymiJrUCEL
	 wLGtaLQGnQEvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77DD241C60;
	Fri, 15 May 2026 17:45:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30BC745B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1519084532
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Vn2VMoMWFMy for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:45:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E737C8454B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E737C8454B
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E737C8454B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so908485e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867149; x=1779471949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zQUZX363NtMfraOMcRCejR09tQ/uU6rVVLbmSaJrn20=;
 b=CNqCq81EmXsJdouOSYiNAsN23kHB3gcxZJppcsxb3D10LMPzmiYfuhywP2UQVUEYlv
 ATVWVxJWFzGCCHAPjKMGuZmwF1fYXuNEGDH/nz0lc5Sh3XR/ulrx39RxDGqE1rfvBsP+
 4jLAQcnooYeKXUHcy0/e5tgGbgDf9SW8tZbygPCOejmRx3c88LlrXOlzQ2416ERIBmjT
 1F7BoEN5VnLgbe2/Kd0WxDwG0YPmQAAAbPuR3wUIi0Yx/NzxN4DQdjRIHYkGGladjLhc
 KraxIDdm6GF0LEFBK8H/+Oa3TGdL4OrcDmgrJillgMUEWstXE4YL1benREAcIebL8Tyj
 opTw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/KZY2P6GuONpXBhOyqZLFThHOftDPhOI4XHo2haJhfZL2ahOcbFNo9+tlXRU/9esEREIEcFQWAgqY=@buildroot.org
X-Gm-Message-State: AOJu0Yx5SjXSWPcGfc2tEUMHXb6/jdq2uG/4fOmeyGX5FweKRZSDOvFv
 o9JIXJpF1QNks+cXSEYPqedPLnCGRtQ3/8BNUkmZGIlcUAVzDZcgIpC1s2/u59/thlI=
X-Gm-Gg: Acq92OFQHl3QSpCUjsaKHuqfb3DbCiQNYMq89Guoi+E8ntonrrea/vZYnm6/4XvuSd2
 r4hlOJHr25E2bmttYijDeZDXiSdLIFzx2fc5KIt+VvI5Q9O5XN4dkFtl8eMqVfCa7onFE/t6T6C
 7X+UvwRaqYg7wWfGpJJdo+bTL7IdnnvFLH/YlvIVCzPCTcWMaejPeylpQfhCZRbYBfqDtUUrsEm
 vEFlKmmgFDQL4bSd7juW2Ylb3QHR3UhbtP+V5TCk2VbIsE3VIHHGthZJV0VdtZqAox684gnWp/H
 XyyVXUcxeDm76G1eTgBiPvHiNaUXrzrMzG2xpI8Wlkg7H0p27nvdMcCQM9oO4fsB3J3TKDUIe8R
 ARis7DbHzq5VKDJEFHHTScmikLCeBM9p0k//Rynam4oijgzILmL1+/+2kD9TlQJZL87oLE9eAIE
 ZzDYAI+U0bZ3l+yc3tA1AjD/gAIkuJTtSisnAlCSBhcdB2
X-Received: by 2002:a05:600c:4504:b0:48f:d1b8:9a9c with SMTP id
 5b1f17b1804b1-48fe60e14bamr67332855e9.7.1778867148684; 
 Fri, 15 May 2026 10:45:48 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53ab773sm78401365e9.3.2026.05.15.10.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:45:48 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:45:48 +0200
Message-ID: <20260515174548.529014-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260101192150.1714696-1-bernd@kuhls.net>
References: <20260101192150.1714696-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867149; x=1779471949; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQUZX363NtMfraOMcRCejR09tQ/uU6rVVLbmSaJrn20=;
 b=V6f6B648YrVQgcfN9o5AmOKJqQ6fcl6+8utH0FXHnc2qZ1NAeC49pH/G2mZfTYgEja
 h9uJUt8BBS4juYVKpf0vKxZeplPK79u68Hk2OeyohKLqN9Ka2Ru3xDY3Rj6eU70dNH1E
 Wi1rs5h4s0tWyivL2pFm8WWzFERyEn4orrOE8SyXrb72uaVSt/UddqZETLmXIiS6zIxS
 yoUG/dUYzr0oM951N1HMIXBH8WxCWm+aP+FJJJfKazWcRnXHeRbmoYbDB0ItuoPjcgVg
 Mi8N2Q15KAB5HTYy1/1pUbO9iyvZCcQek+QuGJSv7o2LtDy8SsfUNYpwGTXon267towR
 pQOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=V6f6B648
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 6.1.4
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
> https://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=0b3937cd1ab60b206a8bca8be5253b053e042161;hb=34277e12e80031c7f89494ba543684bc1dd0be8f
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/ffmpeg/ffmpeg.hash | 2 +-
>  package/ffmpeg/ffmpeg.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
> index 99c3da5e74..1ffef61309 100644
> --- a/package/ffmpeg/ffmpeg.hash
> +++ b/package/ffmpeg/ffmpeg.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  bc5f1e4a4d283a6492354684ee1124129c52293bcfc6a9169193539fbece3487  ffmpeg-6.1.3.tar.xz
> +sha256  a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18  ffmpeg-6.1.4.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
>  sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
>  sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 7bdf948c80..1efcbf87aa 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FFMPEG_VERSION = 6.1.3
> +FFMPEG_VERSION = 6.1.4
>  FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
>  FFMPEG_SITE = https://ffmpeg.org/releases
>  FFMPEG_INSTALL_STAGING = YES
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
