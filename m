Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0D4C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 20:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBEAE80E1D;
	Thu,  1 Aug 2024 20:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9oJMXk42Jx4; Thu,  1 Aug 2024 20:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2C8E80C96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2C8E80C96;
	Thu,  1 Aug 2024 20:59:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A42EC1BF232
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80B85409EE
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K70OiFjIVDyc for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 20:59:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 398F040997
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 398F040997
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 398F040997
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 20:59:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C54E40005;
 Thu,  1 Aug 2024 20:59:29 +0000 (UTC)
Date: Thu, 1 Aug 2024 22:59:29 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240801225929.7cc8ee14@windsurf>
In-Reply-To: <20240731204453.322627-1-ju.o@free.fr>
References: <20240731204453.322627-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722545970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GAbSMYFFqHk6wclVGUkx7aZqm9QkEGmebvtm2esZyf8=;
 b=jL4LcaFC2jKL58Hs8AhQUIB3LmlClCjbI4uvY88DDAdeJHuHKhfjyeLifutF36N0whgzSp
 u4D5FE7yx4zHRIbGhiLqIpG1Cj1JvvhwO4wENOlMwrZ7e2CKREJWll3QQuTw4rJGhJN8ch
 p7iiFeH9u1E5dl+wUpuojtOsZ0GM+gi15uiwJf0OZgMiJYx0oq+PCSGoFDcMRRRNtBwOe4
 OSr20gM3NpTOnbMiXqrf0IPmuLTbze97z+GTOCnZo+h+J6REJuXT5WylyWxbKSBzknplNR
 NvsOMgJnSfYbhRKQCQDLdtaEW259UhGjODsO4cdisWu9NXPTy+5RQ56k5ZI6lA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jL4LcaFC
Subject: Re: [Buildroot] [PATCH 1/1] package/freerdp: security bump version
 to 2.11.7
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Jul 2024 22:44:53 +0200
Julien Olivain <ju.o@free.fr> wrote:

> See release announce:
> https://www.freerdp.com/2024/04/22/2_11_7-release
> 
> Note: this release is flagged as a "security" bump from the upstream
> release note. While there is no allocated CVEs, commits in this release
> are backported fixes from oss-fuzz. See:
> https://github.com/FreeRDP/FreeRDP/compare/2.11.6...2.11.7
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/freerdp/freerdp.hash | 4 ++--
>  package/freerdp/freerdp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
