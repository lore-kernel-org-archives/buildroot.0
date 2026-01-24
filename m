Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54035D715DE
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 10:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D93580EC1;
	Sat, 24 Jan 2026 10:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWuK73ovSxeF; Sat, 24 Jan 2026 10:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 818538109A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769251478;
	bh=kAScH0THEV1gD1sOZIswuEXyTikMCVsSG73U4tTzWl4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TIIrUVr52bEaKnJdMsQqXLfZY2lyi+yW7CjMkdROFhq1FFweOdBwllpuxy9+S7Ej4
	 Ua9462PhEj7WWC+Q//0y3Bf8yqoB9Dd+V5QOD2CxjzIo7h512ft+9Ih+1Aq1IIzVkL
	 iqtoLyDivePpFc66zIgSf3/VlrDlEkpoaXegz1yn9qpNm0+KdXjhEYuuL5uZIw5uoa
	 Imtr/GUW3LxFAYXw2Am7HwjLCEQR6R/VNvRLUx3Ui7PRlzAu8q1gE0552Nu+jKGzWn
	 CA2NuQ/ajwAOTUqXVMs7jKlR0O4b9VQ3xnwTV2+WS77+bqMfXRPlw2eQEwB2gKH2sl
	 QGVHdDaTnAuQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 818538109A;
	Sat, 24 Jan 2026 10:44:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 82CB6358
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 10:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6730780F48
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 10:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcf1m_O7X1tB for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 10:44:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 45EC08125E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45EC08125E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45EC08125E
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 10:44:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6A13713F89C;
 Sat, 24 Jan 2026 11:44:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 24 Jan 2026 11:44:32 +0100
MIME-Version: 1.0
Date: Sat, 24 Jan 2026 11:44:32 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260123221408.11223-1-bernd@kuhls.net>
References: <20260123221408.11223-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <5c6755ac0bb9430b92a0dec68389bd37@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769251473;
 bh=vQyUNyFu+tJnaLxyeUDrCGW51VgzxhkhzAOaNlzR1O0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u30e/8GOt3UQQKFAzH5lfzTSlmJRMnJB+P4rLP+p5PI8B7kPa3P+I7IKHzdL9CPDW
 Lk2hbfXWWKzxLh+hb2kw0PivIgeDo4BCWiJVRThUTQrQUXaprrI0I4R0wWOTgFdtbf
 Gopv9lEUQGMDZe4QcSdmt1bC4j4A6Ho7tX7dmqpkjyGU5fsffpCK30IWOs8U8lKcS5
 x5BzSus75naniexbqd7Ok5L68zbFygY0bSOFI/XinhYtjvOiLFJ6RaYEYCTv7Blu4l
 XJ0dTychH0emJKCEUl5ege80WdpqDafVHIxDeMFUkw5ixDSirLV+MtJ3uYXzi2lwC7
 +KPeiCnJKtLEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=u30e/8GO
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{12,
 18}.x series
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

On 23/01/2026 23:14, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
