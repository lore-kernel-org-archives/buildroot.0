Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6553C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D12E41857;
	Mon,  6 Nov 2023 21:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D12E41857
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZd1SNoyVNoQ; Mon,  6 Nov 2023 21:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9087C41904;
	Mon,  6 Nov 2023 21:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9087C41904
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7EE81BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ECE5415B7
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ECE5415B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otlLVB1oiB0r for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:06:10 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09F67414FA
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09F67414FA
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7F1D20009;
 Mon,  6 Nov 2023 21:06:06 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:06:06 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106220606.3394d0dc@windsurf>
In-Reply-To: <20231106201309.7280-1-fontaine.fabrice@gmail.com>
References: <20231106201309.7280-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699304767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDLZEUXLKvhJ0s1vNE/mWKNXe5VKE/+EvKnAjXN4S6E=;
 b=aaxihZLrQOwpzzpa/u8FHgQLHw+ioMOy2VsrZ4dA+7hM3XDvoM8c+1iJKR1o9/V7QndAX0
 JG7V77ElJ+A6eKm/BLXsgfcSA8ha7kGRwEtuVqt+vVhG+lbiNlj574lvoIVzGfpyGy4rOT
 olWCOo+0UsrNxb5S+zTIVb25OITOjM61zBlv/6WV9RaT8ytE7re/ay0dACRPGaBEdPYv6v
 QiIhHntP8VybzukZ3HzwlL4FEep6e/e8ds68Gq0BX/XLnAjFOdC+G4819lvM8A0o81VMAb
 337Y1888Xp4WJ8/RX854h67t/a3VK/rLjPW+YyGp5KeZFlsQUlPeCThCwNi+cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aaxihZLr
Subject: Re: [Buildroot] [PATCH 1/1] package/xen: fix selinux module
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
Cc: Alistair Francis <alistair@alistair23.me>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 Nov 2023 21:13:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following refpolicy build failure raised since commit
> 64ce823223fece5c106994d9654a126fc6161d6a:
> 
> policy/modules/system/xen.te:559:ERROR 'type udev_runtime_t is not within scope' at token ';' on line 628879:
> 	allow xm_t udev_runtime_t:dir { open read getattr lock search ioctl add_name remove_name write };
> 
> [...]
> 
> policy/modules/system/udev.te:205:ERROR 'unknown type systemd_hwdb_t' at token ';' on line 582304:
>         allow udev_t systemd_hwdb_t:file map;
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/849050b00a2ee5983c2324cb955cd533189a0460
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xen/xen.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
