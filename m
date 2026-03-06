Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22449FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9ECA613BE;
	Fri,  6 Mar 2026 19:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIHlqX0Ugxkf; Fri,  6 Mar 2026 19:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A00961397
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772824805;
	bh=r2jQEtt+LO3x4T54B5jcXZb+EHI4arpYqYQEmCXFDb8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HTe/TkZkJ/QnTlK9Z0ARMEzOVSIh0MZpafvGlwCHZ7FDqGKzzuBv4tPiJZON/WtGq
	 lV1XYFC0TSQjimTa0Hw86ml2ypr3mQumJc8FUxZDx7pyzijyeHfK82CYQLKYE3Ap8J
	 NebTBWttVhpKU6pELbnQJQN0G+D2DGwJ/r5NuUM++zGsn8/zD15qRCAGbmpgwiJmMr
	 1gicmmHGsGOdqcBm9MSWR93p783aYxndItBeNCjM9wIaNCcK6DE0PIw4Sg2EpkDEDN
	 i8OXJL35+/tRTkBrnnQHnQL8HA3Lzk8nP6O4CRxLySaGuuPs3VKXa/7ufnUMmV703U
	 f98SuQp0JnlSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A00961397;
	Fri,  6 Mar 2026 19:20:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB79525B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFE13404EB
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1f6OfAc3azxg for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C65D74138C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C65D74138C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C65D74138C
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:20:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 05F6E2003AE;
 Fri,  6 Mar 2026 20:19:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Mar 2026 20:19:57 +0100
MIME-Version: 1.0
Date: Fri, 06 Mar 2026 20:19:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20260304191607.3488559-1-bernd@kuhls.net>
References: <20260304191607.3488559-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <8fa36e6ed3431952661f09b88d3a7214@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772824800;
 bh=/DAya+aoOn2oM20dNqDZ0j0mK134EASgNZf8Uz/ydf0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AZJ+CcOZz1aaELcrNZU/4cRiJJBIA/cfE2f9wzUwsv2vJrB0ZP7DKxoPDfnb0EFWT
 qwf5zEllwa/hmdIOlRBMXKEfmPkteVQtwBYbldOMpt3zjo/K1bHH6EB60chjyJIqOu
 Nh1NbnpD+RlQckaZDOtSVrwT54LrnArO5ZdA574IPVsU7k4kXNS6q8lLjD+nDfZ4GA
 FQHThpZa7cXGbq0xJZ682h7FVa7/x1xTw685a848/SCFgp0lDMOKhBQevA5b83LJ41
 fjkCc0/k4s86Wvtl7Q0V4al7KhKhArksZR2W8H+Q6Bl7UKe+lwyHIji/8MicOv7keU
 GOCAKrPkhjeLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AZJ+CcOZ
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 18.3
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

On 04/03/2026 20:16, Bernd Kuhls wrote:
> https://www.postgresql.org/about/news/postgresql-183-179-1613-1517-and-1422-released-3246/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
