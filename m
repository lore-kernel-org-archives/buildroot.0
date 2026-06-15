Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EACCD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA2E441963;
	Mon, 15 Jun 2026 20:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sD53QGmYGJE; Mon, 15 Jun 2026 20:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C2104195E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781554239;
	bh=OTD3YN6jwZKBeE7Nh40PzEIc6OXHVJiAI+25GfYFdo8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NQrYiA+p6txlFbwR06u5BDKYFSdPCY/2OJqO4D3LCcUjgwa1tf2YWQcsfo3qJTLor
	 x4y88p3nTeWnCWCP/mNPEurWrJBgdN6lcAUyG5BD9WSn4s8uLgvBq7UUdGXqEd5htQ
	 McJ9kgW/4yovx3KOG1gVBjoRHmPQgYqNkvxXiUJWWKi3AylR6AfmN+9vUdgr660dU0
	 0vm0bd/ziEq01ZWvMqRGkjfHBHtL9eVJoKHZxvCQkV+d7RjUMHHKKKTWpyTxXhf1qo
	 dztcm97uMtRlouAPbwpSNVOue6PAN+FMFLyepAdtx5zacv3b6vH2DLaHScRsOTz2qt
	 w9S82NZLHRvCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C2104195E;
	Mon, 15 Jun 2026 20:10:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BDA582F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF5714195B
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5800hvzHHEj for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD0FD4195E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD0FD4195E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD0FD4195E
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:10:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6EDFC780333;
 Mon, 15 Jun 2026 22:10:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Jun 2026 22:10:33 +0200
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 22:10:33 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
In-Reply-To: <20260615083710.865467-1-buildroot@heine.tech>
References: <20260615083710.865467-1-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.16
Message-ID: <72282bdbd3f75f00a5750d39bcc62d2b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781554234;
 bh=98TM4hgJ8YucBHAX1tDysWhcD8sEnNXKehaVo3vjV3M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gT5vIFN3/nhTa+yEvmJbWEaJ3e4SJmhlzWGk8vbSO5ZuQKRtTN+7B8pAFl20nk+2N
 s4rDoQB19myW8s9+ZpGkTumRWE+Xl8VH6i2D74K7uMoh52boD7K+IxHQkebVsRWLaK
 o/Dq9l9l/G9c+YNo+OgAOjfpTZta3yoUS+myEL8O1LjB8O4ZwQ5kUfio6yqfD1gBp7
 I/wVjyMZpzLN+KaUtyHf7SZz63d8oUU3puvOkf/qBzc7vQhy+x/cOgo3mZ5FB2HoxC
 vMYNVRn5TNgeeCZPp2YsH9jsI9Ww1/FQfpoUIJGZQSKnzCL8kSfjXuwlnVwbTnkTKd
 MGuSMD8wnaE+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gT5vIFN3
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.15.1
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

On 15/06/2026 10:37, Michael Nosthoff via buildroot wrote:
> Changelog:
> https://github.com/catchorg/Catch2/releases/tag/v3.15.1
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
