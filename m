Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F298EC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 21:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8020241695;
	Fri, 29 Jul 2022 21:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8020241695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OCxfYSazJqmZ; Fri, 29 Jul 2022 21:06:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C12BC41615;
	Fri, 29 Jul 2022 21:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C12BC41615
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE5DB1BF31D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6F1B41615
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F1B41615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYhLGpJ0XXbz for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 21:06:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455C5415D4
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 455C5415D4
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 21:06:02 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w5so7190586edd.13
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 14:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=W/ElTJI5R0Q0HnGKQeZO5SeREv93TIPcQumHSd8MHi0=;
 b=t7UpQGn3fj50O7vR15JStsVxsHNA2BIRDFGrxh04Hvxvqu2Gk+JWsSyI/1VEunlFeI
 jo8813YB7W1+94i/dfTFy+qvxw/4GKFUO8QlcX76sQIQjvUxUR7vAMaMJ4XKbZvSPeyc
 TkhBr5/AhzSRgaoT/9rnNbdv9CUGqrc3LDUpPowLPVMxJq2CdZBfR6Y986dlofOqUpA+
 WHHB+P7kqjFYxY5Sdz4/+zDyOL1W3GeO6KxqdIz7py1W+85r6g4mgtJ9XrYigG8dkaJw
 58IljipcFxWdyCGO0zyDqY6ap7yix6RNXb/vIlugfiuJG2RREp/UrG+zqko0lHiRsgV+
 tMog==
X-Gm-Message-State: AJIora8aXAZf5/hLAtLxCYlOnYm4cJnLd85shECLd87sH25ThGZUcuVR
 RL42z8R8zIkd3IlHyjkpQQ57Hg==
X-Google-Smtp-Source: AGRyM1vbW3HHxh9Z92XkmRyhpkXRCQdOopuYybiILnf/3u6mKNyNI/XKknajsWScv2D++ANL/Jwt1w==
X-Received: by 2002:a05:6402:5107:b0:43b:e073:d802 with SMTP id
 m7-20020a056402510700b0043be073d802mr5177984edd.409.1659128760179; 
 Fri, 29 Jul 2022 14:06:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 s10-20020aa7c54a000000b0043d1eff72b3sm1506286edr.74.2022.07.29.14.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 14:05:59 -0700 (PDT)
Message-ID: <b120f450-f227-3f22-112c-758c8746595b@mind.be>
Date: Fri, 29 Jul 2022 23:05:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>, Julien Olivain <ju.o@free.fr>,
 Davide Viti <zinosat@gmail.com>, Louis Aussedat <aussedat.louis@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 Mike Harmony <mike.harmony@snapav.com>,
 Filip Skoneczny <fskoneczny@gmail.com>
References: <20220729111229.4acffff8@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220729111229.4acffff8@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=W/ElTJI5R0Q0HnGKQeZO5SeREv93TIPcQumHSd8MHi0=;
 b=dpCI1+ih6qu/Q/7/ycq5z0YObZ1ja02KDVQyrN09ucv1bZHMg8tPhVdnMSDqTMbnsR
 sOmdxyhbyHPCkefMn+OiD7nTsUevNaPtyjcANUOPqHTsZmH2m2Km5KxJuGu36HQ9xykr
 vwfzHnnp0Mp+hc1hr9c46UjKDdri2KCE06qj5q4IbHOQ8ck7lUkC7kT0qO++cWWffaVa
 7BKzmMvF9RxleaOfHgq7CLKBqpEh0383s2n7DrEykkL9FQENJbHjB9gd2lO3ivXI+UTG
 HGAOH2L2KL4e3GROTsFMcL9HbHhPDUKWfHNCK+VagvbXq0YtuXfCEikBphFRwmMWt0El
 ZiFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dpCI1+ih
Subject: Re: [Buildroot] Help to fix your Buildroot defconfigs
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/07/2022 11:12, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> You are receiving this e-mail because you are the maintainer of one or
> several defconfigs in Buildroot, which are now failing to build in our
> CI.
> 
> Could you please have a look at the failure (see links below), and
> submit patches to address the issues affecting your defconfigs?
> 
> If you are no longer interested in maintaining your defconfig, let us
> know, and we will remove it from Buildroot.
> 
> We would like all those issues to be fixed for our upcoming Buildroot
> 2022.08 release due end of August. Therefore, if we do not receive a
> fix by then, the failing defconfig will be removed.
> 
> Here is the complete list of failing defconfigs, alongside with the
> failure reason and the link to the build log:
> 
> pine64_sopine_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800954

  This and probably most others where TF-A fails is fixed 
byhttps://patchwork.ozlabs.org/project/buildroot/patch/20220729210444.1787668-1-arnout@mind.be/


  Regards,
  Arnout

> 
> pine64_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800951
> 
> orangepi_zero_plus_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800936
> 
> orangepi_win_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800929
> 
> orangepi_rk3399_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800927
> 
> orangepi_prime_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800927
> 
> orangepi_pc2_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800927
> 
> orangepi_one_plus_defconfig -> syntax error in U-Boot Device Tree
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800907
> 
> imx8mpico_defconfig -> syntax error in U-Boot Device Tree
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800735
> 
> imx8mmpico_defconfig -> syntax error in U-Boot Device Tree
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800730
> 
> friendlyarm_nanopi_r1_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800656
> 
> friendlyarm_nanopi_neo_plus2_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800653
> 
> friendlyarm_nanopi_neo_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800648
> 
> friendlyarm_nanopi_neo4_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800643
> 
> friendlyarm_nanopi_neo2_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800637
> 
> friendlyarm_nanopi_m4_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800634
> 
> friendlyarm_nanopi_m1_plus_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800629
> 
> friendlyarm_nanopi_a64_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800622
> 
> friendlyarm_nanopc_t4_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800619
> 
> bananapro_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800516
> 
> bananapi_m64_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800514
> 
> bananapi_m2_plus_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800509
> 
> bananapi_m1_plus_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800507
> 
> bananapi_m1_defconfig -> syntax error in U-Boot Device Tree
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800505
> 
> Thanks for your contribution to Buildroot!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
