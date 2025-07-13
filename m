Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF83CC83F1D
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 15:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90C4D81496;
	Sun, 13 Jul 2025 15:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WE6P2IMJN_hd; Sun, 13 Jul 2025 15:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDE9D81492
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDE9D81492;
	Sun, 13 Jul 2025 15:47:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99C3B106
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 803A740881
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GW9uby6muN4q for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 15:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B15C640863
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B15C640863
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B15C640863
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:47:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9F7DB5FFB4;
 Sun, 13 Jul 2025 17:47:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 17:47:06 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 17:47:06 +0200
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250609105643.1298292-1-m.niestroj@grinn-global.com>
References: <20250609105643.1298292-1-m.niestroj@grinn-global.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d2d8cca66ec0fbb39edf9f770a178131@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752421628;
 bh=5I9TV2Ze8uQ/PTVHr6v3M8D8XG1HZKRy3bLxTRmqx/E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a//4k2jU70wbchNbZN1BPQns838viLXNRRWCv4Iho+NjG53qOpEpW0ZfGbzkzZTvZ
 SDrYTItWuU4YnQ7F3li3ObvIAZKj1lj1P8LzHZ4ltskVch0icDbUqlMdZz3MtfcblY
 85jTL6fXj8vMItvphUm1aPqX/WrsTx2Sz00P4+gqb27vITsPIfK62Mk8pu3t94K782
 jl9yjVI5gzVLSzNHlGG32mkxBji12bMqRWeB6RhstEQzFJwnMFS+YgGX4EbnPkel7+
 mpPmdwlqAH33+KHnlwK5GkxBVH7gh/QH2HfzDfMGx7swXJRQ5qM25Woh0AaaUOssy7
 03O87linzP6OQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a//4k2jU
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pytest: bump to 8.4.0
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
> https://github.com/pytest-dev/pytest/blob/main/doc/en/changelog.rst#pytest-840-2025-06-02
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
