Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D62C5DF67
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 15:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F4FE40887;
	Sat, 15 Aug 2026 15:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xHWO6MpqFrR; Sat, 15 Aug 2026 15:58:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ABEF40630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786809503;
	bh=25sHhLS5kQxIhvDajjcr76Y5EJCNuuPB19NSI4Ci99E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r0Gxh7x8mnHOlEV8E2ypu7oTv8DmxtriFfUSuExYE5yzJiJABRe4k5GyMFEjD4knw
	 R+I/XdOhlbA67l9N/bUDGSOUaZB0QDmJ+1BqdLbqfYyzi8irYQhQ8dllqu0L2tg8qI
	 5WRvoSeeL+VMXQN72i07K1VztwR8Mb+BWOz168DS1+yVk4WGy9T2K2nwtsHUs1ZRyj
	 X0wnLcfPLh8RldjDQqMT9vvD+r/2du3bNzSxUmq0jOpF7Srnxmvg55zJWQEYFi2tpZ
	 Cs6hztY5b5s6QShFga5kAisn75+phpnBF2ah5Lqv8coBEWcqoFjZpTI9/vIoEZW8h7
	 6JgPzXMYYSd3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ABEF40630;
	Sat, 15 Aug 2026 15:58:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78745109
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A3F140630
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdEa-JyHEtVn for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 15:58:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A316E40625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A316E40625
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A316E40625
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:58:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E94EAB0053D;
 Sat, 15 Aug 2026 17:58:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 17:58:17 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 17:58:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260812194946.3861716-1-bernd@kuhls.net>
References: <20260812194946.3861716-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <a677ba520e651cd9855992a7c8a7cf82@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/mpg123: bump version to 1.33.7
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

On 12/08/2026 21:49, Bernd Kuhls wrote:
> https://www.mpg123.org/cgi-bin/news.cgi
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
