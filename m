Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59D8C282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 20:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86F024033D;
	Tue, 18 Mar 2025 20:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Or6WZfaQlBr; Tue, 18 Mar 2025 20:55:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42184402F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42184402F3;
	Tue, 18 Mar 2025 20:55:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFE6AD5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D10C34029F
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u00Frrmihqc9 for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 20:54:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C66E94013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C66E94013D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C66E94013D
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:54:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8ED6B19F57E;
 Tue, 18 Mar 2025 21:54:55 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 18 Mar 2025 21:54:55 +0100
MIME-Version: 1.0
Date: Tue, 18 Mar 2025 21:54:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Andreas Klinger <ak@it-klinger.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250316185744.332684-1-ak@it-klinger.de>
References: <20250316185744.332684-1-ak@it-klinger.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <f18720bf29393360d083f6e6aabf8353@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742331296;
 bh=xX9AKwHi0W59wkxdHNa5Uir49Kq79bf3SGCJrc7PISc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BXSwMUjTcUccd8vvw2ivAAG5xriRwaK/qe4Rj2M0UZ1C6569bt/XH7Q3g9Y2001+f
 tcufuHFq+4jljjE4QtNn1TBxjw38fJEL2WKyWRbBQST7GAzOMBpNQTpiO3DQf/0yCd
 ip1K5OO0OYG4wF5dXV8iRNlx/QI0yFCkfURd6MP57IPBDmCr7vAlu8MJqycTMQdHWs
 RyepcCxqm+PmHDaCQxiKUMq+dgT8qt5+DvGucm58r6kFhKLqFaBAw/sQP4ihxiXpUo
 R8CFHIWW0KwScUemPRcgwDUYjD+Ty9f9wPJ+f2mgucBqVqEaUJz6SrrYiLoHOcLvCL
 gyWkZXDW0mjaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BXSwMUjT
Subject: Re: [Buildroot] [PATCH] package/ply: bump version to 2.4
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

On 16/03/2025 19:57, Andreas Klinger wrote:
> Bump to new available version.
> 
> See: https://release-monitoring.org/project/143128
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
