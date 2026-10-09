Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18089CA601F
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 19:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA93E8123E;
	Fri,  9 Oct 2026 19:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjU_JMVeErer; Fri,  9 Oct 2026 19:47:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BADF3811F4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791575268;
	b=oZYfnS3O70hEuhsIg4EXLIgpeIjwZWl/Ja7vuI8obkEuguLMd/pN0XAisZiEZkq8Z+2D
	 jic6slmsM/PIh0b0DUfbYrKPJBzjWOJk2PnxMGRvQO9HjyBVS05RlqIa9R0XMqnPgYyVF
	 BPnlroqh2xEjYAbulQBzLl59Isa3rScFNMJAo+GHdUFRrRv+KH0s0jXNhPoha0EscR1D/
	 fHGEfsINf/sOuHXtKsf996FwF2k/8JcB9wuy4VhCi3GGfeyqj6eugztbDJrg4HEPsvdYQ
	 jRyLIAHbFProHBQGi5mp3pI69AmWT2i5PaZsrK8LAzhT9+nYXrxqHP9kOkmPTiDo+pw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791575268;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=6OunCTEoDtp9of4pspH0haQ+TLF50f4XLYI+YbOC7c8=;
	b=XbevpXya15OynMLofqtOVYI7/gQlO8YiIjoIhnGi3dHrfP+X6WvcKoZ7LGS67rZbMqbU
	 /S4DvhKNRw56sPk6hzZGSQh73NnNuk7urJWLZ/YRl/b+0d5xZZx/I4kM/rCNVr8vjdhjN
	 q2XVwODd5gyhlMpV0lLDshCceSxrLG1mnlBTeXQMjDM8IO0lA+/8CVQaig6r6J/PzYTHO
	 JKFsmIiLd9NImpc4rZU2ur8hYipHq0ttdaFg6XAecQsGUy/TDYjsrPOt22O75w/3T9xLu
	 H8Wp+DH4Xvisbk7t2X1YhofOZpR/YVi+u2z7FRyPDnmrxFZUwR9J8vY9LaB4RcCfVJA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791575268;
	bh=6OunCTEoDtp9of4pspH0haQ+TLF50f4XLYI+YbOC7c8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qHM3Ez7BqreJUoP9u8SGrWdspwB0suzXP+wOoNa2AvYl1KL3CtMOng0neVWtf8Wxi
	 xjKY9y0EWqMbn0YH4hdt0+Xs3ZGK5NgcKDQOxY6R/zdjMd1yJYdky8p376tGjmcz9e
	 8oZe3JeQZi5qTzOqCR9EWkSrBU/KbJFM9r1d6Decp7dUgmR0t615xT1MxI+E9/HLhi
	 uvJwhZzOlQ7r3+FA6euo97HscWSbq1StxJVW7eGwgtsDjIYLTMYyl4hzvYTnvgaBIU
	 f2gtTqUBmb9mhliQFvvdPM7we2hZ1aVNQsOZANDdvVk28J6BzBI0urd8CmzbCbI3wy
	 CUowwbCfa9hWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BADF3811F4;
	Fri,  9 Oct 2026 19:47:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B326B184
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A52D540763
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mj8-z0HUr94u for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 19:47:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 09CD44062E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791575267;
 b=KqURe1EqI7XYe30abHdnsyo4IDGYk4cAvAp/k0Y2OHtxLL00gbzEyDzsLbD5RxrApEFq
 6kjiVQzRxkcgy+x3PBfm8rDkoVOhCkp3Bgh/FFWHzu3ROHhADiv00e90WtPqjGvvQ4QtN
 TYx6ynQT1sod/JBehXpg5zTNVnA7R1JJIWPsKx3FiK4KaZ7kAZX7vVgHPKlsG0ON+14hm
 72eu9pEaAf0q+D3yHrAF+3u/lrFVQQmVTjfwIYTq98mSl+A/aTqT2/aCXuNWpGVSt6EUJ
 XvDDe6XPOzhzK3iuDyUuygbhsOtrilhFpsp8bTAhIjEVG+Y0CAZ6eTptIhHS+QUA8yA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791575267;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Jf+nAA6CBetwa93cn/tcxGkc5UNtQSTsNxNkGY1iKqE=;
 b=aomaMqjVzwwji1EKWxQbkNv2jf6w0uQ7vrVVUxcLEyhXs7WNNzLK1lEtynTOkkPBuYLi
 OColJCwqGUlC4g+QwKK0RxU1KoKizO+ZOuqUUvCCBNzCIw9XIDPliledaSj/Zd0yzGBOW
 7gTPrTqH9s0SSEsRnfOPMRqW7FOkVlZg45vg9PQchCWquYrlxPtuynX5RIjJzJhvQHPtM
 73f8YIW4iVufq7AyMnYzk5PXVOVNqNVZUV9JpBSUigb4sZWG/IjGfNf7rei7QkgG61CDe
 Xcd08KRP8Sl9HstX7nSR+vJQ+R7Fl4TAtmL1RxZrszjo1zJErKrokA/bRH72alLn19g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cQbZai6x; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09CD44062E
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:47:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8819513F861;
 Fri,  9 Oct 2026 21:47:43 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:53086])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Oct 2026 21:47:43 +0200
MIME-Version: 1.0
Date: Fri, 09 Oct 2026 21:47:43 +0200
To: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261008214609.721718-2-mr.zoltan.gyarmati@gmail.com>
References: <20261008214609.721718-1-mr.zoltan.gyarmati@gmail.com>
 <20261008214609.721718-2-mr.zoltan.gyarmati@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <ac15caa1604745312bcb56adc2b4db46@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/proj: bump to 9.9.0
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

On 08/10/2026 23:46, Zoltan Gyarmati wrote:
> Also the cmake minimum version is increased to 3.22.1
> 
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
