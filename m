Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67345EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17C0261299;
	Sun, 25 Jun 2023 19:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17C0261299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GcvsrGi9gBxv; Sun, 25 Jun 2023 19:27:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5183660F25;
	Sun, 25 Jun 2023 19:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5183660F25
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A39E01BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A410400DD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A410400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2pcqreJ4178X for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:26:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32FE0400C8
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32FE0400C8
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:26:56 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso306960066b.0
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687721215; x=1690313215;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IzHyMgcuTy6EdGRcSNSKgvXVmk7wVppokz4G4x5Ocxs=;
 b=aA8FrpPMVV3VVxkZfVs2PXWbEnHJ5oXkCW7gTWD9+nCB8p33KlyDv68q0+AUICApH8
 Dogs0hbhFoX26RElCCKuYUF8lozsHBB0yWA5qSl6NeVxs0dFJE1wiBBrB7wzQdFRkeIq
 doiubYYUd/ZqUoZuNvMvjNXBNdbfVsDd8P73b32BY4mNr3rPA2y7sXSBo6uUzE5uLdzT
 MQ49OPxIWc4PUtyUYFer5MX036cP8O2epxyK5QaVm7iDPifBp1KH9AsmePgdQoSh5DDa
 PCFP++a5VCDMd6Nvm/Etvx89hbJSnuoshO2fcyyXuN1s8KQBBReL1HRn5Re4MNISw/7s
 dxwA==
X-Gm-Message-State: AC+VfDxGGLIQnGuIOfa9pkXT7oZxYg54BenvmTnCNhK0vqZECZBGczm1
 D5wrubXctjoFARewwMlEBXZiYj1Vm/plNKzajrU=
X-Google-Smtp-Source: ACHHUZ69WohuW+ar4bd8YsIw7PEN3V2fWtEBubNRiLjmfead3guSU/Z/7i+vH1d2cDOljTW0tKFMnw==
X-Received: by 2002:a17:907:1ca8:b0:973:d076:67ab with SMTP id
 nb40-20020a1709071ca800b00973d07667abmr24973000ejc.42.1687721215095; 
 Sun, 25 Jun 2023 12:26:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 ci8-20020a170906c34800b00982d0563b11sm2384927ejb.197.2023.06.25.12.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:26:54 -0700 (PDT)
Message-ID: <3f4b279d-1421-7940-1693-11aa1f8e4586@mind.be>
Date: Sun, 25 Jun 2023 21:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230625144833.296862-1-bernd@kuhls.net>
In-Reply-To: <20230625144833.296862-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687721215; x=1690313215;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IzHyMgcuTy6EdGRcSNSKgvXVmk7wVppokz4G4x5Ocxs=;
 b=Px2XhBoK9K+jfnciP2ICMQLsoxtZwZ9j8nR81fVTmK7U+NaYd9oLvtXr/Q3DfC9Vrc
 q5k8q7YqM9Sa+mVg1zeBuQMfAHM73aVckD4u3DDT+70e34ZOLtRqdc/IRzGH2dXcB9M7
 iNs8Gl+QU2Nm7ZMPjixrBWf6J/EINQ+wATM+kTRRbf3Ve3aBxFyMaEgdLpuLela8azz+
 FAXAdeo0wFFVx4xVoL/KpJrMF8M4iiKJ+dFK09HE+UOYJuAORYTzoyXRADWXx2pv0obZ
 XosdFa11aFWmIYpJI9yfAt5E/eY3UzN9Ue3eL2dRF5jskcJpghqnb2J9erpw7e0eoWjm
 yTtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Px2XhBoK
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: bump version
 to 20.3.10-Nexus
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/06/2023 16:48, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
>   package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
> index 87df4f7de0..9939c6f73b 100644
> --- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
> +++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  451d4e4dbdca71c9bd31d3d11528db4759b93c323476e5e881f617fa3eadc600  kodi-pvr-zattoo-20.3.8-Nexus.tar.gz
> +sha256  68aa0a3af4f10396c866b0da225928033d0bbf980b8884c944dd1829e013435d  kodi-pvr-zattoo-20.3.10-Nexus.tar.gz
>   sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
> index ed3c96f3e8..53153f8f59 100644
> --- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
> +++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_PVR_ZATTOO_VERSION = 20.3.8-Nexus

  We have 20.3.7... What did you base on?

  Regards,
  Arnout

> +KODI_PVR_ZATTOO_VERSION = 20.3.10-Nexus
>   KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
>   KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
>   KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
