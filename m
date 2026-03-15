Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5786D58B18
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 10:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C8818261C;
	Sun, 15 Mar 2026 10:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlFZzHaTUbNb; Sun, 15 Mar 2026 10:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16D2F825D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773570433;
	bh=yvmODM5JDGJ+bghT4bbzMQqjIos/3k5eE65aBX2mxiI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=edITwGIJ6ySn9wnH0UIKwuzYdwMDFy4AAh1W4UhYLGBGXVosOXZRvgiYnr9N3W74p
	 5J6rDbDjtVDSXrUHI2w4cPOiOgcG3NME+jvfgaCSz0je8hDYaRSo4KxpsRyWo5DHHk
	 MaTY54XSf/a9DUyGbhYNKqrF/DrAwgmwDbpCus63kquM5+ql9NKkAWlwjL2QFcSU0n
	 5r6kQWU3tCLGIiYMDWEsgpoOxG4yHk4ZAzgwfJSJggR8P+1RsfG1wxEvpHWyoHxp5D
	 cM1lN8X8NjXST6q5jlr/uqijtbuWCNJM3nBOyEURONqii9kJpyxx7MJqj3yGE+6L/Y
	 7Un1O13dqbVyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16D2F825D3;
	Sun, 15 Mar 2026 10:27:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ACDC1B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 307B840264
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObvnWYE5ZqeN for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 10:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F6E5400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F6E5400DA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F6E5400DA
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:27:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 527BEB0051E;
 Sun, 15 Mar 2026 11:27:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Mar 2026 11:27:06 +0100
MIME-Version: 1.0
Date: Sun, 15 Mar 2026 11:27:06 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260315074850.8072-1-bernd@kuhls.net>
References: <20260315074850.8072-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <fe862ed9419e212836c0ea5593bbb209@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773570427;
 bh=AL5iCJAul0dsxhtVPu95tUZkzlZPKxTkTzX7azfJq9U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XwFVuQOMS2KlWjInm+GiN2Mcuk4WH2bCnhGOSQpHBTrut6wog8ppxuERnzZlJnM1R
 3pW31RlbArEOqZVbL8KhYgfFJvpCJ+Vy3lV89h6R+ZB81rq5gZ58x0GYhF3OK1dnZy
 dkpjK0oAGhrl6A7vdabSlwKY1hddeVNzzM4Trd6gCBIx8CK7C1qP6urxZgqIljqlnw
 SyGEoi1Cr8kyvDfJ2P7f38X37gsB7M3hRglLebVXbUw2AOlKJPUiHnclcNxl8Pxh2a
 gbJ573HtKrZ+yryk3ov3XrvsaR/u6RgVHoFFRFPQcCsK6yn93L8fgJNe/XF1lxv9WR
 3A5L/xJ2OfDGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XwFVuQOM
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/sqlite: bump version to
 3.52.0"
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

On 15/03/2026 08:48, Bernd Kuhls wrote:
> This reverts commit 04dbf7a38f4e83a1c6444b910209a0e3a350b14c.
> 
> Upstream withdrew this release:
> https://www.sqlite.org/releaselog/3_52_0.html
> 
> "Due to backwards-compatibility issues associated with some new
>  features, the 3.52.0 release has been withdrawn."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
