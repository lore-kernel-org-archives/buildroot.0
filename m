Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D258D116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 17:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CB118434E;
	Fri, 28 Nov 2025 17:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDp3B3t_R7pq; Fri, 28 Nov 2025 17:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49BF284345
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49BF284345;
	Fri, 28 Nov 2025 17:36:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99281708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82EF1400E2
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVXdA0aiMg0g for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 17:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42B0B40092
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42B0B40092
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42B0B40092
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:36:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 21D3D2003ED;
 Fri, 28 Nov 2025 18:36:26 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 18:36:26 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 18:36:26 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251127204036.3135656-1-bernd@kuhls.net>
References: <20251127204036.3135656-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <ddb95af62e77f0fa70e7fbd123cf3c55@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764351387;
 bh=MJXGKmGaAOajkxLYgc7akUOeV5r86G7ICaDGT88Gd60=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mh0oCNkUMbGLbjZRy/lWT33OAjNZXl8iG4JTh/E0CshUkYCVmnQE9xeWNQzliDzBC
 mwSHViR48ZC80iZmoQU5YAsNBLzh4/meW7rJPiOjU12AamOXl0d90KRLWsbPzlH++L
 gDaMwrLHrnBU0HrJWiYBF4JkEDl/5QtzBdQngHnDDQ4JJC2AUBacjK42jJOJs+lz0F
 V4uEmDyGqaekvARgnCe+TvhKZoylRykdRS0mCgWWhMcGKQaMSVbBE0l3k8NFLMucXR
 4oBo6bjIHYjaA2NZWWBeZibysxdmc8ZF7+3gyrE2UUPO5UmyMGzjqelHtuX/jh5JYK
 l2ZqVQpDQvqLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mh0oCNkU
Subject: Re: [Buildroot] [PATCH 1/1] package/swipl: bump version to 9.2.9
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

On 27/11/2025 21:40, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/158/1586997a84236b678249ac45b83b4e330e727f39/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
