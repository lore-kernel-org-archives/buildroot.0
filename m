Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5EAC83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 15:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 158CB8148E;
	Sun, 13 Jul 2025 15:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPjGh64YxtJI; Sun, 13 Jul 2025 15:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58AE381465
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58AE381465;
	Sun, 13 Jul 2025 15:45:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF745106
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5E5B400BD
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQlwCoXLVBJ1 for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 15:45:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E731D4007A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E731D4007A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E731D4007A
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:45:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 28121B0055E;
 Sun, 13 Jul 2025 17:45:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 17:45:37 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 17:45:37 +0200
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250609105623.1267146-1-m.niestroj@grinn-global.com>
References: <20250609105623.1267146-1-m.niestroj@grinn-global.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <310d5915a7691e1c1591bea772f8684b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752421539;
 bh=Um/E/pZJJettKesO14LQM2Bnw1KWZf375xdbvyiqmKc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fqs4HnuEP+sD2faPuV8sgCoeOyAAzmDCRglBcT40AGCz5SIfBhC/Gcp0f8Gg229cT
 DQiLxbPItCmu7/haxcnouy9sYAGJJM7+PLtKk1erlz28SrweLVj5pQbvC0+8oA9NAD
 gC7bvA8oJRIHOblAuD9jZNV42HmnpDENLQdTQiAiP4M28RTMGK1Rm3jzhcHhC2CNtH
 xYk9fj/SgrwL0drDJJW0i1zOe1ZfmBvKpHrWjVwWTVcokynJ7ib4SSpJFudR3sEd8o
 kGpoHgFrOSWD+ZOzY224bTZcDmQg6tEIS1A4wmox/jaWe0dZdc85hn1FfFE8h8x0sE
 OsFugm40+jDOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fqs4HnuE
Subject: Re: [Buildroot] [PATCH] package/python-pluggy: bump to 1.6.0
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

On 09/06/2025 12:56, Marcin Niestroj wrote:
> See [1] for changelog.
> 
> [1] 
> https://github.com/pytest-dev/pluggy/blob/main/CHANGELOG.rst#pluggy-160-2025-05-15
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
