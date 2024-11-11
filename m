Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609FDD3ABF6
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 21:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ABF760008;
	Mon, 11 Nov 2024 21:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGOfue5pMtMk; Mon, 11 Nov 2024 21:02:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0EF606F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D0EF606F8;
	Mon, 11 Nov 2024 21:02:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48C5DD8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3638580F1F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lOCyiIDwvq0 for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 21:02:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A2CA80BE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A2CA80BE7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A2CA80BE7
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:02:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07BE3C0006;
 Mon, 11 Nov 2024 21:02:47 +0000 (UTC)
Date: Mon, 11 Nov 2024 22:02:47 +0100
To: Brandon Maier <brandon.maier@gmail.com>
Cc: buildroot@buildroot.org, Niklas Cassel <cassel@kernel.org>
Message-ID: <20241111220247.321caa3b@windsurf>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-5-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241109-genimage-partition-type-uuid-v1-5-9f23180c7195@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731358968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YM0A87/H4Vk7CCVotOUhsx/SvcVFQi4C6z6+2Jusdm0=;
 b=THuUcOSuB0SkXlJbMAwbaBktIa1RnCw5NMJhkjqfG7PWZgzQBdfAXje16R3Zwljgwiq0zI
 HN9ZGpanIXGkY6VQxrnl7Gr+Wjc5rssCqddlmiXAube9KlbV9S9X4aoMNYi1jFsRbTgdzP
 V2nda5WxxnWevmL2DKkLz0Ike2WNaEVHLRZ8dGYD2Bm8plA84eAcFM2gMM3RzXUlxs3vNK
 NgG4ChGePEvWLOxGCzG89HaJBlIgocx/a8E5OFzUFZcC6PLFJ9wiXtJpuOImcjPeYFLSDG
 aN4taxohw0ZZ1epYdYEKYMDf2pim0u4Df3pcKHZZe2xUwdfFbAm+2eORzIHc9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=THuUcOSu
Subject: Re: [Buildroot] [PATCH 05/17] board/pc: use partition-type-uuid
 "root-x86"
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

On Sat, 09 Nov 2024 16:16:19 -0600
Brandon Maier <brandon.maier@gmail.com> wrote:

> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
> ---
>  board/pc/genimage-efi.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
> index c231e1b9b2626c5a788c85511b1f1e9d12759d33..7d3d69bd067c2c39f5188d82d2e1fd11088657e1 100644
> --- a/board/pc/genimage-efi.cfg
> +++ b/board/pc/genimage-efi.cfg
> @@ -25,7 +25,7 @@ image disk.img {
>  	}
>  
>  	partition root {
> -		partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
> +		partition-type-uuid = root-x86

I don't understand how this lines up with the policy you have updated
in PATCH 01/17.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
