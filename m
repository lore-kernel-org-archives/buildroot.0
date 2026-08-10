Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CE7C5AD7B
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 18:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D854440692;
	Mon, 10 Aug 2026 18:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kMXO4a2Wwyv; Mon, 10 Aug 2026 18:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0B2A40688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786386722;
	bh=y37MGeFiiV1ngeaOVhEXXJQ3vT1AAiW7DRRxXu76R0I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WIERb6Va29CNjc2Sy+OwiGNJAJqVUufvjE1Cz+/p8m4u9YL+fUmbcuJ5kkmMrciQx
	 gXEf4vhyFAeHXFdF4K7TqfJ5gRdHwSlV2Qs2q61PSVY0vj1LOtZos/5ybzLMjHc7TF
	 Sv9AaMpq00Na+AOWCVhlJI7ntJLzNd+DV7+e0ZghHdE13W9zx1EkmxIRkkOJjyAN2n
	 M2vSUIc1CY7rs9RIb6rXuytlC3PhhuMguVnaVqkcUW1fVz6yr72/wi5t5vV+YbBY1h
	 s05fnRk8LWSw9+6wedGceErAkgnSx8OAbMiqYbmJnOhpZYA5e0je2/zuXVjZz1SJhR
	 YBM9UsI2S+R7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0B2A40688;
	Mon, 10 Aug 2026 18:32:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07253218
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 18:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0501480EFE
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 18:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRQtb8Im0H_j for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 18:32:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C103980EFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C103980EFD
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C103980EFD
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 18:31:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D32802003CA;
 Mon, 10 Aug 2026 20:31:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Aug 2026 20:31:53 +0200
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 20:31:53 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <a8a63d9b-fdc3-4e44-aeed-846d1406af93@mind.be>
References: <20260726092711.212660-1-ju.o@free.fr>
 <a8a63d9b-fdc3-4e44-aeed-846d1406af93@mind.be>
User-Agent: Webmail Free/1.6.17
Message-ID: <6e608820fd7573c7acfe09e92deda3e6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786386717;
 bh=UYaSxqg9fFIkv/uuhH951lNlr8UF5/TELEDxplhUbmI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=krDxHE0G+IBUnsxpGG8IZkJbnScKc3qyGwHyUok7nmuqZplNnXuD9zSzuGBsSupLu
 sXO8rp3+wufznJfNnH5nIm1Ga+fM8Z6Pi8xPS4KBQy8thMz8aPOJYlkKgiDFYQgpOP
 IBjOLq8Mx0PlFWiPlncmdz+0z3fHa3ptWKC5dxa65Wx08qdKGebeUFNb9HhoE8GztE
 MYLGj93XdauRQXilXdQdHNX37LV8YVYGTkWnBk56tQQvyJrixNZKEdgnZAyTFXR55S
 4gSQQosSYqICoffs8dgCpsasHyvMhn8fGBIr72f6tJ77DBGER1OxltADwIxiMr1QD4
 IXU9JrNptDqfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=krDxHE0G
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pydal: needs python xml
 module at runtime
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

Hi Titouan,

On 07/08/2026 13:53, Titouan Christophe wrote:
> On 26/07/26 11:27, Julien Olivain via buildroot wrote:
>> pyDAL is using xmlrpc at runtime. See:
>> https://github.com/web2py/pydal/blob/v20260313.1/pydal/_compat.py#L114
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Applied to 2025.02.x and 2026.05.x, thanks

I saw you included other new runtime tests in maintenance branches,
but you skipped the pydal one:
https://gitlab.com/buildroot.org/buildroot/-/commit/67d6e6602fec095084f64560050cb1195dff7765

Is there a specific reason, or did you just missed it?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
