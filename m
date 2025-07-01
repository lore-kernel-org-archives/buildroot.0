Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EACEC83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 21:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB8D541CE6;
	Tue,  1 Jul 2025 21:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82MuSDP0wilf; Tue,  1 Jul 2025 21:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F34A841CB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F34A841CB4;
	Tue,  1 Jul 2025 21:03:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 047F4196
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 21:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA6C440363
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 21:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjMswOzrMZTt for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 21:03:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D83F40075
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D83F40075
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D83F40075
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 21:03:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 369D678034D;
 Tue,  1 Jul 2025 23:03:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Jul 2025 23:03:17 +0200
MIME-Version: 1.0
Date: Tue, 01 Jul 2025 23:03:17 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250701153448.545594-1-thomas.perale@mind.be>
References: <20250701153448.545594-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <0dfeb541e6e4aa4a7f7d6c164c9c4ae7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751403798;
 bh=5JVWfjvZ766CkoMCaQ0FeV+4MuiSXuqv7meGDQpDHMU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TcMB/breuQheTRfrR6ID96kcxgjVh83X60z8q3MMq7/HUM6NGpQGvxFodlxzUVtuj
 Pb+R9h1ny35b6y+1ycM0z3Pdsgv/BXG69+tDwuGlk53ax/DzX3086G/cRqzoip8IhY
 GdhxU6ixwvaDkLknZfIvevptNFT58LMmsuMJawbGdi+3scmc1ZGomJ8OTezukNbODf
 AgACML+6/8xOy7fZ9cLQ+grnNCybhJVjy0SUveOWtEyBCBa7m9//JFw364Qt2uYCGV
 pKH5gB/p8QU801zQxLaN4JQXBktJaR/4dk7oyUOpBi3yrpE7CtsL9SWLg0IhOSiYvk
 5Mf6qtONVBVKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TcMB/bre
Subject: Re: [Buildroot] [PATCH] package/net-tools: fix regression
 introduced by CVE fix
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

On 01/07/2025 17:34, Thomas Perale via buildroot wrote:
> Commit [1] backported an upstream patch to address CVE-2025-46836 that
> included a regression.
> Upstream later fixed this regression in commit [2].
> 
> This patch add that fix to correct the issue introduced by the original
> patch.
> 
> [1] 323aaa9f54 package/net-tools: add upstream security fix for 
> CVE-2025-46836
> [2] 
> https://sourceforge.net/p/net-tools/code/ci/ddb0e375fb9ca95bb69335540b85bbdaa2714348/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
