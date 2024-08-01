Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713F7C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 20:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3329E80E46;
	Thu,  1 Aug 2024 20:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vBIwI-hchXl; Thu,  1 Aug 2024 20:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 578DF80CAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 578DF80CAC;
	Thu,  1 Aug 2024 20:59:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FFB71BF232
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C772860689
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrFMYmNTd-kX for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 20:59:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3D11606AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3D11606AE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3D11606AE
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 20:59:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 492C060002;
 Thu,  1 Aug 2024 20:59:35 +0000 (UTC)
Date: Thu, 1 Aug 2024 22:59:34 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240801225934.7cb093c6@windsurf>
In-Reply-To: <20240731212824.734726-1-ju.o@free.fr>
References: <20240731212824.734726-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722545975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OjBWWrfTHKyrzsH18JM6iDzulf4Q1IkNh1uLQLVs8Yw=;
 b=mj4D8ZQADgBBLuZzqwiJo0F5Fm95UKs/Zxo0sQozPLz0UeLl0bYUgTZyZUjCaoObDyd63H
 Aeuh5XDS+PC1Fekj3WmOl75rI2r8VU9+pHgji/xo53owF3lLuCVazjNriCZEnF8PdDsPL1
 ZR1vUw5QDJa7r/HOR7RfpVcWaKc+yXNbAm/OhiPaXCiACNsTD1pskxxRidOC9pj3y0l5Rs
 lG2HOg93C0xKC9FkwXXj33J7srQ8Kxt4zhqovKOdzliE7FidGPYidnFfztXsoXHXcxYPh7
 AzpxMPfTymtNU35h9jssLLMBEBjrS/sV6JbGFtPSCD/S5sSl1u9kIDp21WSpNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mj4D8ZQA
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: bump to version 24.07.00
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Jul 2024 23:28:24 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Release announce:
> https://lists.ubuntu.com/archives/fwts-devel/2024-July/013869.html
> 
> For release note since 24.03.00, see:
> https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes/24.07.00
> 
> This commit removes the patch 0002, which is included in this new
> version.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  ...fix-parallel-build-with-GNU-Make-4.4.patch | 133 ------------------
>  package/fwts/fwts.hash                        |   2 +-
>  package/fwts/fwts.mk                          |   2 +-
>  3 files changed, 2 insertions(+), 135 deletions(-)
>  delete mode 100644 package/fwts/0002-libfwtsiasl-fix-parallel-build-with-GNU-Make-4.4.patch

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
