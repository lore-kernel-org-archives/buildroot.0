Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE32BFEFB51
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 20:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E77B822D4;
	Fri, 27 Feb 2026 20:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbwhLzCofxmz; Fri, 27 Feb 2026 20:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02999822C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772225852;
	bh=bB2hGgAdR3bIqu/xKwUvJC734WZ7MbKz0jbN99HIT0A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DvyxZKm7vue9VTcqyBhbLWbHd97gN9tJ2ilAexPMSvuNgefwSW3bG769y8Vg/eZ0W
	 FQnEnJO296kJq7LIF0VH3nX/Gdv2FQKxNjhLUJV3DJQ3sZEOQhepxoEs5d9GgF+jqb
	 DHWEv6evTmrZRqGWgqHJN37VkGba/XKfODTqAHPjgRwAQleKURNaqOnxkpyC4kOYS4
	 3JN5YDigOi9rtQjqbY8DQlgXKthtoDLB0yM5Q19ZzsFV+qBEBJ7iWw673WwuigrWPy
	 1T6wUKu9ztW34uYpYLczMsyj9RgF5BCGZyt83HK4zgpAns3peiawsskAOM0bakxtTc
	 Pi/oYc25X9rkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02999822C4;
	Fri, 27 Feb 2026 20:57:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 250DD131
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 221ED60D7A
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgbVfYHlr03M for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 20:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8240F60D79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8240F60D79
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8240F60D79
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:57:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B21AB78032A;
 Fri, 27 Feb 2026 21:57:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Feb 2026 21:57:22 +0100
MIME-Version: 1.0
Date: Fri, 27 Feb 2026 21:57:22 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Marek Belisko <marek.belisko@open-nandra.com>
In-Reply-To: <20260227194921.3401564-1-giulio.benetti@benettiengineering.com>
References: <20260227194921.3401564-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <6a50f445f74dd68c3298faf0e844505c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772225845;
 bh=4SME5m1kysyXpgD6/ilgaF35jmXVyijG7pLtnhUBncg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VkQOz1FHM5Z1F2irAp6LJPHdaUEdOAaI9JlB4FBvnZr4VFavrc8GbKHSWFL7iynwY
 CI7wCzjDiDo0WzPNKErLtcnuptkehyYTb4tA65EbKIxC2pN3i1n9c06tdlpc6FHfNq
 //zYrhOmFhqzsfVcsSlMseL0a0jwDaYi4rkQEYLR+apcQ3Lk6SCi7FMJX4yewh7v89
 cnNkzDPwLAqksljq8Y2caN9xXlqFB2v0o2S+ZHvBcRgAXEbkMrIzYS0NzGVCJF5cu2
 RqeEelIv+MQvJ/ghSzoT6kIHEqgHEE6pMwG1kzFnE90RLIZBALEY8gD5O/0bVh2ULM
 +IMKrAPQKL7Bg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VkQOz1FH
Subject: Re: [Buildroot] [PATCH] package/udisks: security bump to version
 2.11.1
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

On 27/02/2026 20:49, Giulio Benetti wrote:
> This fixes these CVEs:
> CVE-2026-26103:
> https://github.com/storaged-project/udisks/security/advisories/GHSA-c75h-phf8-ccjm
> CVE-2026-26104:
> https://github.com/storaged-project/udisks/security/advisories/GHSA-fcvx-497g-6xmw
> 
> Release notes:
> https://github.com/storaged-project/udisks/releases/tag/udisks-2.11.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
