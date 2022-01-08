Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C3CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15FBF400F2;
	Sat,  8 Jan 2022 15:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CR7WYPN3ASFX; Sat,  8 Jan 2022 15:11:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16D7E40103;
	Sat,  8 Jan 2022 15:11:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B23C51BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A05098125A
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4CaiGJQI40QV for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:11:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0A7B80D6B
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:11:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v6so17108997wra.8
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=4mx0oSoA64GWMOPzkMEKiindV97JeMODwnMGHeWwMZc=;
 b=KT4lg99dPxXIBIu068EGST/98yQDM5mBkBNmPopTiqkhOhjH4JdzXUkP+s3ane6qhW
 U3BeiREDDIciKIqP6zL7fzwHf5Ktdn36nAtNvoFlwFkNdf7xcsmbwOkTm4LAzAjQ0iJo
 IJYi/OnVRgwQCcwSABJ9URypPwTtRfAyO3JeGONJKSlMObWb0WJbFuowd3zra1TRFCjn
 s8c1mE0UlF+7TlyAOj0MhRsollgqP216LMyMndbi6hzDlotjGeAyuhCIqnoz162asUFx
 mJEAyqhg9N7ng8k1fJZ2hGHLFPtinyVS2Uj/DLV0mS+XAQQlPJgi4d65uhhANWRvfr3P
 nifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4mx0oSoA64GWMOPzkMEKiindV97JeMODwnMGHeWwMZc=;
 b=DeDQOnEIXaingS6MScHyjXTaBonmH3KEgKlI/B8qjpHc8dlRnvDmy0Mz1C+ez/+mx7
 WQ5Yf++mE9Z2j8MwNeHcWfxCNRgwiv4JJpJZWf2lk/T9BNlMXIyemdaPDi5lGmWhVmdK
 URNJRIqI64DrI0lqRHhok7n1i/p3Ua5S+3g2dTuilxZv93Lad6rJL+j4Dz5zWJpWSXQC
 kdZkIxCdV5NPA8PULxqQNiPFDXhocfst3sp2hUx5iU6u2Kf2zolpckWICot1gwv20tcu
 irDydSiP+kQRW1e1ma70x4OPMKH35mTUsk5UBLlPNsTeOtD85XD2+ihnovDpdQgIcIay
 MOPg==
X-Gm-Message-State: AOAM533Tw0I1JuU31VkcTCQE70sVzD2ouGm65uBoFoH7DcH/Z9I6aSTL
 BS7s1jk1AiW+TC31SYc0vUyVTArRRBaP3M4H
X-Google-Smtp-Source: ABdhPJzFxc2n0kCGalbQVDq90NZv6SxQPu7ZvpJZVwL0f1kHmVxR+PEn9tRfJYfqJ0qApQouLJruhg==
X-Received: by 2002:a5d:584b:: with SMTP id i11mr56662174wrf.433.1641654698856; 
 Sat, 08 Jan 2022 07:11:38 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id ay39sm1671347wmb.29.2022.01.08.07.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:11:38 -0800 (PST)
Message-ID: <b8999091-774f-8d72-995f-5cf3809c8014@mind.be>
Date: Sat, 8 Jan 2022 16:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220107213253.75709-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220107213253.75709-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-vdr-vnsi: bump version
 to 19.0.2-Matrix
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



On 07/01/2022 22:32, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash | 2 +-
>   package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
> index c6223fc8e4..4cd1f7ad6b 100644
> --- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
> +++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  38a1c8662dda6eeb91a9924b7f5f9fef510c78f2faf8ae3248c10ec0885fe9f3  kodi-pvr-vdr-vnsi-19.0.1-Matrix.tar.gz
> +sha256  2471b4c0a22bd3382b7b7e68974d5b6c08a757737086faf82609ebe5dfb5625a  kodi-pvr-vdr-vnsi-19.0.2-Matrix.tar.gz
>   sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
> index b281f00f19..65e69d2b23 100644
> --- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
> +++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_PVR_VDR_VNSI_VERSION = 19.0.1-Matrix
> +KODI_PVR_VDR_VNSI_VERSION = 19.0.2-Matrix
>   KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
>   KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
>   KODI_PVR_VDR_VNSI_LICENSE_FILES = LICENSE.md
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
