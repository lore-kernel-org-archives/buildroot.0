Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EB9D3ABF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C48C080DF9;
	Mon, 11 Nov 2024 20:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpD9TEXHodqK; Mon, 11 Nov 2024 20:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBFC980E10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBFC980E10;
	Mon, 11 Nov 2024 20:57:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E8D7DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C559401A2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1vyPKn0WiDP for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0495540124
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0495540124
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0495540124
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:57:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 541C3240002;
 Mon, 11 Nov 2024 20:57:49 +0000 (UTC)
Date: Mon, 11 Nov 2024 21:57:48 +0100
To: Brandon Maier <brandon.maier@gmail.com>
Cc: buildroot@buildroot.org, Niklas Cassel <cassel@kernel.org>
Message-ID: <20241111215748.4ee4e4e5@windsurf>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-2-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241109-genimage-partition-type-uuid-v1-2-9f23180c7195@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731358669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Nf3UP0CFEW7q/aFHu3R+p0pbblzwXoAf7uMoVnwGkM=;
 b=KAiq0aRlkC0//0NFsSP/ZyEdiPjDwEb3nJSNsGElaX2dJrBqUNWpQtewFodonPF/u25nZs
 T8weSIApbktWR9X2GjKECfKBdKQjMXfdIy+3IiPa4lNv90po+SatXYTAg0dqTuzGW9DFqC
 Cxffv/8EOIcdT63+6fBW5jnDKdiWhp+SO3dT0qX5mELXl/2ay5WYeTh7MYYTgteC3rF+nc
 tnqyZqYB8v9a1gU3RSJwi16OniJj3iBrhuJ8i/qfKZukgZav8YzkO7cvq1ZrAG3pQD4Stg
 u2b3oQxnu84y0cHx0heI2tp2ie/D8+0TOKaFbL+Eo3D618wiDE3/X5CuM0Xzmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KAiq0aRl
Subject: Re: [Buildroot] [PATCH 02/17] board/beagleboard: use
 partition-type-uuid "L"
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

On Sat, 09 Nov 2024 16:16:16 -0600
Brandon Maier <brandon.maier@gmail.com> wrote:

> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
> ---
>  board/beagleboard/beaglev_fire/genimage.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/beagleboard/beaglev_fire/genimage.cfg b/board/beagleboard/beaglev_fire/genimage.cfg
> index ef650704c65f24eea37fb1fa8d53b5759062d570..0241480ad6041883a799ed68c6f080d8a3b29cae 100644
> --- a/board/beagleboard/beaglev_fire/genimage.cfg
> +++ b/board/beagleboard/beaglev_fire/genimage.cfg
> @@ -24,7 +24,7 @@ image sdcard.img {
>  	}
>  
>  	partition kernel {
> -		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
> +		partition-type-uuid = L
>  		bootable = "true"
>  		image = "boot.vfat"

Considering it's FAT partition, and not the root filesystem, this
change doesn't really match your documentation update in PATCH 01/17,
where you state:

+** +F+ for a FAT partition (expanded to +ebd0a0a2-b9e5-4433-87c0-68b6b72699c7+
+   by _genimage_)
+
+** +L+ for the root filesystem or other filesystems (expanded to
+   +0fc63daf-8483-4772-8e79-3d69d8477de4+ by _genimage_).

So I would rather be expecting F here, and not L.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
