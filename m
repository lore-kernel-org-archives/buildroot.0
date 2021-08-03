Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF102C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:18:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AED0460F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AED0460F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 858ED8444E;
	Wed,  4 Aug 2021 01:18:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4fNaeFSAN4wH; Wed,  4 Aug 2021 01:17:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFE4A84451;
	Wed,  4 Aug 2021 01:17:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B43671BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1713831B0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iGaHvIY0WyEa for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:25:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C21FF82980
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:25:21 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u3so653708ejz.1
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8xgfd8h9JGUjruVEq8DVzRgb9j5cB7xGZrkhX+jGruI=;
 b=L5M8G8kCsc2YNUHVWlY8HCTixcIL43ihxakeocFX0hyP9vlxhHRzrvMey7dO0SRVrG
 9OxVLjhbQgZijISBbFxtz6l+aM0ZQYtJ8KI5Q+S6SmvCmSyuoEf/u80QpHi62dzc1haq
 vI0qo2ZH0Aqt0GuCK/phvwzjIpEVA3qFEKztMcsY37xBPwN1Cp8dFIPde0FIhLa1T6IV
 FzXfvId+BHC+uzbfDKx+jFOz93XTt1OIPRlKMAgD8E2Y6al6rcB2bUEaoQIuP30I51Dy
 +Mmi3k3oVKF/NnPS4OsR7t7iPQf0FjLiHjBcjL5dLqcQQ1j9n6nrbhzNUsDH1C048IEq
 E3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8xgfd8h9JGUjruVEq8DVzRgb9j5cB7xGZrkhX+jGruI=;
 b=mCk5G/Cx6QO3TwrlAee5ypFds22YTV+J+KKCYIX6jr+UTxV8dPafehyJdhT5YwIgWh
 GyMykWt4qu5I/PQxgFHoC89Is6fUOyvN8lpMCncA/sVZckPta/ovgUxll8c70jT2Lh9V
 GH3TvKB11cB5Mu2qL7V7HHzYLBGt/Qr4n2pQIInvS/O8n7yVnhjZQ1WZMGpX0cJr+wuE
 XLgIkFFgdIuaOl/nkGVMLqsyzxN0uxGVOSvG8Q74xofykoMCYAmud5RCvrpxv/zfBBJu
 aO7lo16QuRtGAhUdPZGgwunFv7YuhmJb4+KdMgqkyV0T4SDdvXuLlkStD6ZRtnSC4sL7
 eT5Q==
X-Gm-Message-State: AOAM533vdNBy6gukZll4QfCuBJ8aI13WDWLyupbmR60gkIhP3ZtfbBeE
 bzZbwplczGHC7c83IBBU14/uXAHRloJHF9CJeH0=
X-Google-Smtp-Source: ABdhPJzu0sBeMukQYjLZ2u81HsYEOUt56M1R0rCe9r5bFr2KF9ayW5nvz2tgx340Xv1Lhgh0hiLUeA==
X-Received: by 2002:a17:906:8741:: with SMTP id
 hj1mr22651664ejb.140.1628025919973; 
 Tue, 03 Aug 2021 14:25:19 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id n16sm67925edt.31.2021.08.03.14.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:25:19 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20210803123330.70319-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <7cee3c4d-2b54-6c33-1dd6-5e0aad1b3aea@mind.be>
Date: Tue, 3 Aug 2021 23:25:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803123330.70319-1-buildroot@heine.tech>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/bluez5_utils: hid2hci needs tools
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 14:33, Michael Nosthoff via buildroot wrote:
> fixes:
> http://autobuild.buildroot.net/results/9f91d530c22cad053d89a7bf54c4567d3012d05e
> http://autobuild.buildroot.net/results/80b90e1b6fee99ed7bf4aed87a14311a12469993
> http://autobuild.buildroot.net/results/444eaab22b140b26a730c7fdd4bada71a8d6fef2
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/bluez5_utils/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> index a8232279bd..2eea8c7ced 100644
> --- a/package/bluez5_utils/Config.in
> +++ b/package/bluez5_utils/Config.in
> @@ -143,6 +143,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS_TOOLS_HID2HCI
>  	bool "build hid2hci tool"
>  	depends on BR2_PACKAGE_HAS_UDEV
>  	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
> +	select BR2_PACKAGE_BLUEZ5_UTILS_TOOLS
>  	help
>  	  Build hid2hci tool
>  
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
