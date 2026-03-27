Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DE710ED640
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3730613F2;
	Fri, 27 Mar 2026 10:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXn9lB-GZp8b; Fri, 27 Mar 2026 10:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18568613D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605760;
	bh=kJXppJXO0WQ/czEe0ZgtmVWJuAHA0veJU7GTrRt72uw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Rs1DK+GahWBoZ1T8eRE3bpIxo5f2p/eh29S8cr3iCNIO7qc4FOgj9gmBEU7HM2tmU
	 jHYybSQv45Pq5Y6nKQxi4Muao5o3fVnsRsLayyJW9WVGFd8njoJbvmwWI12yagnUHw
	 IRZyfN9OB0yxnJqUZ2axg55QMCo1FTUlDa5vMOXwnpRQANp/A36hz56VbH4qytOoYK
	 xZFLGOZrlEYXbnq0xHhhKV8avgqJTJIJhwZTa0kqi+185+kP7wftGxJWw8Bro3lFyP
	 iehRKYH5LMrl9p+jHGMa5iRFlj3TQYK1GAaftKdx9fkZF9CWZXroiodKI7lReT6Blw
	 hv1i80GJGZ1wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18568613D8;
	Fri, 27 Mar 2026 10:02:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF3661D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D49F883D61
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PjA5vd11aVt for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C013683D5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C013683D5E
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C013683D5E
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48702d51cd0so21894755e9.2
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605756; x=1775210556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=43vQrC0KUU+9W2OxgthoPh6lR6PPjbSDfSIZMUynBK8=;
 b=MI2/OU7wAwdksfzMKzdp0C+7YsEpWd/LK2BOZmILqXV53pcSa/ih2GSUVFZEUfqJ/5
 LqrxBLmr9/XWvENMVtFibcu533S4OTL9YKCZmjny4TnmPVrU4oxXUqsVfnRV/rNiOP8h
 ik0zSbN0rTWiidhAcvUsa7o+KQFhFdRUXmK7d8n3lq0mvbPf1M04dJvWdC/Xv7AHd9CU
 yDKaHZ5Pd0hdEIeb+b+5A367uyBJhGWdnNmlBw/NpPNr0zI+kVvcXnoRGRuZUMwq0EjV
 IFCmJ15IUgNiZsxQ8HX0TcG9Xgx+quDK2bg1jABwWDCVVFLcU+/jFYduhaIqI5OQxMGx
 SPkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8WHQLNWwZ0TPyhrEIKF/bDpRFa3CoXF9VelLqcAOs3kCX8iYt00kQYIRgaN8UUsLqw2b6KZQ/z7Y=@buildroot.org
X-Gm-Message-State: AOJu0YztaajKbYwrQbW+HtdUu8htIDPb43hfZpzX5llPE2Zt/LfpIPa4
 G0YbhWHEWCwRtht59bboSTFBGUNS+qUSaT4eOmlvDXdT8i2QDsUoEnoaYcHe410+/cI=
X-Gm-Gg: ATEYQzz3DiepECntJ7lDTPC1iGpE2rafR2F2j6RceiYsh1SAX+9pv426Jwunalccgza
 gPdGMuMLeQqIC8RLScQT+Tf/02mlp36c1qyllNpm8+efIRNWa2xvluOqARdTDZzTdaHdcq5HbXk
 ScXX9R5+5fLL9aHzgWg00Rr3kzypaghTVhZIxoRUpi6YEuYDivV2SyEVY0fg9Hpsru/G9O2T+Xj
 Y+dKVq5b88rE1Ut+1NNSuuL7jwT04DDFqmilsJqdBRQybeVkgIXgYP8a7LTiTHpX/7PG+ul+xkL
 cU+fHk+JgOXojuRrSQ7+VZzYf14f5fCzksvWmziidRRo17O1qoTBQnLduF94OwtYMPPsb9PKn27
 bFBRIUzmsA79fs9OfjJmrucHZ+f9lXmdQyAv19Lkdl0shMJq8GhFdChVqTTLwviLYpeIASv1IG3
 xrXY3mqRIvQMPq25bD
X-Received: by 2002:a05:600c:6095:b0:477:b734:8c53 with SMTP id
 5b1f17b1804b1-48727e9a09dmr29651125e9.12.1774605755624; 
 Fri, 27 Mar 2026 03:02:35 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722be608bsm107926715e9.0.2026.03.27.03.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:35 -0700 (PDT)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:34 +0100
Message-ID: <20260327100234.46078-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224133341.1711806-1-fabien.lehoussel@smile.fr>
References: <20260224133341.1711806-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605756; x=1775210556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43vQrC0KUU+9W2OxgthoPh6lR6PPjbSDfSIZMUynBK8=;
 b=TSjQN4l54lj0Zo5UiE9PXSZ9xoxihKe7UF2jHVcA76lxEf5B9XJajtcyRHCKcF2Q/t
 lfsWOIPeAJQQ1TkCBU7tR4DWO5Dp+RkybLSZcpZkcWNDfnFt7me7qpf+MsNnk6RVkTAV
 pbzdFgcTFu/tPVc78be8CoMRnR0AEikq3nM8U0PFQ/BQxZqXgvZzh9OmiKuQutL09em1
 x8eWwhV7ykU93NfT5v7cYKyP46ehb3JHPSnaCBbqMEZ9A6BuSTpkZI/jjD6PfX041snd
 xFGHEAwxFWNPZ9TFvHgkZ8XP3XqgdspnTL1lcpDqI1dCFvfd2nyDG4ik3T8z9wXJ2Pxp
 kwQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TSjQN4l5
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

Applied to 2026.02.x & 2025.02.x. Thanks

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
