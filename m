Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4303EC0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 20:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC71D60590;
	Sun,  9 Feb 2025 20:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xjCGd35oA0C; Sun,  9 Feb 2025 20:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C22607DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1C22607DD;
	Sun,  9 Feb 2025 20:39:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D9F76C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B4094094F
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHohg4-8f3cM for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 20:39:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CFA63400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFA63400E7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFA63400E7
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:39:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1A5DC13F86A;
 Sun,  9 Feb 2025 21:39:33 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Feb 2025 21:39:33 +0100
MIME-Version: 1.0
Date: Sun, 09 Feb 2025 21:39:33 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250209183828.148265-1-thomas@devoogdt.com>
References: <20250209183828.148265-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <dee8ae51758f9f0608541119ca4f6480@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739133575;
 bh=XUfF0yjEMPHU7cch3ma4/kOo0/s+PRKR1p4a2ehI5YQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=skwU4OZ/KyKlbBX3rVQs1ABqC9jqFw0qQX4OOIq6LZrXMJEO7++v3sD6MPaBITNHt
 rOlqPaWTnvw8k8x7g7WyTKeVhe9lqGAS5y9PKpelJoXQykNVRb4HxAiQvphFn36BmH
 EHfSQi47ApV0P0dFJheO+yxnPrhI8Wn0OC+NiEYdiQbjCuBNMWPCDKdnwA3RkIgqFm
 p/lFNk4ETmF5Ugrl03EMIYxWrUk1fuOs55R12T47H8VgIPqLOXhKIioGGov38n8c0a
 vbFgzZLn41qJvei4gOCNlFzWUYHUePlgx5JJde9Q5M0QgaOlWyaKq3vDq0baujY6et
 iZDU0fadjcH+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=skwU4OZ/
Subject: Re: [Buildroot] [PATCH] package/seatd: bump to 0.9.1
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

On 09/02/2025 19:38, Thomas Devoogdt wrote:
> Announcement:
>  - https://git.sr.ht/~kennylevinsen/seatd/refs/0.9.1
>  - https://git.sr.ht/~kennylevinsen/seatd/refs/0.9.0
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
