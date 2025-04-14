Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F208C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 19:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E38360C00;
	Mon, 14 Apr 2025 19:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AdG8aOdPY6e; Mon, 14 Apr 2025 19:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 444EA60835
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 444EA60835;
	Mon, 14 Apr 2025 19:33:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89D6F200
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 700E640659
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seT5OqUguTno for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 19:32:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EAC840755
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EAC840755
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EAC840755
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:32:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 905155FFAA;
 Mon, 14 Apr 2025 21:32:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Apr 2025 21:32:53 +0200
MIME-Version: 1.0
Date: Mon, 14 Apr 2025 21:32:53 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250413162533.1737077-1-thomas.petazzoni@bootlin.com>
References: <20250413162533.1737077-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <cfda6727154abf9c7cb09d78b73856a0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744659175;
 bh=FtqMoit0m4wtWXv8yrW4mTSmZHoNLXIqHriMZNjxRaI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CwVfXzeNxfoK4IxTlkEQ60q9HcgD6JWx+DQiBQd/p4F8CbVQOZ0/Q4fPttMEw+KDt
 h3TaMSo6K+bTfETvMYlXKbFOsn0Yw+SjQbsn3GAdEQdFjoCZZyeGqKIz30pSKacw3Z
 aKNZvhoCwOrS0gYP02iBTlNf8maMpGEaJv113AUU2jd0GNPiGH54roOCV+7vg8mVH2
 ZR3jBM2E+70WghXqxubhoAwpu4B0Lg1BBkUypOzM991iDIUWMx1Pd2XeLwvY3GEZuq
 6lDRS5wp3bEH2k5RWFEvuKd0lxk1JBirvu08l8bFq1loemfAb8QVJR/4JPLPrBss8o
 yuPZofmrvYp1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CwVfXzeN
Subject: Re: [Buildroot] [PATCH] package/sqlite: revert upstream change
 causing build issue
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

On 13/04/2025 18:25, Thomas Petazzoni via buildroot wrote:
> Upstream did a change in sqlite3.pc.in that does work with their
> default build system, but not with the autoconf-based amalgamation
> that we use. This issue has been reported and fixed upstream, but the
> fix is not yet in any new release.
> 
> For the time being, we just revert the upstream change. We don't do a
> direct revert ("git revert") as multiple upstream commits touched this
> very line, so we simply revert to what it was prior to the different
> changes, and to what the upstream fix ends up doing.
> 
> This issue is causing build issue for all packages that use sqlite's
> pkg-config file, in a static-linking configuration.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/1824a76eee4a877a2f19c1fd19a710ef9f059168/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
