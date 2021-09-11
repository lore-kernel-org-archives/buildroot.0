Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5754EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:56:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A2CD611AD
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A2CD611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9C00826DE;
	Sat, 11 Sep 2021 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjMC4d26Kg1w; Sat, 11 Sep 2021 19:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EFCF82695;
	Sat, 11 Sep 2021 19:56:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 926601BF285
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8287E608CC
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3h_ADW5816H3 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:55:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DB62607B4
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:55:28 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id kt8so11526192ejb.13
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=46wkc68mnW4i3++h6azX3EDkIsC1pOVG3XmSZfPzYUI=;
 b=h18S+BDxCUMBFvVuGYmwKqjVyQmBHZZEpTcT6tcB0V02cT/05JSX4TTCUtyKIldoz7
 kJ9gRGDjvoCG2SnuheX+ScJSgLCsRSaP1WwFHQygpqQggjZOJQmeDN4HTkKGj7Dgw7J5
 s3I7G6WkL7NdsZrk2e7ZMPMU4/AUcK979rOz2/dfXRC3eR8jUyVcHhkAm1VfGNGD1D5P
 MkpJ/lhP1aJAXtonYO13bNpbxLeT/uRaCp71E/Ejq9z2QJRVj5PBPo271eW2jXddxU4y
 CSRLJnKU1DKxts51ko7tjGVjb3eOrMaCQVl9LUeivoUbB9uPdkPbhsRwEIjpADIGjjgo
 LRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=46wkc68mnW4i3++h6azX3EDkIsC1pOVG3XmSZfPzYUI=;
 b=1rQ4rly4Js+aA1VCNFfEWv8Xf1eAJ8sYGWs+FGFyMCaujR0gsBi8fzSOV3W5+Ykb1Y
 pJyOGkaxA01IT1XELOq+3lZ9UtpFDfSLtgC/i3ZXpMiHXrfo+h46w2LNPPHv5wC2Niud
 lptgFL3ffRrk857t46mnCMi+A53KGC6yKq/ALvCB+0Q2uBhpPnuRnELpZq+51XnxtLzu
 YEaaF5cPdIMpEJaYf0SlAhGAxI8xbqFbVPah2xlLUkIcOlNz77E52e2AV26IGO9fGLhv
 cb2kF3CHTshTKzPXVKcxIgyfdqmcB+6CLQbT1l6CprupTK3mSHuxKOn2y/T81YHyLXV6
 t6ew==
X-Gm-Message-State: AOAM531V1CMKueRyc9SgIgG3oeKddchttgiCA5s9Non8tM9nSD4wWfIw
 4gQFR39w4sVAb/AYypFWaTncnw==
X-Google-Smtp-Source: ABdhPJzKGrRnl3AQjQ0T37917hjUSPuBiJ0RsZQ4m06y7pRzG9zTjbxmNeB7EV+6fZmHpnpGJaCtUA==
X-Received: by 2002:a17:907:2168:: with SMTP id
 rl8mr4382937ejb.42.1631390126908; 
 Sat, 11 Sep 2021 12:55:26 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h8sm1154222ejj.22.2021.09.11.12.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 12:55:26 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210904095403.1519090-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <d865a7ca-0590-efdc-1b5c-06c86e5cdf1c@mind.be>
Date: Sat, 11 Sep 2021 21:55:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210904095403.1519090-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libvirt: fix build with lvm2
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 04/09/2021 11:54, Fabrice Fontaine wrote:
> libvirt needs a lvm2 standard install since its addition in commit
> ccfc90e1010e42e6529afae3a5ea8bf7226dabc1 to avoid the following build
> failure:
> 
> ../output-1/build/libvirt-7.4.0/meson.build:1831:6: ERROR: Program 'pvcreate' not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/dc9af7a677af7e53c1240ebbee5b0edc84c8cf52
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libvirt/libvirt.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
> index 1b420771f5..847c35e06e 100644
> --- a/package/libvirt/libvirt.mk
> +++ b/package/libvirt/libvirt.mk
> @@ -166,7 +166,7 @@ else
>  LIBVIRT_CONF_OPTS += -Dselinux=disabled -Dsecdriver_selinux=disabled
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LVM2),y)
> +ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
>  LIBVIRT_CONF_OPTS += -Dstorage_lvm=enabled
>  LIBVIRT_DEPENDENCIES += lvm2
>  else
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
