Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BA2C83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 15:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 374A880C8E;
	Sun, 13 Jul 2025 15:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMasJ68-tWij; Sun, 13 Jul 2025 15:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6504580C5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6504580C5F;
	Sun, 13 Jul 2025 15:48:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D76106
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48BAB60765
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNf2u9ed-OSV for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 15:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 674186075E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 674186075E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 674186075E
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:48:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 97D0FB00576;
 Sun, 13 Jul 2025 17:48:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 17:48:09 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 17:48:09 +0200
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250609105701.1314792-1-m.niestroj@grinn-global.com>
References: <20250609105701.1314792-1-m.niestroj@grinn-global.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <51072b4a53b808a7d3e4bb299cce563f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752421691;
 bh=DmGnjw5KXCKiD+RFGPPrEFtR/09BeSsBIIBU8iGqdmU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bGspWzR8uSWBfS6H2UTWCr15nCy1wtDTNcds54O76F8j9tytszfbCpLqSpFgF/uaU
 8fQCfMejNCDHs/MO/SMBrrSbZllriJSilylfGHHR/9hgySDq14jqIAHJv7B3CM138U
 uJAdQKUCI8/Xf1oheKUb7I2MxaZ2t5ZqtHvPc+DIcXsFy7BPcqlLe9KXaQ0xJdfgV+
 va+Ml9xXvhW+F1bftHBSzTn75oPYyw2/pqgD/Dxtw6II3w2Ca+jZFk8r7/y5Af19qx
 zViF17IrVs1XX5zbfhmVYhjVbAFPaRkxqp4yjCPsgC8yjwEU+jx3BCtkexcFxY0o6E
 auWWeeUiqDCZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bGspWzR8
Subject: Re: [Buildroot] [PATCH] package/python-typing-extensions: bump to
 4.14.0
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

On 09/06/2025 12:56, Marcin Niestroj wrote:
> See [1] for changelog.
> 
> [1] 
> https://github.com/python/typing_extensions/blob/main/CHANGELOG.md#release-4140-june-2-2025
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
