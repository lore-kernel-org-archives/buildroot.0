Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04282C3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 09:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C664E60EF5;
	Sun, 13 Apr 2025 09:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7beziwwE3j1; Sun, 13 Apr 2025 09:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1844B60EDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1844B60EDD;
	Sun, 13 Apr 2025 09:45:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9055DE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9E9380DE2
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WfXUYBoJp0D for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 09:45:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B13A80966
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B13A80966
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B13A80966
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:45:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 63ACEB0056A;
 Sun, 13 Apr 2025 11:45:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Apr 2025 11:45:47 +0200
MIME-Version: 1.0
Date: Sun, 13 Apr 2025 11:45:47 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250328180427.3434693-6-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-6-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <49e238094d0570f3f0244b2e67ae39cb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744537553;
 bh=7MbAz31sFcRcVipbXjjZgQX7buwHQVgVySLJEA2YxY4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I9Rd8gfNLzMchiAzWbHoKn/aTfS8jxnVRJ1l8sm2m8K3rqH4APrMdMo3X1534PPyb
 y0HXOk0rxoMQhZHbWto5xib0dr9xFcINC7PQQZP4PP9C8IIp+o3qurRm7SZXecKiwD
 ARaiiFIflbzXC4nsXd6tlCAr7DZYpD4IZJ41464o8okFT2lxJb312xAIdy6pfGyNjf
 PUrJkh3DrL7nlJEis+VYKmwr/FuL2NCauN2KIev5sAqgCnkngf5C2ME2BmLzUAtVUd
 gLC7gvBfzJYLri8JhyQHOmzzAibjJEvRfWMRHMA5K3O6Ms72lie4gZ5h7RzWx8kHhz
 MgOroIuBTZSuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I9Rd8gfN
Subject: Re: [Buildroot] [PATCH v2 05/18] configs/ls1028ardb: update to
 lf-6.12.3-1.0.0 tag
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

On 28/03/2025 19:04, Vladimir Oltean wrote:
> Update the kernel, U-Boot, ATF tags, as well as documentation, used by
> the LS1028A-RDB to the latest Linux Factory release.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
