Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D7AC5AD49
	for <buildroot@archiver.kernel.org>; Mon, 26 May 2025 20:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80646403F6;
	Mon, 26 May 2025 20:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JiLX-BDLt54J; Mon, 26 May 2025 20:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B59C840512
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B59C840512;
	Mon, 26 May 2025 20:18:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DEDBB66
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E5F1403F6
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6_jZpiQQgCb for <buildroot@buildroot.org>;
 Mon, 26 May 2025 20:17:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6ACF2403DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ACF2403DC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ACF2403DC
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:17:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7D8C513F8A2;
 Mon, 26 May 2025 22:17:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 26 May 2025 22:17:56 +0200
MIME-Version: 1.0
Date: Mon, 26 May 2025 22:17:56 +0200
From: Julien Olivain <ju.o@free.fr>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250523230019.27747-1-fl@n621.de>
References: <20250523230019.27747-1-fl@n621.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <9d060919e9579b95db1ab9a8cc55d7d4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748290677;
 bh=6nX7st6dYE+L+bNKmsXVO95QjEF+1irDNRc971gG4pg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g3Iv7lL8Jo2QAZqcEU8owUbNYTzmaaFXbISwqBJ84NJYwyIKDbUKIKqeFx9y4FEne
 +2cSzpgwEIVmlLV6Uxw5VdhgJYmhCeio8IdkL7FfQH9uikewu1DbuLd/3AJjlo5xtj
 9RRxQB5i9IbwXrE5ZGb+JoDK5N2BFMwdg+nfyw84N0IIuSUA1IgZLpco25rg7/a1bX
 2UfucaFeCrw3GjlG/yW8V5dCWMjabMcQpeodCKxII7widJqBpInq5DFs4uzAeduYwb
 WXuFBCY7Lnud7kHnVX6EmPdoJtLduwUkwSd1jvErv5ScQjYAtjI43izJKjkpHL2gun
 AlYCQr09SUMlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g3Iv7lL8
Subject: Re: [Buildroot] [PATCH 1/1] package/lzo: fix CMake 4.0 compatibility
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

On 24/05/2025 01:00, Florian Larysch wrote:
> Add a patch to fix lzo builds with CMake 4.0.
> 
> Fixes:
>  
> https://autobuild.buildroot.org/results/8d9/8d9cc53d68d93432e6a7bddad0ed3fdaed913da6 
> (target)
>  
> https://autobuild.buildroot.org/results/aba/aba68e0889b66300f87706e15ff34899d3e1e97f 
> (host)
>  (and many more)
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
