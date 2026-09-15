Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D3BC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAA0B80965;
	Tue, 15 Sep 2026 17:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSajzvDP4cO9; Tue, 15 Sep 2026 17:33:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2E2BA808A2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789493610;
	b=Uf6kAw8O68aF2f24I9bGG2lF8NVG3BI4Arh6cmN+Trl/OHr+cp6HBWgwvPtJEWpgHvLI
	 L366CgRX+3c4v9mfSRrske7YRvy+JKUtuoy4mnk3uBCShr5+hrC7n+T/vvb+Sr0kahvp3
	 SEzTrPZHZu/pik107THQCCYbkLts0XaXX8gFRXyvIti9k0o8gBr4r1CJ+gJiF/rXyzsjQ
	 O5eYwGS4ZoXGDkQIy/LLPBfhalhWIdGoL1P1rOpT54hEvttxFHKcksOfmGTVTJgxOnYE/
	 7+SeDKY69wCuT4VAEZ3/zRGcEOvv8a79pnvJhj+6MbXgJ6QlMxLwE+tYYuHdzKwbz+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789493610;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=5VvKvuGTQdgjaFNMX1tfs3mXm3VLKqmc81YKT6DQGgI=;
	b=qdg0wSTqSYdXUBGbVz7Muo1uxwAcjDHcqjk3UQzSD0Pi18pzfqYRMZIuTHhbJve+VSyf
	 F6eox/3vOva0vsVE9WGQnHgBS9afXnBjdPsp2uOKujGpkZiJ1eMB0H+AkWPx4lkqMGHnx
	 9kjq3doH5F3+AQVCD7+fML4FBo0y9CDeLLT+GE/qS7blROAJxQnlbELnJNH0KJJESR55S
	 LhRjAba/wmA8MCNxCiVKfaQJqHnPdS2GoxWK8crHy4e7BoaDSUe9ZPD5UCZlWnMrATuju
	 iLoIyYuXS/EgyeWJrLVLa7zCGTZzydE4DWCM6xoUnLI28NhIy0hR7OuO6MpRn1kpoKA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789493610;
	bh=5VvKvuGTQdgjaFNMX1tfs3mXm3VLKqmc81YKT6DQGgI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Kbtc5aSiHfpvgIFm3TIh61C8PVuDW06jTY0zr4RDPga60Fb9fU+DrMC73Hrq5vuns
	 ZNArduBpgyN+yIcCmT4u/s/hrNIxnLiKRpTRMdFilsr088UHr2MoDPalUkkeu54i22
	 DqvE0Ng1qNfQh18STxGu0Bk5dkfIcsScX5mXPD0qz3KBJOh9xP6DQFsSLgyv2s0CyL
	 k15h9ehnjLlO7AnDzL+vj03yS/Luxmy5MDNMLNHBTX8TQh0YfstwUXWGAH/PuUDpfU
	 oyNb6mFXZIruhBFcFHRHVZP7BYJ80CkPoxWxAJHuNZFjfMcZCH6utpmZitxt7lnRJv
	 NTssu4u69w3zA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E2BA808A2;
	Tue, 15 Sep 2026 17:33:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDD6223F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB2F040535
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvvDPl435Ujq for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:33:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1715340400
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789493608;
 b=fLCIkxN8yNrXXvZD/TMx3VYQX7ZlZRKTNxChcuRWf6FsCh4hMLsLcfMsnQ+pCEcewJVx
 wpqiJkhEv2scyQLNiFt5i6pIXpQPG8BsTr/u0nHMUH1jRpgZV0wa2mAFu4e4+Ml4Do3bq
 09NM9ocnmKn8kKTmCDuL4BKTrTHJqOb+E6Pe69RWkDSEfzCZ3IAYpVWzWjb/2aS4PQgum
 iRoBbjmCe+d9La+J+lnznNsKN4nO4imPseIASJQLBKX39x1z8aj9ywMvDryBt8stYoHE8
 h9N50TW03laDeWKwzzHzNWyl8OvSdHf+Y8oFuyHi8v65TxOl8DZxsEUZHPNpdJ9VgPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789493608;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=1vyol3SIX8Ye72QrqX1MsyBkAktmAPrW6Wh8j8CfFks=;
 b=maHJ48UnbVamCJVXhCwoZxFOoxc4ftxJe6aM7Nk0XaLncVcLRb933JTGPgSV84tKi2UQ
 4Rb5yMjQApkHN/mw4Y+eOv5jwytxq1yAXUuTedmlHFbMDR9oei0zqkGjQZWjSqd0VyJqR
 5kM/vvsKjL8mxyaIXfZHNDk1jhNGj1+U7oHqMx1K917Sk36z56/2eYjfxxnSnK/ddu7S9
 dl8BDYJeo84a9iyGITBJHi7DPKNpq4bz3yhx35DMU0Q41nQ9chUBpq7xVnKOcG+tk8fJS
 SRxy2tVdg7TM8m0vLDiEaqO91HPfqBlsDXzUv2TwWu0Anq24zwazVTIQbZmWGEIW5uw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=C2XUedbu; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1715340400
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:33:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9C42C19F576;
 Tue, 15 Sep 2026 19:33:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 19:33:22 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 19:33:22 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Chen Pei <cp0613@linux.alibaba.com>
In-Reply-To: <20260915122946.1953137-1-thomas.petazzoni@bootlin.com>
References: <20260915122946.1953137-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <ededb895800302065d99bf87105d2439@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/ndctl: fix Config.in comment
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

On 15/09/2026 14:29, Thomas Petazzoni via buildroot wrote:
> The Config.in comment has the correct dependency on
> !BR2_TOOLCHAIN_HAS_THREADS, but that was not reflected in the comment
> text itself.
> 
> Fixes: 039c1ae13ec12f7cebddf86f37080d0a1fee28e6 ("package/ndctl: new 
> package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
