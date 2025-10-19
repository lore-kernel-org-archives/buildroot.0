Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B209CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 14:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CDB741249;
	Sun, 19 Oct 2025 14:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOI-weian4uJ; Sun, 19 Oct 2025 14:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CD4D41280
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CD4D41280;
	Sun, 19 Oct 2025 14:50:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04C261CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 14:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF2B36111C
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 14:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fI0kL4LuVJr1 for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 14:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 109A161113
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 109A161113
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 109A161113
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 14:50:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9A58A19F5B2;
 Sun, 19 Oct 2025 16:50:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 16:50:12 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 16:50:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20251018192729.3113082-1-bernd@kuhls.net>
References: <20251018192729.3113082-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <12595ed4da18bdf3640ab23341e7480b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760885414;
 bh=s8L6RNerjKq/f3UcBcswNAFnjzEKMr85z01aAwdr6oQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TuroATMkHS0vJnyIvbNoqq7C5jkD/uXOnprBGFufshl/dMGPdKdergIEBmg/PaWLj
 lpmt38cSpsiPh37MM7qPgPThnjwFh/YeVjG1I4emQW7oxTHP6MhYdwRfwOzJu0jU8Z
 34Ea8Rd/qa7GGEWbWIHTuPdVlbXobhfJ9OA1Wrc5db3MwYeNLh5oxGj1JBpJCi1pjg
 mcmilZKxT22unAKKVpbdG2gGnO+hzuDt3YDBZUkdaoN1VDPVUHXGEB/FjNL74Sag5d
 mTPZySqr0ybw7Cd41Obk2qICuujFZi6yQKyw+Rx0ORJEwdASFPa18iMTaCBNsVD23t
 Qw+NWwf4OhQOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TuroATMk
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: add upstream patch to
 fix musl/uclibc build
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

On 18/10/2025 21:27, Bernd Kuhls wrote:
> Buildroot commit 532d5561f48b6c430e7414ba5eacccf9b6c1bd22 bumped
> iproute2 to version 6.17.0 which added lib/bridge.c:
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/lib/bridge.c?h=v6.17.0
> and causes build errors on musl & uclibc toolchains.
> 
> Added upstream patch to fix the problem.
> 
> Fixes:
> https://autobuild.buildroot.net/results/951/951e4198b2ba109fd9c746fe2e6316a29085aeeb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
