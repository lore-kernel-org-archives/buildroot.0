Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12C2CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C61AF80EDE;
	Thu, 14 Aug 2025 20:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akjTLyIvAwXn; Thu, 14 Aug 2025 20:32:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C590D80E56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C590D80E56;
	Thu, 14 Aug 2025 20:32:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 729721BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48526402F5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LIkaaI6yuGx for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 88B7040459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88B7040459
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88B7040459
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:09 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45a1b0cd668so6869765e9.3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203528; x=1755808328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VP0vaCd58WCIiFFerHNnVkiLljaSiOMt4bq2I28mOKo=;
 b=PP33KE2SzzgKk/hzGHS8m2V4LAFrADtv6R/04toTOzOQY4+wLsz2O/VnS8+miHIDJW
 u0wu+xgslKpzlcVZR8dtKaDBt0HkU2vyExdCrUb+ZLg9EH9z+LZMfJz2bK/mmiFGSboj
 ms0WaHf2u1Z5tfDYMNYMMBINxlzutopwuOrM5H2hMwuy5sqnGJrtdy28pVLaRoYFhnJR
 xTZVXGQxgxm8HGlbxW9wjwTDpgsvT1OkyeRNWgPE9lGP16naVc5mGasZOK6/bkBtjcIi
 F3hCABpZWuSnhEG6I/cR/ALKMBZsidlIagO81iMdr8iimRdUaj55RrsxVC5GS+aeQ7uv
 DcPw==
X-Gm-Message-State: AOJu0YxIzIyBIxi/TRckRKhGLtEJXiXGZ0iPikP8ufPEPy55cPahdoRS
 kAXOjVHHshf7qgqPIR2Q3armet6uK6y9UctrY1F8M/AneJ2CJ0B/asK1Fe4NaddNNVkvRmRYWMK
 6kk1727c=
X-Gm-Gg: ASbGncsV2yf8/LdizQbYqn0wrovkBdxcM0I9so2Spzxk9l50lpDd2KPZPHqbiUD5IRe
 EiPGAAY92hfkJo44bpoqdybLAGimbA+V86ZpGUDgtJqDQOl3fcAK4PTYYEAU45JCwJphAs2yBBZ
 MzBMosY1536lMolnzo3QqTLYs/nKqeSersHmCn3/RYdkgWMMXp0brN4eAO/O0RT7lmvs6UhfiQG
 okLFfX2uY2V83wYQ0pUR4bZWCCS5wk/HC6GG+KM+2Um30lRm/x4iSz4BEnHNngO6sEA+lDOS3QO
 F2MKGIcqvEnSxD5at8At1/GUCyLWi8wY30na+IXAT1r6ZmoPFHfmbxaAd76byWzDKPuRzhWXTWq
 qGQ7heckuxA6nQg==
X-Google-Smtp-Source: AGHT+IEaISq8N4XLGeBH1CN879qyIBOTmz7mdQV4DkF1uAQ7OXDMYUqUdHkQGw1RwfdZWTVp3JBlBg==
X-Received: by 2002:a05:600c:4449:b0:456:1e5a:885e with SMTP id
 5b1f17b1804b1-45a1b605ab4mr43992895e9.3.1755203527622; 
 Thu, 14 Aug 2025 13:32:07 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6ce764sm33262885e9.10.2025.08.14.13.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:07 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:06 +0200
Message-ID: <20250814203206.2816436-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806193802.532017-1-thomas.perale@mind.be>
References: <20250806193802.532017-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203528; x=1755808328; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VP0vaCd58WCIiFFerHNnVkiLljaSiOMt4bq2I28mOKo=;
 b=aeDyxw7wO9f02tfCGDHxRZ1oVY8dKjxru5ryUKJgLo99+8ZA6AyCZA17oTYpWxH1pj
 G1cCmTlfNoPt5D71WR6P5d7HhEagJy2r9eYb6RNzU/8LseIwRIJMuglxCkQFbFiyYmqB
 3CiCSjevmO9O15TOFr0obMwi9Qs3r9JojtftWwhSf+AxPkqN0wYZ0qYsIXTj8wpk0d1b
 j50DyPFfAtyyqYDrqmhq4tbDwXy1dTspFs3R9fs1FfWCOYILv7L5/iBA0TWzcVJgcI1g
 Xg69Lks1Nxom4jq3++5GwAD3mQjS8MsNni00Ac31vgDuBhYUtRGYKsWnFWC3Bkr6UvxW
 /fsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aeDyxw7w
Subject: Re: [Buildroot] [PATCH] package/flatcc: add CPE identifier
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
> The cpe:2.3:a:flatcc_project:flatcc:*:*:*:*:*:*:*:*
> valid for this package.
> 
> See https://nvd.nist.gov/products/cpe/detail/AA7FC7B6-537C-4735-B615-689D3A91C994
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> See https://nvd.nist.gov/vuln/detail/CVE-2021-33983
> ---
>  package/flatcc/flatcc.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
> index 06be1a1338..b2d1efe00d 100644
> --- a/package/flatcc/flatcc.mk
> +++ b/package/flatcc/flatcc.mk
> @@ -13,6 +13,8 @@ FLATCC_DEPENDENCIES = host-flatcc
>  FLATCC_CONF_OPTS = -DFLATCC_ALLOW_WERROR=OFF
>  HOST_FLATCC_CONF_OPTS = -DFLATCC_ALLOW_WERROR=OFF
>  
> +FLATCC_CPE_ID_VALID = YES
> +
>  # Disable build of tests and samples
>  FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
>  HOST_FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
