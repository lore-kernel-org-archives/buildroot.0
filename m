Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF864C02198
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 10:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 941DB410B2;
	Tue,  4 Feb 2025 10:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Df7wlpApLIhg; Tue,  4 Feb 2025 10:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63C634072B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63C634072B;
	Tue,  4 Feb 2025 10:53:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2E7412A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8418D607D8
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6VLeV2n3TSXX for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 10:53:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7CBD160067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CBD160067
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CBD160067
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:53:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CC776780368;
 Tue,  4 Feb 2025 11:53:43 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:47716])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Feb 2025 11:53:43 +0100
MIME-Version: 1.0
Date: Tue, 04 Feb 2025 11:53:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20250204085901.767542-1-neal.frager@amd.com>
References: <20250204085901.767542-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <963fd038cf9583d3e7a0e8ef3f0f9303@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738666432;
 bh=yzcAAEn5tZwGz+AwDVCvLJAXER39IKSUnK6NuC/iAb0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lY96P+JG07tYHNiJjcnZHtmMr16qcOMItulm1GEww+Nn3FnEhdTEvgp5CnyRZXHum
 ZCwJzyYis3llv3GYCGGUQpvYsIWiDf/c60rsWOW860GBBwjiCJe2TlwQqce5B8rkaH
 PFvMqV/NoA2tYaSX+Q2KZYxlAdygjJdNISf1XQ2Iu5rTZRryOxuA73cT4lOSCc3I8F
 AIRhTSoo4V5QD5BbZmUvvenXibBwiqwbAGetdCapIBwStzvHdHTmEODBOS/drZAC4N
 OLxyly4Bk2mXvS+Zc5B7mKLO46YSoWkVxKpMdFwQamvj/tplXQRaKJADMyYbdEHZ9j
 Ie/U9frYCMr2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lY96P+JG
Subject: Re: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 version 2.44
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, romain.naour@smile.fr, michal.simek@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/02/2025 09:59, Neal Frager wrote:
> Bump binutils-bare-metal to version 2.44.
> 
> Release notes:
> https://sourceware.org/pipermail/binutils/2025-February/139195.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
