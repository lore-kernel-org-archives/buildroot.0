Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B043D60CFA
	for <buildroot@archiver.kernel.org>; Mon, 18 Nov 2024 23:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C004F81304;
	Mon, 18 Nov 2024 23:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9gnbr2HjYnm; Mon, 18 Nov 2024 23:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBFEB820BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBFEB820BA;
	Mon, 18 Nov 2024 23:06:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8569427EB
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 23:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BC8042DBB
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 23:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybHbm1uuE6-Z for <buildroot@buildroot.org>;
 Mon, 18 Nov 2024 23:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52A2442DBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52A2442DBA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52A2442DBA
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 23:06:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C72AA780368;
 Tue, 19 Nov 2024 00:06:16 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46206])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Nov 2024 00:06:16 +0100
MIME-Version: 1.0
Date: Tue, 19 Nov 2024 00:06:16 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241117215429.136783-1-giulio.benetti@benettiengineering.com>
References: <20241117215429.136783-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <40f1128c07cd7d8bed6e4dc281478eb5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731971178;
 bh=BkciklgCqxIGDFN5vyJll+M+iugvddwW+9lMuIkr2Oo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lk+nyOy+J8mUyVzI3LcBhxBAYO7pMNVYc7Vmk9mmsn1fI3YZMpjEU0JzbNO28QuxW
 HNEGyJjPC2dycCOXKdjkmS4GWW3W9EfUP3IYWlOeDB2RaoZZv/Ob4vkf9avT+Yzv/J
 +B5MsWjzgd2Ud0fzgwofn/X7Y7TdMu4Ig71cLvfptLawbcpJHuu7Z6GtU+e64e/fHa
 xCb78sb8Y24ExrNBjpT2BcKIdPdEK6UDTwD/Q2Hya0Ia25SeGHy+OmoFi6OcYaFhvl
 iYUPNd9cjn8Bc+++CLTe7Id1MXozG04lG/jXhDxLi7mVYMoqEVhPqaBIZNm6vP9g7U
 8moG43BH4SSgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lk+nyOy+
Subject: Re: [Buildroot] [PATCH] package/libnvme: bump to version 1.11.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 17/11/2024 22:54, Giulio Benetti wrote:
> For release note, see:
> https://github.com/linux-nvme/libnvme/releases/tag/v1.11.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

I applied to master rather than "next", because it is a maintenance
release fixing a specific issue.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
