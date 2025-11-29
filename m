Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C35CFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 17:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4A4960C13;
	Sat, 29 Nov 2025 17:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5x-OQ9wWntp; Sat, 29 Nov 2025 17:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FE0560776
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FE0560776;
	Sat, 29 Nov 2025 17:09:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01D1B1A9
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD62F40CB2
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7Z_shO5uJRQ for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 17:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D08840C9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D08840C9C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D08840C9C
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:09:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 55FAAB00548;
 Sat, 29 Nov 2025 18:09:04 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Nov 2025 18:09:04 +0100
MIME-Version: 1.0
Date: Sat, 29 Nov 2025 18:09:04 +0100
To: Sergey Bobrenok <bobrofon@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251124195631.234829-1-bobrofon@gmail.com>
References: <20251124195631.234829-1-bobrofon@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <01a81867e01de7f4589dbf893a9f12f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764436145;
 bh=Cm551fCE6avyNrObWtefxNnMgKL8XbX4jX5FiPogqFs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cxl93yfTW7E7530snzAj4523jGJZAqyznh0LVc7qKZw3ajiYHlRaseEJ770vX8zn/
 PhYwwJ7qWKZBf4Xv2w/mNjkyK5nnTw/3RxyPD40dZ9tTL1HQb0XmoHQdt69GWWR3fC
 CRcpqWKATZwbVFCSFVhw43hMTi+4Teeqn9U1QkjAlkneL78RliHTw+/0RCvjA0Q0qv
 CibLfZVb0IWlWEvEEqNCoV2IjwFOQ7U+JWZTCcfBeHbfZymjgeSPzTaLBf7Z2M38JK
 i+Lg+7KVoGLn9lzGpFOuc5qvQVPtImJps7MKThsSos+shV4EAB8jJOgWe9um22TNR7
 ujGvS/jLQVOTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cxl93yfT
Subject: Re: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 2.2.1
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

On 24/11/2025 20:56, Sergey Bobrenok wrote:
> Changelog:
>  * https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.2.0
>  * https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.2.1
> 
> Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
