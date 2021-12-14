Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC65C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 005F8409A8;
	Tue, 14 Dec 2021 20:05:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UjgUS1yudCQ; Tue, 14 Dec 2021 20:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6675440928;
	Tue, 14 Dec 2021 20:05:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 681BA1BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55A15405EA
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_aCBvr79nMy for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:05:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0550340114
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:05:35 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b7so7766145edd.6
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=P0srrNawMT4LMDHTcgoGH/R/OXlTPJvwKX87xX1FshY=;
 b=TmcSn5ZnDr2ZtaiQMoN3ouJRK7mXeut1FYA28dBhIVqMJeBMp0RVf+3CfWpEy0i+Wk
 n48JvXH21HF5cpGRuKCr44AjbL+DIBP4mLjnIEZoh3Vod557QNrqM611DRE+MWcgriGX
 wOGtGZUft875Yid4sLuHpjcHedAJpm2ZdQEzTd5NRnbs0L4d2roe+EgPElZN9LG0OJ4w
 2hD2E2gb9fCNgGggbfuRwPeZElhK8cw7JwRH53Jrt7cvRi3hFbcokjZB3UM1j8L6rhxb
 mCA9g1ybZs3iURZ+aJgu61U1PEc8DSG18As0G06TgqZHH9y/Q/ENA8pxzPLBD3nl35qG
 RRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=P0srrNawMT4LMDHTcgoGH/R/OXlTPJvwKX87xX1FshY=;
 b=pzgKxZe0j+tihZ79UCuy6lFPro+Qu8oADhT5CbU+m+FP7rrnM4eLgpXOHq1OIjApVA
 W3Ue7B3sIkAYi4nQOmjzbHqJ2IHINNMEKP6Uez2h/RYB9z51iHFYb8hP8SKia2dtcK0A
 CWxvb++hKvpyVmlXdPYHNUpSAaykcerxS3E5RIkZgVWtkyL/K+jfHn4ZsqvQBUXLQSOv
 VX9cb05/8uUXTVldPXZVcakwEGha4j0fO+uflVmiXPUxW5Co/YUt1uOs+5gXw0aZSnga
 4VJTECW2Yxdi91HsVq9jLEcz73EHmTSQgReIjXZAG322uDeYtFEv6iZXftF04s6n0o7p
 ZBFA==
X-Gm-Message-State: AOAM532nsKg6RwJPcOEc5N8q904xIE/caikBQvWhypBTczlpW3f29j4/
 aBrGc6dqWJxmm0xZ/eKlAhhbEQ==
X-Google-Smtp-Source: ABdhPJyHtXNGZ4sahjF2MaDWYTZ/ZOIeExmWqObq/760ujJwvm/Sruze/7MR9AqIAC69BUyVFO8PvQ==
X-Received: by 2002:aa7:d052:: with SMTP id n18mr11036430edo.104.1639512334289; 
 Tue, 14 Dec 2021 12:05:34 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z6sm320203edc.76.2021.12.14.12.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:05:33 -0800 (PST)
Message-ID: <3e1c568f-7d86-bb36-1189-db15dc15426a@mind.be>
Date: Tue, 14 Dec 2021 21:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20211213063402.792467-1-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211213063402.792467-1-br015@umbiko.net>
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: add Andreas Ziegler to
 package/mpd
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



On 13/12/2021 07:34, Andreas Ziegler wrote:
>   to monitor issues and changes.
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3023526427..4b4e59cff5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -133,6 +133,9 @@ F:	package/wine/
>   N:	Andreas Klinger <ak@it-klinger.de>
>   F:	package/ply/
>   
> +N:	Andreas Ziegler <br015@umbiko.net>
> +F:	package/mpd/
> +
>   N:	Andrey Smirnov <andrew.smirnov@gmail.com>
>   F:	package/python-backports-shutil-get-terminal-size/
>   F:	package/python-decorator/
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
