Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB51C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:16:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6109E611CE
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6109E611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D371400FA;
	Fri, 15 Oct 2021 21:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3kgLyePV5xek; Fri, 15 Oct 2021 21:16:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3687A40107;
	Fri, 15 Oct 2021 21:16:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A7921BF417
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE23083B21
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9ImDyeiKQ_w for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 21:16:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7D1683B1E
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 21:16:18 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id a25so42968366edx.8
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 14:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=SBNpAFr5QeflMiAgrOm9PsQj3UoRlB9tsiF90xjcxFI=;
 b=Fvt4nLPLHGUO3KqcN09yQ0yKsLxolzAWSlLdj81tNhFobs8/oWhdEFVqJwvXW8w8Vc
 HNEzxleeEExj5De08f58RMS1RUCdOGnEg5MiUoxNs7UdfXqNkpTdDuOVMdHcV0g5xqsX
 kbGUsyggAb6X6NDuaXDoelJYvoPtKuGH1NMikYhMTAs2PCVV4K4YDuYGvtdYjWtSSg9I
 WHtU4PrfEMNpWA0hStIm+AHKrRnx/JcXSAsbO/cnn6fw8Us0KbrRINEC+2O0yZni1Q54
 wM3Sx6ICC8F3Q89wvvnexo1DGPiVx3x09HLBBKaG83pn5D3u7ihA433hXBFii1/pgG6L
 5Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SBNpAFr5QeflMiAgrOm9PsQj3UoRlB9tsiF90xjcxFI=;
 b=hSIuNZEK0IXQhJq8FjNvq9PTAFCFTI9x4rpFxiUA7CEhUdM+ABtnywhpCiVH07kE0c
 wF8UB4NmC5ZazR1XCjkdTjYqrdoRwtcmMDW7uG8EYIPDqtKGcV/yA2Y/RAMT3zTGtF15
 No+fiy6hCgavGq3ciMjJfocJcPB5iZQUxjaN/EPR1WCvdOeKfSps3YeHRNzR622abAHr
 NoZ9hYol/F1xDMHGTUVgK23E2K998Rd7ujacfXjk17baFlgyF1lJbrSCnxOKYZyTtGPH
 0ggsjjfag8/MhxZxOs+wW2NHU4H6rvZT3iVDuvA1g8sALJ2HKbo9MDTyX8iWQDmNgDvI
 0++A==
X-Gm-Message-State: AOAM532Fjhc7whqWdcEnsL8FpIXl9hO/+96zuVeL4EgL8mziyAGrdT4V
 PTSSRJ8t2RTOFxAHskBtM8BfJ7fKLn7MgDAV
X-Google-Smtp-Source: ABdhPJyphxGmzP/BH1QfTVxr7Oq2SEgAIEtpfd9vAFFzTfWaAk7JwTycL4tJMrdfz+GEAj0RhHyPdw==
X-Received: by 2002:a17:906:bc43:: with SMTP id
 s3mr9747016ejv.46.1634332577300; 
 Fri, 15 Oct 2021 14:16:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f22sm5467168edu.26.2021.10.15.14.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 14:16:16 -0700 (PDT)
Message-ID: <2f025051-0ad2-e8c9-90c8-edca2b47d96a@mind.be>
Date: Fri, 15 Oct 2021 23:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211012060355.1002416-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211012060355.1002416-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.15.2
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



On 12/10/2021 08:03, Bernd Kuhls wrote:
> Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/xmrig/xmrig.hash | 2 +-
>   package/xmrig/xmrig.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
> index fcc7cd456d..810a9381b8 100644
> --- a/package/xmrig/xmrig.hash
> +++ b/package/xmrig/xmrig.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  4191299f9556556401fe3a1008e11784146ba53fdbbff6ad74ae19c4dd03d2b8  xmrig-6.15.1.tar.gz
> +sha256  27a6c34ee1bec60f8c49a5e2b97223971f579a26a4632fb64c4a4556b3bb04ae  xmrig-6.15.2.tar.gz
>   sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
> diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
> index 45bfe71236..071eddae32 100644
> --- a/package/xmrig/xmrig.mk
> +++ b/package/xmrig/xmrig.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XMRIG_VERSION = 6.15.1
> +XMRIG_VERSION = 6.15.2
>   XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
>   XMRIG_LICENSE = GPL-3.0+
>   XMRIG_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
