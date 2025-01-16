Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12413C02183
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 22:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAFBC605F1;
	Thu, 16 Jan 2025 22:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nnx7zMEwXmtz; Thu, 16 Jan 2025 22:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4D5860705
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D5860705;
	Thu, 16 Jan 2025 22:07:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D022794B
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1D0D415C2
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id po1osYwRy1Bz for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 22:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C25541361
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C25541361
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C25541361
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:07:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2F0AB19F59C;
 Thu, 16 Jan 2025 23:07:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:39564])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Jan 2025 23:07:32 +0100
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 23:07:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250116070420.369915-1-peter@korsgaard.com>
References: <20250116070420.369915-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3f0e048e4ea8520447aae30d8990d0bf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737065254;
 bh=DuY/bSWgSzLIy78jhRGgLW41cHOxYmgXQ+WcbzAZ+84=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YG0ZXn2Xhe6WCGv+fqSuAcGnccIU955J+73xqgzD9i2OMztmHgB39R/wlGGRDUuRi
 2QHRJfNpNfokB+WrgLNX4/76FcYVJtXW6HFaokyXqTvzNS+goj0MEIH3a2HculU9NX
 3M2hhBxdI2XvdaEyXBRYaYYVqtrvEmsZgSncK7sovUYMJNBNxPv7ioL/Ffc2TrKyG5
 tOi+zffNjW4HWiNveHc/RHVwd3bEO48mdyuZUt5c9KrWftHt10JU6TPk5HX65WaEDb
 S0yWguaZjC8Xr6O/aOz1JXyakape+HUBC6XBiZvu6GGQxHY++wocn57RNNSyPYRayv
 hlDdkwQN6qC2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YG0ZXn2X
Subject: Re: [Buildroot] [PATCH] package/rsync: bump version to 3.4.1
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

On 16/01/2025 08:04, Peter Korsgaard wrote:
> Bugfix release fixing regressions in 3.4.0:
> 
> - fixed handling of -H flag with conflict in internal flag values
> - fixed a use after free in logging of failed rename
> - fixed build on systems without openat()
> - removed dependency on alloca() in bundled popt
> 
> For more details, see:
> https://download.samba.org/pub/rsync/NEWS#3.4.1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
