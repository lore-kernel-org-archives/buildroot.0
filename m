Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59534CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EDDD606BB;
	Sun, 18 Oct 2026 14:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-nJMW5LOpsW; Sun, 18 Oct 2026 14:28:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5984360659
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333692;
	b=DJTbUXUrgGUHbXXTSaiinpes5ypJo305xFZfK8PGGac9mlo4sKjIja91mlRIcRyzEVAH
	 DlbBwQvaAfDi0urStj1xgEsMqbjIAgFd+ymE4lqTIA5L3PB+X4ENsTiX6Mbdgr2U/EwBD
	 +EsYH5/sLyZxQK16cwxZNSWGDYp4X+ckIfQgi50aL4R8C/vzri3Uo60qVueP2p+Q3t1iT
	 aIsPu7IDv4FO9kLqOrnA3/i6TNo6ivDOv9cGHW1DFaNp+Th/WMhdrPqUpDL+8woosrdIJ
	 8Zlz4hZBP0Arv9hET2LyC6G6NUhKYBlCkiwxmkty0JeWEjOyTijqG+dr4eSnxlc01oQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333692;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=m0NnQdsRS9wNaK2zzNaL92i8DErB4yRXAetxNvLJuegNfFNQtz5zSU1gvuZgpcilJaer
	 AZ5ra94xqzumGJSkYQFYVeInjFsfI2mSGTdqQLsdIecstcqULUQSdGJPpl59tTW3M6L5/
	 xTsDfS4+NxSw2q9TPCWfyO/GoCrwVRTh0nyT0wfMVVcsWAy1rM6ThYNf3JHZTKUUMo4Us
	 tYiwY9VCGCM8grVjk8HjCN7ua/53HGbn4ozfF+t6yy4/LbROImymeAj+MPvVtqm8HoAAD
	 I2SXS4FYsIGZkSvrEiNx3W4o34zmAl0s+99n8SqINoEi79HBCxW/sjZbuf+a8wI5Gaw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333692;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PkAvyqmkrnObrkUd7AKP9jog6iwoTKOcamT/ISBXPsLLPXfumlgaxFiGV6mNzyqKX
	 z8PRhAGTtsTv7YyuVrzyRWabjku1A1sB5A7auKhoRiqvvj34KyqARfyp0z0w8U0Lg6
	 zQ8HPotz0ldJnxFooFV9NZ5O0KYSXYsPnrmDBA0pplVWHHCW5wPmLpLM5MzTaglxKM
	 G7jW/WdpRbnlugZJMWvK99cEdBHPBEvVc4kgNwi5PKXqPjSf2vFEtbu0FZcc2jsGzs
	 taaPVh7JgWsmq7Uz5AQs/p3C/b1vcCZTovzh3qjVktwsd+H3bmYgH5XGmlT6qr4eIA
	 SZLm353nDn2sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5984360659;
	Sun, 18 Oct 2026 14:28:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D93461
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F76960659
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtNFvSYjplHV for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:28:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8377060652
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333690;
 b=n4iBv3q0FR9DF9+Ag+psD33y4A5+WNdlN7cu2NBFqdhhROzp+ssJDyEeBizJ2wr3D/7C
 leKrQvmAuGQ3TdpTyQle52FO6aD9bDqdFkA6eipBUQV3vFimfjHDfaUDxkCPW7kwBR4U5
 slDmOc4dU8JqYGfz4+Q/yLHNZVQ2reWx3eZDT78yaSW4mHgjNL9omC9h1lwKvblxORZvq
 Q8n9H4qyeFc0xLIvmCcfLqTEqOg+DNwh4rzSDJvwkWbL8ef2bGbgERmkTN4foEJn1ux1p
 TaBukP7ZzXNMN8c6Qn6J+E4zVzgHOjmVtE0xv9V9AUdhzYkL2trikcl/+YL4W3TRzJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333690;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=GS2XhsRFNEr/f/0oeuP3u5G5c+x6BbYGtngCo2hfxwfBTt1t9idJIgwyk8U9qpb6r2mI
 E7aK6re1xqsQVa1aeUDD/f7xO3qDBtbtm1NYlgeiBkfCQk5xs/hlP3LnYtFhlMOwQx5hJ
 go3ku5NmtMRmNrsGIL4IQIKu0z40+6fPtvoJIRMiSGwF+E5O/XDAH59BOpz8pw0HqIy7u
 qUtGjm870EYF0agrH4Yu+HcqomGAS4ERVRy6Re64sxlgTvFyvqhSEKcn1TONQ4p4GWPc3
 7oCPrcKNejM6oeE+7KYUjM08g5y+RGKkoMEPEpacu9FOMxm9VxQTq77/ErTGOIst+Pg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AfTnOLPN; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8377060652
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:28:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7D023B0054C;
 Sun, 18 Oct 2026 16:28:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:28:05 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:28:05 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>
In-Reply-To: <20261015215210.3426895-8-james.hilliard1@gmail.com>
References: <20261015215210.3426895-8-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <3ca01e5e443b4dcfe7d2951fa88b0b27@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-hiredis: bump to version
 3.5.0
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

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
