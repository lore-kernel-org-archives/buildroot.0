Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD2CC43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 11:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F0380CB1;
	Sun, 12 Jul 2026 11:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfEagjMBm3Y8; Sun, 12 Jul 2026 11:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431BD80CA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783855603;
	bh=DUX++FBqyYz/UOTWqhCScK+3Axjt0xAi8HGjqy2jjBc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nv3DvsxNBhrqwZ8Am115VDdV3nbYyonJh66AlY2EYiw3hOQ0Gs7K3A+82jo5lT9tI
	 R18nrNMACkY9dIeBae87RapfpSQO0vGrR8fs4nHNBBt1H+QJ23/3H0Xifgibp55lEo
	 zCp5hZVzk8wUfN3WRyUwmdBWTFBEy1UaU8Jvdw6YEX6TgqgWKxP0ELMb/otnEyXEC8
	 qWxgOEqEYRXtya0VJNza3+BXn573ko9O3pM/xQ6zoVAbi+WF/KATuKpiPZhKE1j18l
	 RTTL8RpTguXvmZ9JHKgHmXip7MriM4fE69fsp6gl5CMfppoCXULuk+MFVzOJP3fXEd
	 YJsnmwfnvsr8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 431BD80CA8;
	Sun, 12 Jul 2026 11:26:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0403E2EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE29F80CA2
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCagP_U1cMlh for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 11:26:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38FD580C9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38FD580C9A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38FD580C9A
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:26:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A154019F73C;
 Sun, 12 Jul 2026 13:26:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jul 2026 13:26:32 +0200
MIME-Version: 1.0
Date: Sun, 12 Jul 2026 13:26:32 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260712082328.1984967-1-dario.binacchi@amarulasolutions.com>
References: <20260712082328.1984967-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <235e743cc972d4f2e1e30c50f61f72b6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783855598;
 bh=ze7He5l53/vO58OFIPLjCTCYhw0DAVf+tItI+9osh18=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=StxjXMGs4Me5We0T4z4LqeBGizoJANBQvR3l19TT7YesIJYLuUcPG5YC646NVbXTI
 TYfUwnL16RY9wrqryMiVx7m5ySRXP+L0mimth6e3pP22gWBiHHGqaHuy3bAzfJO0r5
 6NYWuvg64NnIfxHDdKhPewQp1rhYMXZh3np5ILpzx8Fnghthi8tEDJrPHQWp/izdFE
 83QP7ZbbS6LZDkIsfnQXEwnIel5nP2TGF9SRH9DEY8CXk0dQ6tETI/bbgw1kq49cc6
 dCanaJ+pn+npNe/GliWhXL52rID3RiSbBskbQQp4veyiXs3EwtQf1ZKS1ig3SvQgKZ
 VwHicaxgbF38g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=StxjXMGs
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32mp1*_dk*: bump Linux to
 6.12.95 and U-Boot to 2026.07
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/07/2026 10:23, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.95 and U-Boot to
> version 2026.07 for
> 
> - stm32mp135f_dk_defconfig
> - stm32mp157a_dk1_defconfig
> - stm32mp157c_dk2_defconfig
> 
> Tested on STM32MP157C-DK2 Discovery Board.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
