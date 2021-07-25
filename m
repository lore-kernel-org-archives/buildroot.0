Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2B8C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:21:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8F360F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA8F360F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 915ED4042F;
	Sun, 25 Jul 2021 13:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zlZXwJCbcCRn; Sun, 25 Jul 2021 13:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81E6E40373;
	Sun, 25 Jul 2021 13:21:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91D151BF3C1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E80C834B6
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t4IQtxwY3fBm for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 13:21:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C52C282B5E
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:21:13 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id gn26so5406565ejc.3
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 06:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hK/oELqTFQZShfUVHjD+nGe03UnlmxB8DvSHurHgzb8=;
 b=bmTYLj38I2PNybivPpMtY/FQHkMfz5Ms56FcXNxAmOnIan7jJr21G/IK76KlrlJUBB
 P7f53BxBdCMQntTQQY278bOrwOfWW+M/YPo8hBj25gWle1TSpe07c++xMvfZncea3NWL
 IeKC2dBzz8Dx9Xy2RUZNEZHza73aT3sO+XLRZDMSdRNfo8+jPOyaWfiTFpD8d8xLEjbp
 gEtJBEwN6m/5Ibv18Cqu48bIcRXPIf5LjXOTlOmvl5qp+Lzx3vS9m87X5cD3rs+weJHe
 5jZXPfQG139IVBYFfTyJEKXafDh9UXKP0A3dTGI6NI9Muc1/17Jb2UOPgacUpFL73jnJ
 OBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hK/oELqTFQZShfUVHjD+nGe03UnlmxB8DvSHurHgzb8=;
 b=rpZNZrb2FE2VVmWup5spfOrb4yNLX5uYEdibf51nr9aTmsqVZVaWnHOZMDfQVRUifP
 3yzVkbD3wTAydog8HLGtNBY2qrqYcsV1xcFJeq0OJWv8xtCSfCwPAoHhfjPx7/R+0XHV
 9ormT+mn4YX3d+As9PTD8UgwcxyP4i+8ZgtvhXCXDstQhH6L4WTHeVHJfTZeU+RwODFz
 WDvhY+5zejqV9D68scne9VL2TrdLN+JBcT9WqAVlLJm0zeDTPRE4xWPdh6k5goJ+QWNr
 wAyX5s9l8XqxZHmzXN3XexO76B53co061d5Eoy2uTICt+ToAqmEZFcWqbxzxVOVzbLh1
 pftQ==
X-Gm-Message-State: AOAM533LzV8lAZpZFRSRcu6BQO8pXcfM/Ze4VPCEsTZxUrux4FSGmJcC
 Oe/uNhuHj5wSogK6lum3IwztWg==
X-Google-Smtp-Source: ABdhPJzPEbqH0x/oT5lIryFW5myhBJ7d03gGn2weR8p4tdpnc4SA+Bys6xjCw7r+vXmL1Yy6dVd/YQ==
X-Received: by 2002:a05:6402:292c:: with SMTP id
 ee44mr16442612edb.73.1627219272020; 
 Sun, 25 Jul 2021 06:21:12 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l2sm951799ejg.37.2021.07.25.06.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 06:21:11 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1627161553.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <f8f8993a-2505-3c5d-2745-a63fe1b58a8a@mind.be>
Date: Sun, 25 Jul 2021 15:21:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1627161553.git.yann.morin.1998@free.fr>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 0/4] package/pkg-kconfig: introduce generic
 help (branch yem/kconfig-help)
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 24/07/2021 23:19, Yann E. MORIN wrote:
> Hello All!
> 
> This is a counter-proposal to an eariler patch from Thomas, which adds
> and fixes help entries for kconfig packages:
> 
>     https://patchwork.ozlabs.org/project/buildroot/patch/20210703194001.693553-1-thomas.petazzoni@bootlin.com/
> 
> Compared to that patch, this series ointroduces a generic help generator
> for kconfig packages, and removes all existing custom help commands for
> those packages.
> 
> As a cherry on the cake, it adds a new configurator to uClibc, which as
> supported nconfig for some time now...

 Series applied to master, thanks! I'll also mark Thomas's patch as Superseded.

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (4):
>       package/pkg-kconfig: move defaults before calling pkg-generic
>       package/pkg-kconfig: generate generic help
>       package: use the generic _HELP_CMDS for kconfig-based packages
>       package/uclibc: add nconfig as a kconfig editor
> 
>  boot/barebox/barebox/barebox.mk         |  5 -----
>  boot/uboot/uboot.mk                     |  6 -----
>  docs/manual/adding-packages-kconfig.txt |  3 +++
>  linux/linux.mk                          |  7 ------
>  package/busybox/busybox.mk              |  5 +----
>  package/pkg-kconfig.mk                  | 40 ++++++++++++++++++++++++++-------
>  package/uclibc/uclibc.mk                |  5 +----
>  7 files changed, 37 insertions(+), 34 deletions(-)
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
