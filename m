Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1938EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 05:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7298D401D8;
	Mon, 25 Apr 2022 05:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNwlr19RTc0a; Mon, 25 Apr 2022 05:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 771034012D;
	Mon, 25 Apr 2022 05:42:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5EF61BF3DC
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 05:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A07F24094E
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 05:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dq_Nv5Aq_hFe for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 05:42:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 447FC40903
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 05:42:51 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id l18so836164ejc.7
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 22:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7BHmaj9OBvoeffjIovGuUu38fr0tDvXKk6M9jjjjd1Y=;
 b=K4e7RVSz4VeGzwdE+PvLKVE2tkoasYJsVEMxEWbzXeHpyX7x8t7Z1srmk+OSkRu43F
 4N/PL3viTFLB+GFhMvdEK38sfZEfC/oYlNAieinM1rcodwYO5+O+1k797mIdzn936Hu9
 OiY8oW3/g8RcGx7BnDHqNgr4avmynkge/dFMBdCiwpqyyKx/ixqiXktZVO+H22H5mpsG
 +zDfWkcrHAznkZ98erb6KmcnSuAcRz5f52v07eWUL2+4CTzmot8YY1FujxoVap1MZsnX
 xWTl85SfYGvK63cFeonIazDLQJAj91su/xDtni1ya13neIQY4KhHMlbkAh0vI9BCF+8C
 becw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7BHmaj9OBvoeffjIovGuUu38fr0tDvXKk6M9jjjjd1Y=;
 b=n37XDra7/WtKqZtomNxf73QfoyUGF64gcut2CyJT6TFKLLGdWHsIG/QihqjKmSyacv
 Wc2FM0FNnbCOiFCcRmhPXfE+KCe0bUjYXfT5zg3mT1kUtw2QQrBgXAoTNBYZf4apD05O
 Z4O50JD4UJSp9Xv8++bFhdAtrtccsuCjwiXj+mqEltvS7i0wtxgGEwLN/qBw2GAst5Mp
 LhXL7A2/1Itn8g+I0h0BJ+l4LfSL+mqVVqcYq1mzTGCNjzrQ6jduwWABkcjtCeVk0R96
 URHBQ9kWvWSyNdkUifoz30dYsWh0mADXCvme2tbmiwXbPrAyUpyvFxur06DDbaOSUX7V
 dYzg==
X-Gm-Message-State: AOAM533XInqC1XYUVYEMgFS4M8UCQNvPsLDln6LP8Jll9RLfLlKEvNhD
 yM/8BzltrVo/vFz4xqGI6/zFfg==
X-Google-Smtp-Source: ABdhPJzVB1+GOdXrVYVu91J2Z4XT70GtKkaSOtE2KqrocpYZrHDyRXKmwLORMSiIZG8fuRel1La0kg==
X-Received: by 2002:a17:906:1e94:b0:6b9:6fcc:53fd with SMTP id
 e20-20020a1709061e9400b006b96fcc53fdmr15085584ejj.450.1650865370313; 
 Sun, 24 Apr 2022 22:42:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170906780400b006ce69ff6050sm3233762ejm.69.2022.04.24.22.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 22:42:49 -0700 (PDT)
Message-ID: <56cf3cb2-d00b-b957-8b0b-2a095e5797a0@mind.be>
Date: Mon, 25 Apr 2022 07:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220416211323.3200669-1-fontaine.fabrice@gmail.com>
 <8e85d9ce-f8d9-6f76-37f2-664b9c0db08a@mind.be>
 <CAPi7W83CD7gBa+ZY5vTBOfeq7MMhZPqkrYLY6=dpqcP9_ikMmA@mail.gmail.com>
 <dc26f0ab-bf60-2c3b-6f79-f6c816cc3bec@mind.be> <20220424163350.GX2730@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424163350.GX2730@scaer>
Subject: Re: [Buildroot] Removing BR2_SHARED_STATIC_LIBS [was: [PATCH 1/1]
 package/pkgconf: fix BR2_SHARED_STATIC_LIBS build]
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/04/2022 18:33, Yann E. MORIN wrote:
[snip]
> I have always been a bit confused on how BR2_SHARED_STATIC_LIBS was
> supposed to work, to be honest... Sure, it meant we wanted to _build_
> both the static and shared libs.

  The problem is that it only actually works for autotools packages. They are 
still dominant (more than 1/3 of all packages), but diminishing fast and many 
"headline" packages are no longer autotools. I don't really like to have an 
option that doesn't even work for most packages.

  Regards,
  Arnout


> But how were we going to tell packages
> whether they were supposed to link staticially or not?
> 
> Surely we do not want a per-package option... Then we're left with
> deciding at the package's .mk level, by hard-coding some heuristic to
> decide.
> 
> In upstream, we have no such case where we'd want a package to be
> statically linked even in the presence of shared libraries (maybe the
> the exception being busybox, for those who want to cheaply build an
> initrd before pivoting in the final rootfs, but that can be done with
> a config fragment or a custom config file in any case).
> 
> This leaves out-of-tree packages.
> 
> In that case, there can be tons of reasons to prefer a static link even
> in the presence of shared libraries.
> 
> So, the real quesiton is whether we want to support that use-case or
> not.
> 
> If we do, then we need to keep BR2_SHARED_STATIC_LIBS and fix those
> packages that misbehave in its presence, like done for dropbear.
> 
> Regards,
> Yann E. MORIN.
> 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
