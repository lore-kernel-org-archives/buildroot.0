Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEAFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:23:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 536B561268
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 536B561268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 251AE84061;
	Sun, 19 Sep 2021 12:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VludbztjZlaM; Sun, 19 Sep 2021 12:23:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7855B8405D;
	Sun, 19 Sep 2021 12:23:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D74EC1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C78628405D
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pOE9Bcvghq7e for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:23:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E221C8405B
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:23:14 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id j13so49429345edv.13
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 05:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=N0aqcEi3haDQsqgvaOEgEaUnEPVF+pD4fXy5H3klx7g=;
 b=Fpw39u9pThuvela+vq9m4OvNHfFf4XaqgMY/e4XSpkWiNYJEyXdTLEe9WMzUcq2yo7
 Xx88SnTjpJiOpNZLNODAjO5Sg+NxPSIVMdsVTZci2dqQOQhVbA0yYELxqnQgH8F6dw2S
 zoPfFNUkcjtDxmOCaDGpqgzj2aWj3vxT12p9HwFhqlF2CVhqCc4R2//aB1nju+8BsjXi
 O0/Sd0cufVIx/zZoi5ICkjKldKeFCgn1JPG9Z/eTv9pck2hquOcyZxVIc9J5TxLB2yFj
 XeVlsAt5xKpLyi3wyU6x6+kevbETuaO6sJVFsmhRqHUCKs6BEx1ghfdF5h574He1EH0F
 suZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=N0aqcEi3haDQsqgvaOEgEaUnEPVF+pD4fXy5H3klx7g=;
 b=ABd+IiSQtG5v0TvbvQlCcUL1j+h/wG2vUq9G1g7G5igjz/FUV7QMKXQqBkwKC9c5tO
 8Dh8PxJeyGfAuljuBGDTATVrzmVBdmK1mfxuIdKNGUctHqU5PlrmCTNUTcd4InyyG0Cg
 R0ijEiJRIRbFf2tDKCm6e1ei0i5kLAfIW+/4BtA/RvqmczLsTs0PqEgmfU4moc57cm6l
 ds5Cwb9e9B6gupPtpqMIE8tcwNaHyw7qy1vECnPLLp6w0D8IKr5rMMyUFHlvisbktOlX
 n++2rIWmcF4hXYHiwYYIibHkrBR8r0dH8Mc87arEB/BkkqNcyGqNsetrbgDBGwwuMW8C
 RGtg==
X-Gm-Message-State: AOAM533kTRL9XSfyWOpJvUEHZZ1KhlbZP7rp5A6yHZ/L4KOyhgdQs6e3
 9Yzh7HUdK0yUIdvrWcFPgOI+5BsOy6kySw==
X-Google-Smtp-Source: ABdhPJzAGuOX1wRf6YYkWSoK7KNnFK7V6+2onTMSCe7QymROkFmKrhuCEYM+Qm0EMvSWwcOP+sRKHg==
X-Received: by 2002:a17:906:a0c:: with SMTP id
 w12mr22366891ejf.376.1632054193128; 
 Sun, 19 Sep 2021 05:23:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d15sm3141073ejo.4.2021.09.19.05.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 05:23:12 -0700 (PDT)
Message-ID: <6fbb2f0e-d592-e389-09cd-fa689c81ded1@mind.be>
Date: Sun, 19 Sep 2021 14:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
References: <20210907084345.6192-1-judge.packham@gmail.com>
 <20210907084345.6192-3-judge.packham@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210907084345.6192-3-judge.packham@gmail.com>
Subject: Re: [Buildroot] [PATCH 3/3] package/gstreamer1/gst1-shark: Bump
 version to v0.7.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 07/09/2021 10:43, Chris Packham wrote:
> Signed-off-by: Chris Packham <judge.packham@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gstreamer1/gst1-shark/gst1-shark.hash | 2 +-
>   package/gstreamer1/gst1-shark/gst1-shark.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
> index caa9107bd8..be26050715 100644
> --- a/package/gstreamer1/gst1-shark/gst1-shark.hash
> +++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
> @@ -1,5 +1,5 @@
>   # locally computed hash
> -sha256  b141312603af82f600981dd7231e2ecc5a42b3550fadd2450965a0a85f62cbb2  gst1-shark-v0.7.2-br1.tar.gz
> +sha256  689e60b4e10635a4f3af795b53045c6e90643896fa07b61e164a96158a79bdcf  gst1-shark-v0.7.3-br1.tar.gz
>   
>   # Hashes for license files:
>   sha256  6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
> diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
> index ea0c5a29cd..4e7801e920 100644
> --- a/package/gstreamer1/gst1-shark/gst1-shark.mk
> +++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GST1_SHARK_VERSION = v0.7.2
> +GST1_SHARK_VERSION = v0.7.3
>   GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
>   GST1_SHARK_SITE_METHOD = git
>   GST1_SHARK_GIT_SUBMODULES = YES
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
