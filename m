Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F85CC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 22:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21BCD406C8;
	Wed,  7 Aug 2024 22:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FiAKSvJeSfUh; Wed,  7 Aug 2024 22:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEA5C40711
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA5C40711;
	Wed,  7 Aug 2024 22:12:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCFDE1BF982
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAD474025D
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ejmyd5M_k8vz for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 22:12:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AEC7F400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEC7F400D1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEC7F400D1
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 22:12:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D77EBFF802;
 Wed,  7 Aug 2024 22:12:31 +0000 (UTC)
Date: Thu, 8 Aug 2024 00:12:30 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240808001230.39ca2187@windsurf>
In-Reply-To: <20240807-tfa-src-update-v2-1-f2cd6166db5f@ti.com>
References: <20240807-tfa-src-update-v2-0-f2cd6166db5f@ti.com>
 <20240807-tfa-src-update-v2-1-f2cd6166db5f@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723068753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=stENKB8Wzn1hoqBUdgynz5gVz9b4slWRJ6a/+s85uio=;
 b=XvBiB9dAjj+Jyw7xKUG50RPBBoShMMvV62krn79NvKnHhpgJJUw7mpGOu+zTAer9CXMm8n
 iSdLbGu3PGuWlGSHbfFPxJ8uCxJU/Ih8d7BT1SuoB6MD0DJJn8dw1cypepIKY8bEXPZSGb
 VeV9OyT923x6yFkQjffoG1LN5YkVvw8cuwh56PaXwWcjVYOdBhz3LmNnDiDbHKgZL+3BX/
 gSUaoNVReByOJLQrYgjQkg1SfiFkSpG9ctbSTfsg0oTd50UItXII2gLvHhkf9wj6d2D+Ge
 9OXyZpe+J9PDAzgc9L8U23/4eQ/KKeD/ruuO5FKwIA0eNzcQ+lkRtE5NS5UK/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XvBiB9dA
Subject: Re: [Buildroot] [PATCH v2 1/4] boot/arm-trusted-firmware: move to
 official source for tf-a
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>,
 Marleen Vos <marleen.vos@mind.be>, Bryan Brattlof <bb@ti.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 7 Aug 2024 12:48:19 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> ARM_TRUSTED_FIRMWARE_SITE is currently pointing to the deprecated
> ARM-software github read-only mirror[0] which is no longer publishing
> new tags. They do have a newer github mirror under the TrustedFirmware-A
> organization[1] which continues to receive tag updates we could use
> however because of the way github generates tarballs changing the SITE
> to point to TrustedFormware-A changes the pre-calculated hash values
> for every version for everyone.
> 
> Without much way around changing all hash values if we want these latest
> tags, lets drop the github mirrors and move to the official git
> source[2] so we can download real tarballs which shouldn't change even
> if the ARM_TRUSTED_FIRMWARE_SITE moves again and hopefully preventing
> this from ever happening again.
> 
> [2] https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/
> [1] https://github.com/TrustedFirmware-A/trusted-firmware-a
> [0] https://github.com/ARM-software/arm-trusted-firmware
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  .../fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
>  .../beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
>  board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash     | 2 +-
>  .../stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
>  .../am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
>  .../am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
>  .../am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
>  boot/arm-trusted-firmware/arm-trusted-firmware.hash                   | 4 ++--
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk                     | 3 ++-
>  12 files changed, 14 insertions(+), 13 deletions(-)

Applied to master, thanks! Note that your patch didn't apply as-is to
master, one defconfig had changed in the mean time. If possible make
sure to send patches that apply on the latest master.

I hope you didn't forgot any defconfig :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
