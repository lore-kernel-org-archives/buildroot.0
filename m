Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD41FE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 12:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90F7F40164;
	Sun, 29 Dec 2024 12:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLDUNr5K9sGt; Sun, 29 Dec 2024 12:41:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FF64401EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF64401EF;
	Sun, 29 Dec 2024 12:41:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 278FE72
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 135064046C
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nxiQEkBjsT3 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 12:41:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B72BD4003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B72BD4003A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B72BD4003A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:41:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1D5912003BE;
 Sun, 29 Dec 2024 13:41:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33486])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Dec 2024 13:41:27 +0100
MIME-Version: 1.0
Date: Sun, 29 Dec 2024 13:41:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: kilian.zinnecker@mail.de
Cc: buildroot@buildroot.org, alistair@alistair23.me
In-Reply-To: <20241228192341.929080-1-kilian.zinnecker@mail.de>
References: <20241228192341.929080-1-kilian.zinnecker@mail.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <6340a7f99f6428c6f2e9f0e357412d60@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735476089;
 bh=4rNkvRas+vw1EcFnTMc31bAAVeibHYvlngpMbdOS590=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I/4Vf3zjNgt+j5c4i4OsJhfZbxyYYV6mXrQq7KTISbhcgtbPrHMvbffDpmHuKwZ2I
 XVY3vHSvPMhfrx6YXFlCRDT2tzWQ593yyyDS2M8G9Vlr0a3XzYScJfQM6XcZYNblhV
 VLJxUCTlPyxX9D4o7lfXEPmmWDLQtp0Hk1bTFxu38X85p6OXf0Y6glJrDj+qHZz39B
 ISnu/dHxNsIBTwVvXsje412aEPJZODazwlhcqrQ6ltr067/QHrygdVvSJAtAdZqhJl
 u0UOAn7mqV0H/jqhUO07Qm1TfZgoYPiZIWxZ/aqh6IKoIpfyXn7Rwbd4MEFlD4JMBE
 IfHg/9AjBwMfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=I/4Vf3zj
Subject: Re: [Buildroot] [PATCH 1/1] boot/opensbi: bump version to 1.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hi Kilian,

On 28/12/2024 20:23, kilian.zinnecker@mail.de wrote:
> From: Kilian Zinnecker <kilian.zinnecker@mail.de>
> 
> Release notes at:
> https://github.com/riscv-software-src/opensbi/releases/tag/v1.6
> 
> From release notes:
> "Overall, this release adds more ISA extensions, drivers, and other
> improvements."
> 
> The version bump was tested with the qemu_riscv64_virt_defconfig.
> Howerver, due to a ROM region overlapp issue, the
> qemu_riscv64_virt_defconfig had to be modified for the test. Still
> the OpenSBI v1.6 does work. The qemu defconfigs will be adjusted in
> future patches. For more info regarding the issue, also refer to:
> 
> https://github.com/riscv-software-src/opensbi/issues/372
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> Tested-by: Julien Olivain <ju.o@free.fr>

I applied to master, thanks. I reworded the commit log about the
minimal commands that can be used for testing, and also describing
the ELF image issue with qemu. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/8d94747b33471ff0cc3e4db2459f23b9b34ca0cc

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
