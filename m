Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEE1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:53:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3366960E97
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3366960E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4D9041578;
	Sat, 11 Sep 2021 14:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LxUdLYpTgTyg; Sat, 11 Sep 2021 14:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 289714156F;
	Sat, 11 Sep 2021 14:53:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 344171BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FE50406AE
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7zNyM2xSbyO for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:53:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62513402E1
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:53:14 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g8so7019869edt.7
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M7fGgAT5ZFAFC/H72ld+cgSFQ+7Z+zB88k5iYGkGCqA=;
 b=Zb1OpLDv9NaVWG7pcnqJuJ4OJqg+c4jlgOZQJZx4+C51uJ2SSL4E4kftwkUSKWRMn6
 2n+IhGbvBU4AoUbaFWMDWJXwxgSweKV3ahturxBXYjY+FdeVjbVgr1/cFIphT3Oubmmi
 L1qYoeGW5ia/rwLHFWSy+qpprE6o5UyWyXlHY84aDSxbQDDEUZgkG4q8oiY85XHJW9xf
 KzxQrC4A3kKWx+9UcCxIFRKuIHDvbqt1vjXen1Bn5WKm+USq03JQJLY2ViY7FaiWBwYP
 hfdpMGoHF1WJzIuNSJhy/fIA8t3t+vxgyOBMd/zgfrMbLIJIRUhPk0FWfmiI1bdYBl0i
 tnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M7fGgAT5ZFAFC/H72ld+cgSFQ+7Z+zB88k5iYGkGCqA=;
 b=VA//pgfDs/c/RZIXNadpb3WaXgUyTMNm5gqKwKQ83WXuzf9OR0ZNJmOFF4a4bmyWw2
 LpyvvvI1by7Dz4NvOQRoXldhWbEhCWn8ZNaS0CclAPyBs305kapx/Us6Uu5v001Y57kj
 p5+U1kbXKjZOG74ThPRtml9+14Tn01ZWKW9m2G8zRTB/JP81XpU1qYw2NzQB7Vqgl7U0
 ohcHWgRDBm+bEIUIrYAZvKz0a2CBAQd0VLLPLceqmM/6SbkMOQMI0HejKTY2p0enmRN1
 t+T1ydQwu9YWY8NKRxPnXs6RXaOioNB5vvN7XL/C33nNmx3Yz6poah3tp86nrIqRwrEy
 dONQ==
X-Gm-Message-State: AOAM533CAwezk+TLzDPGen554wstS4TtkZJYQ5h6lz7p6YUBQoQpPyDj
 PC5+UwB2iksm8PEMfIoaFm5uMggCDIyJKw==
X-Google-Smtp-Source: ABdhPJxcx/IcqnB/l0AHQ4kjLLH8kYb1VrrNdd7dbl6mh1fRgYR9ux/HfV41TfeEZL+hzpLb5gegrw==
X-Received: by 2002:a05:6402:524e:: with SMTP id
 t14mr3586329edd.39.1631371992653; 
 Sat, 11 Sep 2021 07:53:12 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x9sm1038835edj.95.2021.09.11.07.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:53:12 -0700 (PDT)
To: Krzysztof Kanas <kkanas@fastmail.com>, buildroot@buildroot.org
References: <fe5d4301-e57d-5cf9-7860-841639c59f86@fastmail.com>
 <20210902112848.41512-1-kkanas@fastmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <abdf55d4-63da-1791-b47b-39197c4ce0f3@mind.be>
Date: Sat, 11 Sep 2021 16:53:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902112848.41512-1-kkanas@fastmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/1]
 package/environment-setup/environment-setup: add zsh
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 02/09/2021 13:28, Krzysztof Kanas wrote:
> environment-setup used BASH_SOURCE which is bash specific and empty
> variable for zsh (and other shell's).
> Zsh Uses $0. Unfortunately POSIX is not specifying how exactly $0
> should behave when in sourced (or using special dot utility). So other
> shell support have to be implemented in different manner.
> 
> Signed-off-by: Krzysztof Kanas <kkanas@fastmail.com>
> 
> ---
> Changes in v2:
> 	- fix shell detection logic
> 	- change commit comment
> ---
>  package/environment-setup/environment-setup | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
> index e9bc36fdd093..6716c19a577a 100644
> --- a/package/environment-setup/environment-setup
> +++ b/package/environment-setup/environment-setup
> @@ -16,4 +16,10 @@ Some tips:
>  * To build CMake-based projects, use the "cmake" alias
>  
>  EOF
> -SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
> +if [ x"$BASH_VERSION" != x"" ] ; then
> +	SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
> +elif [ x"$ZSH_VERSION" != x"" ] ; then
> +	SDK_PATH=$(dirname $(realpath $0))
> +else
> +	echo unsuported shell

 I fixed the spelling mistake, added quotes around it, and applied to master,
thanks.

 Regards,
 Arnout

> +fi
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
