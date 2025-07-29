Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9640C87FC9
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 23:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E4A961270;
	Tue, 29 Jul 2025 23:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maT0E75bMKtn; Tue, 29 Jul 2025 23:29:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B35526104E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B35526104E;
	Tue, 29 Jul 2025 23:29:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E869B13D
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 23:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B248199D
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 23:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u0GiokNmyBgh for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 23:29:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCAD88143A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCAD88143A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCAD88143A
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 23:29:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 3E9A320039E;
 Wed, 30 Jul 2025 01:29:44 +0200 (CEST)
Received: from [192.214.236.6:60438] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 30 Jul 2025 01:29:44 +0200
MIME-Version: 1.0
Date: Wed, 30 Jul 2025 01:29:44 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250728181530.2655314-1-dario.binacchi@amarulasolutions.com>
References: <20250728181530.2655314-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2a9b5c49624a21b620cbc5086eb791f7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753831786;
 bh=owVYEv0A3gWI5j2xB1neNENPITnYnBBismENB/aQqQM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XSSSt/dKJCd6WRSeRq2SKWLT12sZzYV3W3yItgb4NVcbxWqm+2x9qamuHZYGV+1Nj
 H23wfSsdozDB5/pEEImQCWealqUZBJJosY1rlh4EKjsHuys6IseIEFPnCwMGJmYMnI
 PXMbo+2NHl4wz0/SUVJqpV/EZPxPK6yrqTw9ozOu0fC+U9AvCAd8l3JbbJWtRsBhjM
 ahH1MFkEhfuUIAFLT2HwM9r0rJYTIOXVvIjhsW217r34V/SxUipKzl10tBxqg85kf+
 MWAzwZmSygTABaNNez3tcmki9Yz8YJcPlRqmFYDDNtsoAgQwnyMS3XR4r+9fawtsPt
 RzkI40g6BtDHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XSSSt/dK
Subject: Re: [Buildroot] [PATCH 1/1] package/inih: bump to version 61
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/07/2025 20:15, Dario Binacchi wrote:
> Release notes:
> https://github.com/benhoyt/inih/releases/tag/r61
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
