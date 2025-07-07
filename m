Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C761CC71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 17:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84BCE4069B;
	Mon,  7 Jul 2025 17:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dya4IVmkfVtI; Mon,  7 Jul 2025 17:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B38C440659
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38C440659;
	Mon,  7 Jul 2025 17:49:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D7CF1BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E814C40598
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGfFs7L5sUzu for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 17:49:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 028024058C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 028024058C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 028024058C
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:49:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B53D719F743;
 Mon,  7 Jul 2025 19:49:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Jul 2025 19:49:52 +0200
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 19:49:52 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250707081050.1996244-1-titouan.christophe@mind.be>
References: <20250707081050.1996244-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <636be7b2d0c9d0ba4636a9bdfd86e8f6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751910593;
 bh=cyDDGYyyJaqiM9tcJEy+R4rDsjOsRcsLlgkOynFIzuA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q1I4nuo4M7m7JOaH/6GWKYSC8z5TB/imF/7/ff7W/BO/rni79UIDtL/3tZi08Vd7P
 rAVZGjmRPoG+lX7ym6g6WQEP91UCyzMzFvwHPH4IFa64FscSGNnxnkYxBKj/7J6qo7
 kO3YB/FfIV0rrz3nk5IHfSI+dZsfgSHiZ1zyE7xX3ZYfpcYwxzUPx+Gkl0ajUME9yd
 A1dPdYY6k2Rb3nlfDTvG/NMwJ2cZFYnBR1CqQCT6Ji3MnPbyifKYMrqueyxKFzUWhp
 nVFP4Uxu/0V/dACQ7+MVPxZKOm2K00w1s97SC8CVRRQcfrdXzoGZhWb4AJzg1DA1pm
 HjUc+1bq/ahzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=q1I4nuo4
Subject: Re: [Buildroot] [PATCH] package/redis: security bump to v8.0.3
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

On 07/07/2025 10:10, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerabilities:
> 
> - CVE-2025-32023:
>     An authenticated user may use a specially crafted string to trigger 
> a
>     stack/heap out of bounds write on hyperloglog operations, 
> potentially
>     leading to remote code execution.
>     
> https://github.com/redis/redis/security/advisories/GHSA-rp2m-q4j6-gr43
> 
> - CVE-2025-48367:
>     An unauthenticated connection can cause repeated IP protocol 
> errors,
>     leading to client starvation and, ultimately, a denial of service.
>     
> https://github.com/redis/redis/security/advisories/GHSA-4q32-c38c-pwgq
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
