Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F76C88E75
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 07:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA8F60BD8;
	Fri, 18 Sep 2026 07:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaJkBzUHj4Qz; Fri, 18 Sep 2026 07:28:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9861960BE1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789716497;
	b=jKTNDDAItHVJolQVZzgUkdeRBd5k5g1hgBMJckWUR7ISVJYDhEdZO+RH04cspNMeWYdy
	 HLdzFex98BaPcriWDg2j9oRDyiPT/UJ9FCN8JJb13jKoqMrBE4/Smfsb16/SRwBeB++GZ
	 fcAf7cwfMw6nW6w79lnwnUb9REcLLMLPi2oD1TExy0iWAw9Hao0fgmWF7imFpfykbu3FT
	 o+ZHuLb1AyRtjAT2bPWA2VIf4ndJuvXTsZfntN8evESrLM4Twh2fqm6Kkl5HgV1Nl8B5A
	 o3hEhq/vAwPIOzBKQwOVDe/w99VNhWG9qBD5S6BD7pYsq5fnvUsPGOMWEFTGAEcKGiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789716497;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=puNIvwfn6Vk88MqN9mJwKxCfeZAchQQXR5loheO5WrY=;
	b=b2rLBnqG41+FllHr7dglqDEdiUtvAIk1JmAdXJ5jW6T0gdoIViiO8P5YOcfbO8gBOf5E
	 bfvOoozfX4hUMoVscL+U+usFUcQhu/N0cU7U2TCx8FAOa0LSmtM/Yq1xwF/xehnqc44s4
	 rhcu2j3dG5YIXZgMDfKvpBugJBaTqNSnHdp37h4vbnTeXRqaG7UF2E3Ou1sa5hkB5HB8i
	 b/W8vwU2usUoWE03IzPAlthRVk/nntltS2638Ctl1KHvx70LF/trWflQ0PDfL4jGSk8ZX
	 IyH7yJTMKzYWvoaLONu7j8YL0vFpbVLdb6hj/ByR9x4D/s+MvgbBmX/+8PwXF+bGPmw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789716497;
	bh=puNIvwfn6Vk88MqN9mJwKxCfeZAchQQXR5loheO5WrY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JfXdULDTHXVMIDLQNmhIclxMa/mzkcBCpZnM00qicpfuoEkCQMfsRHPZsHSMufqYh
	 JjQ9PaovaAHQuRNPmeoChUDl8bsEyKsx0EmNJKjO4UgDQE2wYJS8tnqDHcfLUttYXW
	 hUz6+riuMY6CfFgYqdkETah34ymJDs/34vdBH8hdE0FXyrxVPwnJithg2hyY+1zdTj
	 c1jc1M9MVuHP4mfWS5/kFwbcPyFCnekHx5QZVAdugmS1HRBq01u7EA/LQagZpZDtUz
	 pMgGruTUlxpqoQLCp6qYnP+OOlsiSdl55pIBgqlUB2BBgY+ctczQ0D4+5YubTsVP/W
	 XOz/EPNT8ejOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9861960BE1;
	Fri, 18 Sep 2026 07:28:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51B0E37A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3743540AFB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfaOnDF44aHt for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 07:28:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8114740A51
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789716494;
 b=JUSr1b/lX2+SxrdgGDG+IM1K4aer4+vDJkbl/IttLcP0efHLc7n7oXWgQZwXz3tINNoE
 rwHoOFDhyjUOoJTK4z0OhRfUR7uNtl6VIsb2wCxKOM6j8X/zVIqYZZszUKx0oGTXyzOgZ
 yuayvJjNOnzxeHzKCD64wcMHIqrG4pbVSX75J05uqnlh+IBRazx/czSQSi2E/6FdfUhyL
 gEUKejZ3bPYOrYFHfiDa/v88zUhx0rDgdxVtm9Qkf/GGWgjBy2Au1ikuliNNx12zU+7hC
 JBAIE5HdnpBECzhg6yhor1mVH0HKl4M1ySuk9eICaXqROBJqAzdGLxfbUgXUX/qAeug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789716494;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=IvwXzLOrsMwMJx9KddvinhSTn55tKUS6p5SF8hnX/tI=;
 b=qZVWP4+g2VAu3pJG9tEkBNn4i8Kx2A18GDh8f5dD+UR2W8NR9Myf5rN93CPqvt6xogEZ
 ohDkMCqlX/bQzNgflfXReN5zretxjVkp780XDcoRLi9ser3KsA2qmzo1RlnjdxPA1ePcr
 L9qjx2D7Tm+17aIaBANGjP9wOeati3aBLKOflrb3JNrRwIRNWqEAwem7dco1zXK1vJKiT
 qA8zmaxTaHwH+nlxjowWhLiPA7eMNCJWik/Vf1aPmC5wFXIdZGcQ09kF01nZvgDgmGMpZ
 eJZ3eynAqBgPpF9BPsLayrcLndsV5aH+oVyWfyFOn3/o6s+vBvR+fwT1Hp7/tohFErQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2PProLwx; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8114740A51
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:28:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F33EC1A0934
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:28:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C5CCB60649;
 Fri, 18 Sep 2026 07:28:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E7CAE11C7B078; 
 Fri, 18 Sep 2026 09:28:09 +0200 (CEST)
Date: Fri, 18 Sep 2026 09:28:09 +0200
To: Jean-Paul Etienne <fractalclone@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aqznoUtW4EIcK_8m@windsurf>
References: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
 <20260917-rock-pi-4b-v1-2-a1da4ee05567@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-rock-pi-4b-v1-2-a1da4ee05567@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] package/brcmfmac_sdio-firmware: new
 package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jean-Paul,

On Thu, Sep 17, 2026 at 10:42:45PM +0200, Jean-Paul Etienne wrote:
> Package containing Broadcom Bluetooth and Wifi
> firmware for various boards, like pine64, orange-pi,
> radxa boards, etc.
> 
> Signed-off-by: Jean-Paul Etienne <fractalclone@gmail.com>

Thanks a lot for this package. A question though: isn't this firmware
already in linux-firmware? I see in linux-firmware:

./brcm/brcmfmac43602-pcie.bin
./brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt
./brcm/brcmfmac4371-pcie.bin
./brcm/brcmfmac43241b0-sdio.bin
./brcm/brcmfmac4373.bin
./brcm/brcmfmac43241b5-sdio.bin
./brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt
./brcm/brcmfmac43430a0-sdio.ONDA-V80 PLUS.txt
./brcm/brcmfmac4350-pcie.bin
./brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
./brcm/brcmfmac43430a0-sdio.ilife-S806.txt
./brcm/brcmfmac43430a0-sdio.bin
./brcm/brcmfmac4356-sdio.AP6356S.txt
./brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt
./brcm/brcmfmac43362-sdio.WC121.txt
./brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt
./brcm/brcmfmac4329-sdio.bin
./brcm/brcmfmac43430-sdio.MUR1DX.txt
./brcm/BCM-0bb4-0306.hcd
./brcm/brcmfmac4358-pcie.bin
./brcm/brcmfmac43340-sdio.meegopad-t08.txt
./brcm/bcm4329-fullmac-4.bin
./brcm/brcmfmac4356-pcie.gpd-win-pocket.txt
./brcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt
./brcm/brcmfmac43242a.bin
./brcm/brcmfmac43241b4-sdio.bin
./brcm/brcmfmac43143.bin
./brcm/brcmfmac43455-sdio.AW-CM256SM.txt
./brcm/brcmfmac43236b.bin
./brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt
./brcm/brcmfmac43340-sdio.predia-basic.txt
./brcm/brcmfmac4334-sdio.bin
./brcm/brcmfmac4366c-pcie.bin
./brcm/brcmfmac43455-sdio.acepc-t8.txt
./brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt
./brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt
./brcm/brcmfmac43430-sdio.ilife-S806.txt
./brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt
./brcm/brcmfmac43602-pcie.ap.bin
./brcm/brcmfmac4335-sdio.bin
./brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt
./brcm/bcm43xx-0.fw
./brcm/brcmfmac4350c2-pcie.bin
./brcm/brcmfmac43143-sdio.bin
./brcm/brcmfmac4356-pcie.Intel Corporation-CHERRYVIEW D1 PLATFORM.txt
./brcm/brcmfmac4330-sdio.bin
./brcm/brcmfmac43569.bin
./brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt
./brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
./brcm/brcmfmac4366b-pcie.bin
./brcm/brcmfmac4330-sdio.Prowise-PT301.txt
./brcm/bcm43xx_hdr-0.fw
./brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt
./brcm/brcmfmac43430-sdio.AP6212.txt

So what's missing? Is it "just" the .txt config file that matches with
the specific board?

> +define BRCMFMAC_SDIO_FIRMWARE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
> +	cp --remove-destination --no-dereference $(@D)/*.hcd $(TARGET_DIR)/lib/firmware/brcm
> +	cp --remove-destination --no-dereference $(@D)/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm

We normally use:

	cp -dpfr

for such copies.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
