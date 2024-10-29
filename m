Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD52D3A67C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 18:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE867403D8;
	Tue, 29 Oct 2024 18:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHlDVRT_mbCe; Tue, 29 Oct 2024 18:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86EE8403B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86EE8403B2;
	Tue, 29 Oct 2024 18:39:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59A22494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39F27403B2
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7R8HNb9i2gpH for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 18:39:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6E2C401C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6E2C401C4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6E2C401C4
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:39:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC768FF803;
 Tue, 29 Oct 2024 18:39:29 +0000 (UTC)
Date: Tue, 29 Oct 2024 19:39:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241029193928.5d784b3d@windsurf>
In-Reply-To: <20241028223754.2462242-1-bernd@kuhls.net>
References: <20241028223754.2462242-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730227170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkKjHz98Kk3w+zrCiuHtxOv3J3N5oQq1yO55PT/LlZ0=;
 b=bnlQ1tjk2xxOY/Nkx/9EsPwgiGl6W9gE18NW7uMwlxcnLpIiZf+vFeFjiH/xT73w3eMxLw
 xlxOO9xltKfAzP5C/XSOlWma/beAGHEmuD39MZ4Pq9q+CPST2XaKfK8xLHF0JCWEjV0auO
 NFF1nREbZvpNZeIM+Ekvkb9PSnZa2RrbE0L4KzRZhiCsd//Sjxz9OkEzfiXcpAkaHkJPBT
 FIc89FCSk6bM7crdH8tRhLxSXqPt0Y9yaq5AtQVsJEZYHqHNWmgw5C3v+gcI6ogzsSuU0Y
 W6PS3wY05ZHmsGr01ibhbex5E9kzKz/XTcBH7luG3Jg9fnSUALLwYZLabusRuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bnlQ1tjk
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libpng: fix arm soft-float
 build
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

On Mon, 28 Oct 2024 23:37:54 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Bumping libpng to 1.6.44 with buildroot commit
> 583bb434ffe1eec0dbf6887dd719c3f41a6253e9
> causes a build failure on arm because the NEON code is only available
> for softfp and hardfp ABIs, and not soft-float.
> 
> Fixes:
> http://autobuild.buildroot.net/results/021/02158525203d8c7f16a4a32637d44d6c87b7f333/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> v2: updated LIBPNG_CONF_OPTS (Thomas)

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
