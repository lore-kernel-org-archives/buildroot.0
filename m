Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E486CA601E
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 20:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1E8F60844;
	Fri,  9 Oct 2026 20:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rM_UQ8C2IVLD; Fri,  9 Oct 2026 20:08:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 747F46067C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791576518;
	b=hUgUvYCpqKxNn0k9FaohJt5jOlLYHpW+Um7oZuwHBCFlIkyujOufV7zi33B1rtEyvpR9
	 acoXJcPDggH8/hJSqhW7UV6frKlvEA2tmBapjsDYGnRM9vzDs8J38O9QSbPxb1t1U7zLJ
	 5j/gWLaKpTK7D+d2lwt7tTvDHr5SoS4z7fpAlQhW0tsvGs3uDl3RCm+MU7vkHff0kR8QF
	 6LJIImk8wx+dxYpuoGcco0Eh05vHhMC3/UM5OI4zEZjY1wrr8aVsDsk71kvUZKaVOBaN8
	 ja0rafRjT8qg+vH5swKcS+ZYI4+O7YJvvN9RIbS1LGGa+rXGWN+f0xixzXqpAM0u5sQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791576518;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Hjcj+0sTFceYUvGKdAE2pmo+a3O85lIKUcssrDckRNY=;
	b=YXZQ2TlfQQ1UL3S74aMvAvHils7d5inVB0GEqMrCy3coXMzklT3cbq7A4sbx2QZS78gY
	 9x+20bWJMsyxE7u4vtLxPluqIP87i4kYV6jlnek/baLosd77IbFe3nSQwTttK/SirCdhr
	 +cMH3p4KqBDq9tlk/PkpWUNYbMLWVwcDgP3vMMd2XpOyqPIV/1qtY7LM2UTiivSOGujc5
	 gZr33jdztQh8xrwTYbWyoPWvIpKb4lu2sYobE2/he4yY9pNlKRZ353gGqYfLKlCxKzuZu
	 tc/EMZPTHxMdfTdyFiz+WzQTFTz13PwgfAGbVQeDaoWKXWn+NJDXwdc7OEds2DnwkFw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791576518;
	bh=Hjcj+0sTFceYUvGKdAE2pmo+a3O85lIKUcssrDckRNY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lGHHjtcJJPuERxKfyZSRj8kkWlXGcbdS4mz8ay6jqWcf+rUwgZnQkqLpqp4RIuxpg
	 QxriWQrf6qcjBw+QXwsB9mzgMZG03F8i7hJpNJSiv84vU7Oq5+tQxAH/N0wEUwvVmg
	 EG+HhS34AGBRXpBFBmw3RbUmnX2yA0sJk6YSdsZKcYMDbsE+QoJShskQWEX7ZrTEwr
	 emz5THc28PjgCfPwo3VGFum44urPbBfV77tpiaGrrBPxiIdTrb+u5oZU6A8/ZvwjPW
	 pHenmAaZUVsMCgDNV8Q/RbTHV6ZjtZ5/WqKt+0+/2m3jWyV7rZyS22gfFErfPI9U52
	 D56724WGOSuvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 747F46067C;
	Fri,  9 Oct 2026 20:08:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82179317
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 741D8408CD
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2xAT5sAcdCm for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 20:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3651840881
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791576514;
 b=LbIxRiV+ubY/dcPFrqkUz2P+IqUGFQBjsYbyFhhGrENhhgmzFQsUF9S+qLom6bSbm/5T
 90sTMx8WtjicWxnGiT2bwFNjiej/AHfkFcePeF0f9oWj0DbWqTZyF1XmD1Yz0HamKVTid
 wMApNcQIVcDjLXNJNMtcar5neKaeehvSpRM9FeQWAkOUqX6ekqOZG6RdVkW3R/xVyrCL9
 xR62sQ6BaAmteHgP4HwH6jUriLXfYuOiepk0vCgV4SQfK6qZjElcDN3ZKDZhRlYp18n+j
 Ep75zx13Y7jyMgwMFBywakUfVa+B7kdkHWBoKBKQ9ws2ImN2pugW7xXSg4EajkG6QCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791576514;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=ni60P2+aTvfkS7L0is3l60YMZioMoKJt3w7z+3NxJOM=;
 b=oHAqewHns2gvQqFcFjYypEfqzS2rGHgVYWiVIzWhx/igFY6kX9fhKqUC4/6S0TECFj6K
 WuLCsxP9MrLrsY5J/M7iZzriGD7aFwUOX3PUBBQh6pDHhAG0gkq6YUBx9It+muqBKc7G/
 /NNSXHmWVOb/GT2OIQ0Sz/guYUwNSAqVcOckpUFuygd1siEBZ9F5C8EmhswCv87fiPq25
 1vlSfqa01YxZY3sI/ZBMA+Zjdab0VmaMI1oTkMd9X1aPz0STBnqzoVTtIbcJCZHyenuXc
 ky/1hCz+9h6evpkDNfBxJc60QE2tlaM9IPTsq/sFYhAbUwvKOS9hhtBQVK9rWjZPFyg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=F+tXHr5o; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3651840881
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:08:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8C841780107;
 Fri,  9 Oct 2026 22:08:29 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:59144])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Oct 2026 22:08:29 +0200
MIME-Version: 1.0
Date: Fri, 09 Oct 2026 22:08:29 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20261008132337.3883254-1-giulio.benetti@benettiengineering.com>
References: <20261008132337.3883254-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <b74dc77362c5bd04cf01f6672b189ab1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.131
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

On 08/10/2026 15:23, Giulio Benetti wrote:
> For release notes since 3.129, see:
> https://hg-edge.mozilla.org/projects/nss/file/NSS_3_130_RTM/doc/src/releases/nss_3_130.md
> https://hg-edge.mozilla.org/projects/nss/file/NSS_3_131_RTM/doc/src/releases/nss_3_131.md
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
