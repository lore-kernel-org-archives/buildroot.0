Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C91FC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 20:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38DC2608FB;
	Thu, 15 Aug 2024 20:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Er7mCBVd_yVf; Thu, 15 Aug 2024 20:00:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CFA360ACD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CFA360ACD;
	Thu, 15 Aug 2024 20:00:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9001BF599
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7502D400B5
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sf147ycjwaps for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 20:00:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B000740FB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B000740FB4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B000740FB4
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 20:00:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C12B3C0003;
 Thu, 15 Aug 2024 20:00:49 +0000 (UTC)
Date: Thu, 15 Aug 2024 22:00:48 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240815220048.51b80da6@windsurf>
In-Reply-To: <20240815-zynqmp-zcu10x-defconfig-fix-parallel-build-of-uboot-v1-1-5fef12406c32@collins.com>
References: <20240815-zynqmp-zcu10x-defconfig-fix-parallel-build-of-uboot-v1-1-5fef12406c32@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723752050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAZZcufiSy/uuN7MEe4tKAcKYZPD/p2AMjUrFzG5GpU=;
 b=pRQ77+xgujk4iOLvrFS8OUcf4GwEc/4+H5Fh9QjZ2I84N+Jr28uecHEmyVLAOtY3tguOUf
 IJ6IzgmqKiq/4N1outrNncIjUBjdhArreOm5EgEILl+9ynxzFqtc/Y8B1EVx00dv6u+iir
 VgfFKMeRq63WtJxIyBU6MANHn7G3/UleY9AKVxpeT8EFSyvCiy1OoaXJMfa91NkaBiU+33
 yueyPAmOnqZUzeWwz4Qd27sv+VxYz/n7w3TVz7Ya6YhluBCeWADUm8opBM39L/1fO8GDnN
 M1rQyP/ZqGEfNGlaJrMO0sXHJPb2JGd8cB6VfXrCTfYf8F30e7akF7NRIDH0BQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pRQ77+xg
Subject: Re: [Buildroot] [PATCH] configs/zynqmp_zcu10*_defconfig: fix
 parallel build of U-Boot
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 15 Aug 2024 14:18:02 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> When building these boards with BR2_PER_PACKAGE_DIRECTORIES enabled, the
> following error occurs from U-Boot.
> 
>   tools/mkeficapsule.c:18:10: fatal error: uuid/uuid.h: No such file or directory
>      18 | #include <uuid/uuid.h>
>         |          ^~~~~~~~~~~~~
> 
> The U-Boot defconfig these boards use 'xilinx_zynqmp_virt' enables
> CONFIG_MKEFICAPSULE, which requires util-linux.
> 
> This doesn't fail when BR2_PER_PACKAGE_DIRECTORIES is disabled. This is
> because host-e2fsprogs requires host-util-linux, and host-util-linux
> always builds before host-uboot when single-threaded.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  configs/zynqmp_zcu102_defconfig | 1 +
>  configs/zynqmp_zcu104_defconfig | 1 +
>  configs/zynqmp_zcu106_defconfig | 1 +
>  3 files changed, 3 insertions(+)

I fixed up the commit title, because the issue is not about "fixing
parallel build of U-Boot", but making sure it has the correct
dependencies. And then I applied to master, of course!

Thanks for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
