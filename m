Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D69C71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA3E83B04;
	Tue, 17 Jun 2025 19:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZO7XRXhiAkO; Tue, 17 Jun 2025 19:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 961F483B37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 961F483B37;
	Tue, 17 Jun 2025 19:01:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68D8216B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A89760FFF
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZtjSXSpzq0v for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8902B6079D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8902B6079D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8902B6079D
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:01:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9862FB00572;
 Tue, 17 Jun 2025 21:00:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 21:00:59 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 21:00:59 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250616191358.3479543-1-bernd@kuhls.net>
References: <20250616191358.3479543-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3f22d78e2f8e040eb68fdd9456a72a5b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750186860;
 bh=ODOM5uSN+BnG2jcmD38JzSrp7xsASh1cBaDDLUYwtNY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k0vIBzFgfStAKYjMUp5aHzuZwG25HcsCevaOL5dqG4mAqbS7DZlwuIWGWNzRqRs+d
 WzqUJxnpxMg8XIj50/LA7FNR2hwH1eCCcR5SDSKknEuX4UrpdxjNrt37JmYsnRlnVQ
 u/ZFa5R9tauP6tBAhYam3fp5EHyOVktB1apKi7uFuQk+Gtq3Sdb10UvLYNpO6rrMTo
 fLMfZ8ddK3HjYsNgYCg8g/F+ye0DNsEEzGt7KqKimKf5ou4goHc1QqepqLHfKCEP61
 X1pvM2Wo8NtUoeXjCjtw1x3OvooqphKVkpRds5MwYqLF7eVH3srHRKlNqWqtEUZcyQ
 PP/bqRt8Em5PA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k0vIBzFg
Subject: Re: [Buildroot] [PATCH 1/1] package/perl-net-dns: bump version to
 1.50
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

On 16/06/2025 21:13, Bernd Kuhls wrote:
> Changelog: https://metacpan.org/dist/Net-DNS/changes
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
