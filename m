Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0ECC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:00:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 844B960F9B
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 844B960F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BC19817B3;
	Tue, 26 Oct 2021 20:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2I6e82g99ih; Tue, 26 Oct 2021 20:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C945380F07;
	Tue, 26 Oct 2021 20:00:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44BA01BF20D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3ED214011F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LP-Is2O7sWf8 for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 20:00:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EBD6400ED
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 20:00:38 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id m17so981900edc.12
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 13:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=CvmLdu2e0vjwEcAN0u/JG29Kwo502r69GyUN8X+SgWQ=;
 b=LQdaUWwkulWD/J4+vIfScR88mA70a8t6NX/+kUE/rtSYgSwi1rp1F9sdWy5Kubppms
 bgY7V/+HGird7TjHhv4Km61Dcx807TzqHGrKzowojMXOhB0AxrLCkCRRFoEcRsA+h/a3
 R99IJ5leNwCCDSX9OSARmuCmiawGcDxVhtjLDpdOZIiJNkvRioSKOKH2m7KZr3l0ddSZ
 yFC9GaR8SpWTPt5cHnGYcdDuSR/LKoHuUozVCXZplvRoJ2KDVOtqjwvH571DL7ENoDva
 wzjwHO6q3728kPxmj5U9Sh8ibipnx3GF9dtRcQgQyRiM3iAE+eXlIis1wfpN+Fpt284p
 2aLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CvmLdu2e0vjwEcAN0u/JG29Kwo502r69GyUN8X+SgWQ=;
 b=qhZMURN/tSEd0ZSQ02eJODviF++UZHQ6sXd//l2jrREICHIoCh+p9QCpRNLuIFIP1H
 G/JB3dC1vj4NIcbVkZqOWttJ5HtZx+fbuLkId6xtxKvizoalp0zbOTH5KJgxzuQ7fbab
 94YAR9Bn5oAU6nYT5LWCydJ6pDQIpWH9niyFta7ZgjXdneVIATdHWGTMHoK3R/+jjEsa
 oTXXPC1YE0CcVZyP5Ip0S1kh8C2YBOsheiGbFqokleQOqolrSmlbJ68vMB8+VqoQj9Bm
 8yMrWUgaL5FXStHxJT4O7Nw7EvozsvcdSY22i3AnhAXkaZge1Rgi/aZ4JJ/W46p5cax2
 0nFw==
X-Gm-Message-State: AOAM532qCiU0zSdK3PEB8NcmlsVxqqXMBQK2NN2iSc56ELWqtLlFZLTr
 o4V1SyU01RnvEFQENF50mi9AlA==
X-Google-Smtp-Source: ABdhPJyewhmfIeazcniHfZl6+WfUGpsh6js+9H6j1mU6CTCoFGz3kEG34s0R2f1DrbeebE0we35jvw==
X-Received: by 2002:a05:6402:1910:: with SMTP id
 e16mr39300701edz.176.1635278436056; 
 Tue, 26 Oct 2021 13:00:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f3sm9748208ejl.77.2021.10.26.13.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:00:35 -0700 (PDT)
Message-ID: <9167208e-db59-a055-0a09-7e84ed05df4f@mind.be>
Date: Tue, 26 Oct 2021 22:00:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211025082809.3967881-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025082809.3967881-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-ugly:
 remove examples option
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



On 25/10/2021 10:28, James Hilliard wrote:
> Fixes:
> output/build/gst1-plugins-ugly-1.18.5/meson.build:1:0: ERROR: Unknown options: "examples"
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> index b3dc765d07..a25110264e 100644
> --- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> +++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> @@ -14,7 +14,6 @@ GST1_PLUGINS_UGLY_LICENSE = LGPL-2.1+
>   GST1_PLUGINS_UGLY_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
>   
>   GST1_PLUGINS_UGLY_CONF_OPTS += \
> -	-Dexamples=disabled \
>   	-Dtests=disabled \
>   	-Ddoc=disabled
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
