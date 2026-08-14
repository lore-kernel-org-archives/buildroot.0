Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB73FC5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83BA040E93;
	Fri, 14 Aug 2026 14:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lezr7He4Pjt1; Fri, 14 Aug 2026 14:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D23D840E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716894;
	bh=3U5GsuNBvB97AfhkSWwkk5AUMV4nTTvz93WF2/Z68AE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=l1swLQf8lXkBeZk6AwDVsDZMMSkfNe6ZCwJ/cv+AOu56eQAN7fgBfMjOBEMPWKswo
	 g+uxoKTuPOX8MGVKqk9k+CCQcWNRe1f5z2oAHu9kVRLOppOaQr9Al/KfEEY4VJeAXu
	 SUfgFG893HCHWLiW6p+mHTmWReEcyVweGegnfDS4hX1PzBaiqh1TWxDjsLhdHAvF9y
	 oFYlAbM23K9+GPnDlU8uiIshuJF5gziEhtZVQf9hqtUvuLEGsmKH8ishWpka6eKya0
	 h1SspQ9V2yCRY5ltBq0B6hcb7S20b5CRzeBqPYHupFuA5m7/gQX8vKqziQ5bYMsjiw
	 4Q8hXXIaSi06g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D23D840E84;
	Fri, 14 Aug 2026 14:14:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE3313DF
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFC0540E84
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znobFEr-GyC9 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:14:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D79E140E82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D79E140E82
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D79E140E82
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:14:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so9638845e9.0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716891; x=1787321691;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tM35U7jPh9bN6Pt5tzd1+guOJFnkJ4DdPopV/Bavr8I=;
 b=IBg3uZC7yEi7HRKo/qCSLOTVhJss0jRKasiSPnay7tmwvluszflbE9UPFTR+KtW+wV
 LlBxHl5KRE4M6wioUgc0AfAErkzg45X4KewpzmCzeK+wIj2vGlYeSrnNdHqOmLBcAcNw
 nG3mLpc5EACYeK4cRfvgb2svKNz5FQlphCtTLJW8FfXLJVBHgBYR2K+5U/TNCKXYVEkj
 GKGh1M8VfjyckvV7DtsrcIZasvT8ySSD4iismG3ErkNY6Da6VkRpxERO940KoyxY20pq
 6IsteOFF+OK2kb+Qo/MgjnknZNr8jQhNk5DvBhnRbdtAQZIyU4vxcy67ZXD7GniIeGXo
 kiJg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqqQB/8+2/aZpVFC82/RiNG0BQG5tL/uIIu+a6pNeng1pMRR8RtJusTG+xeSCUkYUBm3EejxTUmmFc=@buildroot.org
X-Gm-Message-State: AOJu0YzJ5kYgKPK5Z0RyAnflnaP0L22Tk5V1ZX6MTN/+DFs9cyWY2aWM
 SrRUfubalEyj/96ztUgPMsptxNlZEZ6mltwMeAzEDTGIlA21SpYcJmUnswIjz+TvbCk=
X-Gm-Gg: AR+sD12QjShJ3xbbRgjKNYBMEDutuU2ybEnEE5Qx0m7jNzF5Q8TOmdtydGv/uBJar80
 76FfkZ8E3haB8lgiaUtd4m9faDfvnBm0tK2ugUPvK11f+qDUIDW5yo1pHUYqPQu1Q6CY8Sg8qHh
 E0qz9LSLoHSrzk9QVfQGDznyFgvZ/FZTL3ZteeazfWU84/yjij9w1I9pCwQFQeM9+AfHQ8bk2Qr
 S+ylTxwLf2nDRB31BZ3Iqvc/C5qFzPqIIx8PNsoxr7KoWG4e4IPkMC1KhkQpceJcpvWN6c9hxDV
 XWpA6uGIMwuB4fALBKx8pZhTI2p7MH5EOsgW8K0TKtNRyFThbafxSbRiFCqrJTwFFTiVnrQMJU3
 pGgva6kx5D55jfxgnkoMaYDbPtIpnN2hRK8QoHaulubDljRUrnnNllcJJaC0D0BmCwv596yN+F/
 IR1kdPFt6bY1dLtm5h6ytJUlp4Fv/wfxeun2//9hreVC0FnhDZD5YSo8TEI9V5/2IErwG8O+vAP
 HGh9g3oW0Dotn2m5nUes/UHnNFRuL7NMIU48nhUfsVrcY9eEQ==
X-Received: by 2002:a05:600c:871b:b0:499:8b00:5261 with SMTP id
 5b1f17b1804b1-4998b0052cdmr29257295e9.8.1786716889867; 
 Fri, 14 Aug 2026 07:14:49 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988b1d9fasm59429695e9.9.2026.08.14.07.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:14:49 -0700 (PDT)
Message-ID: <1fd10c59-62ff-479a-a8ef-8685109b6568@mind.be>
Date: Fri, 14 Aug 2026 16:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260806210833.3852-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260806210833.3852-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/apr-util: security bump to
 version 1.6.4
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 6/08/26 23:08, Bernd Kuhls wrote:
> https://archive.apache.org/dist/apr/Announcement-aprutil-1.x.html
> https://archive.apache.org/dist/apr/CHANGES-APR-UTIL-1.6
>
> Fixes CVE-2025-49506, CVE-2026-32327, CVE-2026-34191, CVE-2026-34501 &
> CVE-2026-34502.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
