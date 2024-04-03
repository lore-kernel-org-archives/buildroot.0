Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD590CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AB8741899;
	Wed,  3 Apr 2024 21:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Ox7DDRTGXOw; Wed,  3 Apr 2024 21:15:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 269E64189F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 269E64189F;
	Wed,  3 Apr 2024 21:15:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 400141BF3D4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B9504189F
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDb3k7BRkoW3 for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:15:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC90941899
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC90941899
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC90941899
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:15:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABEE1240005;
 Wed,  3 Apr 2024 21:15:42 +0000 (UTC)
Date: Wed, 3 Apr 2024 23:15:41 +0200
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20240403231541.5b862c85@windsurf>
In-Reply-To: <20230920060831.71857-1-fido_max@inbox.ru>
References: <20230920060831.71857-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712178942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0AU1Qgw8+HmJVqhbh8xDuJtBkWxluuTjkLnBITR1K74=;
 b=MOHrU3brvmItXuayP4sAb6igAZgeVLzi5NzmXAXphzM7SvDLVBxNDqGtsp3N1PHExAsNbB
 QaHHhvzVboGeQtDGwiPv6BxzuZx8jiPY2PRREhU0vrwmGuS85dsz+EMVHix+GpLrByJ1+u
 42UNAUVS0JHng/XofN02JaRNpuaPDMLaMvwRCTahKR+fsgPDXFj2pISbzftp8wY9RfC+uu
 w9FQX/3MIzSGR6bCnrXH3zskqMKMTNi2evDKIRg34CIDyirsiKemECtAE9KPKQ4k8Wnk/J
 SyOeoFrOPzem2cwAU9pNaMiOZaHbXTg/ikuaGPtRTQufjsMtyctoaBUaiXC0xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MOHrU3br
Subject: Re: [Buildroot] [PATCH 1/1] qt5: enable jscore/qt5declarative
 support for riscv
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Maxim,

On Wed, 20 Sep 2023 09:08:31 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/qt5/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index f1b16ff39b..e15d3a5005 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>  	bool
>  	default y
>  	# Javascript engine is only available on certain architectures
> -	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel || BR2_arc
> +	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel || BR2_arc || BR2_riscv

Thanks for the patch and sorry for the super long delay in getting back
to you. Could you provide a bit of details regarding since which
version is RISC-V supported by JSCore ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
