Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBECD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 21:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0157540827;
	Sun,  7 Dec 2025 21:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XI-ugn8XsbT4; Sun,  7 Dec 2025 21:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6DC8407D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765143828;
	bh=RjI1pkDt0R0/JE5UwEXBO1p1EHSUR2jTssSnl02JCXc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YjaAHnwpv99SqV36Ilae94S25ITzK9/5PthEfgEQ/YeavsxCA/qCkTGuC6yodTroK
	 OoEbc88szwVA0Kiw8yLYHyJfF0Rj3mBIGxagxm6W07rJqvr8uR3lAejcSe51li3FM3
	 NAkAq3RM58OFL51eEeVfG7MQB1L0r6/wIhKEMxX58uquyUy7FdG5Y2E9JJLjh84d8K
	 iqj8uO6L+CG2WpLnRY7dwPf71PhVgbjhi+hA6/UZlHugPrjmtCQYai9BOA76NbJ3QU
	 ed0Ro61d1Juquzd1LUIMwyBjba6AGoLTfL0Y7ZorGsfVPKZ+mzfkxnv4tN4jR5gWJU
	 HBqM/LwmR94mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6DC8407D7;
	Sun,  7 Dec 2025 21:43:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 957AC2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87693817A7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ac59NXBuSwEj for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 21:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BDF18179A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BDF18179A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BDF18179A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:43:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 02DAF78035B;
 Sun,  7 Dec 2025 22:43:42 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Dec 2025 22:43:42 +0100
MIME-Version: 1.0
Date: Sun, 07 Dec 2025 22:43:42 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251206094357.532993-1-giulio.benetti@benettiengineering.com>
References: <20251206094357.532993-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5c665f6d5a5a0eecf925dc3928bf2561@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765143824;
 bh=kWAcz6LvWGqebvoTf3Vys0B98l/3Zw+x8kR/dUsQ8mM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NM9EjeTp62b6xr7lWuYTMwEZzzwEkmSYQQNsenV1ECpOdPojDln2oULIxJPgJ1pN/
 sE3cxaciZAD2udV2jhHeWGeO4zXiQY42TSjVtIUfeRbiSqUwtewrMd8M9iRwHvK5tn
 ZFBk62UFpA/UHRqsnIJ3Y64xyqbrHRLpwR4i2Y/M09A0QX/Cfalt9yOhB+xL0W+D+U
 //GDO389xtB2r5zybMeZkRXssOqDfKmsDfymJMdpOntMKrx5GH9ZdbSKJLfEqjJaTN
 LbYQFGJMAvp8R2kyE2GOcaPJkxLk11BRD/DNzBODAx5qea9eNgJBAL9E49VUaPJ8u+
 0IOINRZryF8ZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NM9EjeTp
Subject: Re: [Buildroot] [PATCH] package/swugenerator: bump to version 0.6
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

On 06/12/2025 10:43, Giulio Benetti wrote:
> For release note, see:
> https://github.com/sbabic/swugenerator/releases/tag/0.6
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
