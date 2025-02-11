Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027A7C0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 22:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99D00405FB;
	Tue, 11 Feb 2025 22:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rE1YtxjUCyfd; Tue, 11 Feb 2025 22:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CEE7405FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CEE7405FD;
	Tue, 11 Feb 2025 22:38:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4BC3C2
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 22:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A932B60D54
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 22:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E94FBN0rF44E for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 22:37:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A333D60EF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A333D60EF6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A333D60EF6
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 22:37:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2DF8619F5BA;
 Tue, 11 Feb 2025 23:37:53 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Feb 2025 23:37:53 +0100
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 23:37:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
In-Reply-To: <20250211203534.2053975-1-bernd@kuhls.net>
References: <20250211203534.2053975-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <571a3f94377aa367e91e59f8b9bd8631@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739313475;
 bh=Clxg/zHkNtoHe+juMcPgmzhhCz36ZXabnJGdAKasViI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TBo1P25LqIdZoMedONnMs5IovUHQ1sYStRsuid3p3nZYzshfAeu6DUQiMzOk5jPNN
 B4a6fnIjmGu77mlZqHUlwB6fJNSpeT/e6xdm+zGwWmyj0E0anX9peR3WCzeDkZKNE/
 ZPEz6zrH5YGsRuQJ/yfCArMyJT4ARPpc9BU5wjQIn0jJZNDCvnd7NmOngNnDL8J8Z0
 MDYViDaVbNv2we1vZtnl3JmysXIQCUTgXh/3lrUCypfSKXOD44ixe7bE9lNRU3v3w3
 LL17Xc+R5XSDOyggBatLfsJd4sngUUneKb1TnbWaMEirkSw1AeLFuA9ctLsYe6K1mm
 xTV9dM+Tx4VOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TBo1P25L
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: add optional support
 for libxml2
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

On 11/02/2025 21:35, Bernd Kuhls wrote:
> Support for libxml2 was added 2017 in ffmpeg version 3.4:
> http://git.videolan.org/?p=ffmpeg.git;a=commit;h=96d70694aea64616c68db8be306c159c73fb3980
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
