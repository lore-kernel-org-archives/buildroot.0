Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1532CD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 19:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80689407D1;
	Mon, 11 May 2026 19:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijGny5sXQ8_M; Mon, 11 May 2026 19:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0B0B407C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778527180;
	bh=wtphnNw9MI0iTopgHQ+w91R8jkxWn6noJGm2Om0paNM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zc8h4PCdhYwNFHNzbUMlzc8aObmx5PUrVDSPH70FpSTqTRENyW/bzZ1W5QTwGvqm1
	 qcG5+QkQijfWx2WM1eAtev+iktd+FK11BDmNS8bFwAF99lHKwQtQIpgMxu1aXwVD6i
	 IeEJWIXMyeOiZT8CVyK8KTHp6+mLIA+bZC5MpBO/JiyhhzHtVq65nmxAzxXbQLHrIw
	 47U2R+ROXugO1C994J3fk2TE5x1gkqlAFj2kf40cSbDrtuBgCN6t20w/ztylPTsPBM
	 ys9pr6Or9glJ2HOC7M0BOH6LnRf3jj9eEimjlDwFrFvdG7/nvOI3ZQl3xoBiqVcWNV
	 bPVILtpZr9HpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B0B407C9;
	Mon, 11 May 2026 19:19:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FCAA272
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 316CB407C9
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAJEiwRiyZX8 for <buildroot@buildroot.org>;
 Mon, 11 May 2026 19:19:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12E93407C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12E93407C8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12E93407C8
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:19:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 356CC19F574;
 Mon, 11 May 2026 21:19:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 11 May 2026 21:19:34 +0200
MIME-Version: 1.0
Date: Mon, 11 May 2026 21:19:34 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260510211832.2114019-1-giulio.benetti@benettiengineering.com>
References: <20260510211832.2114019-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <ff3ea45ac708b589a941efe915a5f764@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778527175;
 bh=pPGyhKBHVK/2hY7z5rrOajKyMqG86ROeHgoPy9Ieshw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N41v8EXXfCoBQftR/bayhGyzS5I9K0lPVJnBcWYNdItDPA4tPKiqK+UzEppQhoZX6
 1jMsIECpu987oWTFimxFcn21oBiuVbEO1wQXve5QBu3oriI555Q+kMIIDvgCbo6z+F
 ny/MiD7errmf5g+yMFpkheFqLLr+S1VSxGG6i5bWjgskDP4BD4RMhC9yISvN665noN
 qXCLZA9DG5KR0XFAuSO88hiSaHdZvjddPjOstCyu20e1Mfos3LuwSPPgHn7qq+hxH/
 u+n20r9ioxB9Et45++bLBGNUzcgxd1OCEfdqrO8ejP49HPuvinVbcptaZ+oElvAifz
 mD6ENY1PgbF7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=N41v8EXX
Subject: Re: [Buildroot] [PATCH] package/dash: bump to version 0.5.13.4
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

On 10/05/2026 23:18, Giulio Benetti wrote:
> For change log, see:
> https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=6a1533f24b646364ad514c542292b5c85b2adabf
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
