Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790A7C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:47:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA53F61AED
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA53F61AED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AD90400D0;
	Wed, 17 Nov 2021 20:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0bRmKXZqThLR; Wed, 17 Nov 2021 20:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CCEF400EB;
	Wed, 17 Nov 2021 20:47:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F049C1BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFF9C40546
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUyqDRAq20y3 for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 20:47:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC69F40545
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 20:47:39 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id e3so16801801edu.4
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 12:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=qAtbhveqnU1Xac2+y97oYzfkNyxj4cZ5dEotCA9RKgI=;
 b=NEDJcfF8srcjQmnWuglrtIZVMEbYLxKnw3dWtaw7RanTj4NOno1KE8bNWMWJEfbjrZ
 AD0F59z1LMM4tFAoJRd7XLdHUw7QPzLBMxJnLHI/q52NFQkjTXorzEeTAIW3Zr+REdKK
 FJIPqB4X6nes7Oy/MiR0a7hCnxvLzvlm9hqjnzAcYt+ngGF9H+f+uJ2TfONAdk+tZa+x
 2h6/POwkz4SGCwVAq1p+d/QyqsnahkY5DDKClAvuC7AKdo1LvlhnZQhc+l4LtqkDIiB1
 RTT8jziPeOH65grDjjgaG6YEDncOZdRA2xqJZDawNM1AQWbejaWvhZrsGwcw9wAfCSLB
 I9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qAtbhveqnU1Xac2+y97oYzfkNyxj4cZ5dEotCA9RKgI=;
 b=2M/YGCULcfe0XFvx+sOzSj5SQBhkA+VuoPRgrZbHail3ON6mPT7ZGE2OzZ5I+MY0C4
 1FJ+c25I7TLhOeUflhm6wTw85Gn9y893cJnVgGaLNH9Yf3/bxtvB4Zt+EapgKW8n4tyL
 FXexMoihdLpVSt7c7gK2Io04f6U+sKNTAaCb5HWUFaPYnpIFeGTffrI4WqmBb8dciwZy
 91yU3W7sgqQXHpri7BBdsJjVOzJO3nNCax5Dyveh370HORVYn3u63D6fy69aVQOcA8tV
 IzP5QayAT8RcKv8bHB6AQSlH5l58gEWyn6xLPVlWGMe8oj2llba0oLfrn4yo6Q7F8Mxx
 usrQ==
X-Gm-Message-State: AOAM531iqSDN5vcOZHoJ+j9XJFtkz4tVFTmJBNKi9DJJogKQDPKuqzTl
 n6dor6oqQCRfs98Ce4lV7avQQw==
X-Google-Smtp-Source: ABdhPJyNvlFtH3aqlGWn+jNkTvDysFzb2bl0QJTrOzIFz1H+C52iuUCzB+9Qku6zA7ynY8B/S1Z/4g==
X-Received: by 2002:aa7:cd99:: with SMTP id x25mr2422963edv.249.1637182057923; 
 Wed, 17 Nov 2021 12:47:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id kw10sm410398ejc.71.2021.11.17.12.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 12:47:37 -0800 (PST)
Message-ID: <411c91b7-9901-1323-64b8-549560cc42ac@mind.be>
Date: Wed, 17 Nov 2021 21:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211117173658.994653-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211117173658.994653-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/seatd: daemon needs MMU
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



On 17/11/2021 18:36, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 0.6.2 in
> commit c54f85ca0d2ba7b73c899a27e62c67d3389617b8 and
> https://github.com/kennylevinsen/seatd/commit/1e98727ae9dfdb23316249a4f32b3169d956e417:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: seatd-launch.p/seatd-launch_seatd-launch.c.o: in function `main':
> seatd-launch.c:(.text.startup+0x8a): undefined reference to `fork'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5219b6dac714886c7fa4d3687a13b9dff8338df2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/seatd/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/seatd/Config.in b/package/seatd/Config.in
> index 2c2efcb04e..5473b237ce 100644
> --- a/package/seatd/Config.in
> +++ b/package/seatd/Config.in
> @@ -16,6 +16,7 @@ config BR2_PACKAGE_SEATD_BUILTIN
>   
>   config BR2_PACKAGE_SEATD_DAEMON
>   	bool "seatd daemon"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Build the seatd daemon and support for it inside libseat.
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
