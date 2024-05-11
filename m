Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4B1C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 367C84079A;
	Sat, 11 May 2024 20:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qt1vec4c6pN1; Sat, 11 May 2024 20:18:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D33F34086E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D33F34086E;
	Sat, 11 May 2024 20:18:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 212F81BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B30640449
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7F8Fcv62l_k for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:18:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED877400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED877400E5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED877400E5
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:18:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 678BA1C0004;
 Sat, 11 May 2024 20:18:52 +0000 (UTC)
Date: Sat, 11 May 2024 22:18:51 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240511221851.0a722a95@windsurf>
In-Reply-To: <Zj8nmWyktPA/zB+L@waldemar-brodkorb.de>
References: <Zj8nmWyktPA/zB+L@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715458732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWTWAEO1tQUf4OxG+9IJ2fr77NsOL8QfJJUkZtG+F7Q=;
 b=aXC/XDf98hyUZC1p9WtjNIKAgTX5H08xdQ4unlSkmwohoPduuIG7Oj933n7K7O9gd4R3U5
 jHgWU0COu4k9dNKn0S5ZA8lL9jZfq9mosp/zt97Dgt5a/DKcpy3d+p5dXr5iV7ZCfdDDhv
 +tXIojo/FDdLHA47PZ+MqCBWlWEZxya3GuDbrlQekIrtrJyeosZ90vjp+mL7zFyv1UqmJN
 uQ861qEB75cVMCT8aqWnI/EhzaNf6Y3eTBU2x2cj7N2AW+wtaiUKvGTYeb3fDvZ+WsiK/6
 nogGH8uyaY0+Vz3NC/Tbq6YVURNqESsTj5qOBV2Q21Fnju3LTixHVIjxcXWhzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aXC/XDf9
Subject: Re: [Buildroot] [PATCH] arch: remove BINFMT_FLAT_SHARED support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 11 May 2024 10:08:57 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> BINFMT_FLAT_SHARED was removed in the Linux Kernel by commit:
> 70578ff3367dd4ad8f212a9b5c05cffadabf39a8
> 
> It was m68k specific and got recently disabled in uClibc-ng, too.
> See this commit:
> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=72b01dd20f9cea273809e3437b4aba849ae658af
> 
> Now that only BINFMT_FLAT_ONE is supported, remove the choice entirely.
> 
> BINFMT_FLAT_SEP_DATA was removed in 2018 from Buildroot by commit:
> e2ea4157a9a6425506d8ec24a27de216536654a6
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  arch/Config.in                            | 25 -----------------------
>  configs/canaan_kd233_defconfig            |  1 -
>  configs/sipeed_maix_bit_defconfig         |  1 -
>  configs/sipeed_maix_bit_sdcard_defconfig  |  1 -
>  configs/sipeed_maix_dock_defconfig        |  1 -
>  configs/sipeed_maix_dock_sdcard_defconfig |  1 -
>  configs/sipeed_maix_go_defconfig          |  1 -
>  configs/sipeed_maix_go_sdcard_defconfig   |  1 -
>  configs/sipeed_maixduino_defconfig        |  1 -
>  configs/sipeed_maixduino_sdcard_defconfig |  1 -
>  package/Makefile.in                       | 13 ------------
>  package/uclibc/uclibc.mk                  | 13 ++----------
>  12 files changed, 2 insertions(+), 58 deletions(-)

Applied to master after adding a Config.in.legacy entry for
BR2_BINFMT_FLAT_SHARED. None is needed for BINFMT_FLAT_ONE, as its
removal leads to FLAT one being the only format supported, becoming
therefore the default automatically.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
