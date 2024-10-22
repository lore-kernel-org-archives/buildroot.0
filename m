Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BFBCDD0E1
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6909E80BB6;
	Tue, 22 Oct 2024 20:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlHi2Bzkq2IO; Tue, 22 Oct 2024 20:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D79E80BBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D79E80BBB;
	Tue, 22 Oct 2024 20:31:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD7202072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E46360664
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id in7mR9Bk4vpF for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:31:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B647605E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B647605E7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B647605E7
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:31:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7007D20007;
 Tue, 22 Oct 2024 20:31:13 +0000 (UTC)
Date: Tue, 22 Oct 2024 22:31:11 +0200
To: Roberto Medina <robertoxmed@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241022223111.4200ccd2@windsurf>
In-Reply-To: <20241015172607.635267-1-robertoxmed@gmail.com>
References: <20241015172607.635267-1-robertoxmed@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729629073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cnyX8E94w+7qebd/1J/0aCxd+6ZS4Tlo3TTNhpdHuWY=;
 b=AO5FHLLceR57q/vJveSmrbGrLNPFuI10apPUQPS2P+veONoS/cMnGLN7Vsf21gUSiwOSAI
 sQSlrJ9ORuodvZUfinFXlqKoAMJvlNplVxuKlHsN8WVuablZOJbUm3Py63AU/nns9KpX6h
 EPram+qfARVqR/cbvtLi7OZ6Gc2O2yXkYQ3zSHSoHc/8oQurlfSq8vusTuSjPWyP8mrPEz
 7060AyrTkYmzU/vC0oZFD+1ZIi/CncTOrss1olA7G36wPxHtPYFzwVqz8kpCS8CpdptD0B
 oNtE7BlTi6qox1cud8gQZQInrp2dD6o4EVp1Rkc23B+0bhHKQ50Da8eql/L99g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AO5FHLLc
Subject: Re: [Buildroot] [PATCH 1/1] configs/roc_pc_rk3399: Bump Linux,
 U-Boot, TF-A
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

Hello Roberto,

On Tue, 15 Oct 2024 18:26:07 +0100
Roberto Medina <robertoxmed@gmail.com> wrote:

> - Bump Linux to 6.6.56 (LTS).
> - Bump U-Boot to 2024.07, so it contains commit ebb0ad4eef0a ("arch: arm:
> mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588").
> - Bump TF-A to 2.11.
> 
> Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
> ---
>  configs/roc_pc_rk3399_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Thanks a lot for this contribution! However, we are taking advantage of
such version bumps in defconfigs to migrate them to have
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in those defconfigs. Could you try to
enable this?

./utils/add-custom-hashes will help you generate the necessary hash files.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
