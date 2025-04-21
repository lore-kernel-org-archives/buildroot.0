Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD02C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 09:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAAB381299;
	Mon, 21 Apr 2025 09:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85ObUaMN2M8c; Mon, 21 Apr 2025 09:51:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F22F7812CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F22F7812CA;
	Mon, 21 Apr 2025 09:51:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03E591C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE57F402D0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsgOI-6BO3Sy for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 09:51:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F9B8401CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F9B8401CB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F9B8401CB
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:51:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D1D2A20039E;
 Mon, 21 Apr 2025 11:51:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 11:51:03 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 11:51:03 +0200
From: Julien Olivain <ju.o@free.fr>
To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org
In-Reply-To: <20250418143730.23712-2-dalang@gmx.at>
References: <20250418143730.23712-2-dalang@gmx.at>
User-Agent: Webmail Free/1.6.10
Message-ID: <bd3f99eef8ab08357cefdadef7a3524d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745229065;
 bh=q/jo3Cyeg+5H/EkBq5wu/rW9mzY5P/3HyQDBNsB2mUY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ihUGZ4Udgw1onbJyKUQcdBH3o7oUH5Cc2ypNjG7Fr1+nQK+ldDPOL7zJ9vuCQzBlT
 h+IVqLJrA63mHihcsy6x+Ghdwvol6CocVwKMBAE2fqlVH22w72cTQ+h1AU1L9dlI/u
 viqVEeoGc/mFSJ6d9wY51gGXJjDeAAwvt9o/uvdiJ3AKgvIInlKBO3K50Tu2XAPQRT
 EizYCfYF1gr6JsbrW7weS5mYz1XJYkhumj64u1840xO3Rr6dbE08hWw4Iv6cSywbwn
 KjXbqLpUlumcCObhcNvIAujZ4XCJ7ooPjFM548lGvD7a2rTDcSSWw18mcOVKkatshJ
 lOj7P8EpUJ3xQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ihUGZ4Ud
Subject: Re: [Buildroot] [PATCH] package/dbus-cxx: bump to version 2.5.2
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

On 18/04/2025 16:37, Daniel Lang via buildroot wrote:
> https://github.com/dbus-cxx/dbus-cxx/releases/tag/2.5.2
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
