Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCF2FDEE45
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 19:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38F36836CE;
	Thu, 23 Apr 2026 19:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-CE1bQoH8uC; Thu, 23 Apr 2026 19:02:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B597B832FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776970923;
	bh=1yipUu/FEkLlvm6umhgs4kmUrVQJk+zv4+vaQflW83U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ru+Qx26XY4mYI9gyUuKqQ/rOAlBPEJ3gBZNBanBa9jQjO4/CFIJF1uLF3NIiOrxtI
	 YZYhpzAE0ZZ7x3Pddd0s0TbmoSNrP3mAglUC0gUqlABKvCVMn4rntNqQm/83mGFi+9
	 gsRGGRXYv5zoZ4LdwRznBw4Kd4JqN+ulIq51CNIeVWrOQ43ZouqA7D+Z6rhZDHb7ys
	 T1b9m7QbKPX+WzxNZm7qhHvvlG3bwvhfVkNZRUm5Gg6H/y16zEA4oC5Z7cISvUsy5Y
	 GeYbQf/QbmQsNrzihbdmTsPPT6WxuiDinbA4cY/Kr2q+vtpSsI2AlyBbgGo3gJwCr7
	 X5kJYZCmvaK5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B597B832FF;
	Thu, 23 Apr 2026 19:02:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A38C724D
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89693836A7
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIs8YZpVJ3hI for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 19:02:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36D8F835CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36D8F835CA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36D8F835CA
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:01:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7734619F5A5;
 Thu, 23 Apr 2026 21:01:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Apr 2026 21:01:56 +0200
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 21:01:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260423061424.47374-1-bernd@kuhls.net>
References: <20260423061424.47374-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <abc6b5787a9b117a18f1b14fe89041aa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776970917;
 bh=Qs0bC/Cc62uTvZV3RdAd7fpqyYcv73bgu2f+xn88bDg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hVDdqhtXV272jfVBguH6z5JgyhsLoFSuRAbPa3DU4YXXqeCtwYWLeafeffdnFnrOx
 oGTqGj06lVdnYqUgIPWUxgwLg4tPTpQqqVEHvq9baRT8Bj4fMFVS/fTr6Y+O0CnjRz
 /kUrsui/JrRpmbQqU93yGgckeN0LQIUt1osKhfdpHi/LLUxGuLRch9LpBjlwj305WN
 p05Hwg1rq+Z38TZgzNLS0zddK6gXCVlsk+j1+TMd2+JqK48su0vH//U8Ua3oQs1zuZ
 VtXlzQd69KvEavUujC5vC8iRDFm5qZJXTUpOBe2pJmBzMNZEUe63ZnMfcFaYlSY6/T
 Zs5Gaod/czynA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hVDdqhtX
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: security bump version
 to 2.7.2
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

On 23/04/2026 08:14, Bernd Kuhls wrote:
> https://github.com/OpenVPN/openvpn/blob/v2.7.2/Changes.rst
> 
> Fixes CVE-2026-40215 & CVE-2026-35058.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
