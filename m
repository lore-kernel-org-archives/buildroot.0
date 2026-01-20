Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A459CD262A1
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 20:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89CE660AC4;
	Tue, 20 Jan 2026 20:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XKNNuQFtm15; Tue, 20 Jan 2026 20:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB1AE60ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768941497;
	bh=uidYey1NinBfHatkkvJUr4KX8eyVyYSIIa+HYAWz/qA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K/oR/FNs+4Jo2qXsi87Rrs4ba4FAAYYmv8Fdpu22dvn4zBc75i2iZZSt5pdlbz1Wl
	 EkWZfOPOvRTPsuQVj7cBYPjMUVdm8Q6qsPaQ3pyPSvRXDoSxLm7qSdKen0ArwyKwQ8
	 VG6VLqMjVGeWJSrXyUMCL/mx9y7Ks7Eke7zk4/3y0XzTY7y6ETKaqDOsalfJ10CFWY
	 HVfq9KOagA6zhkyn+brC2WDh9EdjxKwJ3tvB7bvAw+s2bgUdYWrQWTPRTCb4vI4Awq
	 UCgC8quAuCPvleXtM6ifF2tVil2e/DUiQD57mC47xPZix7M3qAPPccrxVJF5ZFIzSB
	 IR9SA1TzA8ozA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB1AE60ABA;
	Tue, 20 Jan 2026 20:38:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D8C6160
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C95540BA2
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWIoNNgNxWLx for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 20:38:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E28F40BA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E28F40BA1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E28F40BA1
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:38:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0B34F5FFAA;
 Tue, 20 Jan 2026 21:38:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 Jan 2026 21:38:11 +0100
MIME-Version: 1.0
Date: Tue, 20 Jan 2026 21:38:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260119213157.3681054-1-bernd@kuhls.net>
References: <20260119213157.3681054-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <26b66788c1d5bf689a58660ed920f2a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768941493;
 bh=qe64gZG84GE6gIBX+pEa2Ns+hMPMFofuEif48sDobSw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dniBrHKJl9h0pCMjkx0hbJFfa34F8+MpSJdO4960MOcZeq7CFP2Ip2onBy9aNa467
 0kLdBmMQBUSTAuLBOtiLLeBnauvj1d3S0gnPGSdg/ay3wZTys0OvelL2D8bsQP1YUP
 SZ1MLQLZx/bUSoSGh5LRROuB8VnyfpSXLTZ5UVVeYwLFJZyuwIbgDmc5nGl6gQcxyd
 j2EPf8weadBAD1xRAan/wJN5eGtP5oAlanGnTJ82/YWOr9dfILddY4SEJcamoQCz8G
 6hnYlKvXp6WHYf94tvlJ/jivCoYY6Ij5f6v3NuGkvH/cENkPW1P6Ij9ohY4RhuL7Hc
 9OjbRjmhBZj4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dniBrHKJ
Subject: Re: [Buildroot] [PATCH v2 1/2] package/php-zmq: remove package
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

On 19/01/2026 22:31, Bernd Kuhls wrote:
> Building php-zmq is broken with php 8.5.
> 
> Although some pull requests exist upstream to fix php 8.5 support:
> https://github.com/zeromq/php-zmq/pulls
> 
> they do not fix other bugs like broken build with gcc 15.x which was 
> the
> cause for the its removal by Debian:
> https://tracker.debian.org/news/1668817/php-zmq-removed-from-testing/
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1097580
> 
> According to various sources the package is unmaintained:
> https://pecl.php.net/package/zmq
> https://lists.zeromq.org/pipermail/zeromq-dev/2019-August/033109.html
> https://github.com/zeromq/php-zmq/pull/240#issuecomment-3684566367
> 
> so we drop the package from buildroot.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
