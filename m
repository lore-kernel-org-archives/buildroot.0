Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE12C531F9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 09:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFE8960AFB;
	Sat, 25 Jul 2026 09:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tln2UE7luLK; Sat, 25 Jul 2026 09:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1755560689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784972758;
	bh=0noQ1ktPvrOYrwc7r8VCsnR1hvLqApBBDhAu1ImXxjU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NtrkRkreoXGQHf5/ffFjfsLraetXUL8EQC5W2wPzsy+gb4imRdTb9mcDAujQM/Uul
	 eSUXaoIw9cARdIQEm4IYfj0D3grYJ/cuXYSlUBNRd7J+dLHI1FalgIer0gcT5aV2Yu
	 EzQmf/vlBX905YuwWFEEykSkg6f14xOi3GwE9zh6ueP+4rSj7dNIgUtXwwiS7Js27e
	 kKoYeYBatb5Q7ZKi2HSMDxHNtJD6WOiA5/LYmVqZ7JDMpAljqMzFgOD13vC0541lpK
	 7L33Jzfyd7dnDLYqLa8CU5r3J3mpKFZEQuvXe7fqbZK7fDv+Ddqf435LtmrDaaIjLd
	 zJnI2PAw4LRFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1755560689;
	Sat, 25 Jul 2026 09:45:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96E1A977
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CF22810C8
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmHt0w2QOap3 for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 09:45:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7046F810A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7046F810A8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7046F810A8
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:45:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1E81760139;
 Sat, 25 Jul 2026 11:45:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jul 2026 11:45:52 +0200
MIME-Version: 1.0
Date: Sat, 25 Jul 2026 11:45:52 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260724172400.319609-1-bernd@kuhls.net>
References: <20260724172400.319609-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <9d1dc1de5eb0f01213af04ee143f64ff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784972753;
 bh=J4BQ6EQwtSOgyuICguz++ncaR8ATKHuanl3t/H2VQ2g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rt1BwxVBKTZDalW7BxvjyKBGuWBsm8CorMXNXFr+nqswqJA7h+oO8s3D1iBNCQRCM
 SIYBLo3NM8VU9VIfusK2Jcz2/7veivyD+wU/cdZqMHaPkFVZ6hz6usvv+FTo601/yQ
 W5YrSKpq776yr9ArpfDyCUJZ5p3zhS60eEup0U+ofFtmWUeJ6rpZOUr6bImHsLnB5c
 K8OuZanJ5Y0JHdep4bKjVkpkc7rRQ5wDr+EJY/vV/CNMAmUscZSsxW9wkwYJgo1YXa
 q9CHHHaPDBNPtik0gGEpAJwyph7xzOctZ5LSylZr8XMXVKbdY0hPhK+Xv0A+yRPBgV
 LZVmN8rpp6NwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Rt1BwxVB
Subject: Re: [Buildroot] [PATCH 1/1] package/libass: security bump version
 to 0.17.5
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

On 24/07/2026 19:24, Bernd Kuhls wrote:
> https://github.com/libass/libass/releases/tag/0.17.5
> 
> Fixes CVE-2026-61626 & CVE-2026-61627.
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
