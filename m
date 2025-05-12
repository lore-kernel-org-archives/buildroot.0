Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62985C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 19:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17C6260E48;
	Mon, 12 May 2025 19:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKuJQpBX0VKv; Mon, 12 May 2025 19:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5051D60E4D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5051D60E4D;
	Mon, 12 May 2025 19:59:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 521EC153
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37B094094D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIW53OweF4yu for <buildroot@buildroot.org>;
 Mon, 12 May 2025 19:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3B4340B27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3B4340B27
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3B4340B27
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:59:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A85125FFAF;
 Mon, 12 May 2025 21:59:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 May 2025 21:59:48 +0200
MIME-Version: 1.0
Date: Mon, 12 May 2025 21:59:48 +0200
From: Julien Olivain <ju.o@free.fr>
To: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250512042329.2976727-1-daniel.crowe@maxmine.com.au>
References: <20250512042329.2976727-1-daniel.crowe@maxmine.com.au>
User-Agent: Webmail Free/1.6.10
Message-ID: <7930b8a97444a7a53833dd76a023bce6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747079990;
 bh=f9So4CjzaVXPijNUEcnQqtlYqPixhZsqzvk+7qVvIis=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qxJTOwM0FDYAB4EaMVOPHhOOstAz24y9Fc0e1bmUnPEmanXIP7fhSVE6FAeWFDGNH
 fY6sVZjAtgwN4qGH/gw82yKSLadfOxccZyuLGWqqJl5L9psFBZfDqgasuGb8mv5xPR
 1Hh04sQueyNR7kj5endlLiB40ObmXrI6RraE3ROSZdpoMLoct/YPEiaZ1mGerRq0Vz
 9sxis0SzckPxbiHpsquxe2dFwjU25xoTX/f9pimi6ykmy7cxBCB9EpllZe07CLkjbo
 iHcuN8ACzJJ8Yf4fzHmceAjxXOYavANGrsENsK/8scAvOSQTFMG97Bnxcd9v7/cpG9
 JeF0iLY+K7Xag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qxJTOwM0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aniso8601: bump version
 to 10.0.1
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

On 12/05/2025 06:23, Daniel Crowe wrote:
> Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
