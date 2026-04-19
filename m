Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9FAEA71A2
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A75EE80BB2;
	Sun, 19 Apr 2026 19:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxTRMJWfxMJq; Sun, 19 Apr 2026 19:24:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C1F80AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776626694;
	bh=OwIb8xWAq+A673CG4/79p27CH7miB0gq5tBO+avAs/s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=spwozYfn6/sNiLwrzlbTxaGY/cpG5EDC//lOJtX3LZz4Iv4VJZL9AWtV4toMmOeba
	 PMgRrBlZpRrBE74cF7uLqfDKuGBRVYKblarUJ6RncFJrkv/V3NPfLYTX+e3LABVPnD
	 +aUU+YqCNB0V97VIxwMVX6nuuXlXXRge2Jw8tnPHNali88AaGTddwuVN5Mm4u+m3j6
	 rOor6fj63yqw3HeFPt6AOdrPjP/QxRM2VDf2Cov17AJToNIXJ9uhF5z3bU5kx7HWWV
	 uFw09nx1mm728RV+/r7fKSEh0NzsYg6VA1w8foJj4NthQGdnWj+TK78kIbuYs+3s4Y
	 ztpfj8Lo0LmGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05C1F80AD9;
	Sun, 19 Apr 2026 19:24:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C48B2B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31A6B60FF0
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HdVLCd1kUHz for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:24:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CC8660FEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC8660FEF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CC8660FEF
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:24:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D7E5B2003C1;
 Sun, 19 Apr 2026 21:24:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 21:24:47 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 21:24:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260419140540.261219-1-bernd@kuhls.net>
References: <20260419140540.261219-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <1bbf05bde7c47408d89b3a8702acddfd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776626689;
 bh=8tPwqenLbrORQZ+pUf3KghY1YRu/4yobdrgusd37iKk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LazfCD39I0wrtaA8vRusBjL0tTZrbdBm0DlCgRFurtlc5gTBlHvfauzb3DeeLkJh2
 A74ZRuFOxn+YmTofP89CI1c6E4qH6F9bdbmmoRGmpjzGhHsKvQonDEyIJG/bZr5jBx
 LLYa7IJAkuXdYFDubhWJju5loWYbeKfI/3ysz/ZEkKaxMg1bAps1sg/xu4lqe8s4as
 TFKS0K6YsoCcdRN111mcIpKgooV1kXCql1rXcTlqPiwuJRga0HInQ4qs+H1HhP73A4
 C0063WaeJFBDklFGZAeoyWi/YQrr9j6b+/zE8093F8kyldACv3PeQM+EJBQ71mBohT
 X2YEfKBAnuYIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LazfCD39
Subject: Re: [Buildroot] [PATCH 1/1] package/nmap: bump version to 7.99
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

On 19/04/2026 16:05, Bernd Kuhls wrote:
> https://github.com/nmap/nmap/blob/master/CHANGELOG
> 
> Removed patch which is not needed anymore due to upstream commit
> https://github.com/nmap/nmap/commit/1b3ca45054cd1e569f5fc0da59fceaa7a518b631
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
