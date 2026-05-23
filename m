Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7725DCD5BAC
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 11:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C93681479;
	Sat, 23 May 2026 11:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFBg7UXlagt7; Sat, 23 May 2026 11:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C49D681461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779537079;
	bh=sxN9po2kqgL6XYlTkckkIycIj2zyzaNEDbdd1SPi4CM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iKTrFHDmSfzYyHnc3VvRUBU/pvrjgwFwv8oI/3/NkO+z3AjHygbZDyueRbcZ9kES1
	 28zhwRg6V5d838WCXUzAwrSAuWjj8kc6xjfCgI4ttCfr0sauoZr6bwdaoIHgBfZse5
	 yTZ2J8a1r/n043QljVt+ddHcilGQl5BBxDjFoUHjkSq7YQuagSjELs+/YKto9pNKjl
	 7WE/aNEMj8Q0JfOERaVUI33Nulq+0cqmdZ4opf7H2NB1IUyqXmQ2w7ANo1xGwUwq8v
	 I2+lmDHSWVCs58+dcVUejudqjhtCDP+Ual4Q/9eQP3dLUzB151shegFln0UtCIETu0
	 9pc3Q97966+DQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C49D681461;
	Sat, 23 May 2026 11:51:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47FFC282
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A5AB813A4
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osN_tlCdGOsL for <buildroot@buildroot.org>;
 Sat, 23 May 2026 11:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F6AF81459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F6AF81459
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F6AF81459
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:51:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 29F855FFC0;
 Sat, 23 May 2026 13:51:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 May 2026 13:51:13 +0200
MIME-Version: 1.0
Date: Sat, 23 May 2026 13:51:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
In-Reply-To: <20260521062722.122772-1-bernd@kuhls.net>
References: <20260521062722.122772-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <a1f675d51a7208dc8531d5e9bc9f69a7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779537075;
 bh=vXVVsMSu/1WnO3qBkNxFps5yg3P4Ze0R0aPas6u5noM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d3OTg/2cIuAS9wLnJOAMhyqF4yqPNkHJvV5UoqDbUJb4WY6tecOfEUIvfA+pcHF6q
 wyaw3Dl/E9+CapDHHMOPRJsbARRsCbecqC/JUdY40a+g3jV/9dF6gBKAriAzbV5Pun
 4it9jmQzbqujTsUfoYnjGeZccY//KApR1kc6DCGAygks669Yf3sf8E1R0A/rWQSRxE
 lWhCe0GVWowcWx1fyp4qZi2F/jbiLgo1nEIP81tw3+0mY/3c7xSs3zZwn9er06kbxN
 gm3668HLX7Uua2ays/XnCuDIcd/q2UrkDRUnReE8hTCBwgINncA1DkoOSMG5JTO8a3
 A4tIcl2BevwAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d3OTg/2c
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 22.1.6
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

On 21/05/2026 08:27, Bernd Kuhls wrote:
> Release notes of this bugfix release:
> https://discourse.llvm.org/t/llvm-22-1-6-released/90838
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
