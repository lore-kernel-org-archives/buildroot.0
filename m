Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596B3C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C625B4092E;
	Mon, 20 Dec 2021 22:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oVCbhgbKIRew; Mon, 20 Dec 2021 22:00:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31B4A4092F;
	Mon, 20 Dec 2021 22:00:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26A5A1BF2A2
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13C0440938
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rv5GmSyAdT9G for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:00:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2002540129
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:00:10 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id j6so23268258edw.12
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=G990FMpPIfR7KHJd7vOYVvqQHiIX9b1XerkLxNw4AEs=;
 b=ZjuumnBGOYYzFQeGKWmp5wiv0t+EXsOfdGu2CqauUc7g22GUMTDmbWL799K6Dqnr2z
 BZpdoktuJf43QSmdavnjQJ+BGdcQB4yV+oFcBYcUh2QXOLfPToIQO66UATnWqSBieDFl
 MsrbRK5yx+y2kZeCTQwDMGYWEciOn7mOhWHyD7CSDqOJUhIMJ404AVH1M23ed80alECB
 SqXXKcGmAb0jVmewGqFSKlt5+pSdidRj29bx/LusxSZNZgJYfF/q5I11TcCtlRde+NGW
 CGJLFb9nQ42swmtfK6VoJdWAW2U6myIq3e4W+yMIbMQkIvkXU8nEpG9URsAMB7Yk36cY
 Z6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=G990FMpPIfR7KHJd7vOYVvqQHiIX9b1XerkLxNw4AEs=;
 b=eZmRBg6o51jcrBFCBGJT1d5m1q8LseyhxWbNesj+IpLbbXO6hRNkHEQZKfpYsEm/e0
 /i3SIjYHgAHnLUb7kLpdsbNfRu8MzPMF52wiq9II/ZGhD7+PYRJQ095UOwGTF4Ftc/0n
 z8dr+LZjjzVdkQwhlb+uj0ELkWBzNmaGMXSL2U+oFpVTk1L7l6+aNjfPLWmc/n1fZujI
 d7VaZrPEQe9SYm6SCJxfPePOXLrbXdx+0Tva9LX7Ifj7WOBeX1xKUloW3CUAxM9XWG93
 idvrcaCBXmlinr4RtetrWz4j9aSdW7ZYmzhfKDnLBczQBgJjXgTP+aTAmqsq3QwAhRPW
 55+g==
X-Gm-Message-State: AOAM5336zeBLYowcG/YmO6k8aiP5C19Quzxsb9QK/8pNxorPh519dYHV
 KJ9c5bYf0y6jw6BIbuJ7QsdEDJ4Xhw0Nog==
X-Google-Smtp-Source: ABdhPJxmQZCHaTk94jLiLwvxsewIuKIvRV5/pCg7F8Bph4uqZba8qnwRDxU+6MabAE0GZfRd4oBroA==
X-Received: by 2002:a17:907:6290:: with SMTP id
 nd16mr154144ejc.578.1640037609277; 
 Mon, 20 Dec 2021 14:00:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h10sm1355773ejx.115.2021.12.20.14.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:00:08 -0800 (PST)
Message-ID: <94591470-8a36-8e27-8a88-f27d8e7ca1bb@mind.be>
Date: Mon, 20 Dec 2021 23:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Michael Taubert <info@arachnodroid.de>, buildroot@buildroot.org
References: <20210612223011.26118-1-ps.report@gmx.net>
 <a9d377d8-61f7-edc1-06f6-03291c100dca@mind.be>
 <c8c49a7c-fea0-c96c-ba23-4ff17a1c0d3e@arachnodroid.de>
 <63b4baee-8e6f-ac56-8c4d-1508bedc7f37@arachnodroid.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <63b4baee-8e6f-ac56-8c4d-1508bedc7f37@arachnodroid.de>
Subject: Re: [Buildroot] [PATCH v1 1/2] package/mesa3d: add config option
 for DRI3 support
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



On 19/12/2021 08:22, Michael Taubert wrote:
> Hi!
> 
> Got back to this topic this morning.
> 
> According to this line for V3D/VC4:
> 
> select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
> 
> Mesa3D will be built with DRI3 support only if xorg is going to be used
> too. Though I'm actually using xorg, and can confirm that is compiling
> properly with X, I may have a switch to wayland anytime soon. Is xorg
> really required?

  AFAIU, dri3 requires xshmfence, and our xshmfence package depends on xorg7. A 
similar condition existed already, so I kept it.

  If someone can get it working without xshmfence (thus without xorg7), they can 
send a patch :-)

  Note that it's possible to select BR2_PACKAGE_XORG7 without selecting any X 
library. By itself, it doesn't actually do anything. Perhaps we should even get 
rid of that option, I don't know.

  Regards,
  Arnout


> 
> I must admit that the build did not complete, due to an error with
> libnss. So it's just what I got from the build logs.
> 
> Regards,
> Michael
> 
> p.s. Thunderbird caused a mess with the last mail, somehow. Sorry.
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
