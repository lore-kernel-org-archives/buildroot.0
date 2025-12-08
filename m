Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019A3D3B7EA
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 22:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C281482C04;
	Mon,  8 Dec 2025 22:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWMIoFHPUJsh; Mon,  8 Dec 2025 22:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D075827F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765233904;
	bh=hJ2vIA1k/VEHKHkvwUxTC5VdONp/vUaDQqVoBxcGaXs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bTR6ffZ1KUI3eaeBNHUWINSFLmXWTzFS5Y0JcK3FDQknh3wGNqLGlJcpvVcRVmYFe
	 4Ay8ptELI0GJDE6niavYRF5YR8Ni4ew1nWZS2k0oHhkXjQqw6pArwJ+JrA3kkk1jtA
	 /LzL36JuhGrXA5nLxhejovbYc4/82u8c2/ubMaM9QYBefbp+K3T0oK5nFR/IDbT8L3
	 UUEKG+qlZlz3HxhSChbmDOqKvPorcViqSeg1gqfogxj2nxcAlnoJYckqiSqhodjznO
	 jhnJvv0DOt2gcsKqPulGnECkvwYbd9g+jRJkXUjK3FjVSbX1eUM8NK5iTiWrOZCyAj
	 a1AaqHbdGNy+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D075827F3;
	Mon,  8 Dec 2025 22:45:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A07F8E7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86E656064A
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtTjuKI_BxQ7 for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 22:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA46860645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA46860645
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA46860645
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:45:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C13DD2003AE;
 Mon,  8 Dec 2025 23:44:56 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 08 Dec 2025 23:44:56 +0100
MIME-Version: 1.0
Date: Mon, 08 Dec 2025 23:44:56 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>, romain.gantois@bootlin.com
In-Reply-To: <20251208223350.166794-1-thomas.petazzoni@bootlin.com>
References: <20251208223350.166794-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ced5ee136aecd28d4a0f0e435a6888f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765233899;
 bh=elWLHKD3BbScKgcpqbrPLN8s4LBrvztklPtDiVyrEvc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gML5sZOmb43aAW7emnIP8//XQBfbcBwgPh41BiFH8rdMR+RNAzZT0SgdHOaQJSF/z
 xNLNA6dlPP6b7ayCkBAhE3inbOO5yhgeCA9b8KirM+k+sQfUB6rP3INkOCgkw2LvFi
 Rmta/+tXHUUPvhfoAvMEiAzXEE3w6Ap3+ReXv1j1aOq0GfUy+HC3zolonPSDwIxJwX
 WONw4D1PpRMBIfPzqF4f57tUx3iEmlqzXoc0aydxIjEhPKRzDSZ/pn3nRLD5HvOWvz
 rFE5W7MfyK/NWzHWq9ljspulJYG8IJkWUO6BQbvi/fEEH/UA7lPvEtIEg5jAfWqV6G
 uzFBDJ6JMs8mg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gML5sZOm
Subject: Re: [Buildroot] [PATCH next] package/snagboot: bump to version 2.5
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

On 08/12/2025 23:33, Thomas Petazzoni via buildroot wrote:
> Changes between 2.4 and 2.5:
> 
> - snagrecover:
>     add support for bcm2711/12 platforms
>     add support for several AMLogic platforms
>     add support for AM654x platforms
>     confirm Allwinner A133 support
> 
> - snagfactory:
>     allow changing target device mid-pipeline
>     tone down UI colors, increase button sizes
> 
> No changes affect the packaging or dependencies.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
