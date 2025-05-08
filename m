Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6478BC3ABBE
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 17:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31B9F411EB;
	Thu,  8 May 2025 17:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWqwLN4QvRFF; Thu,  8 May 2025 17:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654E8410C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 654E8410C8;
	Thu,  8 May 2025 17:37:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1850415A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F230C40D2A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Eddu1UDCEWF for <buildroot@buildroot.org>;
 Thu,  8 May 2025 17:37:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E05840D3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E05840D3F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E05840D3F
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:37:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3B2AD13F86E;
 Thu,  8 May 2025 19:37:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 May 2025 19:37:13 +0200
MIME-Version: 1.0
Date: Thu, 08 May 2025 19:37:13 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250507201433.1506091-1-thomas.petazzoni@bootlin.com>
References: <20250507201433.1506091-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <3312e1d37a8a3e247591b58a41deaf33@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746725834;
 bh=gHU+PwcuSybg50VgMEh40RIwcDTWs66+AEAFYygSxDo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F95r2Jl7H3PAttP+7YvUm44rGWMA6ReBt6RQ7Lq2BNxfXpd0cquXLkqQ07eDglZzC
 r1hWJMkMz4XYi533ZdXp8U3j8HlIfFNgNeczDjmSPEN5ZqxWxod/5ISiyqXnjX41GJ
 +CnzogQTsW4s8PtwbxP7RE/ZTxBv9JPNLqdjwckT8zm8tCkNELmNnXk5jEojITl6kj
 mf8Iv1uFdnym2XLaXVslpVF/loGz6CawpSFWHuNalYhvnHpTR2DzlmPF4XlOvSg60U
 CbP9vfrJDmkdGEZVjKjA48NvV5t6XsaqiEGaOqRhoJ2991Q6WQcxV28DGQDY9Dbv0w
 GMCxIKDergWhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F95r2Jl7
Subject: Re: [Buildroot] [PATCH] package/gdb: add patches for GCC 15.x
 compatibility
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

On 07/05/2025 22:14, Thomas Petazzoni via buildroot wrote:
> This commit backports an upstream patch fixing the bundled readline
> library so that it builds with GCC 15.x.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
