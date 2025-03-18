Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF61C282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 16:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05A7941349;
	Tue, 18 Mar 2025 16:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bTj1m5pywhs; Tue, 18 Mar 2025 16:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7CB24134B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7CB24134B;
	Tue, 18 Mar 2025 16:36:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBC0ED5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC52760D8C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNy9AF3gYhlQ for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 16:36:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 09B3F60D87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09B3F60D87
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09B3F60D87
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:36:34 +0000 (UTC)
Received: from L25025.local (unknown [213.36.9.119])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 31E4AB0056A;
 Tue, 18 Mar 2025 17:36:29 +0100 (CET)
Date: Tue, 18 Mar 2025 17:36:28 +0100
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Vladimir Oltean <olteanv@gmail.com>, 
 Romain Naour <romain.naour@smile.fr>, Julien Olivain <ju.o@free.fr>
Message-ID: <kxf5rnunnok625w5yglz2hhylmha633bvma3sa4mcvnjy5vl6p@6jl2dapqadt6>
References: <20250318163228.9989-1-vjardin@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250318163228.9989-1-vjardin@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742315792;
 bh=/u/FEeP7T2pQrtZcqvPCE54jHiRDKVjAjYVwrSUxATo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CThHE7IFpzcELeKGbW+NxJPpkoRzmM16F/YGbowVJeFx+P7UnjWlwUduJUyEA5vDb
 OP2R1EYeeRrxdSQdDqPvHRcHPRbbfx+V4DzS5g4oTS0rcS9VQSqTPtWSUEQSkHmHfN
 ifsHXsZC+TRt+R3/V57wl/aQ495acEge5ghio5V5VLSIWB6yvMyw7IVm93Ox+3T0BB
 CStG8zKl2g7pG22RPerWV5h5Xf4KBeP4JtF1pRihSim323NuTS4oph4W5tfGp1sWK5
 2rKfRLUqVXXoSEl5BokMr8aeZyhTN5W/+1sy64sZrBALgXKDwlpYJIPAzf+OqLC071
 O9IN+xFdBC8ow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CThHE7IF
Subject: Re: [Buildroot] [PATCH] boot/qoriq-ddr-phy-binary: new package
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

Hi Vladimir,

On Tue, Mar 18, 2025 at 05:32:28PM +0100, Vincent Jardin wrote:
> The DDR PHY on the NXP LX2160A SoC needs firmware. This is distributed
> as prebuilt binaries by NXP through GitHub.
> This firmware is linked and used by the ATF.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Please, can you consider this move to boot/ ? It seems to be better
aligned with some other binary firmwares that are used to build the ATF
using Buildroot such as binaries-marvell/ for instance.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
