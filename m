Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A17FCA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 18:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 058D984347;
	Sun, 24 Aug 2025 18:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yp83P_cJbIbn; Sun, 24 Aug 2025 18:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B450845C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B450845C1;
	Sun, 24 Aug 2025 18:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2530975B
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 18:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 159D1845E8
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 18:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHNcWUijUAF7 for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 18:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 138AB84013
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 138AB84013
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 138AB84013
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 18:56:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7562719F57B;
 Sun, 24 Aug 2025 20:56:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 Aug 2025 20:56:13 +0200
MIME-Version: 1.0
Date: Sun, 24 Aug 2025 20:56:13 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250824171822.4123094-1-romain.naour@smile.fr>
References: <20250824171822.4123094-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <51a6eedd0d4761b10c3cf0ee725e7af3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756061774;
 bh=0BU1E04xq+gM0imisaISAhntsULQ2KqC77lZXaFtyYE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mt/7W0auKRH/Q8gNA0oyOreQz0TOoxk1ib9amAExoOM5kDNzgKC0AV8Yq6ahb3Pr0
 pJLDQyX1dtTTQ4SiY70f1L9SI2gFtC+QUEHxSCLopzA5quPf9Nh+iQJZuoX3PRWNNU
 JlMzuPWT8358UYAuGyp9HFIU0kEyv8Y3WM5oc+fJEip7GOnXppzxb6bALKjqq3s7QV
 Ago5iBc4+Cqn/4SH0EEkfbTPlx1TG2huvVk5RYfB2t1bHXiUgVmtlewyEqXRqWzLPf
 Z+cEK4HytF83A+rThrm3C+sXP27A5g8Hguo+lplxvaU0qlS/+PjizjB1qk781buViR
 3ArBUWFBwuzMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mt/7W0au
Subject: Re: [Buildroot] [PATCH 1/2] package/xvisor: Use '-std=gnu11' to fix
 build with GCC 15
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

On 24/08/2025 19:18, Romain Naour via buildroot wrote:
> Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
> the TestXvisor fails when building xvisor with gcc 15.1.0.
> 
> GCC 15 changed the default C standard version to C23 [2], resulting in
> errors from the xvisor definitions of bool from 
> core/include/vmm_types.h,
> which is a reserved keyword under C23.
> 
> Since CFLAGS are hardcoded in the main Makefile, add '-std=gnu11' to
> 'cflags' to resolve the error.
> 
> [1] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
> [2] https://gcc.gnu.org/gcc-15/porting_to.html
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295047
> 
> Cc: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
