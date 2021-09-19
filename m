Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A344AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:36:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB73361268
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB73361268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9934640486;
	Sun, 19 Sep 2021 12:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Pqig96xBVHy; Sun, 19 Sep 2021 12:36:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A40A40488;
	Sun, 19 Sep 2021 12:36:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20EBB1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E06860704
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tA8PtebiJO-P for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:35:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C265606F6
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:35:58 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id t6so49460357edi.9
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 05:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9f63zYPGg4jkYnxxKd419fifxwQJQTHgUlPt0IpEe7M=;
 b=JfujwiEnBe+99Z7s7/LRHmlHqz2hddvJa/YHpHhv3hlzJ3cvFDeqC9HkP24sI+J/4x
 uI79EObCyQX5cVO1Uu4JSB4873NZL3u+or9tODUfqiWaqUjCw+OV5zrk4ilZz/owq02P
 bRcFMBHbC9bU342ETq3v2zK7PbhBXcqKtPeL0i2D6Wr3r4m2Se4Bey+RHOSa2Y4iTeU0
 BKGlZMrXpPDsWlEL8+YXRi5a9KLoDPDgbc6mx/wnxs68Ab967aCCqrY/VNwzBBlIRjCJ
 J2CZM0u69Ro/JEoU4LTw4Q/QDy19zz5pkZzD1WGI1KX3JzYjidXy3oiIMlu3CI+zSVwZ
 wHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9f63zYPGg4jkYnxxKd419fifxwQJQTHgUlPt0IpEe7M=;
 b=w8TUMoVf5lUhOYMvpX1Bywt1iJk4nuOQrKmizG7S4YHHeQBmGi6RYm60RC1tzjHWNo
 RQ5DELKb6iM9sneM7siKxP8j/q9/GgZFQ2XGl29T2c7FbA9iWOK6W/hokL+9ds9ptNMu
 YMiGKDsx0p6RSoKKr4FHaWKpEQQ7x9WsTdI75ynBvpP9iH3Le/sYcE37fdU2PWIMsdNm
 NnpuQbMobbtof+3kYNtHJBz0p7r8tmAIwFxZY/a+lIHbEuz9iK3nKisPHO6OZSIfQfZf
 EsSSyibwFvHk56KMaARXyxF4yODxfd4Rh9bbLSKs0fpIl0XAOPzeYJcQp/OfbQKK4lag
 GNDg==
X-Gm-Message-State: AOAM532+dVX2PRsBP96e82TKmxPUmcr1tZkdW6XfL+h5xl6YdF0HCtI4
 ij+qjAu337kZZ29f9ZmUcSv1uatRozUZBw==
X-Google-Smtp-Source: ABdhPJy+/V33qJ8ExYa3tt23lrmi7KxuriWoZF92oJEIyKHWs36XMuPylXU9RMQw1XsjWnEdihlLYA==
X-Received: by 2002:a17:906:4ed2:: with SMTP id
 i18mr22298476ejv.528.1632054957257; 
 Sun, 19 Sep 2021 05:35:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s26sm5650836edt.41.2021.09.19.05.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 05:35:56 -0700 (PDT)
Message-ID: <ecec6557-9d20-134b-497c-e6c7e55deee6@mind.be>
Date: Sun, 19 Sep 2021 14:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20210908081630.3404221-1-kory.maincent@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908081630.3404221-1-kory.maincent@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-a-toolchain: bump to
 version 10.3-2021.07
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
Cc: thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 08/09/2021 10:16, Kory Maincent wrote:
> Update to version 10.3-2021.07.
> The old version contained a nasty nano.spec. The nano.spec file was adding
> -lc_nano option but the c_nano.a library was not delivered in the
> toolchain archive.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>   package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash | 2 +-
>   package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk   | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
> index b18e56c151..26b9f1be1e 100644
> --- a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
> +++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256 ac952d89ae0fc3543e81099e7d34917efc621f5def112eee843fd1ce755eca8c  gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz
> +sha256 8c5b8de344e23cd035ca2b53bbf2075c58131ad61223cae48510641d3e556cea  gcc-arm-none-eabi-10.3-2021.07-x86_64-linux.tar.bz2
> diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
> index d7088892ca..1bbfa45d78 100644
> --- a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
> +++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -ARM_GNU_A_TOOLCHAIN_VERSION = 9.2-2019.12
> -ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/$(ARM_GNU_A_TOOLCHAIN_VERSION)/binrel
> -ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
> +ARM_GNU_A_TOOLCHAIN_VERSION = 10.3-2021.07
> +ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-rm/$(ARM_GNU_A_TOOLCHAIN_VERSION)
> +ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-none-eabi-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-linux.tar.bz2

  Err, this can't be right... 'gnu-rm' stands for "GNU-based toolchain for 
Cortex-R and Cortex-M", and "arm-none-eabi" means it's a toolchain without libc...

  So either someone made a huge mistake at ARM, or you haven't actually tested 
this patch :-)

  Regards,
  Arnout


>   ARM_GNU_A_TOOLCHAIN_LICENSE = GPL-3.0+
>   
>   HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
