Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DB8C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 09:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45E196069B;
	Sat, 19 Sep 2026 09:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wm63VBOwVwRB; Sat, 19 Sep 2026 09:15:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0886B60653
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789809312;
	b=Owl7KlhTjP+mb+8HEJ9aXwWL9QMx5JGdg7Z5ntTcBiTTfP5epd1WSrGIYHrsdBhGMVC3
	 JMejLbqVfr5UQgNPUzwETStLSozvN7i6YqNMAaJ+kDyGhOGIWKnCkRvORSfDbWF3AY9Jl
	 kST93AxD0rI26qH5/Zdi/ytJaUhMYh4GZEO+lcgYnpuYPcJ30Rp8pU7FyU4nfnUy4OGlA
	 amIh/Jxbrjc2ZUMbaE1JClOiIfJlAahRIJaFTDK83uE7G0UVNXtaMXYd3qVkggxaH/gmH
	 6MvZDe7rFUNQXpJp8EYvw8PZMVQqzhqitxD5YlQvbsMzwtUIkEFOKA/AF+tCjlRjvjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789809312;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=OfK/wOdx6eBEcwwPRQsGd3NgNcoKpg4GeC5VR6X8Lvw=;
	b=KxWg5An/Bt728rU0jRjcTBAjD/r1BGWZXakHO5StSBx9ebZedDdZSinOOUe4eesvA7wB
	 Mr2I0uPgxWracWk9NsCgAeRF3QHzQRBHx+ff2Fxt0C0kRDhW46ghZhlwyVLvTakrMHRmm
	 AP0lNclQv71GfhmMIvi4oUDU6w2RBdBGUqGTRrdN/k9jvLzVcci1n0lSeHOHScIXfrLVT
	 Y5GJwU0SZjVrkZKjCTz0OOBwhl/Ii698iS2mqmh8P6pUl/ytTISF13WspJpA5ut3Mc7Ny
	 rKHEzX5lobUuj2nFjBrOkL/stMqWn4bL6ptbgGLU6xSE4U/c/TEjKp99CcXAcPiOBTQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789809312;
	bh=OfK/wOdx6eBEcwwPRQsGd3NgNcoKpg4GeC5VR6X8Lvw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZValmI5yCPIzMsw1kUYBcrJkDCQrQlpwK9DV0K//oP/pGWshAacC4B8d3lhcWwgoM
	 4brsRs7ejS0k+wjPRRcXOUmYJHT+emOWVK3o3Ds5DPl4TGaEXPQC0ETeW3DuFCrXlj
	 Vm914BegcUTKS36EI9bzsbsUkFx/GPT07oz2A9f+i+6oj5CVLQ01DQZ/VMerNEcJAi
	 jSnflWpwPdkGUfVHGCf1X7xgfcHtonC8BeEpOmr8xI/xFuUQTC7eaZBy0CK6dhFVU7
	 vt8ax8o+pnx8CS5Zpj0fsJN2s/EXN4KVrLVz0oRJKxffP9H/8kPA52Uo9GJ5RQSgDU
	 YL2VcYp0Mubpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0886B60653;
	Sat, 19 Sep 2026 09:15:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5F1B422
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D794381091
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0K3kgy4VkoRy for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 09:15:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BCC7A81089
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789809309;
 b=im92ICD7k7McX741OMyBB2HiBUb3HZ7RSxElb5zsn2ENPMnBAqWf24QTLoOgNGjH2EnQ
 XlkaW3/K01/ycdzpanq5ub/IimHS8dHwDiqegfShHvR7V8+mYRTWQl8/6oklavpvYQ2Ch
 tHTigowQilaEnQbsjwq4yg8sfwKfXdIRMRLCmd6taasI0LX0A4I0iU8uVPhQ2Gc/gfk2y
 ewcwY236RT94/P13vutTSYb4jHUhR6XuPHMAGsGuC6Nyso+H+GFCAeQCWATEw7Lqt1f8c
 SNT3L+WHYbfHaJGi63Zd9fH2Jp2Tbi+y3h3XlKh4kM94gbP/3YdZAAVNL8MtZuz927Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789809309;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=MDu9s/6CUz3ryjJDKuo9Uselqa5K4B+8hh7WcnF3Hpk=;
 b=TFEQ55WNpuasyG/sJ+6bxor5FOf5Kas0efVfoOiWdiaCpWljBToG8jZxuqKZaE3lNIYF
 c6vTQ/w9JZRPSLgdN84eEix3h3F56fe79knasNSptOwFivX2NXPpOiGHGZZnHUrXMRm0C
 GuxtMyFDIE0rN0jBMC4Av/cBoegRrP+cgfn5s4vrN+KNX1br2CZlNcdVXIjRJwpkoWaEb
 TUmyd6xtM948y5KUrJnuf+LiLl799ASK1axOaBo2ZE5KtPHDm6s24/bZurDbAQK1N8O0P
 tjyJ+nn9Eyl60faMYTCYMlk8UqrniIv8IPYWb3xSvi0qdwxlrZ9suNWzK5UzC/rf51A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jJUjaDeB; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCC7A81089
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:15:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B83672003BE;
 Sat, 19 Sep 2026 11:15:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Sep 2026 11:15:03 +0200
MIME-Version: 1.0
Date: Sat, 19 Sep 2026 11:15:03 +0200
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260917081411.697438-1-manuel.diener@oss.othermo.de>
References: <20260917081411.697438-1-manuel.diener@oss.othermo.de>
User-Agent: Webmail Free/1.6.19
Message-ID: <9a654566dfc25eb941b48c1ede4a24b5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-annotated-doc: bump to 0.0.5
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

On 17/09/2026 10:14, Manuel Diener wrote:
> See the release notes here:
> https://github.com/fastapi/annotated-doc/releases/tag/0.0.5
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
