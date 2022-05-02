Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EE8C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53EC040621;
	Mon,  2 May 2022 21:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOunb4eDnCx0; Mon,  2 May 2022 21:53:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65226404E9;
	Mon,  2 May 2022 21:52:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B24861BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E33D408AE
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R82nkXTqLsEk for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:52:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FA60408A2
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:52:56 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id p18so18028194edr.7
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zjiFDKyaujTdhCNdTeq+JpRnXUvh6hNO6S/KPNRI/nY=;
 b=TqF/vPtVX/msx9NS5bHXdrFUDGWLDj558jcHhIrB4oOtTWNV3DghgIvtvXafGh4/AC
 ZjsY6ta1/rby4UC1c67aHtXtn0vtno9g97BRX4hTZ64A9jd+ncF2bwIc/8uTcEOiIOfO
 +7o8ONmLzrn3ro8AHqvghDRaVvy+7jD0sn7mMRnml5ceXF/Q89V6CBMsvLoqznz9GIyD
 u/dEVKtLnrSKdZI8vVjPyAv/RRrPy3+ZdHlNTwXy4fdqNhGY4qyHY8J1HDZtVEA88UWe
 t1v9XRkjrAj3AdFGTyIc75DdFpnitBbSP5jyGRYWSbQKJZzp3aXo+K3/Q+mwFtDL8bBv
 pz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zjiFDKyaujTdhCNdTeq+JpRnXUvh6hNO6S/KPNRI/nY=;
 b=v4DsE/tre5oxwovZWuo2e+6L/uxAr41Tqyuul2PON+hYN4rfkloqA02YrB9Ee50xvx
 PCl0C+g4i3y87g5uGCBfEVv4JgR3sBRm1Xv0n/4PoI5RIwFni8011kXyJAPMjGRwcwk1
 Xsg3xDkBi4bkoaPafq8laA9+xm3tBq9b/GqengO1Jyw1pgljoxQ7eagi35MXcIpt56NR
 vs4ktMfBn25U9UmXBEZxTZoSkhwAGBk9iyQ0monGOUDK7OLOcUXjQgQb9o0SujnLVlHK
 nSdgchgsf/R28PcDfukZ0/mt+MAob4oRNB5fRpnkbC5Eija1vctUNPRmniBxKCfzmQs1
 aMxA==
X-Gm-Message-State: AOAM532swqNCinMy+u1DmbBDcNmwp9F4JXcFjS0kEmgwPCPZDfzK8+N5
 r77t0bBQ0WnDTMFJVqgaWJxwAg==
X-Google-Smtp-Source: ABdhPJzI2bVU3I8UztkVZUMjTGSVQfITaN0nvfYHddbYv3COaYZ6hR4GtivpwmHSZR5LiSpRg4TRMQ==
X-Received: by 2002:a05:6402:228c:b0:425:d911:fd35 with SMTP id
 cw12-20020a056402228c00b00425d911fd35mr15453762edb.325.1651528374387; 
 Mon, 02 May 2022 14:52:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t19-20020aa7d4d3000000b0042617ba63c2sm7144319edr.76.2022.05.02.14.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:52:53 -0700 (PDT)
Message-ID: <6d240506-25df-6db2-f62b-f2c04360b968@mind.be>
Date: Mon, 2 May 2022 23:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220501000750.1569310-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220501000750.1569310-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/libnss: bump to version 3.78
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/05/2022 02:07, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  This isn't a security bump?

  Regards,
  Arnout

> ---
>   package/libnss/libnss.hash | 4 ++--
>   package/libnss/libnss.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 04e81e6b84..0c06495f5e 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_77_RTM/src/SHA256SUMS
> -sha256  825edf5a2fd35b788a23ff80face591f82919ae3ad2b8f77d424a450d618dedd  nss-3.77.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_78_RTM/src/SHA256SUMS
> +sha256  f455f341e787c1167328e80a84f77b9a557d595066dda6486a1874d72da68800  nss-3.78.tar.gz
>   # Locally calculated
>   sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 7568ec67ed..540092dfcf 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.77
> +LIBNSS_VERSION = 3.78
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
