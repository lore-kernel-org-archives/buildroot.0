Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CAAC369AE
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 14:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9186812B6;
	Sat, 12 Apr 2025 14:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-HoeRSF2beO; Sat, 12 Apr 2025 14:22:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 111EF846AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 111EF846AC;
	Sat, 12 Apr 2025 14:22:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93C58108
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 14:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8542C40531
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 14:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1m2woJKdBeA for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 14:22:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D8E4740271
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8E4740271
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8E4740271
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 14:22:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7B53313F8BA;
 Sat, 12 Apr 2025 16:22:33 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Apr 2025 16:22:33 +0200
MIME-Version: 1.0
Date: Sat, 12 Apr 2025 16:22:33 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250328180427.3434693-4-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-4-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <fc90cd1c64ce02c67073a1a2a0144708@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744467760;
 bh=4SKZQIkA26ZAdmY411PTjXyW4I3NC2kE/arQpvJsRl4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hIwjNHePP2jERogiBYACuBSlzzBE2VDkhr+kdajdQRF2p3EuIvnwMnixmGULS7CxN
 x/ilp4yYuECt/zAeEPB/x4YYYXvwwvQwadWNV836mbOUK1KZEx5yf6Hs8SNx/Nllnl
 q7jKT8fn/ym4uys21I1F0BaMY/Y4CeoNb43RouIvf+OBXfs6pT0f1zeuI5bOdqNQPC
 vR8td3QIlRLhg0WgjKfSrAQQCwieR2xVTMZ4d3r/eRPEDPx1CS1z7gGEEu6RNiFDBE
 OZGlq3o5qOXq/6XdplWkCQkTMx7MUn9R6J8xAUdhVpAJgAl2syOxNaIzVcXsqynOS5
 QO46glKONC9Ew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hIwjNHeP
Subject: Re: [Buildroot] [PATCH v2 03/18] configs/ls1043a-rdb: enable the
 fmc package and dependencies
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/03/2025 19:04, Vladimir Oltean wrote:
> Since LS1043A-RDB uses the Linux Factory-supplied lsdk.config, it
> disables the upstream DPAA1 kernel networking drivers and enables their
> SDK counterparts. These SDK kernel drivers are configured using the fmc
> tool to do basic things such as apply a default PCD, so it seems a
> reasonable idea to enable this package by default.
> 
> Since fmc uses C++, we need to add the standard library for that, which
> also seems to increase the rootfs size.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
