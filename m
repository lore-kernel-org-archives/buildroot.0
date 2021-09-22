Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05054C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:28:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7896A60F6D
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7896A60F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18072401BB;
	Wed, 22 Sep 2021 21:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zbRpyC7svDPb; Wed, 22 Sep 2021 21:28:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A95040191;
	Wed, 22 Sep 2021 21:28:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4371BF2F7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03C9684050
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUyM31lRonbk for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 21:28:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC51B8404E
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 21:28:27 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id u27so15158976edi.9
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 14:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sz2FrY1nuxBMEtmtXmNQ9aMn1DrxEXRNxeOJnZh49DQ=;
 b=YSA6eX8VWp4jCtQRApcSF53PCM8CVXUzG/iRSJMJKZ1YXUB7QHAlwX3VAN0cEpMPiQ
 nDCs2g5dfIZ1kyEXfJGM0kVtlo0B1bOrDinEsg8q2LH8yPbet8TXcf2iEwOqbOS3LKfy
 nooEzpaf5PH03gsQmUDfWlzmS/KCUPuHI4Pd1q8VE6T3ykXIOtT2Z6r0m24Z6C+syVST
 7/brc1c5RRGesLBBBMAUlsHLCs2O41UzdlzBrOpkiK5tgAs25tlCIo89eQJ0ant+Km21
 NljgEycuCqdgmcvRNokyTVA20EMXhJs9BrWdvIctSYn7AxOXLsp39kaqfTd3vFMRpgTh
 nDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sz2FrY1nuxBMEtmtXmNQ9aMn1DrxEXRNxeOJnZh49DQ=;
 b=WpEXZSrpVOCwxPx/JOzxWvRfCVUx/qbriw4vop5MdvnxAPD31vQsVk4msG5dGEFMUY
 C/Le4efA2bbd5Pj67H1PbLHpInff5yDUPe+Y9VpEOiiATotg8LVbnghP8A102jRayAop
 nPSRcVwIkqSA42JktRQbYeP035fw7WonIaSGjrLkdUKxxh1UzvrW4jfAMRYMS6AZLCnU
 jxPN157iEo3jyAUmSVtKAwMc3lXC4igF3hxr4UNeZO5+m38K9wTpYKUMLHdJicnaM/lI
 yLP2sSPqMLaamVSsExkiBDVcmothEDSu5X6F+Kz8qJR0rzre9YxWnRtGBkxKls6gT5V8
 rOKQ==
X-Gm-Message-State: AOAM533Ffa1VE2Z1YexqCbOc3GrDcS6nUji44MqFCJXdYtxLFJ2ERYKE
 R3ENfPs53XAw14IrI47MMGAYHp2ux+kLmg==
X-Google-Smtp-Source: ABdhPJxruLo+65Hi5/VCqH5MgzHNlnlW/4R3n7OLR/ZsQ1/UceEXnmXtwtuO+2rEcAlTrF49N4gagw==
X-Received: by 2002:a05:6402:1057:: with SMTP id
 e23mr1725033edu.352.1632346105617; 
 Wed, 22 Sep 2021 14:28:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l2sm1780625edc.23.2021.09.22.14.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 14:28:25 -0700 (PDT)
Message-ID: <9e4174f9-7809-61e9-9b1f-301509232010@mind.be>
Date: Wed, 22 Sep 2021 23:28:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20210915052807.1981697-1-br015@umbiko.net>
 <20210920063027.1944-1-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210920063027.1944-1-br015@umbiko.net>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mpd: update to version
 0.22.11
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
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 20/09/2021 08:30, Andreas Ziegler wrote:
> mpd 0.22.10 terminates with segmentation fault on graphical clients while
> retrieving album information. This bug was fixed in version 0.22.11
> 
> Tested on x86_64 using M.A.L.P. Android client
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v2: patch number, line wrap
> 
>   package/mpd/mpd.hash | 2 +-
>   package/mpd/mpd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
> index 3847fc6724..2501be65de 100644
> --- a/package/mpd/mpd.hash
> +++ b/package/mpd/mpd.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated after checking pgp signature
> -sha256  07c82535e9999c3d4a099d8e652c88724635125b3c9f265ba9b6f2974ff9e614  mpd-0.22.10.tar.xz
> +sha256  143f7f34aaee6e87888f3dd35d49aade6656052651b960ca42b46cbb518ca0a0  mpd-0.22.11.tar.xz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 62e31860c0..fe6b8d539b 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   MPD_VERSION_MAJOR = 0.22
> -MPD_VERSION = $(MPD_VERSION_MAJOR).10
> +MPD_VERSION = $(MPD_VERSION_MAJOR).11
>   MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
>   MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
>   MPD_DEPENDENCIES = host-pkgconf boost
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
