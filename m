Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7652C6379F
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 21:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B4F660FAD;
	Tue, 14 Feb 2023 21:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B4F660FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YyxqF4KSoZo7; Tue, 14 Feb 2023 21:27:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEA9860F99;
	Tue, 14 Feb 2023 21:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEA9860F99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D0281BF2B3
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13DE7408C1
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13DE7408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7euX4wuf3Hnb for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 21:27:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CD6540894
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CD6540894
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 21:27:41 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id jg8so43421778ejc.6
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 13:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EWB3l4yswHdJ5idHgm1aKHGqo3cyZ1IQmkao+te4I7c=;
 b=hqLCfuBGaEqeU9Oh28+sALdPkIZyCRWJotvfL8xUwhqjtwG4Yzw2ZrzXA+CH5dyIYk
 Tki/YwEMMG0jFPXiPHAvfe76eSTZUINo3BwIfW0J3rUvLTvMfu1vS6pL/KbSGlDz2VId
 GXpsrklyJOwaGeKF+gGYU6Se7z9p7WnAGeNGHb2Jj67Js+AvUoRzyxfoKZMek4B3FyxZ
 /Lixqp7jIfvRQhIAIypito9ckdyoT1dysEyjht8gpsJRBQkaag5fGjHP/3Tgh94NnMDP
 dfQA8AX5x2lnTTKybQbsPgKmfsUMtykmTEClsyS1knRQHr17AunpNUsr+qW/DjILGj5b
 Mo5g==
X-Gm-Message-State: AO0yUKXrjclHW6Rc1mIzZG56NWGqaNwhQycuamQYwPVqyNsGo5uMYqfU
 2m1XWFwKMjPzvQ0tV59pVcuLfOqyFtwrAqZ4
X-Google-Smtp-Source: AK7set9wD+PWphuIiO05fPE5N6Dyn7KB2voxgucztewk6dI+862C2wh0leMzAFymqTSXObsCkaHxpg==
X-Received: by 2002:a17:906:4dcf:b0:8b1:3135:a63b with SMTP id
 f15-20020a1709064dcf00b008b13135a63bmr3725502ejw.9.1676410060252; 
 Tue, 14 Feb 2023 13:27:40 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a1709064b1900b008b05b21e8aesm5842441eju.172.2023.02.14.13.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:27:39 -0800 (PST)
Message-ID: <91a00522-fc54-e631-5598-158a0aaf7d0c@mind.be>
Date: Tue, 14 Feb 2023 22:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230211184346.1192333-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230211184346.1192333-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EWB3l4yswHdJ5idHgm1aKHGqo3cyZ1IQmkao+te4I7c=;
 b=N3ImzWvRf87In2/d5FtvaoYy8hJhPYH5x6U0ibVptfeYqGpdkQ8z77fviBRhKB5Mmg
 BTZM2tozpEbIIp0FEiZDZW0T2zgFCcmQFwtGFXg+L8JltLTvIzT9Qw6AqdTvvBUVngNh
 yLnGss+NPNtXPEyVfr8ehBWLHgMe4GwtlNOx2XBiYowIuYpwVqeemmWVUtZnXmoGyYhk
 i9kfP6IwESM4xHQHEME9UnLla+Gc6yP/SX/RFBZNjzH9o/W32zMDZN4aayD4UUuy5Zv4
 /VAwROLSqBZMFI/L6qFz0XlDrxBRTJl74f563WhSMUKSWYlvHbB6TpT7fLptpCZ/KaAN
 QMvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=N3ImzWvR
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: fix rule order for legal-info
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



On 11/02/2023 19:43, James Hilliard wrote:
> This command relies on the clean/prepare operations being in a
> specific order.
> 
> Currently the execution ordering of the clean/prepare operations may
> change, for example if --shuffle=reversed is set.
> 
> To ensure the evaluation order is always correct use double colon
> rules to make the evaluation order explicit as per make docs:
> 
> The double-colon rules for a target are executed in the order they
> appear in the makefile.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   Makefile | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 4880b426b5..09575a5e3c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -839,7 +839,9 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
>   	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
>   
>   .PHONY: legal-info
> -legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
> +legal-info:: legal-info-clean
> +legal-info:: legal-info-prepare
> +legal-info:: $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
>   		$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)

  Like for rebuild, reinstall, reconfigure I think the following should work:

legal-info-prepare: | legal-info-clean
$(1)-all-legal-info: | legal-info-prepare

(the last one would be in pkg-generic instead of here, of course).

Although in this case I think a full dependency should be even OK, so without the |

  Regards,
  Arnout

>   	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
>   	@if [ -r $(LEGAL_WARNINGS) ]; then \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
