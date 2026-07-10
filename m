Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB169C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A398A60A54;
	Fri, 10 Jul 2026 16:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iy7Wy1BKeYV6; Fri, 10 Jul 2026 16:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0407C606F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701897;
	bh=12Pu7ahrFasI/qb2tULTZh/8Xb9lP7SGm7FSoogt6sM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LYrsoBJMj4LXKhgTpmxduscsCBLS3FxP7wzeEIcyAroDB6S5Q06cV2Ba2Z0JW7n88
	 ajxquj9DWCNC27Y4hITnyMO2WbuYmegLR5D9XpfXArF7/OgzwQcN33nBKxkgvdB6Ap
	 aRR8dbipjeyDPEMEkSsQn5xWuqivgcog59XMztEKje6NsTG9k8dohlxb6ENNyGGIwE
	 rrqY6amQW7gtmkwXnrK8C6SSPMQKeTNnWQyY0ELpJsKtc/QyLnlIohvKQ/Iov/pb+l
	 pqGjXblsMtK+bd3Tsk/5D+wdD0hbJNXlqQ+O3R7jbEuFLwwXX1Lc7HM7pCxDe0Sw8+
	 zBPzCatWK4bTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0407C606F8;
	Fri, 10 Jul 2026 16:44:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EA42320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BE66606F8
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cErzXfROy1z3 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:44:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60DA9606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60DA9606B4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60DA9606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BC5A8B00539;
 Fri, 10 Jul 2026 18:44:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 18:44:50 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 18:44:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260710072003.160464-1-bernd@kuhls.net>
References: <20260710072003.160464-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <64f028e8dd168f961379d6074cb1bd8b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783701891;
 bh=e4JWNPcNoA3NUa0KuZzpTgTw547j+fLkmRl2YBIi1jE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FDVOIxRrL/q3i7mt6nBDXnvqCh5nSCztqn8y+wOiYKL39jj5t/l3qSAE1I72jhkaT
 GinieWqVaswYAZL9kAyuN2M3NbsZHZYXtzsInxrtXTgK4eW0P+y/sYXVNwLQnmSaxk
 v3elVnrIYQP5oyCTqFUnvdZsZsQ5BQsobQDLAhnNnWQIukmkCT0F7oPBwpXe4ePA3P
 EumQRAyTdQjWgPQHonS9qlWYBX1VRnRS++pd+Hoft1+KHynvN8IpOc30ysg2NmkVxb
 lLQbmZJQdQLt3lWpDQz1FHoYEGUEHvO/QbpNCR9vrBh7RRyTMVPJE/HaRO4vMNjgkS
 AMQQ8zU4l/24Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FDVOIxRr
Subject: Re: [Buildroot] [PATCH 1/5] package/libva: bump version to 2.24.1
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

On 10/07/2026 09:19, Bernd Kuhls wrote:
> https://github.com/intel/libva/blob/2.24.1/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
