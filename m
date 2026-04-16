Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5041BF8D777
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 20:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 901DA60A94;
	Thu, 16 Apr 2026 20:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 414-cPIOpTYH; Thu, 16 Apr 2026 20:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACA2C60A8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776371716;
	bh=PybpO0v2KnGaAT+1DKhnY6Dzngr9RCAkyH1q+IjUWDA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DoJbhMPiz+U8n6XLPgu97p2pTABbd67owHhy+VjdxU1WvI70QqCQd8zDh8kbWd9U4
	 8MvyaIE3FJQNvbMkbyM0oMJgFyzGuvoddn+s1aip0CV/TzMaffX057qoqu0FPh/MkS
	 Q36qWse9GeIsEjoru7Cd08igB7Umro93Oh7jDSUnqD/77l0A6DbQyYA8Zh8L4VYA4s
	 ys8iC2N1XjYvKZ+5rrF9+/1Z+U7vgmvPh/wWnO51twiTZfvZAoIxbaKOB8GjZt4Su+
	 l4CWkdza1fJ7afFjee0VXOfogLoa408nMPMKtkBxaZ6TK6ELQvDWLrRfMdi/yTio5x
	 qeors/qHZVL3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACA2C60A8A;
	Thu, 16 Apr 2026 20:35:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C049EE
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20F3960A8A
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjrXL5ze-DM1 for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 20:35:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 240CA608B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 240CA608B9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 240CA608B9
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:35:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0DE976012F;
 Thu, 16 Apr 2026 22:35:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Apr 2026 22:35:09 +0200
MIME-Version: 1.0
Date: Thu, 16 Apr 2026 22:35:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260416073525.3605421-1-bernd@kuhls.net>
References: <20260416073525.3605421-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <d6c8b2431add009cc15ef10ec17821b3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776371712;
 bh=FFReahxs/o4i1HgO5HpSwQuEg7Vj/LkaQvsU9uGfDA0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iXAD39vSSdwRbqsjyt9ou9foEicuGo0A7ElNJ7Cq5zdi8QGu7ZL+BZoQHczYXaxa5
 I2+1nnUxxOavosSFs1GYauw9Gfi0tkZDeKCqe1Frb9NhKS9c09+PsmYbXom1ABVjsk
 kCE4nrkjv6idhReVSKhzPEuO9VmiryFcEs9BnmyGDx/FbYDRup2fY4PIzSXahApsAy
 FCydCAuir9R//3Um2A11jwHIOWVPaBhgNb4aJLYxsYQe0SzzRI+MVBQdrnXPbaZtvc
 mzyqkDttq2SzDyqJ4K2js5KY2gis7zIx695ZrtISeGLvdwZxcQwq2gMykHbnfqoNZV
 TJZV68IOm3T9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iXAD39vS
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.5
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

On 16/04/2026 09:35, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-April/000845.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
