Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D743FC7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 23:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9255840B7F;
	Thu, 19 Jun 2025 23:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5AW8ADzxgK3; Thu, 19 Jun 2025 23:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D42E740B86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D42E740B86;
	Thu, 19 Jun 2025 23:24:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F58A16B
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 23:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CAF880A80
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 23:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZcwDJHwQjbl for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 23:24:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 57C3880AB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57C3880AB8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57C3880AB8
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 23:24:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6951713F86A;
 Fri, 20 Jun 2025 01:24:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Jun 2025 01:24:05 +0200
MIME-Version: 1.0
Date: Fri, 20 Jun 2025 01:24:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250619195132.1986901-2-giulio.benetti@benettiengineering.com>
References: <20250619195132.1986901-1-giulio.benetti@benettiengineering.com>
 <20250619195132.1986901-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ec4c5a97a4318eb10b20a5cb7e0406ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750375447;
 bh=oQe6WCxYM5rxuVC391a8jX9DZfWjSz6KFwF4yNy9cUw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PPAqPIcfVN6HN8TzwW410E1wZHDcpDj3URmPcfrtGL6ysPy4U3bvIuTyl+pB4G28N
 UKle062fs0s+UJjfgZoXNYb+CdILVm/nWy6lT3XpdfdkYwXB2mk2rIeLP0aVNkTbDH
 ebUZuidzMpc/CBRSZhLjgLFcZGK0rInyLzFqHmQYgmlyFt1cmrL2El2c2gwi0j7HRx
 R78e7HTEN31IOmY6C41b35DdJUFFiAjxwXv0Zg9aAGMXIH0trnmUhTPwqfATxJhJe9
 ygWgiKeqq3w5HBjmaEPyFB60avSpUF+WBkw1rloVjdppWgC/3PnCqEGQ2eN3PH5Icc
 1qvdpPk0CrF9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PPAqPIcf
Subject: Re: [Buildroot] [PATCH] package/libblockdev: security bump to
 version 3.3.1
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

On 19/06/2025 21:51, Giulio Benetti wrote:
> This version fixes CVE-2025-6019, see:
> https://github.com/storaged-project/libblockdev/blob/3.3.1/NEWS.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
