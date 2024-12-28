Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39893E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 10:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD3C40554;
	Sat, 28 Dec 2024 10:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mnw8QVGuMOjA; Sat, 28 Dec 2024 10:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BA4740555
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BA4740555;
	Sat, 28 Dec 2024 10:20:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB342E0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2EA240554
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSj1f5l7CPQW for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 10:20:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A73B440550
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A73B440550
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A73B440550
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:20:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 05AAD5FFB7;
 Sat, 28 Dec 2024 11:20:46 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60082])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Dec 2024 11:20:46 +0100
MIME-Version: 1.0
Date: Sat, 28 Dec 2024 11:20:46 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241228092841.3045045-1-thomas.petazzoni@bootlin.com>
References: <20241228092841.3045045-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <61c33a6eeba322638558c6db2d7e9b81@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735381248;
 bh=N507hFkU7VfaSinbwFRK/G4YY8lWXlQE9c30jlWvjSg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lkbXN9yK5mpNK8/cXZZ5HAzsEfUp9x8k/6NhdE52omgJoc2pCT8NtkHZMWG9ObK0c
 lvj9EZaT4qZ77SJd6XvYoyy+nAD4XbIMyIeEHMr2/TWGjHPXi5D1Bt4ISV0n3ylKKO
 JX5GTpKZV3C7dXv9bvUmDjdyI8wU4ilRDQm45oVY9QQJ/B0GKoOo8FmUIrInIs/E8i
 RKEZPQQUMcBIb95R2ljrIKBdBnDG4ty75l78V5cQgTN6RY47/uzjf4nA1/38uJzN/S
 /yZ3uqpL7A+514oHNUuCN5ReKvsMf+AqpHwUsQmx5zfnuq1QAMXNKxz+MAO1RRDdAq
 Tfkc+8h/lQe4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lkbXN9yK
Subject: Re: [Buildroot] [PATCH] package/scons: bump to 4.8.1
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

On 28/12/2024 10:28, Thomas Petazzoni via buildroot wrote:
> The tarball was renamed from SCons-<version>.tar.gz to
> scons-<version>.tar.gz.
> 
> Changes 4.7.0 -> 4.8.0:
>   https://scons.org/scons-480-is-available.html
> 
> Changes 4.8.0 -> 4.8.1:
>   https://scons.org/scons-481-is-available.html
> 
> This change has been tested by building the two Buildroot packages
> that use host-scons: benejson and gpsd.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
