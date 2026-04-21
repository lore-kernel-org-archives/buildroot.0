Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1398DF94CB5
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 23:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D70B3421DC;
	Tue, 21 Apr 2026 23:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCkX-FSZFnvZ; Tue, 21 Apr 2026 23:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91B0241FE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776813267;
	bh=zp7Nq1Mfu9zN+nRg9RyKBj6AdZU3fLXGHiTjRr172l0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pw6+nLYdDyiY+hxVL9TiN2zHenx01FwVRQVZVosStQJWp4+7gFZOGWowcPi0e8oBE
	 bEbiX/15hkcT2ZieWa8ExxQLyzPIGwBvmlsIzUtKO+zHraxaJbxJ3h1uaFjmr1dNN/
	 TeXplVui/CAEstfxlvq6AJvHNn1BTK5qXD6wjrR1ypkHQOj1LsOuH/Yybkn3sd4jRk
	 fJfNRRfNgFxrIame0sPnJkK4ZvCN04YGykwnVvaT6r/vK5oTRg6FYmzQObSN+8ySMD
	 aydizxRxfKl8cbAjyG+D7NN/ugMCxHhsVWnCesRyKZ2Srq0Et8Iw+UcvmuBItGcLCZ
	 6zg7yohwMkgzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91B0241FE4;
	Tue, 21 Apr 2026 23:14:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5FC9183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 974CE404C2
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUxIVMmBX4Iz for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 23:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B0F0404AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B0F0404AD
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B0F0404AD
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:14:25 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 076682C80786;
 Wed, 22 Apr 2026 01:14:22 +0200 (CEST)
Message-ID: <00ee5cdf-326c-40bb-b9c0-bcb3a340d62f@bubu1.eu>
Date: Wed, 22 Apr 2026 01:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20260421172625.735873-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260421172625.735873-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776813263; bh=qS2E7ARESfBXbQu/Elzy1XuLryn1AwGi0G9IVWmWhyQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=naHzd0oh6bfuZQs99PtwB/LFB/PBU+zA7w/d/qWifdXLRGuN2yrglwKzvNw5fi19y
 Ikv/uN/47AITD9x9K5h8Q5WDV7fXlYRqOnUqUNkJEvFurHJ79OJcOghJqdtDdFI5jQ
 SfOINFFs0VTyK28OllPqNDIYFgMEXFLmFfWshNwoK1Af6EfzLhE1eHMhf41J+Xacir
 IrkXk7nzilM+Je8T83as+UWjpyq8O0XKfgRCgm08IXY+J4AFDXN6EMLilPkGvWkphA
 NJO7fM1M+N0FU75Sm8qc9RQAA4vDhIeLavRMgZl256ij3GfTkBLmEKGgrQguH4S55/
 yMxNeHzPsCsjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=naHzd0oh
Subject: Re: [Buildroot] [PATCH 1/4] package/python-magic-wormhole: add CPE
 ID
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien

On 4/21/26 19:26, Julien Olivain via buildroot wrote:
> The CPE ID `magic_wormhole_project:magic_wormhole` is valid for
> magic-wormhole. See:
> https://nvd.nist.gov/products/cpe/detail/591D7832-786D-4BBD-A16A-04CBDE20333B
> 
> This commit adds the information.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---

Series applied to master, with a fixup for commit 3/4, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
