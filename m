Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DCACCF9F8
	for <buildroot@archiver.kernel.org>; Fri,  7 Nov 2025 21:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7115E40776;
	Fri,  7 Nov 2025 21:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8U4GqZ15a4f; Fri,  7 Nov 2025 21:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7D1840263
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7D1840263;
	Fri,  7 Nov 2025 21:19:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 906742B8
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 21:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76C666069A
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 21:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFSqksuUSU_K for <buildroot@buildroot.org>;
 Fri,  7 Nov 2025 21:19:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C12E060698
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C12E060698
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C12E060698
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 21:19:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id EAC9B2003A4;
 Fri,  7 Nov 2025 22:19:21 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Nov 2025 22:19:21 +0100
MIME-Version: 1.0
Date: Fri, 07 Nov 2025 22:19:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251106213716.2451283-1-bernd@kuhls.net>
References: <20251106213716.2451283-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <9ae4f369bf30c44bdf8713b4cad552db@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762550363;
 bh=7wjuVodaIp/oItlV886QkyFGcESj4P0ll+BlAirTJ4o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZroiqHXqaQdmV+WMIo+JNqFIWuzT3UWTHEvZGhg2TZseyKVCOuBpxXpR5ty7jSDAN
 5RMqE4WqiiJeY2DrR5WuyIgt6+nPtDKDmOV4U5FqkL8IzjaFvhjqMWzkvTTgpleL7U
 we5TW4FCuwh4PPu2sNbzT78e2w4gvMLwzJiz75e9EpvoZQVzsFB4x8Jh8ZA9/2A0ip
 GoXlPr08xuA8krs3pI56h05kZ+pwOMy0oNp1jUkWVKyUCp8NXgBHltbMTRkqhDkf5Q
 za+j12xXwWt+5HjkE9Ddby0xbjm6Fikm+qhtNCQSYJOmoozPEcoqlayj3Mc+EchrGR
 cpMz9jJa127HA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZroiqHXq
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 25.4.3
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

On 06/11/2025 22:37, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
