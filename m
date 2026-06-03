Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB70CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2DB084834;
	Wed,  3 Jun 2026 20:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHKDp36HBGkr; Wed,  3 Jun 2026 20:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DABA80D2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780517828;
	bh=JWDOpWAIZmZR/Y9+tmL6GceFn9249q74ZSMKS7+E3u0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z3ZIwURr93PihgZhr29qhpXALdL5HStodZ5Q9sxdw7supEYt+PS+LXnfz0z2GBAdr
	 q6+Ea+E6V54dbR+6T91hVq87Q3Sah6bOHhOdM7BFhGEtqQZcbkKKL+yFCZ2Knyoa9M
	 DTCV3bWFXyEq3/ZZ+21ZZJ9AkEeYPEdOqCM4sRM2ytnlOD4wo3kn9Q2Q3U64DX7ueg
	 3iYzqecQfy6Z1pL64gJa6F0HBWcwBPcUNlwrCCLI0UwVe+KEVp0H2Pkd+v/yndpiWy
	 bhncA0y27kLbQa2eAw0Nj3ztFsW0a4atryQzVXaa0qdu1uFqXoyZ7o4bUKtp6AwIQL
	 o08DkMf85nrdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DABA80D2E;
	Wed,  3 Jun 2026 20:17:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABE3FDE
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91B5C428B6
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHiqJ8NehUzK for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:17:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D8BD428B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D8BD428B5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D8BD428B5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:17:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1877170386; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 20:16:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUs1J-0000000EIwy-0Krm;
 Wed, 03 Jun 2026 22:16:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20260603185747.3538484-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 3 Jun 2026 20:57:47 +0200")
References: <20260603185747.3538484-1-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 22:16:56 +0200
Message-ID: <87fr33l6pz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=dWd/phTj+0ZX5+f20dpNbJ7UTNAWzvJVZUyPCZY9diq7VcJP2rETNuIcLMVXPSRaPwmCUbp++go4EC4OnK+R9lC1FAP5XSsK+Z58ZWr6GyDK1oEg0VPLtqV4+JmPugy9ps/2yq5jKQmrwM0V6nr82il/kKOy3Gkc8E6U974Pe2an8j51MidKd9wKnvXzno8tlT7xJhUsomOCyNm5JhUaZoOfZcP9J1/FwpR91DR9kghPoCYegAclNiFC0iRjhNqH++ZdBZePp6C84Vl5Tfu3YTum4Wa36NhbI2DM/lXGXhByAYRmckWuNSjkl1oEHcdoCNp89Gfta3JTsxReElSL5w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=c1aQDxtzETr9i3NZXDbo6eBw2azGzqFkKWjrO6T+Aqo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=dWd/phTj
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xwayland: security bump
 version to 24.1.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Advisory (no CVEs yet):
 > https://lists.x.org/archives/xorg-announce/2026-June/003702.html

 > Release notes:
 > https://lists.x.org/archives/xorg-announce/2026-June/003704.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipeline passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/d0b6f1c51e2fea4ad37b9730bea364b23448832e

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
