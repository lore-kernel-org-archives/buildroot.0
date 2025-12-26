Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8692E8FDA6
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 10:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0E3E816DA;
	Fri, 26 Dec 2025 10:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yiuSlsYpCfK; Fri, 26 Dec 2025 10:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9204D81638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766745476;
	bh=OOdlPUyH+WIPVcQ3/3yFPaegI/s0aYnunD4m88IoqX0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OaQkKwiOohaPlFyFcwkIISBJWD6w3nrYe9IR8/fvo2biGnrA1Voj5sTMIPdOoLhcC
	 9gpXMIOO4vz9XS78mxEGPGSEwtYvRvpWQldAVYDVBrbe71NMbNtdt4Ey2q4vFU/5qI
	 +wTPS9Bbt5iO7GH3EPWPgJNqwJWSC33X67flxcVp+a1nDJE8DvN+EGSnaPWg0FBnPL
	 1/Dx6WGC/hoXaebmUiXs1Nml3YOOt3zILHxHX6sVGDiS6Fhk5AB7hojXMph32zGMI4
	 +/AA93q2L4MlVsDnm16nyxXB26Jgt6ouf1T228ZpOcdFx/I5KVLvl5jENOy58J91NP
	 4scq8uAPnPFyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9204D81638;
	Fri, 26 Dec 2025 10:37:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B49FEC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F100E81638
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgpwKU5fSXot for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 10:37:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 134D881545
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 134D881545
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 134D881545
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:37:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 27009780503;
 Fri, 26 Dec 2025 11:37:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 11:37:51 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 11:37:51 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251225211907.2300253-1-giulio.benetti@benettiengineering.com>
References: <20251225211907.2300253-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <5f25522faf38674a073d8761f130f1a9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766745472;
 bh=CfVwfirnd6wFpd/2nn1yaC0wNTFESCLuWWNmmMHIqb0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lLjPr7ZlQ0PC0mXaQItKtZlZpy/X98CeaskhKm762Qcdu1ir4WgAF2pb9hOn4HzV/
 D1Bq7Zxox29ttjB6QBap63Qa9DPVKLDR9JLjal1V6aflaTDYY/NNVIXs2K7O/nLWOg
 OhBKzYOAVMKkkqxconPn5agOTNckA3oh3KqfKIqDT2sioBuY9nJDcA0ckx0yGt26D5
 k9VmxskqdgIsv7C8TqF7oPS/gikMZlqRrd8hSKBLgrVAOv1XhU7vFH6nXb+IsHu9uV
 N3aZYBgqIZNtuw8iJQfFdZBDNsRZWZiPDhMLWSOXA271bXHIUBdLnxc0aXo1PiFh6H
 fyMQFHL22pXmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lLjPr7Zl
Subject: Re: [Buildroot] [PATCH 1/2] package/tmux: bump to version 3.6a
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

On 25/12/2025 22:19, Giulio Benetti wrote:
> Changes: https://github.com/tmux/tmux/blob/3.6a/CHANGES
> Release Notes: https://github.com/tmux/tmux/issues/4745
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
