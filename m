Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BE8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:14:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62DFE6101A
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62DFE6101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41D854079B;
	Sat, 11 Sep 2021 14:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dL7g0J5xG2e3; Sat, 11 Sep 2021 14:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F7DC40434;
	Sat, 11 Sep 2021 14:14:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 730DF1BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 626E1829BB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XwWEpO4WjFV7 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:14:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A90081CA0
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:14:38 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id t19so10367811ejr.8
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SggjBbN+IzdZhNs8b+TdyeLILQETgHjyuaklWbGelIA=;
 b=OTZvBC+IEzyArtT/XsE8fbuuDXZPo+AOcrv9kuly+1EpMXIu7RW/fYZ8xQfG7HUE86
 SSAn+T4EvQphKvQy9BUoJZMrnxwU3U4myA/8jAHlUblBipIwVjTZJAn+ZdAcIP3WPhcc
 R4Llx//eGzK1EzUvQel51jAERFWjNYov3KGN4Zz+ox0iyE+1O+U3M0EX0Z0P9dFwJ+lF
 diYy9S8PhSnmYO+hDNVJzMv9LcwF0HiudCQBR+80VNDocAVrzGX3Z2oSWxxU93viVpBe
 CWcAOPTPnBuw9D0hcTp4ZATDo6lcaMuCbRRoLFacWvEyQUiaD2FGbRCW0vCzyD/xse3g
 w6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SggjBbN+IzdZhNs8b+TdyeLILQETgHjyuaklWbGelIA=;
 b=i96u3BpmvGIVNnkqATtk0UEPevaTDUb6/C0NoDzvPK22VWQincpBiNU/pn7GmqgT6s
 uatVb/whLtjQoMwvfZLyx4umTGvT7GSLYymJX0Ytbd63qc6OrAkkn4Rp2mcH/ipPuQ/g
 Vm5z+ujZDBGTMtDk9OHjrEQFUwkkulwOHgIujWedjzQmUNd1tr5702hxjSefHqwCEG7Z
 jGgsfZeiMDA/i1hXafIvqA47zppAj0m6ibsthEPFTlaCNLCnV/u0xtx8WarMXptL8Mjc
 9l8UmsqN2K4gkocZrgAYgxWLi61NhJbmq5jNzzYeu415DWVqQm2P7TLE6atfbwQnNHX5
 CKng==
X-Gm-Message-State: AOAM532pSN1ssi7PKBi1JPbViHbj6h5mhnHuCUUTJ3ftbfIuKGnM64tE
 47C3WceRzIN75fe6goPEMudFrQwsKqNYRA==
X-Google-Smtp-Source: ABdhPJwUvHXcFfck9rKL467L4ZXN5PRnLoB7ufTvnHbABALm4fnQyS+COawzFZexf8gCBfm0hMM2yA==
X-Received: by 2002:a17:907:aa4:: with SMTP id
 bz4mr3114413ejc.97.1631369676364; 
 Sat, 11 Sep 2021 07:14:36 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e3sm823275ejr.118.2021.09.11.07.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:14:36 -0700 (PDT)
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210829113915.19781-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <2ae536f3-051c-6ba5-1085-f27841a81c0b@mind.be>
Date: Sat, 11 Sep 2021 16:14:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210829113915.19781-1-bernd.kuhls@t-online.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/next 1/3] package/kodi-pvr-filmon: bump
 version to 6.1.3-Matrix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 29/08/2021 13:39, Bernd Kuhls wrote:
> Changelog:
> https://github.com/kodi-pvr/pvr.filmon/blob/Matrix/pvr.filmon/changelog.txt
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 All three applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/kodi-pvr-filmon/kodi-pvr-filmon.hash | 2 +-
>  package/kodi-pvr-filmon/kodi-pvr-filmon.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
> index b771212a3d..3043adf34c 100644
> --- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
> +++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  3ede4930bce246f15cdc4a063086327c28c412b923d0c1030e2fd3ba8a63e138  kodi-pvr-filmon-6.1.2-Matrix.tar.gz
> +sha256  e8cf22398e2ab2da9873dc84a3fa5fcc27c7726adfedd813ebdd9b8d41066fec  kodi-pvr-filmon-6.1.3-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
> index 976db3fbe2..14c7d2262b 100644
> --- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
> +++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_FILMON_VERSION = 6.1.2-Matrix
> +KODI_PVR_FILMON_VERSION = 6.1.3-Matrix
>  KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
>  KODI_PVR_FILMON_LICENSE = GPL-2.0+
>  KODI_PVR_FILMON_LICENSE_FILES = LICENSE.md
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
