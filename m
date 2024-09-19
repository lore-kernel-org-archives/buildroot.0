Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2713CE8D78
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 11:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C47684701;
	Thu, 19 Sep 2024 11:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMD4NlZ4n0e8; Thu, 19 Sep 2024 11:53:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7784884716
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7784884716;
	Thu, 19 Sep 2024 11:53:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B62CE1BF33B
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B15E784716
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJR6cctHkvOK for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 11:53:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B35F84701
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B35F84701
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B35F84701
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:53:40 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso1226074e87.2
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 04:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726746819; x=1727351619;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nqx8hbNzNyaSiCoiaLdEvUcEgVd8R6lLIdS+GJq+nP8=;
 b=Mh184K4whxI9i5emZdUYQiZ/cItEw5a8ylISI7AJmnIsJ/BL+QvrSO9neRlfaxrJfI
 YENAPgdHzS2mZVvik+efkeL67lt7+COUAz2Y72FISKv1rnfXz6BHmpc6QkpwkZk6fWOo
 8y44LMz/AO08oEpnTicUmUbjWjOjWGHCL76G5BUjgYqsQ/X9+nx+UOdP6R6fUE5F79fl
 wC+Mg4YHttNWbYmQu0U9VtX+2QHVLnsOHhnhAWPDsf4wlKhvDsFZmFKNP5p73iRTWOQo
 AkYDDDPmZtdjV9q5DggETD//ZqU0SyI7hS/vX5u7q2rYIgsjhjeX+6Uli1qJqBeL5PlW
 SOuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Il1gWayNO0ujbCufbSL+EUKV1sB5ddR+LADgBX1AeOYXeTu9ZE+CUsQHl4dYjsgCM9mAaAYOQGc=@buildroot.org
X-Gm-Message-State: AOJu0YyNglxN/RvGF+jrlpACQtq5d2GgmJkVUvoHr4ROBOOtpF22+i/Q
 P15p17+6oFH1KiipSeBqmKx0N12T7baf3wapkoKl9h5DrKH8o09kVZKVu5hA5xnKq+8gIlVJl3U
 Kdlg=
X-Google-Smtp-Source: AGHT+IHzkT3fa/+zO1lfREECw5ApMzshfyGc+TWsDBE23ffs6k2Xzt1oTGwbLXrM5z8BsAlpJkgnjQ==
X-Received: by 2002:a05:6512:a90:b0:52c:9877:71b7 with SMTP id
 2adb3069b0e04-5367ff398c4mr16448626e87.59.1726746818539; 
 Thu, 19 Sep 2024 04:53:38 -0700 (PDT)
Received: from [10.130.6.116] ([83.68.141.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061096a1esm720258366b.14.2024.09.19.04.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2024 04:53:37 -0700 (PDT)
Message-ID: <216539b9-4730-4adc-b400-655d287a082a@mind.be>
Date: Thu, 19 Sep 2024 13:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neil Webster <neilw@tungstencollaborative.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <bf3a752a-6954-44dc-b805-c7850be85539@tungstencollaborative.com>
Content-Language: en-GB
In-Reply-To: <bf3a752a-6954-44dc-b805-c7850be85539@tungstencollaborative.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726746819; x=1727351619; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Nqx8hbNzNyaSiCoiaLdEvUcEgVd8R6lLIdS+GJq+nP8=;
 b=SlNRn+nWDNve06rHSVYbuaM+1EpHu/0rVIJB5iBZxV4Ts9wNGiskn23Tc+QExC9gty
 2q9HqN9v4v8p8C97b94AjPYAy6c6XN7l7JYrI3PA+fFOungvGZrAi7dJ83BvNxZBKmdS
 8/mIEaygmsUuum+rFnJ9ik7IAh5iUEva94DaX09BwC7ZUUuEvPrUTZx3ljozfLypevjX
 m3H4Up3fTCdcCa/sLNxXPljXA/odx0AcomhGj2EpSAuAIVKmNp/W+3ZNqycUd4/C8bhD
 Pkw1mCFggFZwO0rETgM68LZYB6f8GAHVQuNqFx3HcUUj3gd19p8tjf71v3avtCjElMYj
 TCMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SlNRn+nW
Subject: Re: [Buildroot] Variscite Dart
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

  Hi Neil,

On 19/09/2024 00:19, Neil Webster wrote:
> Hello,
> 
> I am new to Buildroot and have been struggling for a couple of days with
> something and wondering if I could get some pointers. Please let me know
> if this is not the appropriate place to post such questions.
> 
> I want to get an embedded Linux image running on a Variscite Dart Mini
> (link below)
> 
> https://www.variscite.com/product/system-on-module-som/cortex-a53-krait/dart-mx8m-mini-nxp-i-mx8m-mini/
> 
> I have the SOM connected to a dev kit referenced in the same link above.
> 
> I wanted to use the opportunity to get familiar with Buildroot but sadly
> Variscite do not support Buildroot and instead they steered me towards
> Yocto.

  :sad-face:


> I have been able to get an image running with Yocto following their
> recipes but I found the whole process to be obscure and opaque and I am
> therefore back to my original objective of using Buildroot.

  Please make sure to give this feedback to Variscite!


> 
> I have been able to follow the tutorials and get a build working on a
> Raspberry Pi.
> 
> However, as mentioned above there is no support available from Variscite
> and there is no specific defconfig for my hardware, so I tried to start
> with freescale_imx8mmevk_defconfig as this seems to be close with what
> appear to be correct settings under the "target options" menu.

  Yes, that's an excellent start!

  ... but not enough to get a working board...


> However I am not getting anything at the console.
> 
> I noticed that the freescale_imx8mmevk_defconfig sets the getty TTY port
> to ttymxc1, so I tried changing this to ttymxc0 as that is the port
> mapped to the debug interface on the development board. Still nothing at
> the console.

  That is one of the things you need to change indeed. However, things already 
went wrong way before that, because you should have gotten U-Boot and kernel 
debug output on the console.

  There are a number of things you have to change in a defconfig when you switch 
to a different (but similar) board. I'm going to list them below with the symbol 
names, not how they appear in the menu. You can always search for those symbols 
in `make menuconfig` by typing /

BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call 
github,nxp-imx,imx-atf,lf-6.6.23-2.0.0)/imx-atf-lf-6.6.23-2.0.0.tar.gz"

You should check Variscite's yocto layer to see if they use the NXP TF-A or if 
they fork it even more. They may also use a different version.


BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"

I expect that this will be OK for the Variscite board as well, but it is 
possible that they have defined their own platform.



BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call 
github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"

You should check Variscite's yocto layer to see if they use the NXP U-Boot or if 
they fork it even more. They may also use a different version.


BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"

This needs to change to the U-Boot defconfig. That defconfig could be in NXP's 
U-Boot fork already, or it could be in Variscite's fork, or Variscite may supply 
it in their u-boot yocto recipe.


BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call 
github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk 
freescale/imx8mm-evk-revb-qca-wifi"

You probably start to know the drill, right? The defconfig is probably OK, 
although it's possible that Variscite appends a fragment to it in their 
bbappend. The DTS name is most definitely not OK, but it might come from 
Variscite's metalayer instead of NXP's kernel. The kernel is unlikely to be 
forked by Variscite so that one is probably OK, but it may be a different version.


> I tried changing the init system from busybox to systemd. Still nothing.

  No, busybox init should work fine.


> I feel like I am poking around in the dark. Any thoughts on what I
> should try next?

  If you do manage to advance with this, there are two contributions you could make:
- You can add a defconfig for the Variscite board.
- You could update the documentation with a "how to add support for a new board" 
section that explains what I wrote above in a better (more generic) way.


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
