Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CA2E9B269
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 14:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8A4241B5C;
	Tue, 24 Feb 2026 14:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZV5tKrpsjBf; Tue, 24 Feb 2026 14:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4299640B75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771942136;
	bh=GvcpVX5QY5wTf4bomU4WgkuVU8tBPaU67EvL/emPmkQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BxY1ctm3qELT9ShQwke5GdzsK2Eg7sxW6QazSy6v9itlG5mVGPyvye56smVDUNRZu
	 DenS91bMS0lJTyEkFSO9inV98I57xjuPei38iGYJrK+ogCY2vy5jYVi1RzIHFGTpbx
	 YP/VpN5e2hi2hTib0DeCTl5YJrA2LfIpi18wx0J3tvSYkJTC5ZIy7gwKvodNMQZjNC
	 wozTQVjOk4wkbbfzUTT2pc/Dd1cmuMMY6buXroMS89ZbvXQ+rz97eyKBH7XfaDgWwv
	 5BypIj99zkN7R4MOjLRn0gisxtHcZk2Od2gn8PjJFbWC2IR96bQ602oJsoulQDBQ5h
	 nclAgtfUN/EbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4299640B75;
	Tue, 24 Feb 2026 14:08:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56F00237
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 14:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F3DF843F9
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 14:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SGtzPYC7XwO for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 14:08:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C83C82470
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C83C82470
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C83C82470
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 14:08:53 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4833115090dso53853165e9.3
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 06:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771942131; x=1772546931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AIv9Jt04YOcXd5um6oJO8yCOpYEVnjKdx882/pR96RA=;
 b=wavVYrPSTj01myVL3+ijOTok6+JOxOoZlB/iTSynOajaIRwdIN6mGSU9x4k1zYMGsL
 pXMOnPrkxbDbYM/b4hIyLarNZ034ONyoTdhaUBH95oLEmSiXHLznRmYbk+/M5J/bNT8k
 PRhpMNbEQvt8jvaB8p0M8VY2ajYXBXUBpBK+svL/A/2q3E+da7JvyzHrg8dRc2ocvL+p
 F/yYvBoPDS9JSfqNcndBIXXRrQ3V9M4gLWpFIkhbHaPtVwral2pTjjZgkwg3Ddy5xwT7
 6f1/zBATRnFWQLlxmr4+UTgaMJ1PAt5SVuINbTENi78mmUs7LgitPznBymwGGQQKt8tq
 i5vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoR3/KZoXVxs93wZ848zzpNMME+pzIxawUVYL8mOkoa/eTAoPzK5rIel5jtfe8nK0wkfTFOBh8PZw=@buildroot.org
X-Gm-Message-State: AOJu0Yxt1rEDzXvo9TKFhqD2bu8cf79ZXPJR579sI1cG7aHFXl6pDXbw
 YnTAGP8WbecJ5cY6wriSgJTw+GE12R48J+sm64HIFWRXcvtbOYVJROlLkWnfYYRn29E=
X-Gm-Gg: AZuq6aI1ESPTHGiP4CueXc/MTZeMH2c1WHMu4JDlVzJjwSh3BCrv8Nkfvb25KAoUeRr
 8fUV/uaY3vEppSbKr9JyW+YRJyJKziBcRPXnwXfKkVH6Cqo8XwBpqyrGWp0hndjFZJKNPsxUKj4
 1OKzzSYlnXYeMs4E/CjRgtahVbhqhANGplsNqPRgT5zjNE9zTQnETtCGlpjPJPE1LAUyiSiXIZu
 DGt2UqdxxXuhnWTr0aqxxwp3ADUNEwudz+kqNkpHd0trtSg7+BIJUptw8Ha3PzXr7lp5+ErXKeg
 KwsZu/yQGUAb797rFZHn9M4q5PjDzG5SFJHcojuq13u62fv/uQChUm1PGOARC1rlyDHUHVIgbmZ
 vE/A2oQcDeCEZo76SHJmIXBDbAR8gKfEPBT/0T31A5qrf2anONfzKexcGbPGbWYQtDO7xwwmONH
 OOSuPbi1mjJmszxa4=
X-Received: by 2002:a05:600c:1386:b0:483:887:59b0 with SMTP id
 5b1f17b1804b1-483a960c879mr258638335e9.35.1771942131189; 
 Tue, 24 Feb 2026 06:08:51 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7031f3sm1769225e9.6.2026.02.24.06.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 06:08:50 -0800 (PST)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 24 Feb 2026 15:08:50 +0100
Message-ID: <20260224140850.96741-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224133341.1711806-1-fabien.lehoussel@smile.fr>
References: <20260224133341.1711806-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771942131; x=1772546931; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AIv9Jt04YOcXd5um6oJO8yCOpYEVnjKdx882/pR96RA=;
 b=gzybW8r73PaWbvcZs7/B845aT6trcVaxnFmcxv/a0i2ADyKuZI85Qe/JRYF2ndHCdF
 EPFTNSx2jkbNnhrzUBG7fBvf0fGwmKX/45XiR290IFwjGjaYnX7RMcYXs4vOeRsaU1lZ
 Tnb6opiKg895FWfkH94Jwf6uWH9r8t8vSk3UVVVm2SIpYV/5xL04MT2KPx8Qh2Y90RgN
 MbqJfFepV1r/smDHfI0aWGLtD9AivsNuwdjqWTfB+prrlHrQwim+aHrV3zBwtLA9DJv/
 t/mIP5cYrtC2fTmTB5hHnofhfPlpa1QjNPYF0kk4vX1+16EaG7QsWptQjI/pIQoGkj61
 gI9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gzybW8r7
Subject: Re: [Buildroot] [PATCH 1/1] cve-check: fix CVE URL format
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

Thanks Fabien.

Acked-By: Thomas Perale <thomas.perale@mind.be>

In reply of:
> Update NVD source to full URL format following CycloneDC 1.6
> specification [1].
> 
> Before: "url": "https://nvd.nist.gov/"
> After:  "url": "https://nvd.nist.gov/vuln/detail/CVE-XXXX"
> 
> [1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities_items_source_url
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

> ---
>  support/scripts/cve-check | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/cve-check b/support/scripts/cve-check
> index ff14e4b238..bcd970bad8 100755
> --- a/support/scripts/cve-check
> +++ b/support/scripts/cve-check
> @@ -131,7 +131,7 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
>          "description": cve_api_get_lang_from_list(nvd_cve.get("descriptions", [])) or "",
>          "source": {
>              "name": "NVD",
> -            "url": "https://nvd.nist.gov/"
> +            "url": f"https://nvd.nist.gov/vuln/detail/{nvd_cve['id']}"
>          },
>          **({
>              "published": nvd_cve["published"],
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
