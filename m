Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DD5C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B165840650;
	Mon, 15 Jul 2024 14:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18gR_L843Thp; Mon, 15 Jul 2024 14:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F23C40734
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F23C40734;
	Mon, 15 Jul 2024 14:45:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E43E81BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1B9A80FB0
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TigUMTg8H7Mw for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB66780F6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB66780F6B
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB66780F6B
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 14:45:11 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52ea2b6a9f5so4555990e87.0
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 07:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721054709; x=1721659509;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wLtZosCw+mrmrg+0zZsHGx03MiB86EoZAVF3u4EHATU=;
 b=EH1OqYpcrjjPdWHRIAP0xQGsnUGnoWJkrQERkybT9F0wmUyCSN9y8UuiMTA1967WBY
 SenIr4Pr8/BHzvNsNMKXW5UMjuAGcxQ66OyBxDzPOgnarRlNLZFCQxngbVlqcko8AVay
 k3G/qKO3f09gveiCyiH4dU1GEmWDvtmQxfdRiWbHjFP2+7yepw/JR4G2Unjl2fm0s1aT
 Ra47MQI0XUWFXUuG2ZRKn+UbVShgIBXmP0gQjiQXOj8ZSaAS9QJC2trPjUGzkisVL0qw
 S/jhY20lMEOn3Q8HKo1JNiI5CUvdSlMnwtttz4a/35clR9Za2X5sM4BPb1XqmumhSGRS
 ujVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmwFbr6ueB7tNQ0oo0BWh5GaWVOgnV9jdR0mO+r8MKCbaRNweracE1v+JPBoyoLJfbqXLiBIb0wPp4oVZrFC22ntrpk34=
X-Gm-Message-State: AOJu0YyhlXlAsfCFyqkJdi0GnWQpiNi0O0/mamnwXiEYSUcRjdHWqwm6
 xnBzxKelfFfI3ENMe5nsuvjfTvqEOoPMcO7jSHWTorZ8g6prBBELMAXzXqzFl6I=
X-Google-Smtp-Source: AGHT+IF8glQK/fzDzorpo+jghicB0AuSDW/o5bgmC9TWsjMjJ9em1M9xOXw+2q4R3w3pQotgXtoYbw==
X-Received: by 2002:a05:6512:2810:b0:52c:e326:f4cf with SMTP id
 2adb3069b0e04-52eb999125amr15097354e87.3.1721054709527; 
 Mon, 15 Jul 2024 07:45:09 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d73bdsm125489485e9.43.2024.07.15.07.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:45:09 -0700 (PDT)
Message-ID: <71b4d966-06d9-4c55-ae02-d81dc3f133a5@mind.be>
Date: Mon, 15 Jul 2024 16:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20240715134109.508868-1-francois.perrad@gadz.org>
Content-Language: en-GB
In-Reply-To: <20240715134109.508868-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721054709; x=1721659509; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wLtZosCw+mrmrg+0zZsHGx03MiB86EoZAVF3u4EHATU=;
 b=fgiaWXMEQ/7Nz25iuY5xyDg3noiaBgYRBP28+ibr05Tpfyw0t0fast1P+aNpL7z7AF
 G+pqo1nZpX4Eg/DZhUhOHMI7hOhGsa3+BPAGcIW3aVslWILptWcoGrSyQbwKvXr7YvZD
 Mlel2q6C0vWwU0UfeU+iNVBiM9ZDo84YA1e/+k2zCgf+K6XrVhhIhjO33aJWc0aSwfhk
 Tw2qgLbOLTIdSlGvg/8cFKDnVJi9ee3MraRzr/oXQYezMuUCr7eUiv5P6aP089fwJHVj
 3CoJKVx7n1Uz5TldCaajtAS109uQ/gwBuDAe3DN0N/MNk/kzN3vjctW2fN+c+cHGcxN4
 V/kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fgiaWXME
Subject: Re: [Buildroot] [PATCH] package/gdbm: bump to version 1.24
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/07/2024 15:41, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gdbm/gdbm.hash | 6 +++---
>   package/gdbm/gdbm.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
> index 7449d5dc9..a9df48908 100644
> --- a/package/gdbm/gdbm.hash
> +++ b/package/gdbm/gdbm.hash
> @@ -1,6 +1,6 @@
>   # From https://www.gnu.org.ua/software/gdbm/download.html
> -md5  8551961e36bf8c70b7500d255d3658ec  gdbm-1.23.tar.gz
> -sha1  50ba1b1d45ce33fd44e4fdaaf3b55a9d8f3dc418  gdbm-1.23.tar.gz
> +md5  c780815649e52317be48331c1773e987  gdbm-1.24.tar.gz
> +sha1  7bd455f28c9e4afacc042e0c712aac1b2391fef2  gdbm-1.24.tar.gz
>   # Locally computed
> -sha256  74b1081d21fff13ae4bd7c16e5d6e504a4c26f7cde1dca0d963a484174bbcacd  gdbm-1.23.tar.gz
> +sha256  695e9827fdf763513f133910bc7e6cfdb9187943a4fec943e57449723d2b8dbf  gdbm-1.24.tar.gz
>   sha256  690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
> diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
> index e807a8e1e..1a2c352d7 100644
> --- a/package/gdbm/gdbm.mk
> +++ b/package/gdbm/gdbm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GDBM_VERSION = 1.23
> +GDBM_VERSION = 1.24
>   GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
>   GDBM_LICENSE = GPL-3.0+
>   GDBM_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
