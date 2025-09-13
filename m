Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37A3CAC58E
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 13:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACD8B843B4;
	Sat, 13 Sep 2025 13:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dpm6GsKpEUC2; Sat, 13 Sep 2025 13:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E5E9843A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E5E9843A2;
	Sat, 13 Sep 2025 13:32:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9282E12D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 843EB61737
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BLNi74CEb1k for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 13:32:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8989961575
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8989961575
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8989961575
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:32:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 157852003C1;
 Sat, 13 Sep 2025 15:32:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Sep 2025 15:32:09 +0200
MIME-Version: 1.0
Date: Sat, 13 Sep 2025 15:32:09 +0200
To: Viacheslav Bocharov <adeep@lexina.in>
Cc: buildroot@buildroot.org
In-Reply-To: <20250911085446.3432160-1-adeep@lexina.in>
References: <20250911085446.3432160-1-adeep@lexina.in>
User-Agent: Webmail Free/1.6.11
Message-ID: <cb1bacd515b84a03bbbcd6b589475fd2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757770331;
 bh=XfBKZ2w3uIz96FyQeS9GUQn2e6EfQqLTqOotb9aUjCg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GA3Oud57T3wxMkrX5AtZzbPFKgwHQ4hqogUsifcvD6TVeHDaG+NcbCdVSWTCCIDM9
 ZKh3a1/fNLdQUbXp8Ep9CLM6kPkuE4D2vikY7Gq2GRonXmRAZ93HtfwFQIQFuvndIl
 1PYT9wjGt5lLxCsJSexlW5MTjaxSRencFEFvvGMX7xTYgdaecCFsqS63lJ5SyZQ9g9
 uUZ8ErxbVTbZM+ER8CtTPmqI0KZuj6U2XoAnt90NPrwhWbP6vm8Kj5ebscTLla61mz
 xaGYRiv1hhAfBGABRAsX5KIq8swkUrKTbsiubTzgT4n9VcB6fhw1UZ4ug8t2HcWSc7
 jys/N1WOVlaSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GA3Oud57
Subject: Re: [Buildroot] [PATCH] package/rtl8822cs bump driver version to
 latest with support kernel 6.16
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

On 11/09/2025 10:54, Viacheslav Bocharov via buildroot wrote:
> - Update driver for kernel 6.16+
> - Update repository link
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
