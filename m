Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F6CC61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 11:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 255C160773;
	Sun, 15 Jun 2025 11:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imWCG8YUgyDP; Sun, 15 Jun 2025 11:13:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D3F460774
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D3F460774;
	Sun, 15 Jun 2025 11:13:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 442DE151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 367D46080C
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sgxjAJSFjpk for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 11:13:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A05E60740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A05E60740
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A05E60740
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:13:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AFFEFB0056A;
 Sun, 15 Jun 2025 13:13:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 13:13:31 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 13:13:31 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250614134233.678855-1-bernd@kuhls.net>
References: <20250614134233.678855-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c9e6712430365aba1d7ff8b8d09862fa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749986012;
 bh=q0c6l9uBnkrZLfpkJBsx89hx/kAwy7KGLhvPbzCOIvg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NokM9CfYs5dfpeIj+vWd19HDE+NJZRdmRadN+cXLCNlbb/Hm9dpCF3HfQ4F5L9yGu
 fZ5W3Q6LntnGVH17dog/Uw1+8E9fsI7Ybwlue63bFpIu0ZzfPpvcVnYpDgHGk1tdt1
 Eyl7YRsrd9EpQXy6spW6SOELBi3/i1o6wClaV774I98LoLPt06V8XtPoPhhwmBHBty
 ovXyCvPsqxs6LBBHOrqj9ptiN4OrSz/BwMe/eMFSWJjdJGq2+bb9bcKmC61sQ4JNBu
 pMno3c0LAJGvRlSEKgpWWKFM+zRPgJbgH2zQByJkZPZtolvBkBUNPvdsJ8h0E7Q1gX
 pdiYJADjnnM6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NokM9CfY
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.5.3
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

On 14/06/2025 15:42, Bernd Kuhls wrote:
> Updated license hash due to copyright year bump:
> https://sourceforge.net/p/fetchmail/git/ci/62a11ca4064e5b59e57ca7a8fce08c82af259731/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
