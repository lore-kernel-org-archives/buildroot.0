Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B69CC87FC9
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 14:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31CFB803EA;
	Mon, 28 Jul 2025 14:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uV0ydz1zfvvs; Mon, 28 Jul 2025 14:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49531809F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49531809F6;
	Mon, 28 Jul 2025 14:12:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 518C1DA
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 14:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EA774030C
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 14:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95rNyTnTOEaX for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 14:12:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91F0E4022F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F0E4022F
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91F0E4022F
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 14:12:25 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 33FEEE006B0; Mon, 28 Jul 2025 16:12:22 +0200 (CEST)
Date: Mon, 28 Jul 2025 16:12:22 +0200
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Romain Naour <romain.naour@smile.fr>
Message-ID: <20250728141222.nl3bkdj3gqklhl63@n621.de>
References: <20250611162152.32353-1-fl@n621.de>
 <20250714145242.27516-1-fl@n621.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250714145242.27516-1-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1753711942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3wmv8F+8dLKslGzxu8vlHEELpRGqG1VW+6OcSUnPRno=;
 b=Q6UwJzT2KTD0lZ8Wb0M/f37UMoDh9IWwhwAnZgHjfPkI6uTP6if/l0WEtZ+WTyzHgjqk1u
 k/W6OxucYnL1WTlstb+oYuSC4fHjSk4sZ7JWjWGISEar3Ld4VBlKmAKS170Zo8DS0c3oWX
 Y5+hunE2wiSjWAptKADHQZFA3jeTfQ8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=Q6UwJzT2
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: make pre-built compiler
 provide target support too
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, Romain,

do you have any further feedback on the new version of this patch?

Thanks,
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
