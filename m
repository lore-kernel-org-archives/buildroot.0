Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B46DCA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 17:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B68A41298;
	Wed, 20 Aug 2025 17:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzTWv5x4nktR; Wed, 20 Aug 2025 17:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6958F41275
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6958F41275;
	Wed, 20 Aug 2025 17:08:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2C217AD
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B023C4086F
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LexEdMwckjCY for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 17:08:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E974340888
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E974340888
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E974340888
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:08:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DB50CB00573;
 Wed, 20 Aug 2025 19:08:16 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 20 Aug 2025 19:08:16 +0200
MIME-Version: 1.0
Date: Wed, 20 Aug 2025 19:08:16 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250819212631.3570549-1-thomas.petazzoni@bootlin.com>
References: <20250819212631.3570549-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <dc7da23d04abb147e4511a14e9d7b8f9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755709698;
 bh=3MU/ql1QQo4AkBfN05B0nGyfOGy0OqmNnLE7pMAXPFk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LYa4VVXvutRCAYe23PKhMAwnexg+c16X0UA5orgOGT/Bw2WM4bRw1i13BY2fKdjM2
 R4cHEltvEIpRHM2CU2n/YaEjo1EE05Kf4BC5gWKT1o5vAwAN7Ai5RF9oFMDrL1GYnq
 UbnSZC/cuCnL2Vz90LyhhJ3FprpeziiwGJdTWp7QVJgj0eTWJISDaTX/WIRy2vGzhr
 vXpk554ktW1N1p6a8FhPDYWae34ZEBZU8S7Ya8rQys6AsrTm9Wh6dPkdp0NTHU/ik1
 dgSl6dO/qQHIt7SiVUpvO0W59G0fnAJhsooXlQsUP79mtL9SPUGvsPWsGXhqH6EF4b
 NYSAW87TLgUTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LYa4VVXv
Subject: Re: [Buildroot] [PATCH] linux: enable
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL on a few more architectures
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

On 19/08/2025 23:26, Thomas Petazzoni via buildroot wrote:
> This commit is an extension of
> 5dae966a30c5485e45b94f750a739d36810cba4c ("linux: select
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed"), which solves
> autobuilder issues by making sure that
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL is automatically enabled on some
> architecture if the default architecture defconfig is used and the
> latest kernel is built (which is what happens in the autobuilders).
> 
> This new commit adds BR2_or1k and BR2_riscv to the list to fix
> autobuilder issues.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/1a739eee39bdef8986279a9e21f8637fbe263353/ 
> (or1k)
>   
> https://autobuild.buildroot.org/results/acb62b7a486f3f8e99c6cc2b52b0c259bfa18a0e/ 
> (riscv)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
