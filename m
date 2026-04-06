Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E24FF46C59
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 16:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B068409DE;
	Mon,  6 Apr 2026 16:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzmBocpOv1tt; Mon,  6 Apr 2026 16:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29481409C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775494106;
	bh=WV+oehLrAoqzwl2szrJ3eOn8ZkvyeQ97ytAwmQukqKo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XOuYc+4gRIcrnTnM6DO3ltPe5DrqE1FB9iDXGlwItPuF1qBk9NvkJN0IGQtZvZqWy
	 5A+pXWc/jY3OKU0eGMa/5C42wHNIuSd3CkxH47FTtKxtyADWGMeLqWRaHUQZcQZ3gs
	 +ymVyFgd56TsWH3EhK9bl7qRxiOikK9n7qbqmOHIPQYnaK1OckiBhY8tuIFdcafz/S
	 H2QiXp15jdsMU9ESp6+timPJFrwlN+KtkmqxOG8HpWJym4WMDU36NqegpCx8NfduTL
	 z7VmQr+baRFIPPJZXx6PHtdBwHguCQ0sOfN7y97jbIZL8oiFrXSvkTya2RQ0fnA08c
	 cwCfVnaz705sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29481409C1;
	Mon,  6 Apr 2026 16:48:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5251C2EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3817F409C2
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfWVwgS1IDBX for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 16:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B039409BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B039409BF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B039409BF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:48:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1C12213F8C0;
 Mon,  6 Apr 2026 18:48:21 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 18:48:21 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 18:48:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260405162711.620128-1-bernd@kuhls.net>
References: <20260405162711.620128-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <8d6603e7ee8c4dc0a0bfbeec7c5236b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775494102;
 bh=e3E1Z54CcHFbdZEv0VGAqyIIMRNgLvdT9ad+Jp5t3Nc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RewbWCBfqPKLgJK0kfDjHzHAmo7+aU0uJYPqEuUt5URntb6y1H/l5iYnUdLJqW6SM
 9ZiLXqC8O6nHaeim9HPb+KQ0Bus88310FOHrV0p4vxYI9/rFs1SNejp0zdK0mo3bTV
 xEHbhxmO/nd/aewckylrWurA4uQByU5hDBCIuMBcizdE1D2IxGZu6Gb2HCUUsQurjR
 U93qqU8aEZZY9iVXKIbvj04OduTyzhFpZyewW7c1+NdDPgeGv+fOw0oSjCMapjgt4z
 RgnDc7DMp/VNHyAnM4LYAVW+6FViWW5Wg1zNRBK74LsCAqOiO4EVhWKTXXbpiOrAsl
 JHopSNNpXTpnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RewbWCBf
Subject: Re: [Buildroot] [PATCH v2 1/2] package/leafnode2: fix build without
 pod2man
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

On 05/04/2026 18:27, Bernd Kuhls wrote:
> Fixes a build error when pod2man is missing on the host:
> 
>   pod2man ./tools/lsmac.pl >lsmac.1 || { rm -f lsmac.1 ; false ; }
>   /bin/sh: line 1: pod2man: command not found
> 
> Fixes:
> https://autobuild.buildroot.net/results/999/9996e81429f90f4615755827ac182094d416c467/
> 
> Although the build error only occurs since 2026-03-05 it should be
> backported to LTS branches because the last change to the buildroot
> package dates back to 2024.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
