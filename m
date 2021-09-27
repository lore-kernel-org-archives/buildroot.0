Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C13EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:35:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A073160FC2
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A073160FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 739AF403AA;
	Mon, 27 Sep 2021 14:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1CPnFNwSp1Q; Mon, 27 Sep 2021 14:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BD28404CF;
	Mon, 27 Sep 2021 14:35:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1156E1BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0073E80F09
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-h0YKLgSXU8 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:35:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F6C780D0C
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:35:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id ba1so12203640edb.4
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 07:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=cJ65pjPVJH7dnLxtM5p9TOe1tMHBGZ/C6OFX0SKnYzg=;
 b=M7Cn3NRQM92244xxCTUdNSBrIvS3f8bq8fP+v0GxQlSlUXQRfL3mB+m6lz0yrd1y/N
 cTrv31rP+Q7uwOsz0GAmMo8OTJWCQMBsKv3b9bjScP6ioRVu/K8hVsVkt54yQfMfw51J
 0kz4eFY1ENC9UsXYQWAehj/uRmYKQTGw73gN4r1y/3BBrRSisDa6aOgUsmMUOebNtS+z
 88QWkC/lqUeLeYK4SSTUt6982zPsuMc7mH8hcaf/qKZilFy0RK8HFAf40uu2MDlt2vIq
 80yEGURoI/Q4Vt1yudVlZmGgDQWByLvdHUCUddHURptFJCmL3zxIZ+zTHEs6yEwLc3sU
 J03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cJ65pjPVJH7dnLxtM5p9TOe1tMHBGZ/C6OFX0SKnYzg=;
 b=mYKXPyWRjnX5o2AyzBAQwGRjJPyhuWSuiurh9cAxQ5nZX5eZd/H+S1Y6o4Aoxl/LYN
 4kJgfBc8WeUnDs15bYf8fFBLnJys88834Mg6AE/iRmuAstO9nL8l1m7YoMhqO441yNEv
 indih4tHuViF871Ej1uUxJFcPVkZV1I42Fc5JHgqp863CCDLmWR4V2gpcZRcW9mQvx/0
 MuUdBzamJsyJjHcQbxWEqW8bn27L15OvLXGGV1fj26X8EkpTVcexHbDe68qSg0OzW0um
 h7R/VwMWMy4M+fDacF2SO1kzgm3Pf1vfdWD9T7WAVw3sZGffTHDtklaKyplkYv+B8hqd
 BuMw==
X-Gm-Message-State: AOAM531roV6M3eo2Tv2pk+d8BcrPBD7PpjiWRAVzCm+/qAkQ153lutB2
 GtNRSF+miqERDO5f/e/XzAWeNw==
X-Google-Smtp-Source: ABdhPJw5Y1DrsFKwT+D3sToHep+65mFDri6vb3mwoN1Qmb6VFV4oMoymiMFPLhPTznjvgodmRz+tnA==
X-Received: by 2002:a05:6402:5171:: with SMTP id
 d17mr203962ede.364.1632753342268; 
 Mon, 27 Sep 2021 07:35:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b3sm8614897ejb.7.2021.09.27.07.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:35:41 -0700 (PDT)
Message-ID: <6753be4b-3fec-71ee-74d9-eb168a35f695@mind.be>
Date: Mon, 27 Sep 2021 16:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210926212556.915231-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210926212556.915231-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wget: bump to version 1.21.2
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



On 26/09/2021 23:25, Fabrice Fontaine wrote:
> https://lists.gnu.org/archive/html/bug-wget/2021-09/msg00005.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/wget/wget.hash | 4 ++--
>   package/wget/wget.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/wget/wget.hash b/package/wget/wget.hash
> index 11071566aa..03394f55c1 100644
> --- a/package/wget/wget.hash
> +++ b/package/wget/wget.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/wget/wget-1.21.tar.lz.sig
> +# https://ftp.gnu.org/gnu/wget/wget-1.22.tar.lz.sig
>   # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
> -sha256  db9bbe5347e6faa06fc78805eeb808b268979455ead9003a608569c9d4fc90ad  wget-1.21.1.tar.lz
> +sha256  db9bbe5347e6faa06fc78805eeb808b268979455ead9003a608569c9d4fc90ad  wget-1.21.2.tar.lz

  The hash didn't actually get updated.

  Regards,
  Arnout

>   # Locally calculated
>   sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index ae036478b8..f30fa39917 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WGET_VERSION = 1.21.1
> +WGET_VERSION = 1.21.2
>   WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
>   WGET_SITE = $(BR2_GNU_MIRROR)/wget
>   WGET_DEPENDENCIES = host-pkgconf
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
