Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B543C52D70
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 17:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2C7860643;
	Mon,  5 Aug 2024 17:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5i4uDRVUHpMb; Mon,  5 Aug 2024 17:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB2D7606EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB2D7606EB;
	Mon,  5 Aug 2024 17:40:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 868D81BF31C
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 17:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8175F606EB
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 17:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j07oH49sxS2f for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 17:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=dlemoal@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8435960643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8435960643
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8435960643
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 17:40:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 06C3660DD0;
 Mon,  5 Aug 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4250C4AF14;
 Mon,  5 Aug 2024 17:40:31 +0000 (UTC)
Message-ID: <dcd68d5a-27b8-4084-ae3b-ae6b7c2f9287@kernel.org>
Date: Mon, 5 Aug 2024 10:40:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
 <20240803224527.1a93f941@windsurf>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240803224527.1a93f941@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1722879631;
 bh=ZevayfP5ltxnNGDnLZQFD15dnCBivVdeHzSWLb+f+Hk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jko/swCmzHZwQgeNWAheF8T8fvQnJIyZzwPi9D+IlYY8111r/GgYzMb9pTaysb9z8
 H6r4xgiUs43TGByed0PuZyexWbs8tEpsTCW/5dNrTJAbnvaTo38ig/amNPWBbXmMlK
 Y8SMsDvOBLF1BTlxBIAenoSJUs+cc7IC8N61caeHx7kCAra5pukkrH2yYHgXIxiAkC
 Y+zA4H78RGQypX0s3EVjFXMbDVo+gRlY+qriflssxDOnOsFsItqCYk1YlskCca9yft
 64Th9ddx5dSJ/6LDSFEuWDOUDmjd2o33f8wKSufTfdua7wNbRyjA+OKXiZdkEucyJy
 lU1okebn5mlJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jko/swCm
Subject: Re: [Buildroot] [PATCH 0/3] tinit and stm32f746_disco_sd_defconfig
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024/08/03 13:45, Thomas Petazzoni via buildroot wrote:
> Hello Dario,
> 
> On Sat,  3 Aug 2024 17:55:14 +0200
> Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
> 
>> This series is inspired by reading the following topic:
>>
>> https://lore.kernel.org/buildroot/20230206230203.70e2dbd8@windsurf/T
>>
>> Starting from that patch, and following Thomas Petazzoni's suggestions
>> regarding the possibility of using a single minimal script without
>> duplicating it within Buildroot, I developed these three patches.
>> Meanwhile, the configuration for the stm32f746_disco board was useful
>> for developing the display support for the board, which was later
>> merged into Linux.
>>
>> Dario Binacchi (3):
>>   package/tinit: new package
>>   configs/stm32f746_disco_sd_defconfig: new defconfig
>>   board/canaan/k210-soc: use tinit as Linux init process
> 
> From a high-level point of view, I think it looks fine, though I'd
> really like to have some opinion from some of the other maintainers on
> this.
> 
> Maybe some comments:
> 
> - I don't really think it's super useful to have a Github project for
>   tinit. The script could just as well be inside package/tinit
> 
> - Should it be named tinyinit instead of tinit, just to make things
>   clear?
> 
> - I believe you should drop entirely the logo thing in tinit, we don't
>   have such "logos" in any other Buildroot defconfig, so I don't see
>   why we would have one for those super small noMMU defconfigs. This
>   would allow to get rid of tiny-setup.sh stuff.
> 
>>  .../stm32f746-disco/busybox-tiny.config       | 230 ++++++++++++++++++
> 
> Why do we need a busybox-tiny.config? We already have
> package/busybox/busybox-minimal.config. How different are they?

I tried to compile the sipeed_max_bit_defconfig to check again but running into
an error (host-fakeroot download fails with "The certificate is NOT trusted. The
certificate issuer is unknown."). Let me dig into that.

> 
> Thanks!
> 
> Thomas

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
