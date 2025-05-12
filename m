Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6311C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 20:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7E6C405D6;
	Mon, 12 May 2025 20:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOu5VBD_rUlo; Mon, 12 May 2025 20:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE08A408D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE08A408D8;
	Mon, 12 May 2025 20:03:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31B18153
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22D8760E4D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00K_OvMj201m for <buildroot@buildroot.org>;
 Mon, 12 May 2025 20:03:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 484EE60B09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 484EE60B09
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 484EE60B09
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:03:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9082E60132;
 Mon, 12 May 2025 22:03:33 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 May 2025 22:03:33 +0200
MIME-Version: 1.0
Date: Mon, 12 May 2025 22:03:33 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250512094324.127864-1-dario.binacchi@amarulasolutions.com>
References: <20250512094324.127864-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e73548cd526e74033fd8bbdf42b1d879@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747080215;
 bh=kvrxGsc+I7MPqDM66zrrArea8ts6gyxQ72E2zZaG9y4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tfA7hKy/SvV5lhwOxj82dGn4IdEnED4/4jk0X+wVX3+Q5+JbJJiulcuLnASGDxfzv
 9SKzhioXEoRHEb8DPy4V/3bLX8BzZxKCdm3gFxNMrYEmX644gz5CgtGfhgAN7SoaSs
 OxXxNK42PS6Avtt6bxqn5Psasq+undRkETO9pfyFpHT0/TJC8F1AIjF/EJ4FOUjvQ+
 9cJiY4kGDy7MPHrrJ+wcphJ8t9XNocZDqfgUnGHuDfSLZ5zXNbfJ3TdYtXH95o35Ge
 J0SLCzj5Sio9kC49FfFp8VxdN9m0t09Z9nsQIW23n2GhZ95gER3dQUdOSRYjgbnSFo
 JVI2Nxbou1ETg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tfA7hKy/
Subject: Re: [Buildroot] [PATCH 1/2] package/inih: bump to version 60
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

On 12/05/2025 11:43, Dario Binacchi wrote:
> Release notes:
> https://github.com/benhoyt/inih/releases/tag/r59
> https://github.com/benhoyt/inih/releases/tag/r60
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
