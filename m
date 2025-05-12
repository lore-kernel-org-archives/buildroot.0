Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE4CC3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 20:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9980405A1;
	Mon, 12 May 2025 20:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRdBBX-SsPfn; Mon, 12 May 2025 20:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23846409FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23846409FF;
	Mon, 12 May 2025 20:09:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09B76154
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E23DE40D80
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5W2Pc8o3AHK for <buildroot@buildroot.org>;
 Mon, 12 May 2025 20:09:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 203DB4098E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 203DB4098E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 203DB4098E
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:09:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 01ED17804FD;
 Mon, 12 May 2025 22:09:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 May 2025 22:09:31 +0200
MIME-Version: 1.0
Date: Mon, 12 May 2025 22:09:31 +0200
From: Julien Olivain <ju.o@free.fr>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>
In-Reply-To: <20250512120307.10341-2-fl@n621.de>
References: <20250512120307.10341-2-fl@n621.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <bacac55cfd38c0c5a33465d7079658ed@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747080574;
 bh=pUYfdwRynE0+RzbVFnvMH8YSJQK9Ry071cVQJm6yBkk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NwhXUVczrI46NFcI444JuHbv3EL5X32BBxoRhQ/Ats7u7DAx7jyvJCcMgHMdoujzt
 3QRg39UFd5grTGbr7iWGF5qRhXRis9z0wp/cX3JF44wwnpw0+vW7Hiz43y4/ycUqV3
 UtMNoQ/6o9V5UgBz336j4Op0hbfNqWDLWc+JLF/IWqpdmVGW8/yIpplrHQVN+PUCXR
 Wm55JFWHV8a6Ti5tsHtaBXtz1MxElhqp3mav8GJ3i5aTIXAxtnqb81XU+HAI4WY3a7
 7nw+Gg73+AKf6kVncAaQk87GfDc9I0OCtrCezReV8Cm9v935H+DD5vKIcoTVj999zo
 g3guX+G0nT7DQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NwhXUVcz
Subject: Re: [Buildroot] [PATCH 1/1] package/f2fs-tools: fix GCC 15 build
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

On 12/05/2025 14:02, Florian Larysch wrote:
> f2fs-tools had its own "bool" typedef which now conflicts with the C23
> keyword, causing build failures on GCC 15.
> 
> Import a patch from upstream that fixes this.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/d17641582d1beaec9dcca4dc48a68d713cecfdc8 
> (and others)
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
