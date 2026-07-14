Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CECC44508
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 18:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11A1760ABC;
	Tue, 14 Jul 2026 18:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUYHBwYD7O-p; Tue, 14 Jul 2026 18:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABC6C60AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784052098;
	bh=1F5Kije7WWv2KLR5xWlJ+gwdkvZNcjGQPT3yN4zyA3k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=olicl/DhrL1DfQJKTWYcQaZtXjIH1hTgncZqZgvYFggv6Fhw4K7m6ZsiRPj/rGfvx
	 cLIR2ZffWYN1gAueSEh1Pbrqyp0r+Wc7j/fuMK0uILYqaqQ6tAcqbkprNleE7VWmLW
	 TNIlDUEKN8UDmrnkxclfwSomnQchC7T/a78nR5LljaCCcK5r9oUEtRKSBdGJuBVlUS
	 nFDNbH1ySn+Qdl5K4Gzja+X1htnABF0E+IYqMCSkQnBBJcQ3PvFpR4UE1bE7y3A2Oi
	 PSfFyneQE8BDX1c8kvmMyyTM3HgMnw50edO9jlBAJlOeVeedYHUjdbTWdCufl/HeMx
	 Gyz7uQcUTudCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABC6C60AB8;
	Tue, 14 Jul 2026 18:01:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A3E749D
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 18:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FA0E80A49
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 18:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wiNTfXTDmcI4 for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 18:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69D29808C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69D29808C1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69D29808C1
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 18:01:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id AE2732003CC;
 Tue, 14 Jul 2026 20:01:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 20:01:29 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 20:01:29 +0200
To: Pedro Aguilar <paguilar@paguilar.org>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 thomas.petazzoni@bootlin.com
In-Reply-To: <20260623155231.3827936-1-paguilar@paguilar.org>
References: <20260623155231.3827936-1-paguilar@paguilar.org>
User-Agent: Webmail Free/1.6.17
Message-ID: <5f602a00ee5f52c3f011b7dbe22f0768@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784052093;
 bh=bCCLzU4spiSbZF9ctxBbf659ZVdn4q4XjxcF5xSL9/4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BY6bGxJMt6v0p3WupAU6kGYrwQ7rde1MMe7+B6PZ0w0ebndK+Mm7xfnfPxBT6rfg+
 mPbIREqtx2dOujUpuOMDx4zTFInRb0XdjpkJcByOcKqK3OfclHiOlDAc6mxUKiuC99
 6kYkc9la7mpJ7ct/eFIE87GoQGpA0jDYy+UK9tPX61IBeH58aOuI8KH+ASNeANTGJr
 eSe3+9McDaGtN77E03UjdrjVgwt1V83MqkGZpI8MwcI9gdgwCp3VctPkNJeGco3fZU
 rFNSbN8wCHD+iTOHXyXQ2/dc026GAFXjRut9m7Zq2b5mUWXq9CcAdmUaIAYCHvXLbK
 L+j/Zsan/GW2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BY6bGxJM
Subject: Re: [Buildroot] [PATCH 1/1] package/guile: bump to version 3.0.11
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

On 23/06/2026 17:52, Pedro Aguilar wrote:
> The patch 0002-Makefile.am-fix-build-without-makeinfo.patch is not 
> longer
> needed since it builds even if 'makeinfo' is not installed, so it's 
> removed.
> 
> Changelog:
> Changes are detailed in the git repo logs:
> $ git clone git://git.sv.gnu.org/guile.git
> $ git whatchanged
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Applied to master, thanks.

For info, I removed the .checkpackageignore entry for  patch 0002. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/643f480f4379afe5677ec399c802b8d33734b601

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
