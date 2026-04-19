Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6C4EA7197
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18CFF40DAC;
	Sun, 19 Apr 2026 19:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QZ47ornOuSI; Sun, 19 Apr 2026 19:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11C3A40D55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776626202;
	bh=bo2RXJV/wVAwJzrs4JlArKrjA4mSVd6M4/OiH69RQZQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HbpfccPNs8ttN6Lp0ORpvmOdsT98MHWSxebXXuRCu8vUQXkcgJu3lTqRKZ1fTi7ln
	 p5L4yeEFqZhnEDoUpSGzBlZzQLA8+WzUeJz0X8lVk/khdCHx02VWyG7bdskeAqNOuM
	 48z87PNV53JkYXZ6Vqaa6nSCi/O/UXUnx4u3kjHZhQBuqdUWljw/A8PO24T6bFlvmQ
	 bN2iQ35z6MG9vmvTLvxpowHiIgXNj1DqgEx+syDU3xn2o99rWkWIKBWOi5wK+IRHdF
	 PybCSPciKK1EkiCvwNQaTmlaSZ1Wymx+aick4ZRk13QW8EWc13yMkeZPqAgaMLIWSL
	 UEPMdi/XB1opA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C3A40D55;
	Sun, 19 Apr 2026 19:16:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 310B424D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22E7C80EEF
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIDXBugUg4fl for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:16:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5631380ECE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5631380ECE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5631380ECE
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:16:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 46A75780383;
 Sun, 19 Apr 2026 21:16:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 21:16:37 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 21:16:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260419131554.2952082-1-bernd@kuhls.net>
References: <20260419131554.2952082-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <efb0ed44fc34913de183b1ff5a380620@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776626198;
 bh=KRGfk3MHTjrkhBWAwKEqTrjXbKxoCaUpyoiv3Htl4ns=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DvAunSDYPKUs9h/MbMl5E/Sjhpv5xo8UT5KJpc9fNDq+mnMaYnDJZnn1DCypljQE6
 VGr0AjpfLVzR/ZJ5gFCwINZS4diRoneAO8ysCMXycjxc+IzVJVC+Aazsi0Nu485G7F
 DfFpJ+SRG7TrkFQkIM86F7mn7Ex0SB4LCxLUAP+EGHbj6nPtLiNT5gN/OJw0Gpgh9v
 jiVL6wLObB5areqoOTjV55bXWEgPVSuIMHWdIryOdRwWLDQV4lJHHzO4YZ9YhMgxfQ
 0rLYzcw8s9Knw868LZIBMuYLqdB3WbTcnEhpmDeZVFvmRpv4IqoxpJmNRbA3+Ehd3A
 ZfvXauCyGsx3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DvAunSDY
Subject: Re: [Buildroot] [PATCH 1/1] package/proftpd: bump version to 1.3.9
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

On 19/04/2026 15:15, Bernd Kuhls wrote:
> https://github.com/proftpd/proftpd/tree/1.3.9/RELEASE_NOTES
> 
> Removed fix for gcc 15.x added by buildroot commit
> c53f5e78fcd0c6af9174c76d381a44aa48fb4f24.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
