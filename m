Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA70CCF2CA
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 10:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D1A5606AA;
	Sun, 18 Oct 2026 10:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPRcmmXkpMdF; Sun, 18 Oct 2026 10:39:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5A72660623
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792319986;
	b=R16ehOuVbH8xQMsyXaQIT/Jw5dJ3bQuWcQH+pgmPTp++pgzq6d0kwING6T0p4HhQm3AL
	 bATwrm+G9PeeIRIrCTsyXalcHjQnjVPSAgd5xaEsjI9p/mJJBOvspz4js0/QDX9VvXoMM
	 mT5q8TGdLkCtFQzL6sh7Q7h2uwpcFUkdeLBnzwyRo7xbkEVyoVixVJAdO3H4yaDhlHdi3
	 84CAO0ScZS2J0z0kYvF4oByQyHHPeSgmtOzAxcUg2STlr9rcSeJoU1dvPPyAJSEfy1fow
	 1GhI/G3Q+tXk0Dfx784/23UiDFV55nHrjkqWAAGaZg/26TCrtGTzyWmOWBqHXh4Kn3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792319986;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=B8m5qZDEB5Z77opHl0WxYXN6L6KD3WrtP0k1Fz9FXDk=;
	b=XFePDX4In+RGFbr9DNzGXod9FV3MXZ5+NUbjUlOZJRl2ywmr3zMHUzCHPWcBM2nynnxp
	 qi3vTOYPUaOaavOfjzrppQr3ldhYzQ6CB5gNjeeJ1tjCwO8djvov0RV1yMXQq7EhEJ6xC
	 /IOCt3t4SpZzHdcqF/gJeLtiaIb+SofbFaYEwWbZG7w+hq2+UAsihIqnW4ojCmD9umQCg
	 IIzW7Wu55SI4OU/GmLP8mAfL2xViGv9532FDacVHdKVrO9bLKXnq+0FWgiWSpxGzi7Xbi
	 RAU+xhGxSj/xha2f2gsSg2d/N/S1xHcWjSA3hsgwFe3UdA17etspBzNipv5SWk8yuJQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792319986;
	bh=B8m5qZDEB5Z77opHl0WxYXN6L6KD3WrtP0k1Fz9FXDk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G81tN2NmRSC3Z4kVWir6+6Jixr1yw3UTWeIxPxtZNRuV8qnJTZ1Y/oiC7eCShNkWL
	 /RzCdArlG8qR8C6N2aM3qsNF+qzzVnkrIzrJChc9OzMJ1OJ17etFcQNu/Qqq99ardu
	 3w4ca+iLCx505nNSDKweTKFA/fwSWbnuQS1fyq7uXDTZCTGJHqwWYk3SPTrmcpOw5J
	 JnYZbDMD0WWv8pMeEHrsLlEUwPzE2ICQ2xN73MdUy8NfkG65QGXncVqL72rZJwED6D
	 E7jFHK3DK5Eh2FlEriQuE0ZO2OlQlZNsc7M4BWcpox+7yOIHrXIocsd0qTIaU+lPQx
	 G61muh/YkMu3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A72660623;
	Sun, 18 Oct 2026 10:39:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FA382A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 219E280F71
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TN256ZNghq1d for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 10:39:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 744B380E2B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792319984;
 b=Mde9Axx7FV9w1p6+TM0FD11m2uAXFjVnQEWI1RCLJtQmoTMcJMW5LpVoo67AS50OXRCL
 b/7iBqBuLW277ooiJRu96WUqxRhPKFgG11T0Vf2vya97sYNlFDQSfZs0Gsf0M4QdJTY+r
 Wt+8GShwgMxN9QF3uiIh6HzESlktb37C0hhQi++ebtOKKLe9yJjodDZiI8Y8oBeSQ+4Ou
 8ljrE5+zbfqVN+sT/qL7CpmAhHxZ5bgNTCKT2Fpt5gIPgSJp9UysIxHKjbB4Jj98sYb8N
 1Vy8jRQjD4nuV+e0iVgg1SLiAp3nMMZnKbmfec/IKRzyWN+yoj1IbtmgOTiI54hbtZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792319984;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=0nZVUbURnozEIjGyEcKDuUGKU3OC3pQsCG3BG/qk7H0=;
 b=pc2/0X9mzFbQDTJ5esOlvuYz1xb0g/bRl+aTGNAcQjsPRpS0Gfm/NztS4vEAGD9fZPtS
 ojUIPOD3i4ftGeV/DJgnrwJJRMNYfCielhIuEAm33cRBELXZluq3YAUiGEPUzIL9Qx966
 l+Y2dGMD4rfI5npvhHOuSizPUdiwyqSkd4Ft7PpS1VWuPUqz+w0DhCbFDFj5X7w8xwHf/
 UIVWrhhQ6nKGT+iU5wdx3+2gAIf0TfMIAn/FFj56OD/414mElIrROfU63/0Hz8oz6Csmm
 OHoBhRfcldSNkInXuOH4hkII0gsd5Tps78aTlBglZqdPcUUxfoyTYO/mpfKs6Xprk3g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gAPOroED; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 744B380E2B
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:39:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 844B1B0053E;
 Sun, 18 Oct 2026 12:39:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 12:39:41 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 12:39:41 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261016083906.2575324-1-yegorslists@gmail.com>
References: <20261016083906.2575324-1-yegorslists@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <348f5f76fa717d3eeecc5bc16dbb127c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Yegor Yefremov for
 libmicrohttpd and libwebsockets
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

On 16/10/2026 10:39, Yegor Yefremov wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
