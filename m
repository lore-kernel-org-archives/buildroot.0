Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54715C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE01784BB3;
	Sat, 23 Jul 2022 15:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE01784BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BhWJn3WZVA6t; Sat, 23 Jul 2022 15:01:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFEC784B9C;
	Sat, 23 Jul 2022 15:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFEC784B9C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5216C1BF859
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A6A560F58
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A6A560F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gZzWtbKqn2Z for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:01:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F97B60B59
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F97B60B59
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:01:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m17so9804759wrw.7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8GbWYIurZ2HD2ukAshbc25DR3lOwxkQcbVsm6DVIEDQ=;
 b=oUM7w5Yrr+2o03mgCgvD0x7yMthxhGewBbUykosPd6rTkBLfsPVlNLnw6ZndUebdpz
 LFwXYRUkUBgYtXngInM6m0z2k6Ald55qAirya5gguw7P6Gr65cs2FqbKgRkwZ6McHdkk
 gK86xpckGyCQcBST9ki43frrAffpjFdDVoRBT2iGJwoQgV8f0gu4p3jy/pJT/kOmFaSu
 cuTzZBB8WG7FGkpkLkR2Xu/KWoTyW/3uHW5B6+OZ7cUwC6PLcokPxxCszvYLvPLam1S1
 AlsfVt6HuItHnk9Y/gciLny8JqRlF0CVluqoffjaLb4d7uoH/DyEjiqmIjiFW9xp2Oui
 y6Mw==
X-Gm-Message-State: AJIora9nj9VQELbq4Dj+1fJil6tXsfUzDVHNqDTVY2wcK3UkIVlIX0YW
 OkHA7Jd3s6TR3lbi3WSIJ4hl/KR/dDgaHg==
X-Google-Smtp-Source: AGRyM1tsRIfJndKRTmKbX2kTyryTZUpV1UzHItAsG56FfDX+NSQx6kCFRUa2vqBnLHDafgV3vVo/ag==
X-Received: by 2002:a5d:6908:0:b0:21e:4fe3:cd1f with SMTP id
 t8-20020a5d6908000000b0021e4fe3cd1fmr3018342wru.476.1658588511393; 
 Sat, 23 Jul 2022 08:01:51 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a05600c420300b003a3200bc788sm11627364wmh.33.2022.07.23.08.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 08:01:51 -0700 (PDT)
Message-ID: <7658571b-ff98-c4a3-0fce-137cc839ebbd@mind.be>
Date: Sat, 23 Jul 2022 17:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
References: <20220717172210.381711-1-sen@phobosdpl.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220717172210.381711-1-sen@phobosdpl.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=8GbWYIurZ2HD2ukAshbc25DR3lOwxkQcbVsm6DVIEDQ=;
 b=O6L0us3b7DkhCFV1vylNYbJGLx9hoKl7ETp2BCyjSAjIZzkCHixmVyjGkhfi9ZFWxp
 8Navvw00II/lypcBareup5kIq0zHiOn9r8RWXahXLc86dUGcaed47HwhnE9OGziG0NvQ
 RYjvvHs9M4RDwlcK90NZEeyRSB5MYf1dyvBliJq+Pfi+L9+blLTH/orLXNooqADLQbau
 48a1h5c+Q3rQY5axjnMWuAIiy375OS1rlf4paqFpudUpPLfjmEe60cUdFe77++S6ykyr
 mmgVtIl5TgfT6TbMJ/lkJKIfdLdTmA55vFtC4jakt9gTuGtfJlQYpa+HpdirL3+T4v2q
 WACA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O6L0us3b
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself for systemd and
 pkg-stats
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/07/2022 19:22, Sen Hastings wrote:
> Signed-off-by: Sen Hastings <sen@phobosdpl.com>

  I changed "myself" to your name in the subject line.

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5c3c24ff7a..a004a72a38 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2565,6 +2565,10 @@ F:	package/libbson/
>   F:	package/lua-resty-http/
>   F:	package/mpir/
>   
> +N:	Sen Hastings <sen@phobosdpl.com>
> +F:	package/systemd
> +F:	support/scripts/pkg-stats
> +
>   N:	Sergey Bobrenok <bobrofon@gmail.com>
>   F:	package/sdbus-cpp/
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
