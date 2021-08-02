Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B8EC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:41:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3CE2610FB
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3CE2610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B6D860651;
	Mon,  2 Aug 2021 15:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5Mvsc0hKa0X; Mon,  2 Aug 2021 15:41:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1DAD607A1;
	Mon,  2 Aug 2021 15:41:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 962841BF4D5
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 836C3403C3
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yMWNu7oAgCFb for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 15:41:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C298403C1
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 15:41:22 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id f13so25008008edq.13
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gnDADaGs1toBSORL/jhgVqHMgHRXl/NEfvdYfgbZDHA=;
 b=SEHproO1X/qNS0sot9JMkNm13S9FXSmKUVP8KHJc+U7oyjU29KnRZWZA2KHfSy7vSO
 P9tbgt8qmOhuQqm330wgr7K3cYRBU0IM0QLki4OamKPFBy+cRJUGV3CadyRfDfXT+M6j
 Za6rhzN61/XikAVrzsrPcei/AHKXtx5d2BBCNpLhhcG4bTf+qu9JUxMcAr+qYxYhcV8B
 x6Ff0bull55JeyPscFUETO7TAmTZI/NjIiPzpkigf2WxDdvbIa4xtQAbK2vMOy5Cddy2
 Tmmsgtg6gk01bIeDyZlz1HIDo14dHdNm8QnEZyZgA0YwErs8Rlqd3PpMJ2VdXsdjgTRN
 qAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gnDADaGs1toBSORL/jhgVqHMgHRXl/NEfvdYfgbZDHA=;
 b=dqSKigYXl3Y2NlISPZFlGzixsULl1E/Bc81FVPikkK5EpwPfb3bd8FcniMKAFKHaR9
 eFonFQ+Ro2VCcw2EQV++AxyTFJXdKKygCCOBaUJKjwlGjWAZB1qodL/je6goOqPAJg45
 ke425M050UQYDzg0c9fXHPGHGGuMF/6b4Bi34tOUEwK85qBhmlGKydmXUgxE+oqBouci
 8INavxTIsi2iQicN5X1L9nmpJHN3W85plf3NTv3uXWv43t+mejZfEkh2GaEb++s5iSQ0
 b3j15HkSFZZFkP6RB3bAqCFgzhHZV+0rba2o0OdHKlevu6rBs7bZn7G0/4HiNPsEzMP7
 ql0Q==
X-Gm-Message-State: AOAM531ODV3kPj8iw3EnH5dNb7fDvvt29KoqaZ6MfAHrbBw/HELEG/nq
 627eTutOowWsnY6qGlCtrhL2aA==
X-Google-Smtp-Source: ABdhPJzeljad20iB9Rx92FAQorA4CdHW29hT+smqgL2M9RoDMY6fRfVKJIb+7i5BuKjebfwjZaO5KQ==
X-Received: by 2002:a50:ed14:: with SMTP id j20mr19606272eds.323.1627918880649; 
 Mon, 02 Aug 2021 08:41:20 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id z8sm4750927ejd.94.2021.08.02.08.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 08:41:20 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20210731203814.68125-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <6cc0d6e1-68c2-fae0-3a70-47c7222e42f4@mind.be>
Date: Mon, 2 Aug 2021 17:41:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210731203814.68125-1-buildroot@heine.tech>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 00/10] Slimming BlueZ defaults
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 31/07/2021 22:38, Michael Nosthoff wrote:
> As discussed in the follow-up of the previous patches to the BlueZ Package
> I did the following:
> 
> * Make the build of the tools optional
> * remove the 'default y' line from the new options
> * skim threw the packages and see which ones would require the now optional plugins

 Series applied to master, thanks!


> None of the modified packages failed to build with the new defaults. But looking at
> what these packages do at runtime I suppose they require either the audio or the HID
> plugins.
> 
> If anyone knows one (or more) of those altered packages in detail I would be happy
> to get feedback on the changes.

 I've applied the series to master regardless. If the automatic select bothers
someone, they can send a patch.

> 
> What I left out for now is how to communicate these changes to the user on upgrade.

 I'm cooking an RFC patch for that. Stay tuned.

 Regards,
 Arnout

> 
> Regards,
> Michael
> 
> Michael Nosthoff (10):
>   package/bluez5_utils: make tools optional
>   package/bluez5_utils: drop default y
>   package/cwiid: select BlueZ HID plugin
>   package/bluez-alsa: select BlueZ audio plugins
>   package/brltty: enable bluez HID plugin
>   package/gstreamer1/gst1-plugins-bad: enable BlueZ Audio
>   package/pulseaudio: enable BlueZ Audio Plugins
>   package/pipewire: enable BlueZ Audio Plugins
>   package/supertuxkart: enable BlueZ HID Plugin
>   package/kodi: enable BlueZ Audio and HID plugins
> 
>  package/bluez-alsa/Config.in                  |  1 +
>  package/bluez5_utils/Config.in                | 22 +++++++++++++------
>  package/bluez5_utils/bluez5_utils.mk          | 13 +++++++++--
>  package/brltty/Config.in                      |  1 +
>  package/cwiid/Config.in                       |  1 +
>  package/gstreamer1/gst1-plugins-bad/Config.in |  1 +
>  package/kodi/Config.in                        |  2 ++
>  package/pipewire/Config.in                    |  1 +
>  package/pulseaudio/Config.in                  |  1 +
>  package/supertuxkart/Config.in                |  1 +
>  10 files changed, 35 insertions(+), 9 deletions(-)
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
