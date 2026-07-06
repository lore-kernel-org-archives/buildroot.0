Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40955C43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 19:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BFB5810D1;
	Mon,  6 Jul 2026 19:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PocwSaNM2sfO; Mon,  6 Jul 2026 19:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B363B810C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783367569;
	bh=YPBm8MdCznsJebIN2WR/21kP+/N1iKv5qgnssRwFOOE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JVvtc50y6GS1jHuY67ejy+ZNlsUD6NTW7HfLTXJ+6aWRVKtgyBj8A9Fg//sEBDAMJ
	 v6dYksk/2iK/aA7s8Uf7TphXmmKJSN94t0edQHWphw7pjlxeULXKMlwQ0Xt3qrqs4c
	 W65Xdn7zr4axrZ4QD/2S+bDfEfpZ2Jhf8TxUSuWrfGbrHobrJWNBznUuJX7ROjZTA0
	 gxopDIR7seUfQW9SzCdz02pYHGZRovXeifEktiLi2LcNw8M3Og10cmkfbbgo+tNlsE
	 pLG5jNrRJ+frLeDONOqMBAG/bGsPVIT8+vsFLe6lB0KTDwWFNynH4LgP2Fg9BuCp61
	 i0emtyrXrV7KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B363B810C5;
	Mon,  6 Jul 2026 19:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB754F2
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C26AB810C5
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsjNlsjhHonN for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 19:52:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DABF1810C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DABF1810C1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DABF1810C1
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:52:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C336320039C;
 Mon,  6 Jul 2026 21:52:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Jul 2026 21:52:42 +0200
MIME-Version: 1.0
Date: Mon, 06 Jul 2026 21:52:42 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260706074805.2641362-1-giulio.benetti@benettiengineering.com>
References: <20260706074805.2641362-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <372caa553139846e619604703126cc87@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783367563;
 bh=apJCWY4iGf5OJDxabFjkKze0HFfLcLe94l6GQkG6pZU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lSvPTjb5eoQQPUNnYKvfQmkmanrj4tgBX6WmIKXEys7KFbtb+ktSRt1PYmCelnIwr
 Z1uMKyxIbMTIwW8pnIsirwxpT/5umLztrq/VYpTK70CQoMOhOU8vnfakj81o2q2EL7
 w9PCLWIRiZVae91eOEJ0Mukp0tq3IAa/RrllSEX62De+yj7qBgjzpu7tZI+imfOn3e
 LFMcqlrbV2N8iZbBdixOa9L3y/8ys5i1Xyg/BbwE+EmDdHoZ9Epb15zievC831m0Z3
 FPTGMgf4Zwl2LfvFqS4wXDnBVTEnet6V40xKDbrFD36MxG0PwAuG8ht/waR5mmII+o
 rIa3W8lJaGewg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lSvPTjb5
Subject: Re: [Buildroot] [PATCH] package/swupdate: bump to version 2026.05.1
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

On 06/07/2026 09:48, Giulio Benetti wrote:
> For release note, see:
> https://github.com/sbabic/swupdate/releases/tag/2026.05.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
