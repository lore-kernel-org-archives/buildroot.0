Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DBEC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BACE383E26;
	Mon, 25 Jul 2022 22:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BACE383E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64_7DyXDpCsZ; Mon, 25 Jul 2022 22:28:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C62B383E18;
	Mon, 25 Jul 2022 22:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C62B383E18
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D3631BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26464612B3
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26464612B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7Fdbb6VY6U7 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:28:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41A9560E57
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41A9560E57
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:28:12 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k12so130077wrm.13
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q5Ssn0x/VgSBhGBiMuc4T0ttbLMbd3jFiQWcLWM4hLM=;
 b=EC4IwVVKwRrNl58jEeoBRlKMhVo/BOxaKH5MnmOUGsK1asU1zF6H0+Ht1Qc2Jsehf8
 rS8FsdjziNZGTaMk6N646VL1UKvf3NJ4eTirvu28TZ+XODq/oKpndxc069v8jQk72QY4
 Wwp2rPpdmbVZrBOfdgEZ8lrArJdI5JY8H1jtCKoRJt7xBYLw96ysZ6VEBRE9yoNiNJ6X
 i72zp5DUWSDqOu+vYmCfy9SShbgB4E2/iyfKAxeiVXIONvdYs8X8v+d9KBChLaRbVKOn
 C96JiSDOOaa2+ERnQLlghLke53bf4371L8ywDOIvPnKeQkyNrH4P4/b1UPvlDeJqmp6Y
 HvKg==
X-Gm-Message-State: AJIora97iyYurCBzv0ZE1dMpjNeCrvFGI3E51NYaZr3/NWafgtPzjcuq
 W5CLK8OdnaWEOr5LlEFDVV4brg==
X-Google-Smtp-Source: AGRyM1s7YVZJQo1r2t7WmRX5QxlAvH3M215yTo8SwyXrd434dZZ0pW8ydkwv98U8tfoYUwquyjN1tw==
X-Received: by 2002:a5d:598e:0:b0:21e:734a:dfac with SMTP id
 n14-20020a5d598e000000b0021e734adfacmr7625448wri.398.1658788090289; 
 Mon, 25 Jul 2022 15:28:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 a8-20020adfe5c8000000b0021e5d77a489sm10792747wrn.31.2022.07.25.15.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:28:09 -0700 (PDT)
Message-ID: <1488a799-0480-d5be-417c-55ce128f5b97@mind.be>
Date: Tue, 26 Jul 2022 00:28:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220725194720.246080-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725194720.246080-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q5Ssn0x/VgSBhGBiMuc4T0ttbLMbd3jFiQWcLWM4hLM=;
 b=S5BrbZoVYF8l5WlxwpMvfzZZTHG5vOKvQF+RzWnww5X7sOttjj6cCjMVqBKfzFFRrg
 I0sZLRmKGQvrHt7aPOnUs4IJ9x22syhYhQzfvs79nKzxVPGb0huoIc6gUs8VvrPsFboP
 3TWekSN2n6eWT8ORFwFYSbc6n5g3NIkFhUpIxewPyPXBtwDFJlV9c16DzHW3PeuAmq15
 y7M4I8cULzyUeiqanFz9PBliH3I9YFB6QYhCweVV+EBuWad1gTvvnELh7oU8B9fDBEgX
 hWj2rxPxCe/xnmPl1NvBZ4O83P6ZjF/VkZ5OvVNJ69qTGDuUX1UTvFtYXooeSCyQdB9e
 DsLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S5BrbZoV
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseaudio: disable doxygen
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 21:47, Fabrice Fontaine wrote:
> Disable doxygen which is enabled by default since bump to version 16.1
> in commit 6f3131296484767f037d3535ab69f328e94351db:
> 
> ../output-1/build/pulseaudio-16.1/doxygen/meson.build:9:0: ERROR: Program 'doxygen' not found or not executable
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/127b87f97eb5517cd0a513289768a599081c15c9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pulseaudio/pulseaudio.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
> index 1322b25fe3..b423057ab6 100644
> --- a/package/pulseaudio/pulseaudio.mk
> +++ b/package/pulseaudio/pulseaudio.mk
> @@ -13,6 +13,7 @@ PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
>   PULSEAUDIO_CPE_ID_VENDOR = pulseaudio
>   PULSEAUDIO_SELINUX_MODULES = pulseaudio xdg
>   PULSEAUDIO_CONF_OPTS = \
> +	-Ddoxygen=false \
>   	-Dlegacy-database-entry-format=false \
>   	-Dman=false \
>   	-Drunning-from-build-tree=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
