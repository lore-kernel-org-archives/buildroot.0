Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7569DC7115C
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 16:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3801D40E54;
	Fri, 20 Jun 2025 16:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDqk-gEK8ItM; Fri, 20 Jun 2025 16:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 856E840E5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 856E840E5A;
	Fri, 20 Jun 2025 16:40:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E9382154
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF9BF400D7
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELtB6BcBrb_g for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 16:40:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A09D40091
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A09D40091
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A09D40091
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:40:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EA5AD6013B;
 Fri, 20 Jun 2025 18:40:45 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Jun 2025 18:40:45 +0200
MIME-Version: 1.0
Date: Fri, 20 Jun 2025 18:40:45 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250620062524.20688-1-bernd@kuhls.net>
References: <20250620062524.20688-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <22c15d9ef942ddd56e199e17ff4eeed5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750437647;
 bh=UnwU+wOSFVO8NnMAr2qM4DyoIzh7uAPMZn+V3FLu81E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WpLcSIPpXy7CS7hoTn3BHxWnL2Tn3bHK3LNx8/zgqpd7i4APRE9FfdLmJF8TB723M
 S9zBzAXHTT436dsIXEZSGiPdZR969Lo4CHsLOYBkVxFdjownoy8Zti3919UFYSQs5B
 ikUxTDx51PlkMvIpkd8ELvIkwkqHQbwZOziSXiN6c5m/zolS+4xxdex46qGbIcZLuQ
 BXkksJ9jTgd7uAso/1rnfLfM7l8k5nYLqdbMx/XmJeGFMcquJOAwKSAJLRGUv38GKz
 HWaj9LN534uV5QNOAc4dZsb4QAA7+SuC1jENxhx3bdI7qn4BCDvHPo97l/5nRHjjsV
 +PSadYIyMhTvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WpLcSIPp
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.5.4
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

On 20/06/2025 08:25, Bernd Kuhls wrote:
> Release notes:
> https://sourceforge.net/p/fetchmail/mailman/message/59196377/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
