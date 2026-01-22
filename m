Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8207D6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 870928233E;
	Thu, 22 Jan 2026 19:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBu-77uFaj2c; Thu, 22 Jan 2026 19:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B72B982339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769110928;
	bh=uHxY87UvAy772GJnLJFJLDNP551R9v39bMdDuhJIL94=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=df3nonNQ3hUT3BG4dGRRR5wgLyUBBpuSp8lLyxMDqNb37pmzkUUSVhfciabKzwOpe
	 LpqQmaXOd9k59yVQyzPh4E3Yt1PsHQWpDAhCyeVZZ+3hG8oTVp1IGv+xIr4K8Q6e8s
	 jW5FYVGUb3PSV8E98KRLpCebd8cxzTw7jgh7kt5+OpZzyHn3AtQzIbj6BTZ34mT/l9
	 GAyW1OcXVgMR/E/F+YKjHFVUfkMKxQoPvxPqwCi5IezT7Acbzqoh/+4QbiGJletKVc
	 UhspSaKcUPiAnq50Df9p2K3aANzjC2xf5A3H7Ff18XiaR4QYpcLw1L0nnZwgFHisa/
	 o1t3mqDr/+UOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B72B982339;
	Thu, 22 Jan 2026 19:42:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CACA7158
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B019882339
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUvzb-KsgHfh for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:42:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A53F82337
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A53F82337
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A53F82337
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:42:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B00552003AE;
 Thu, 22 Jan 2026 20:42:03 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 20:42:03 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 20:42:03 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aWksm0JZ9Ldtv5OE@waldemar-brodkorb.de>
References: <aWksm0JZ9Ldtv5OE@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.12
Message-ID: <cdf3ed61610497b288d84c2ed93fe137@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769110924;
 bh=GOnU1gKHd9z6YW6FAYT1pKI4keyAFT6TdFWJ3nhakOc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BGqIIy7CMdI9msfI775Gtxx7/S5fqMmCraEbQo4eD4PbjVGIpXOfgRZv54oX2VmB8
 8m/beVZeoYDVUfkiHCwFG0sVhiRdlVMURNbYxxqmCbmWOG0Yhq2KZoP8AEIEbIs92T
 sC+YXo+20fCZGWVikbdjsC3pTKZwCRJYuPgEVdAJjT34kXW0jEYZdCrA3yN9GS6pne
 2ZAmGiZ9w7FZQuQAyc7I3z8/BzkmUdhoR6XOiyemxWynI2iBvtMaae7cR+uunnUGg8
 wGqJ43whE8qzb+T5dMuL85mK5byg48+jxRyilLNFxIj+Utpt5FEwG/73aqmLLGFMEA
 Jvibe2HZgS2QQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BGqIIy7C
Subject: Re: [Buildroot] [PATCH] package/evilwm: bump to 1.5
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

On 15/01/2026 19:06, Waldemar Brodkorb wrote:
> For changes see this page here:
> https://www.6809.org.uk/evilwm/doc/ChangeLog
> 
> README was updated, the LICENSE part bumped the year to 2025.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
