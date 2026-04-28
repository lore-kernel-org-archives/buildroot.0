Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FD0FF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18AC540E07;
	Tue, 28 Apr 2026 18:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFeIgPf2buh1; Tue, 28 Apr 2026 18:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4438440FE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777401891;
	bh=2IJPhB6d7OIf+AH8/a7MtBsXTQxY1Heetj9mmqVIJtk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nv/i3uOUnxcs3q+cYJ2hCvZghMfx+hQscEXxzsVpuWjRUqvk/WNikXdFnoysBUQ6n
	 +PsdwIaKX9K+t5RKO8BHCHlSsVIepKyqFyVHleacHgYs+ib0kvDFuRmJfdYgGZ2k0B
	 1OO41ZacIBvTb2R67lxiIFoUKObW1vXdH9TzqouYNbFD9oIi7f5MOGx/sbJUt3pyJB
	 397s1IinA1bxjxB7+rwhVT6QapfwOMgf0Sje45lL9BniYKlEYxkP/l4hfATXd/VtJs
	 cP+LgbM4rjW1o0Z6YEY4mjBJD7GaLZPw7dsmgVT8gzYx+FZ+uMjhKdkFQOLZvPhzgN
	 umEURKLSoIcGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4438440FE7;
	Tue, 28 Apr 2026 18:44:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B81AA231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DD5C80002
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rri4lj-U94LT for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:44:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C68F7805FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C68F7805FB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C68F7805FB
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:44:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A02D2B0054C;
 Tue, 28 Apr 2026 20:44:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 20:44:44 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 20:44:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Gregory Dymarek <gregd72002@gmail.com>
In-Reply-To: <20260426134011.1367733-1-bernd@kuhls.net>
References: <20260426134011.1367733-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <0647647a2a3b754bb4f0d502073c0134@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777401886;
 bh=lRzUUYBapoGyWU9HgKV0ifZvAJacTPHtZ1w8PgYovOA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lEcL1wxxNCN+T37b9swDNAgtvAi8rfsyMGHABx3rSvt+go1J596y1UmxHdxhcDeYb
 o8sBdk/XtQcjdlSx3dgbJo7t1ejGUi+6ZGgQHynG8FrLIGrXvzoTEyAsmhhvSZrd8B
 V8dzfIkHPW33YNKV4WuWP4UBOiGVMEhU8oPxQd0/ejRhO1P3LJWdPw8V/TCLsVK+Gf
 Gu4eU0c3x/qRG2ALZbs2wBrZhZaR6svo5Am9tZlQ0RCIrqgCvg/KIJbpYqEOrP6Igv
 Bj73XaC5zM3GPVEasjqL1pJXhgN7PTgwiK3bLhrVvEHB9+p5yLySJKSKZjnjmfSzXm
 6IdR/irE0lR7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lEcL1wxx
Subject: Re: [Buildroot] [PATCH 1/1] package/janus-gateway: bump version to
 1.4.1
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

On 26/04/2026 15:40, Bernd Kuhls wrote:
> https://github.com/meetecho/janus-gateway/blob/v1.4.1/CHANGELOG.md
> 
> Rebased patches, added Upstream: tag to patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
