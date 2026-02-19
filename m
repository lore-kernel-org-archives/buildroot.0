Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D2FE9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 289DF61230;
	Thu, 19 Feb 2026 17:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCvqFA8JIDfn; Thu, 19 Feb 2026 17:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A66FF61224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522009;
	bh=NrkpTLpjxxRa2rI4KJUGcJuRxDbkkDEo9GPHKlQ1PHU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pR6qNpfTOIqH2XFYzKXJwRFxbQb/DiByUyBXxJUlKrNrd4ZZvd9bmfTKHpxccyNs5
	 TdtMndsAYS4SlOHNHp9gLK9M1ede/7FFxoWyQi2IrR0XhBMhK3ngiDY8CLafy73cU7
	 cNs0fO3KDKKdNbNXjl+raS/WhIq4gX17Q73Blq3kxdfOuNqzORHKzaxlHIwIurYGDG
	 LLY7veA0Us2xBVW2vM8zhBmihDU00taC0FbDxJXGgqiP0XIRqPGIIMRqEhyPpkbyWh
	 hLcHf+2VsjkVOFcFEZwHOImMFNuW9Urm/hG8ykl+9deIAiHmTseg//qMwmSS2e4jza
	 ST/FXXeVTspLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A66FF61224;
	Thu, 19 Feb 2026 17:26:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F6E206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BA4D61203
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtgQI9gghLxT for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36587611D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36587611D9
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36587611D9
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:40 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48371119eacso11234415e9.2
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521998; x=1772126798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A5INtw9f0QmLgTQovh5FFrdPGPriBiYyooaehLnWzgQ=;
 b=OpFWvyIxQFjJ/sq4OV2C7VNzAdgkjHUCtGCuf4A8NG1426EiZOHluv/Rd8qapJJQNS
 I2pNJ/yUA/LVsHRsmdHOMGT+yZuvPeUqxCMGGZPd6GXfWKoV7klCJfJv38Ks+YNGv+U+
 9jXgyd7XLVaNq6kYSz0eosFnz4nHi0E7epK+QH0Pl0IIikPoplEs3DdHZX+jQn5ihqar
 B67Dw2CHPwv4eH9odW6XrOpltoIwLGYd8otevtF7QTdHY6xmu2w4uAZc7XVXDA0GOphW
 lKzazn41uafcDD88GvWs2BgsNbeMsL7uzzZLB2KFm1VkWs01bprzO9xVve0O0fyBmgvz
 mnrw==
X-Gm-Message-State: AOJu0YzkokjvA3b/Fncw+gC3yhccIh3VamGTdAEu+3dBEyNDe/gJUBz9
 8u99jFEIl0gqvVI3EK8bR17psjDPu75zby1lfdbHQ6nuZ9SIdfBzwTeCeKGl2Eb6Arqn2LMO6zb
 SB57f
X-Gm-Gg: AZuq6aIzT+pQ7mh+pAJbzvTlCr5SEVryzj+DOQTVj45ejSGKjpxdS8V4XxSEvQHzqTT
 /qZk1eYaOBeVus1occVjjLR4Apj4w7VJBw7d5t6I3taaB3Lgmbincptjv8OMunz0Mf3pQ5tJO9c
 HPy2VPkBTThtYAjlbzBdosB6C3E7JZdrjZEB/PwR1+yVFWAEjKUKWd5yzcnBRZRI5GQZpJjT9ey
 9O1Il0OWE5GnjVwvMKZZE4TT5EdMTdS7lgFDjeGWxmPXTTBq1Km5SbZNK2Tj9awei7fRSILnKf1
 F93Yl+2x+MMZi+X9T2LhnLdFVzEJcNHt6hht5HsZb1oWdj6vKKvYvjjzQB44bjCCdTV243mH1F3
 f+SplyOKDgjrJH8r4Iwkkz79uT55ByWQuQ7u45q7GIUh2ILB8CmHF0npN6OjX/jeXl3Wgu2lBBV
 W2DpVkCr/SwAuPnVA=
X-Received: by 2002:a05:600c:5289:b0:483:71f7:2782 with SMTP id
 5b1f17b1804b1-48398b0990dmr93549455e9.12.1771521998123; 
 Thu, 19 Feb 2026 09:26:38 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac800esm53304604f8f.27.2026.02.19.09.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:37 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:37 +0100
Message-ID: <20260219172637.341118-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213143500.528726-1-thomas.perale@mind.be>
References: <20260213143500.528726-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521998; x=1772126798; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5INtw9f0QmLgTQovh5FFrdPGPriBiYyooaehLnWzgQ=;
 b=FHENua1+60ScuqtnrVWb+wdI0djBelR4rmEPHu3NJg3sadpzGAXjdUgsVoLJVQp7KZ
 ohr3YNI0Zl70/oWhjdBl7aa4B4FztwqzXcF1d4dm9dypNi4KeJ7/VXRUI8X8l5++pITd
 VRlNGfiP6x2FiDdCVhHBIAIpwvpJ8NTjttFOJ6wZVlzEezNqwQFaUscVUgNRoz5dtJWH
 pxhBX8JxXaOSFGhksm/HL/ww7H+wjDNI7gVzQzqrHTEh/tviiLXHn1RdxAXeZxH50Txt
 LQjbAj6kdRlgjXmzw62f/GDnOiWZ5QeD5RIB53d5SXaOT9K/TRLaDYyqk5Q985Z/vQZQ
 lQEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FHENua1+
Subject: Re: [Buildroot] [PATCH 1/3] package/dash: add CPE
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
> The CPE `dash:dash` is valid and has a single CVE associated to it. See
> [1] & [2].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2009-0854
> [2] https://security-tracker.debian.org/tracker/source-package/dash
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/dash/dash.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/dash/dash.mk b/package/dash/dash.mk
> index 78effa791c..143972f01a 100644
> --- a/package/dash/dash.mk
> +++ b/package/dash/dash.mk
> @@ -11,6 +11,8 @@ DASH_LICENSE_FILES = COPYING
>  # We're patching configure.ac
>  DASH_AUTORECONF = YES
>  
> +DASH_CPE_ID_VENDOR = dash
> +
>  # dash does not build in parallel
>  DASH_MAKE = $(MAKE1)
>  
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
