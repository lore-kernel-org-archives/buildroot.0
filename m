Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F0BC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 18:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C1F460011;
	Wed,  1 May 2024 18:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEF4M3TpVkGG; Wed,  1 May 2024 18:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5572960BEE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5572960BEE;
	Wed,  1 May 2024 18:55:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9376D1BF418
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 18:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DCC560BEE
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 18:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5yEgreBcoby for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 18:54:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30C7C60011
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30C7C60011
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30C7C60011
 for <buildroot@buildroot.org>; Wed,  1 May 2024 18:54:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40107FF802;
 Wed,  1 May 2024 18:54:56 +0000 (UTC)
Date: Wed, 1 May 2024 20:54:55 +0200
To: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Message-ID: <20240501205455.2f5c46e6@windsurf>
In-Reply-To: <20240403091952.653698-3-thomas.bonnefille@bootlin.com>
References: <20240403091952.653698-1-thomas.bonnefille@bootlin.com>
 <20240403091952.653698-3-thomas.bonnefille@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714589696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tiL813Qyrj8p9yKigQQOuUrpaY7q70Bve4iO5/kW47g=;
 b=PS2c4PDSFVBgKEgi+Xnidw+kzkQcinyTmkPi+XKSpuE4Yuj8z8lHEsCjZanJmTM2/r2FzH
 23K45igxQnJOrQ8aJvOflNTb2XUrDsA2dQjZFt/gSLvFnnXrm+IlR3TdJwYhV0iRI8rH9h
 LT093OIOt2OR+gxyzRVEMkhuP3Xvl/PfrMRNKIY9pXO53PXFeoZrPn87LV/dr+RqX3cKtR
 +N6D7ifDgzg1u44thg2wxk3TyDIHgJTuStLtfMxeLFUEEQVryhozOPyGCGviTSwhufZq+n
 zMDaZdlxuM/Knfc1Ef0sXkGWQoBL8HZSBBlpU6HxsRwR56+t6xyn/f0yQ2VE7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PS2c4PDS
Subject: Re: [Buildroot] [PATCH 2/2] configs/pine64-star64: new defconfig
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
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Wed,  3 Apr 2024 11:14:40 +0200
Thomas Bonnefille via buildroot <buildroot@buildroot.org> wrote:

> This patch adds a new defconfig for the Star64 board made by Pine64. This
> board is based on the Starfive JH7110 RISC-V 64 bits SoC.
> https://wiki.pine64.org/wiki/STAR64
> This patch uses a custom Kernel and U-Boot made for this board. The SPL
> has to be signed with the Starfive SPL-Tool which is a software
> provided by the vendor to get the necessary headers on the SPL.
> The image configuration is based on the work done by Ivan Velickovic
> <i.velickovic@unsw.edu.au>.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Thanks, I've applied after:

- adjusting the commit title pine64-star64 -> pine64_star64 (to match
  the name of the defconfig)

- adding the host-uboot-tools package with FIT support to the
  defconfig, so that it gets built. Otherwise the build fails at the
  end when the post-build script calls mkimage as mkimage is not
  available. Probably it was working on your machine because you had
  mkimage installed system-wide, but Buildroot shouldn't depend on this.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
