Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6EBC369C2
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 13:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79759402FF;
	Mon, 21 Apr 2025 13:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TIJkkYsiZ7o; Mon, 21 Apr 2025 13:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B773E4031C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B773E4031C;
	Mon, 21 Apr 2025 13:35:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B3CA1A0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CAE260A76
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_oj36eFBfAO for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 13:35:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C289E6085F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C289E6085F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C289E6085F
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:35:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5983F2003BE;
 Mon, 21 Apr 2025 15:35:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 15:35:34 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 15:35:34 +0200
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Gero Schwaericke <gero.schwaericke@posteo.de>
In-Reply-To: <20250421110915.6696-1-fancp2007@gmail.com>
References: <20250421110915.6696-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a242d61f39db268784b95f2a7edc0388@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745242536;
 bh=OfXWyczJKgqNRPECL+yueyBjn0Ua29oo+iBvsOkZS6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TRpGsBxFm3Gm4zkJzYjTgnS0xam4i/J9DWxEJ50kppqP1O0+L+tKUWBBNMI7/t2Nu
 UvQb0m+nta5/fsn9/zyYDhY/VsIQ4V6pDErLkkO80GaLxJslKVM/wsuuqwz2djDxh8
 NpaJFeO1G8C5mVY1s2rCywQ7MPt9ZpxOId7iIN+FVe8pfS96g0C4o0e4jZ3/BioaFX
 m51q9qhwZqnd3J0cfLSTAdZps/gGx6JjhOECNY4akHeENTCGk1JzHwpUW0yMsX6iss
 50M7eo96OgKl24nSdm/VXAeCLMUBvbFB3dnoBMo1sSKgdOwq5xyfvXHkaQRePWI3ZG
 4xetFKeLwK3tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TRpGsBxF
Subject: Re: [Buildroot] [PATCH] configs/cubieboard1: bump Linux to 6.12.24
 and U-Boot to 2025.04
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

On 21/04/2025 13:08, Scott Fan wrote:
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
