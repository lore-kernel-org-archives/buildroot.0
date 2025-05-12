Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A0EC3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 19:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D31A5408D8;
	Mon, 12 May 2025 19:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWngwYnKr0bp; Mon, 12 May 2025 19:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 124254094D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 124254094D;
	Mon, 12 May 2025 19:50:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 566D1154
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48B624102C
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g987frLl5Eis for <buildroot@buildroot.org>;
 Mon, 12 May 2025 19:50:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C9544103E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C9544103E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C9544103E
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:50:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C89B72003E3;
 Mon, 12 May 2025 21:50:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 May 2025 21:50:21 +0200
MIME-Version: 1.0
Date: Mon, 12 May 2025 21:50:21 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250511161339.3195042-1-bernd@kuhls.net>
References: <20250511161339.3195042-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <4d5fd2fefc34af5bcbefec542b1d9e50@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747079423;
 bh=MhqWhmocy2mQA/TfwFYQF4RaFylP9R97zUHqgplppvE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M1Hzzmd/G55dZ2QTIv0aKJIccPHkrvxY00AFqIIlKyE7LHhEBkJgqNAsHgSYIvqA0
 qdmkMY2uVlIxhuPB0/XZIUv5+LfVcblT2U9v9aeT4vgZCrYNuhdxmSS6SzSWZU3feM
 vYQEQosbmdN2daaMye/O/JrwTjCg0XZ0MGCBbMcLGKbR9+6Qk49cOia9LCVxhS/ddM
 8SFpmJGqs0MP3ALZQp95hkP3St2GvY9Pr2nMhTosDEUBXXGR6lkgEm8um5q3OfCC7S
 NNvB7VPIBs5n3lz0FncUD1e84ge9zQ/bCbqoWEPXag9Z1SdidPXO1IHvkTkxwPUcMo
 DQx5c0fuxk/hA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M1Hzzmd/
Subject: Re: [Buildroot] [PATCH 1/4] package/intel-gmmlib: bump version to
 22.7.2
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

On 11/05/2025 18:13, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
