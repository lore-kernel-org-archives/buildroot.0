Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC301CDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B3B40226;
	Tue, 22 Oct 2024 20:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQn39zGto8US; Tue, 22 Oct 2024 20:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 787234037A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 787234037A;
	Tue, 22 Oct 2024 20:46:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 222432072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F164B4030A
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwpRE2na11jp for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:46:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E54540219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E54540219
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E54540219
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:46:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B07E1BF203;
 Tue, 22 Oct 2024 20:46:36 +0000 (UTC)
Date: Tue, 22 Oct 2024 22:46:35 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Niklas Cassel
 <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>
Message-ID: <20241022224635.654ad847@windsurf>
In-Reply-To: <20241016132443.3859149-3-niklas.cassel@wdc.com>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-3-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729629996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LC2INfarSjfB3KLzNmsHE1I8Hg6+x/AsNiJREJNT3sk=;
 b=AcXVCIU7lGKXadLN+K0mLP3O49+vqZzHV0etAUN8KjJJNiQ2zVWHZ2wR2QSV32yC/pyPZi
 rVy3gSG/1bXeYTZYxulTpDXGWpoBkgwrXcnrHOYqb/cfBxRzq5x4/BSGjYJV0Hv8OrUDPJ
 1TSbxMzwjVC5IU34DAL6Y+30aOSKlsLFIB/udzicvrW2cJFs0SteMYXU0JvotFoKDMU9uA
 DuTTZV8Gu1zO+rR/dSuXtaPUbx1EM/jH19jgG8If76ngUo+5TG14JYZi5c60EF/+HwLCSV
 iAgOn5W8Prh3sYAUGM5zGJjlYyuy3G7fkCrv4YL2KyV/wUuY9T5sig64wkPcJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AcXVCIU7
Subject: Re: [Buildroot] [PATCH v3 2/4] configs/rock5b: update to uboot
 2024.10
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

On Wed, 16 Oct 2024 15:24:41 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> From: Niklas Cassel <cassel@kernel.org>
> 
> Newer uboot versions contain commit ebb0ad4eef0a ("arch: arm:
> mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588"),
> which enables BOOTSTD_FULL for RK3588, making it easier to figure
> out issues with the bootflow, if any.
> 
> Also add the GnuTLS dependency which is needed for uboot 2024.10.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  board/radxa/rock5b/patches/uboot/uboot.hash | 2 +-
>  configs/rock5b_defconfig                    | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

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
