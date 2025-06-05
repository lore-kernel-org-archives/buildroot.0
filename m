Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78867C5B543
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 20:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27F74831A2;
	Thu,  5 Jun 2025 20:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4r75axt5WCN; Thu,  5 Jun 2025 20:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 698B7820FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 698B7820FF;
	Thu,  5 Jun 2025 20:05:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57B561A6
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E17B40AA4
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 20:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXbhGq6RiE7Y for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 20:05:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7ECC740A9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ECC740A9F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7ECC740A9F
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 20:05:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BB406B0053E;
 Thu,  5 Jun 2025 22:05:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 05 Jun 2025 22:05:22 +0200
MIME-Version: 1.0
Date: Thu, 05 Jun 2025 22:05:22 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250601204529.787544-1-bernd@kuhls.net>
References: <20250601204529.787544-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c6e027ee1eddb3b0848bebc5cb85a219@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749153925;
 bh=Kem6NbdxXnVCXxZiiANz1hqKUmfhqUJckOqwlAkqnjE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jTUPYiQl6EMwzz7sDtvY3A1jcHGlMkojewFsamnWtE6ClAS3ByYA95U9nZNb21Roc
 d/7mXrYPCh812bLFiCkjcGRYsp3Ectay+R0s2PxeSExqZMZxjMkprgyCnh3qNA/u/w
 AeZTJoLoZKpQlko4PhJ8WJN/rCDbXX5ZbZpBU6prxY70FgaoPEPwVtF0/qmbZo6rbG
 KQ7BxnAm4n/loKG/HilNv/W+WyZceD23IiIvfhFTQN/aHA08c2I5EntFXVwvVirvEH
 bqoCqIzPBbJG5t5f4bQs1FWDT6EFiw3oQNJXgZSimrLZr4WFLL8rrwPqtERPTdYBEq
 RSoNqOawZ3HuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jTUPYiQl
Subject: Re: [Buildroot] [PATCH 1/2] package/mesa3d: fix comment for iris
 gallium driver
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

On 01/06/2025 22:45, Bernd Kuhls wrote:
> Buildroot commit 600e75b606 "remove depends on architecture for Iris/
> Vulkan" forgot to remove the dependency for the comment of the iris
> driver.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
