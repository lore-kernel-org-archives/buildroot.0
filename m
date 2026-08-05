Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F4C55ABA
	for <buildroot@archiver.kernel.org>; Wed,  5 Aug 2026 18:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04CCE60628;
	Wed,  5 Aug 2026 18:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdfZXv6l_LbD; Wed,  5 Aug 2026 18:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0670F605E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785956171;
	bh=uptDhTp6yVkEyH4fMiMLtN/W4C3YzunZ4FlSP4sZH2M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qw0/3+7YJwJEQCLMTvLQ9WPvPPF//JHaB21qiN955gBWKrV1wtqiKAA5tGD6d/PqB
	 GeJBU0LCURK1w7gEUJePmKb5yw9zM/KuzeGkbQ0813s6ao+hOgd4WJNK9yeSe5kM7G
	 BTHTvrie2uXLyiMCKF7Mx3vaR0d5UMiv2RoytVftqlzest0wT31k3HKxH5MtTE5p8/
	 owkZOR+9l7Pvh0fUeevEKXzD8/51PNct1HI9xNnNJEfGFh8thtoZloL8Xm0Opi/KWQ
	 gzk1hh30ZjTR8f4ksrqVhsX2gtmMJ2lxo8AhyorKXXv77NLnwLF8vQ43JGzn6C6qD4
	 wXJFuQpCSrviA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0670F605E4;
	Wed,  5 Aug 2026 18:56:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A14C8397
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 18:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EFB040812
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 18:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kk0FiPmFnV19 for <buildroot@buildroot.org>;
 Wed,  5 Aug 2026 18:56:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C62EF40810
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C62EF40810
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C62EF40810
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 18:56:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9DC864E410FD
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 18:56:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 73DBC602AB
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 18:56:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD9B311C351E2; 
 Wed,  5 Aug 2026 20:55:58 +0200 (CEST)
Date: Wed, 5 Aug 2026 20:55:57 +0200
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org, 
 Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Message-ID: <anOHDIfbjB7GXMti@windsurf>
References: <20260805-heaptrack-v2-1-64633668959e@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260805-heaptrack-v2-1-64633668959e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1785956161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=N3u/6JOGReHbTn5Y8aTbNburoTTCJfYSGAI2VUT916M=;
 b=RwwKFmAGHz1tTnnhRvUgW/fShlFmWgnm07vX5tVZ5Rv9iC9af2+VbHUbpXLQS4ekMj7deA
 VhXLkHI+32gxQwffCPMe77iJLAGFQC+uKacvVHbkdhn5vgdrCpkvl1doLOwrmpDWysROmO
 8RnXo+X8hVUaEO9KFNC82GPs1TjU5VmqYqsou8x10xKrzetRQVWL9F+cUB3/4JdoK1zQ0D
 aN2PmP/pIjzWTm4FKJcrTuRGS3qIfMAWMacYWxagjqr0TZpTgDRhGTei8yG/BLe5Whsax7
 Wkesm3f4P6T0ex+e7VeVa4aJKYnuru7Z3LF4BjxB3c+CpmveFoWv2CekrCULzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RwwKFmAG
Subject: Re: [Buildroot] [PATCH v2] package/heaptrack: new package
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

Hello,

Thanks for this v2. I noticed one incorrect thing (but I didn't do a
very thorough review).

On Wed, Aug 05, 2026 at 06:08:47PM +0200, Luca Ceresoli wrote:
> +HEAPTRACK_DEPENDENCIES = host-pkgconf linux boost libunwind zlib elfutils
                                         ^^^^^ linux should not be part of the dependencies

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
