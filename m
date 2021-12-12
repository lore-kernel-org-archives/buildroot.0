Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7137AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1793A60E7A;
	Sun, 12 Dec 2021 12:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8-hgz5P7_iv; Sun, 12 Dec 2021 12:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AD8F60E6E;
	Sun, 12 Dec 2021 12:20:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 491681BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45E9F41E40
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WnYFxQVhSCfz for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:20:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D66741D0E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:20:39 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id e3so44414734edu.4
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dI9OswgNMYwP0ntTX8Ne3Ho4pM25/KS4NgpCCvohWeQ=;
 b=XB/Sf9BaKxhI+cQ+flJy3WZ0tGfZ25u4opTvfsG4DKw4thITW/yUpPlNBh6f4cfUvM
 ACXdt7P6FOn5FIMibMbFKBwzhtOY6XSVGhGIpfZUzlMk56dWtI2tu0PwvDqqtDHG6PET
 nd2wasjdUR8/GH7bF7LNKZO2jkw8iLjX1iiqBhuaOnxKW5KGCQdfIpHzMAS8KUibDm62
 h8cqWi30aRxvJq+DaH6dLrkuThcM4iiM/r21RWUkKjr9OLudAmQzG8t17wXQizc+2OMp
 4CPEMloxaYsU8ZqthCLDPfFMwEAqbHtMMpXifxhu2aNKWk6WDRlEKGNI13V7TGVCNASH
 Lgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dI9OswgNMYwP0ntTX8Ne3Ho4pM25/KS4NgpCCvohWeQ=;
 b=Bg6FCuuzhX+lHszvlGMb6HKabJwWxMp89iMei1mqyfiZzirN6HZ3rUHEakfvTfNDgX
 ioe5Qqeg2IqTcljqWlHV/tItacsB14rLHeN1h9k64aVzaF/RMNALlswDJE3TyoiUjrDL
 bMEXHsWAhozmohVajMCTgZUDEopL/1HWz3WXXQblrogS9Pm7RnAGB7LwK6EM6SO9OVQ9
 0/VjFTlA/Sw++zwMrHAKETPC1c5KLuxXXVRfkRQbYg5J3l2SyAEAkcMUS9MgR7sod63O
 8JAx68B6/YxWYQtcMLnrAuZLj7Q5tMsjLa34GBImizd9FQPRdSmpTS89rmNAi67ser0V
 eskw==
X-Gm-Message-State: AOAM5302BQ3O2D47OcjhdTxcVem9wYQ6Oy5liTaqfUstnPR9S0N3QjQC
 Ms+WMHVyPg1WTPbapQp4vlfKzA==
X-Google-Smtp-Source: ABdhPJyHyqDICb2TwM/QP2crMFB/3yGkCup3tj7+k28uafchLcTCjOA4zIgSjc1y5V1Ohm8XysOvww==
X-Received: by 2002:a17:907:7b9b:: with SMTP id
 ne27mr36336074ejc.79.1639311637909; 
 Sun, 12 Dec 2021 04:20:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z22sm4757993edd.78.2021.12.12.04.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:20:37 -0800 (PST)
Message-ID: <64c7b116-ad4e-0480-04d4-c19ac50438ba@mind.be>
Date: Sun, 12 Dec 2021 13:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211208010816.3186969-1-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211208010816.3186969-1-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/polkit: enable selinux
 policykit module for refpolicy
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 =?UTF-8?Q?Alejandro_Gonz=c3=a1lez?= <alejandro.gonzalez.correo@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/12/2021 02:08, Adam Duskett wrote:
> This is needed for polkit to work with SELinux.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/polkit/polkit.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
> index a8b91d21bc..a7ab725c81 100644
> --- a/package/polkit/polkit.mk
> +++ b/package/polkit/polkit.mk
> @@ -14,6 +14,8 @@ POLKIT_INSTALL_STAGING = YES
>   POLKIT_DEPENDENCIES = \
>   	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
>   
> +POLKIT_SELINUX_MODULES = policykit
> +
>   POLKIT_LDFLAGS = $(TARGET_NLS_LIBS)
>   
>   POLKIT_CONF_OPTS = \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
