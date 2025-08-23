Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29A2CA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 21:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91DE56146B;
	Sat, 23 Aug 2025 21:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vmO7sEW_Iic; Sat, 23 Aug 2025 21:13:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB80061464
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB80061464;
	Sat, 23 Aug 2025 21:13:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4553B19C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BD1961461
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Z2zhjkZdOFG for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 21:13:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 458BA6145F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 458BA6145F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 458BA6145F
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:13:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 233D6B0053E;
 Sat, 23 Aug 2025 23:13:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 Aug 2025 23:13:50 +0200
MIME-Version: 1.0
Date: Sat, 23 Aug 2025 23:13:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250823092848.3760614-1-bernd@kuhls.net>
References: <20250823092848.3760614-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <db3db6761e230f4b9c78d6f7aa1b16e2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755983633;
 bh=CDfYuGJV9A+mtg9PR/0e6JshR71fT3hnxMXYQj02SLo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=afFkv2/PnfShkHRrZFFyi4c1aUXLxCYW4hx//QdbMdPJ2ontzn7dIX9HU/fLURli3
 gRR+Cqc93HTcwUcQdNrFMd4v2QYpOq85DngO2ZtZi1dPYUI9mUbSRe2bxgDYLS0z9g
 D1bxvGdM0uHj0gSRpgXKJgejqsF9rR8nlt39JJr5F1o+zyYH3NWWnzO9m4kGMrQdcH
 XLBS5qn8CJ+IXmSAAQR1mRWUAvi9OqwGYcqAOwlDqOoL/+urcZKdON0kUJT3YLNluP
 E96jMuHrO68u0HdAGzpek1o1bU33gFbbpPN1vTL+EI1QFdBbUK/ktAZAjF0+a5doeo
 yRP07DTfnkRjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=afFkv2/P
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.1.8
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

On 23/08/2025 11:28, Bernd Kuhls wrote:
> Release notes of the bugfix-only release:
> https://lists.freedesktop.org/archives/mesa-announce/2025-August/000817.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Since this is a bugfix-only bump, I applied it on master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
