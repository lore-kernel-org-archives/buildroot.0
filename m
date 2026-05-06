Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F52CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 21:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38EE460F54;
	Wed,  6 May 2026 21:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teMmBKqqBat8; Wed,  6 May 2026 21:12:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B0BD606C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778101976;
	bh=OLlnfv9fa6eJPyZBcjzwaMFUz02BwBHcFsKB0CxOkXM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hpR6+qieXd/RaPKxcV89kwiktMLBHk25f75vVi1NEcQGn62/w08tgSV19oz80XN1s
	 KHA9gjfRCD4Yk9QdPm4KCIEjZbKClTQwWTKpYkKraVKJZQSMhA+AvANpWYr3z54E3x
	 hIb5Kg63RBZRl15HwRS8dzIFY5J8iD/h9Y/Uc1sxfB1R1sUYxQc7mKsYKJjp68eoid
	 uB2IHstBma/nkum+Gwr4sF6h+ycG8l2VG0ih4gxKvJ+WTgmJkv3W3LCuscg8Kb3Xfl
	 KenSCdPsdR7qmV51POP1J+SkEWbob6VGpmhi1y6EAYRoYKbfG9z0hQzeyksnKE0XFd
	 KowhcCn0if3UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B0BD606C6;
	Wed,  6 May 2026 21:12:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41F6A317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 21:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33834400EC
 for <buildroot@buildroot.org>; Wed,  6 May 2026 21:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmgvm7siGS68 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 21:12:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CAAD400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CAAD400D6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CAAD400D6
 for <buildroot@buildroot.org>; Wed,  6 May 2026 21:12:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EEAC719F5C3;
 Wed,  6 May 2026 23:12:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 06 May 2026 23:12:50 +0200
MIME-Version: 1.0
Date: Wed, 06 May 2026 23:12:50 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
In-Reply-To: <20260506125341.559160-1-buildroot@bubu1.eu>
References: <20260506125341.559160-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.14
Message-ID: <df6e9d1da034713600f270515cb26872@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778101972;
 bh=zO1MsszBURe7SlxRhIWaE9Qev5/Ax9PTonYJDULVhJ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UvjvzNDyFjdeBg1WunE5QZx5ro7bi3S3H9EDVvHoRJmKZRys5Lw7KFd1PW/0dlUfc
 WdXZrHhKID4MxXvst1ntrG6EZNk2cHmH0g5lKIgDFe2buuQLKSvLBcA1NAeNQCQ0pY
 UKIiNoeI2aryDgcfgCElvbYx/dXWgpjg6YD4+K7ynqmKIZuh21kPAOKTW6ioycO4Tu
 v7+HEZbMXzY9jHgWWi49Rn4f8kPxz1R8sl4EOlvonYobkHoRlNQcG3vk0YSLqc++T/
 hNW6aRIEgXW/FbaCy53L0rp7DMfps6Isa4Cny7rt0ixH6QRH82V5qLZjmGwQiTztvg
 axNF8TSFVjGdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UvjvzNDy
Subject: Re: [Buildroot] [PATCH] package/libnl: bump to 3.12.0
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

On 06/05/2026 14:53, Marcus Hoffmann via buildroot wrote:
> Changes: 
> https://github.com/thom311/libnl/compare/libnl3_11_0...libnl3_12_0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
