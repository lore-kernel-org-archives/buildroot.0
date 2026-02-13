Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A873EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B8C5613C7;
	Fri, 13 Feb 2026 19:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RgVqeuYwmhQc; Fri, 13 Feb 2026 19:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 315C261400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011552;
	bh=a7sw7iZBxfYnqWpYWaL02xtX6PWoQ4OvtETV1hibisM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cbIGvjv8ucWRBH1/v+1wt+p5WYfaEw/qQq+2VvEiJ9vfvYgG/nd/st2IgwdUuAhzF
	 WdFLrP77/EQHcxy0eR/StlLDmno27TO0PjkkN6byxrDNbeOV2grKh3cd+Ba1AVJyJ5
	 wKzvywc2+12qu3kkL9wE7lv9JTmjcW8WX/p5aPPAIIdy0HK8P2vbiacuLWN+z9kWyY
	 upAOsbjXhEs0nb2+XQbbz/4T+uaiUUfwc+d0+xNHREWXLyewHzi5tGCX4YYbLr7GST
	 EEj6jy0HokNBu5ZpafmNZBEfkzVmb8R3k7X+YCQ44ItKmTJqfoR68kxsKxLuDv6wpw
	 5qU3KNA23I75w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 315C261400;
	Fri, 13 Feb 2026 19:39:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D71EDEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4A7341FC8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkAAUKWiI6Yi for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7776F41FC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7776F41FC6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7776F41FC6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:59 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso15275855e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011477; x=1771616277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UAGUYQW3HqVEjSNhL+jtdHcgR/uQ0XT1RNaqsOqmRwA=;
 b=l5vRj2Yc9v6PwMHnKQLlc+l2L7IQiR7JJIp2T9K77UYI9+vCHm8qqH892PwPWUWjmV
 8ykRQAlznR+L1/TYgV8Dzt18mx8k6lb3mfmtgeq6rkkKmW78JYlwa91Ra8yCde+BSPZu
 qhMWSWKmCRCw9biLN5O6Uuv/8lcoE1KnZNLaHIR/4YciMo5d69+CLESt2avMQqg9Q0fT
 81sd2LQ3+FwtoKlAEV3ZEf+PdMzyZMbOV8NsJfeHoUELrqEvCNI7H0SDNRWrmRtG0Wf6
 R50MQ6TwpC4rTKZhALqy4iXQu2Dwc3XC4JWbna0LZfhhxwcFf4AunmMVJyA+amdvJUH+
 W++g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7fxAGtw8LZNFWotb3cP9TVbZViaxLdCfmAC4EHmIs/3qR2uLo0139X4fIn7tVuSH8kHNRDItpH4E=@buildroot.org
X-Gm-Message-State: AOJu0YzdP6kg/roo4WiWv3ccxVYwSI/M+u6a81CMHehlee9yidkFIpML
 N8ax/Cbsluqnaw8LcHFysCZWes4l+9DV7zKsuQbBz5vSmahg2GyxPevglDdK7lx5MEk=
X-Gm-Gg: AZuq6aI6Kz402Pw2iwS0CSjgE8qAbdko1iUBqH6zKR4HnsF6NUtUMqqsmOBzaFZZPo0
 1e0WuIrhuYwBTlUaHM5//x2cAJVAc9x8ovaJE42L/ZZK60YOdxXfWaAtgy04Psb8ahQlmFhvuKU
 pzjY8HTubTEX1+kkhM3i2VvN68T3mjjssgLqvz17kILIeJjqXqYFR7YQd1RYgjOJGsrPS1YNOo8
 XNJir6hwr8i40BewCBG6fZL7nMnYu1VOc9BpX9CzxBHJRoVVuP8YQxLjSLw9FDhmwYJ3abBi+Y8
 RQL86tF8KW7Gz25AGl/NQGdDdoSxsmCjkdrXQdR28eDu8Q30JodscVTV+XZJh8AlZ5wl9Wc4Pko
 uo3Iqx5K2eKKpFYxzLIltH3LRseE7hzupcNTbNhPmmddwTMtmiazNluqPuC23m6k2NsLoP0+Spx
 uafVwkqGxUHM0iKiHxuKP/QdEc+w==
X-Received: by 2002:a05:600c:6814:b0:483:43da:6c87 with SMTP id
 5b1f17b1804b1-48379c14894mr6432415e9.33.1771011477520; 
 Fri, 13 Feb 2026 11:37:57 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d78cfsm401639185e9.1.2026.02.13.11.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:57 -0800 (PST)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:56 +0100
Message-ID: <20260213193756.41112-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125122938.260135-1-ju.o@free.fr>
References: <20260125122938.260135-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011477; x=1771616277; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UAGUYQW3HqVEjSNhL+jtdHcgR/uQ0XT1RNaqsOqmRwA=;
 b=hbwKYEWW4Mo1Q1l08HwgFlANkIx+Jl/lu/KscmQYQIZRURxiLgJgu1MYPwxghwFZeq
 XYqkeFmloKEMBbXMCtP1mlQctQz/jf2DRMQrsm6dQ6LXb+kGb/qTmQ8rOAf4VHRjTAIj
 GFKSjVsm/chlGU5VD8QtUOF1WPdFNQitxQwSw/4z9b1qnP/6V+N2t5MRm7u5T+ZL+DO9
 6pEflYSNw8AQcosSjiBo88nx8RceyMgIK6Pdfw8uZHTrBP81APBwY/6PhSURhjP18pCe
 VQeLso5IFIGG4NLDM7xKhk2OWdiLBCSn1bs2Z7+imHEmrSsliSrcN2LN+k+qP4Ar14bq
 NPPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hbwKYEWW
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix
 RuntimeError with python 3.14 asyncio
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
> When running "make pkg-stats" on a host with Python 3.14 (e.g.
> Fedora 43 for example), the execution fails with the error:
> 
>     Checking URL status
>     Traceback (most recent call last):
>       File "/buildroot/support/scripts/pkg-stats", line 1387, in <module>
>         __main__()
>         ~~~~~~~~^^
>       File "/buildroot/support/scripts/pkg-stats", line 1368, in __main__
>         loop = asyncio.get_event_loop()
>       File "/usr/lib64/python3.14/asyncio/events.py", line 715, in get_event_loop
>         raise RuntimeError('There is no current event loop in thread %r.'
>                            % threading.current_thread().name)
>     RuntimeError: There is no current event loop in thread 'MainThread'.
> 
> This is due to a breaking change introduced in Python 3.14
> asyncio.get_event_loop(). See [1]. Before Python 3.14, this call was
> creating and setting an event loop if there was none. This situation
> is now a runtime error.
> 
> In order to fix this issue with newer Python version, while keeping
> backward compatibility, this commit replaces the code:
> 
>     loop = asyncio.get_event_loop()
> 
> by an explicit event loop creation:
> 
>     loop = asyncio.new_event_loop()
>     asyncio.set_event_loop(loop)
> 
> This commit was tested on a Fedora 43 host with Python-3.14.2, and
> with the Buildroot Docker image plus the python3-aiohttp package
> which is a Debian 12 with Python-3.11.2.
> 
> [1] https://docs.python.org/3.14/library/asyncio-eventloop.html#asyncio.get_event_loop
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  support/scripts/pkg-stats | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 7d9170e30f..d2d36257d9 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -1365,11 +1365,13 @@ def __main__():
>          pkg.set_developers(developers)
>      if "url" not in args.disable:
>          print("Checking URL status")
> -        loop = asyncio.get_event_loop()
> +        loop = asyncio.new_event_loop()
> +        asyncio.set_event_loop(loop)
>          loop.run_until_complete(check_package_urls(packages, verbose=args.verbose))
>      if "upstream" not in args.disable:
>          print("Getting latest versions ...")
> -        loop = asyncio.get_event_loop()
> +        loop = asyncio.new_event_loop()
> +        asyncio.set_event_loop(loop)
>          loop.run_until_complete(check_package_latest_version(packages, verbose=args.verbose))
>      if "cve" not in args.disable and args.nvd_path:
>          print("Checking packages CVEs")
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
