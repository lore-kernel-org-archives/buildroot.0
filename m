Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9E1C4450A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 10:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C5FF60609;
	Sun, 19 Jul 2026 10:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQ8repRY4x3X; Sun, 19 Jul 2026 10:22:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C6EC60615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784456553;
	bh=hKpeeKR9i4NGizmo9xB0s8yodmXlcPT+cVt7//kzucs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d27JR2bhQCofwmZWNN31zLk5o7IqNAczBGXqkYv7wnLm6EZGHR7lP2CNX6484lzDi
	 2d/RDJdG+HAfzqP2k2FmRMYJVI8lQxeUb2TXaP6pHWxIudG1KmVsKK87KpZFuauUDU
	 rgbNA70CWlBGgm/rw3YkFT6tCPRL34rabvYSXU+lMCcdReZ5iQV2psdDk1d0tcqaKa
	 wWdABs4a/NBuOsjP9t/Ygp/yT+m71Wsm+ZIJbHzdcMrlVYHMTiLdrrwvBLcUbocN1P
	 Q4Q0mVKHy6oA7Cteh+G7wcnJgphD3Fb2lyn+7QydycynsHrlGB7smFf+Rg1aP9Myfo
	 loJBUXdrYbofw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C6EC60615;
	Sun, 19 Jul 2026 10:22:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 009BB1F6
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 10:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA5364047E
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 10:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1F9AeK5vqpI for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 10:22:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B17F54048A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B17F54048A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B17F54048A
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 10:22:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 95038B0055A;
 Sun, 19 Jul 2026 12:22:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jul 2026 12:22:26 +0200
MIME-Version: 1.0
Date: Sun, 19 Jul 2026 12:22:26 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260719064750.3859427-1-bernd@kuhls.net>
References: <20260719064750.3859427-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <1f7f7dffc37131ed23fc4ce4d0a82942@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784456547;
 bh=oYB+1UoUBERa26NYpw2rxh5+SOVmBFupEbZ6FJkyUwM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LDIarUsxbdAjqhts15rwKBIySzR8FvtQVfmGtJFjfaLVuQ5YYjb7R6vhGGehotn9N
 /2lSjba4rGydFhqimXBdf4w7czotEZpeir5tzrIinyF2ZK9zIRkVVS6wvKBQWWjQjz
 QXT+M2ex8ZWN8iWiVX3BilYSHs1QFvCzjYvnmDXwwA0zz75Omp2Bu/oaK5SsWISjH5
 wQQq+nP7V/8JlnKJXk16iwXwB6axzIudLhbc3FJ1xI2BupSHeP1cMeGNeSeUKWS/Wp
 4iHXjFnS2nM9MIfEiYRSLu8F9zpw5eDrD8yJWmB2kCGCzG3U+M7ZMVkZd34S1eSwUq
 cREumHCWDPg6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LDIarUsx
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 7.1.x, 6.18.x series
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

On 19/07/2026 08:47, Bernd Kuhls wrote:
> Update the latest kernel releases to:
>  - 6.12.95 -> 6.12.96
>  - 6.18.38 -> 6.18.39
>  - 7.1.3 -> 7.1.4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
