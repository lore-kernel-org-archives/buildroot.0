Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A24C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B18614E5;
	Fri, 10 Dec 2021 19:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jPGXqPLAJ8KL; Fri, 10 Dec 2021 19:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2301614E8;
	Fri, 10 Dec 2021 19:02:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1DED1BF2B7
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8C998548C
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8T-LrmbY-WAF for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:02:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF43485492
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:02:10 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id o20so33291643eds.10
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 11:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZN4UhBf1HX9uDNOlVvcEa4e9reGRT4iIfss4ucx9fBY=;
 b=ZITMl5vhDzszeuZOAsjeIEWG92+V2iaRodUEFYl+MYFviHLRLJq1T5Jc5DayGiwPA5
 9weUCSpmFR7z+IqNzaLdBRrSlBRHpebBaK1ylqHIy3tXd0/eh2GmD1pedVEdv9YXM5/3
 neW+5qaombHB/pImKeTleWYcwCJOFAQYPTdQCACtLPPkbCtFDHb3O4RkW6/prS73RuYf
 U3pAvpVQRr9hCituSLzDYaLhgpFaonaXHduaQ9yx/kffTk/c5th3WGK515LONBMSCdEz
 /mnKWIcYlqMiBmHUMsPlEuBITki/6g2szCzzvuRvk6k8po3l7SxW7pDlWgZwjpIZCJu1
 bzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZN4UhBf1HX9uDNOlVvcEa4e9reGRT4iIfss4ucx9fBY=;
 b=YX7T9QBwLmfS0yI3YK774HrKTyMWkmJB4hfdxvdgMF3dkhuw3M/g1trlOitvLLyFus
 cmb5n/i7aLUlhh5pjYzAAjCGoxUpdJ0WXj1HwqSUaExxV2qWTCO2aIZyZHIu7ufQn9F/
 8SSAXbly9duWnIdfpgBmkuBUwMdKiba8PZLRM0/LMz08H6pZpsTvpeXy0f+Tpdy/Z4QU
 3LPaByv3KKlj4r9oqjzpk5AGUuY5wJJve4cwn0bOGvYDczp+EWI0tEKW6CwXbCmvvka8
 nK3SSgVZPc1tNCP42DZ0xvXsyzt0EDvRZqF+zY0+1H3/jg1ReGlwd+Wz5HPa7mDfNUnJ
 SLJw==
X-Gm-Message-State: AOAM531wcLy1yWd9x8mlvjbEFPOVe5HT3uz5EzFn0Mk/4Jg5YQRD0E/p
 AYh6baM1eBTjj5dKLn255fr7hw==
X-Google-Smtp-Source: ABdhPJwb1sw4RLzwytQW39DKMxzP/gyZ51WJCEuO/oLq5RKDk7T5QE10B7PZ3mc/x6qlq7gtnwRNRQ==
X-Received: by 2002:a17:906:bccc:: with SMTP id
 lw12mr25255970ejb.128.1639162927067; 
 Fri, 10 Dec 2021 11:02:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t5sm1863693edd.68.2021.12.10.11.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:02:06 -0800 (PST)
Message-ID: <5ef27dc7-831e-a84b-94b2-e099ca61ec58@mind.be>
Date: Fri, 10 Dec 2021 20:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20211114160803.5ce09ba5@windsurf>
 <20211115123212.11841-2-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211115123212.11841-2-br015@umbiko.net>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/mpd: correct typo in help
 message
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
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/11/2021 13:32, Andreas Ziegler wrote:
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2 (after review by Thomas Petazzoni):
>   - Config.in: create separate patch for toolchain version typo
> 
>   package/mpd/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index 5e49e69442..eb05f25a0b 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -391,7 +391,7 @@ config BR2_PACKAGE_MPD_ID3TAG
>   
>   endif
>   
> -comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 7, host gcc >= 7"
> +comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 8, host gcc >= 8"
>   	depends on BR2_USE_MMU
>   	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
