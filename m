Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D19C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 743B6820C7;
	Thu,  1 Aug 2024 21:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2P4sH4pgwj15; Thu,  1 Aug 2024 21:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6841D82073
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6841D82073;
	Thu,  1 Aug 2024 21:42:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F00691BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD7F24029F
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oN-gexx2eOg3 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:42:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D2BC40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D2BC40153
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D2BC40153
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:42:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1BC4C0002;
 Thu,  1 Aug 2024 21:42:21 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:42:20 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240801234220.7fec4b79@windsurf>
In-Reply-To: <20240731195923.32520-1-ju.o@free.fr>
References: <20240731195923.32520-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QFiPlkKymkkK/8m3gDtETOSJRFqqt3LFiQS36xGaz48=;
 b=plcQW7zrq9ULdHDBqvrcP1tzbspHLuFdoIUzYJoIHhHoQwbkPQrTUD4+JGglhuyEyhJKZA
 2sEGHD/O8kQiY2+FaOl/UBVGNusnI1eXfzC96AfXzMkNs1PB//s17k4Hlhn491ywGy0Swi
 cmE5GxVIr+kwxODVn0R11EhIwuMKanAkvqV96BvNcOfGy/RSlOe04bNkOTyEGNeQv6dIij
 SUZGnAcbZedOAw6Evwv2P4lcZzdUJbDomJE3RVnXPa8urfPndwMCR+W6ks9lKY8+xgK6DF
 OCTSKOa5UqnrcK7mU6Ow42gRp1oXQ0fHaw7+RK5oXCFtFkOlqTtpb4mxJngObA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=plcQW7zr
Subject: Re: [Buildroot] [PATCH 1/1] package/imx-mkimage: bump to version
 lf-6.6.23-2.0.0
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
Cc: Erik Larsson <karl.erik.larsson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Jul 2024 21:59:23 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/nxp-imx/imx-mkimage/compare/lf-6.1.22-2.0.0...lf-6.6.23-2.0.0
> 
> Note: the Buildroot package version name before this commit was
> "lf-6.6.3_1.0.0" (with an underscore "_"), which was in fact a
> branch git reference. See:
> https://github.com/nxp-imx/imx-mkimage/tree/lf-6.6.3_1.0.0
> 
> It should have been the tag name "lf-6.6.3-1.0.0" (with the dash "-").
> See:
> https://github.com/nxp-imx/imx-mkimage/releases/tag/lf-6.6.3-1.0.0
> 
> This commit fixes this issue by updating to a new git tag reference.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/imx-mkimage/imx-mkimage.hash | 2 +-
>  package/imx-mkimage/imx-mkimage.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
