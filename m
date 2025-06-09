Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A70C61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 16:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A774B613AF;
	Mon,  9 Jun 2025 16:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jwd7Sa9xwwMr; Mon,  9 Jun 2025 16:54:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC4E761151
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC4E761151;
	Mon,  9 Jun 2025 16:54:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D62B61F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 16:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC81581E59
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 16:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MG0OmB6BJoVS for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 16:54:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B088381E13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B088381E13
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B088381E13
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 16:54:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F3EFF5FFB4;
 Mon,  9 Jun 2025 18:54:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Jun 2025 18:54:38 +0200
MIME-Version: 1.0
Date: Mon, 09 Jun 2025 18:54:38 +0200
From: Julien Olivain <ju.o@free.fr>
To: Andy Yan <andyshrk@163.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250608114143.405210-1-andyshrk@163.com>
References: <20250608114143.405210-1-andyshrk@163.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6d5d71bed1dc0644ddb16dc61009fa85@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749488080;
 bh=MmgYE3ochI48elbqq+kSHGW7V3kdUtP5m/fD4y+TvaI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KqIckowxbvUTBdx0PzvaAs6EVZmMp7pxP2k5inAMblrxJoOoYFmVnNnIk6EpQD9+N
 JRqBmwoV04WKa5suFUDwniWtozoYp5x/nxn1k7KjgBiRJ1QnzodHs9v8hoFWPloihW
 6Uvk58yIILYxTkWF60GVeb1gvFnLEih8etSgcg3V6bNiizHQw3q/ay9rJ+WoJe9QFb
 PRWOY+saixj9g9freVXo8uGlli1UCuE5Q83yRdTPINfpVxaKgTuaDjf0bXhhpnAKaH
 TaHCg0TyYN6KAAbgweFEn6krj04byCqNQqRvYsDWY+Mm3YzNJXUSwbyVAAY4aTJpcm
 PWEPyih1iyD0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KqIckowx
Subject: Re: [Buildroot] [PATCH v2] configs/coolpi_4b: new defconfig
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

On 08/06/2025 13:41, Andy Yan wrote:
> CoolPi 4B is a rk3588s based SBC[0].
> Specification:
> - Rockchip RK3588S
> - LPDDR4 2/4/8/16 GB
> - TF scard slot
> - eMMC 8/32/64/128 GB module
> - Gigabit ethernet drived by PCIE with RTL8111HS
> - HDMI Type D out
> - Mini DP out
> - USB 2.0 Host x 2
> - USB 3.0 OTG x 1
> - USB 3.0 Host x 1
> - WIFI/BT module AIC8800
> - 40 pin header
> 
> [0]https://www.cool-pi.com/product/cp4b/
> 
> Signed-off-by: Andy Yan <andyshrk@163.com>

Applied to next, thanks.

For info, I also fixed two minor issues. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/51fc2f3846c81051d9743a02469128dd51fa0ff0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
