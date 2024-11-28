Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D496D70DEE
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 20:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C8E240293;
	Thu, 28 Nov 2024 20:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzUsJ2vjb4nN; Thu, 28 Nov 2024 20:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 232D240276
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 232D240276;
	Thu, 28 Nov 2024 20:42:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9ACCA6A
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C93FB40102
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOke2h8PGusf for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 20:41:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6FAE400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6FAE400DC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6FAE400DC
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:41:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 815EA2003B4;
 Thu, 28 Nov 2024 21:41:55 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34028])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 28 Nov 2024 21:41:55 +0100
MIME-Version: 1.0
Date: Thu, 28 Nov 2024 21:41:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Roberto Medina <robertoxmed@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <8fd22598-c0af-4d39-b87d-0c9b4259b0bf@gmail.com>
References: <20241117220500.584642-1-robertoxmed@gmail.com>
 <20241117220500.584642-2-robertoxmed@gmail.com>
 <8ad05d9774584d398fab6e43dc1bd3ca@free.fr>
 <8fd22598-c0af-4d39-b87d-0c9b4259b0bf@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7958a2d7f730c5397a5b35dd354b4473@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732826516;
 bh=j5Jt3b22o8Ui5NNyEQLCCMlptUX1SLbJBsoiDNbBDqA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FJD+IIrO4zQ8b/X/wEJcoHZ7sNYlM6jj/krSUcCdeK4zGoxJBUn+7KCLTMkoIigAY
 CEeJdC2dDHtvxXV5rsT0icTiQBFAJC9rmg5ZyjvBW8CSOs7v8CrGQO5fwFvpt7p67t
 qFQd64hwwB/mcYHE6oVTR/efzZPDjhyvTwjA4KtZouaTmvZf40aAFMgtEvYIGIAUfe
 jhX95HwCsGMw2OjYBLdyVDnLSkJ3sWMo/icRKdPYmxM2uRpcVsAkv8qKzE2YyJTKg5
 SgK/UaaAZPyre6eIEin4jbr0Op+x33ZrHMzjr5i+o+sjN+4sfGCRXcTG4TVW31ILjl
 sBXyQBhCOuzdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FJD+IIrO
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/roc_pc_rk3399: Bump Linux,
 U-Boot, TF-A
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

Hi Roberto,

On 28/11/2024 21:11, Roberto Medina wrote:
> Hi Julien,
> 
> Sorry for the late reply.
> 
> On 11/18/24 8:54 PM, Julien Olivain wrote:
>> Applied to next, thanks.
>> 
>> Side note: I updated .checkpackageignore, due to a
>> "make check-package" error.
> 
> Thanks for the fixes!
> 
>> Could you do those change in a future update please?
> 
> Sorry for the naive question, but are you expecting a v4 for this bump 
> to reach master?

No, I am not expecting a v4.  Your patch is already in the next branch, 
in:
https://gitlab.com/buildroot.org/buildroot/-/commit/f59f69e0e01e2ece4c2e57cc0c371e017c36fe29

It will be merged into master just after version 2024.11 is tagged.

I was just suggesting you use the "utils/docker-run make check-package"
command before you send your future contributions. See:
https://buildroot.org/downloads/manual/manual.html#_preparing_a_patch_series

It will catch errors earlier and make your future patches accepted 
faster.

> Thanks,
> Roberto

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
