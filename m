Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79F5FF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 17:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82F4940522;
	Sun, 26 Apr 2026 17:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RNHeJPiEpUx; Sun, 26 Apr 2026 17:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 286AD402D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777223109;
	bh=3FnQbinK2tYXvyC0+jDqsmBop1BRbEkqNxdIBGEiaU0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ssRYWNL9t2WNkOsvM7hVzBEJvmy2Egk57m4g6omtyv0ceglzEYZywh+EK+a4BupH5
	 N+0Pya8/026h6S+1oxwi8Ni9eV5BOGpfpEh8pO/rbFrbJFI9nJtWTLJLfb0YVWcgAT
	 mALcvv5f41JAfPTNsfsF94jZCvoWYFbl6uetp9SGKiXCDiekcXbV3yc+BYcDgRckgP
	 fQMvqzMHmdFt/i33dcEsPiq72Dyj4qk+OE6rgHwka5otSqLmObsznuxUzXyQTAOeqW
	 FHO3yFHnjiVp0paKjImHEWtv6c1PtwD7AjJQnc3ggZow8Dm1Ahgku5G60xSCeCEDgm
	 TlG0AzCiND2lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 286AD402D2;
	Sun, 26 Apr 2026 17:05:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34FE71B8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 17:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A741606C5
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 17:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVbymNVLT2Q4 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 17:05:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E870260BD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E870260BD8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E870260BD8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 17:05:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id CB2BF2003D6;
 Sun, 26 Apr 2026 19:05:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Apr 2026 19:05:02 +0200
MIME-Version: 1.0
Date: Sun, 26 Apr 2026 19:05:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260426071953.397621-1-bernd@kuhls.net>
References: <20260426071953.397621-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <bfeebd1748d7e5b406aeb0cdd41760e1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777223103;
 bh=UtAVpRnBe2aGnCNmvbaYUC1kuB4oLpEZIMWykQjI4CA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aftZV9fC8GPH9NGcvyUCovExRit7wainMt+ik44uQlkGBzf3TzTKigQkPJQsDaynP
 mGzZ4iJ3EKo44jFBZ06sFpr8dYYera9u3KNEWmsTkj+AYGPdVmCCF4s5wUyfeKTpp0
 w1qpXEcVhW/4UmUko2YPNSK3hUcbu3OLvpKTvl3T5WkfdeqBmfgmdbaheq+/6FGPGw
 KiB3jeOKEtl02zqWLhulItI4MTWFFgHYnksLCzpFebfFntg7aUADAY50/X+mZYtSCA
 VJ001Dey5D3702SiQwVYP/qG+I3RMP0gNQksgUtdhVnTZ5BwWing2vj348jfxpdzpV
 wU1NX6GtOy5Mg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aftZV9fC
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: bump to version 1.6.58
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

On 26/04/2026 09:19, Bernd Kuhls wrote:
> https://github.com/pnggroup/libpng/blob/v1.6.58/ANNOUNCE
> "Fixed a regression introduced in version 1.6.56 [...]"
> 
> A backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
