Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373BFC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E69F5404A3;
	Fri, 10 May 2024 21:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00p2HZFfx9qi; Fri, 10 May 2024 21:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E47840643
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E47840643;
	Fri, 10 May 2024 21:27:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 477071BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32BD242516
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQicOrFmoVie for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC680424F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC680424F6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC680424F6
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:27:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C941040002;
 Fri, 10 May 2024 21:27:20 +0000 (UTC)
Date: Fri, 10 May 2024 23:27:19 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240510232719.5d807833@windsurf>
In-Reply-To: <20240324213042.756402-1-fontaine.fabrice@gmail.com>
References: <20240324213042.756402-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715376441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYE7AYCShGhOWLyK2/m0GCoPyqeR9hMOZWwTZ0r8OcA=;
 b=U6BuTITjm740NVyO0huxjMOkqG9M05iXUzljorU0IFNoJApdKMPJ+7z/csFP+jCeMj6ImD
 qF3n4isjlrxIfS/LR6apSEBBxIPcQs6qK2sP385M+bxFqnwGsYnXTSYcD8Bqsvhi9nEOEN
 Z6xYV4U9Dw3ZGdJfd9cuOmCxAalpD9huzMPa5XY9/Opi2TlWpB1IqQ5woydq8ywLIaw6E5
 gv/QvCouf+4k48sKFjjoq52NXhYhwSSma36d/nyqTinWjJzgXsemJ7U+vdBI8Aa6B6piie
 h8QLldzzCrW8vA32rVw2FugKOdvzIqVbJpXUNgi4ByunhaDn5m84roRTPK/k6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U6BuTITj
Subject: Re: [Buildroot] [PATCH 1/1] package/redis-plus-plus: bump to
 version 1.3.12
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
Cc: Prabhu Sannachi <prabhu.sannachi@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Mar 2024 22:30:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.11
> https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.12
> https://github.com/sewenew/redis-plus-plus/compare/1.3.10...1.3.12
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/redis-plus-plus/redis-plus-plus.hash | 2 +-
>  package/redis-plus-plus/redis-plus-plus.mk   | 2 +-
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
