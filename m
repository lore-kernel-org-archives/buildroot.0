Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77170C369DC
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 20:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4660F40C7C;
	Mon, 28 Apr 2025 20:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kD4Qdo7RQkb; Mon, 28 Apr 2025 20:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6920D40C7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6920D40C7E;
	Mon, 28 Apr 2025 20:49:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9DD0117
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABE3D400D8
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuUo8MPBtjnX for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 20:49:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CDFBA40275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDFBA40275
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDFBA40275
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:49:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0757419F57B;
 Mon, 28 Apr 2025 22:49:43 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 28 Apr 2025 22:49:43 +0200
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 22:49:43 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Aleksander Morgado <aleksander@aleksander.es>
In-Reply-To: <20250428062852.100535-1-kadambini.nema@gmail.com>
References: <20250428062852.100535-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <cffb60ef5b647cc8a7eb19717b5eed49@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745873386;
 bh=ETxrdyqEsdF4s0iWePBVceCNRpMgB/kK7EwmLLYduP4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B/L0pubi5vO0wy7Hgr9oEivhkHs/q3w7rqeUAmXcvV5VH3cbfQ195inz4369rk7M2
 upL7935wKoQqIy5x/wMcnEJRA/Y/6oK/4V+eKu7bdubB5o3Jb+sGi18JE+qj0B04BQ
 qewovTdKniGyJ/9PsqRp5BxEgXMHVyR4mtAt0aXq6K80nyKlAf7ZPmT819/1BdRWIW
 AfUTWUGH8IKBV6sEjIdmetOjaecbYfaYpGdvJJmTA6fWk8xiFT+jJ9QQ7xBT/D72w/
 GNjnCwhvfjWeqWPWi41BigMEcu8IDMVFERguKcV3dLy2sn88BujXSlOggo7vzNNyFb
 3dsRilmPwZLxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B/L0pubi
Subject: Re: [Buildroot] [PATCH 1/3] package/libqmi: bump to version 1.36.0
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

On 28/04/2025 08:28, Kadambini Nema wrote:
> Changelog:
> https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/blob/qmi-1-36/NEWS
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
