Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239FAD1951B
	for <buildroot@archiver.kernel.org>; Mon, 26 Jan 2026 20:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8845660D9D;
	Mon, 26 Jan 2026 20:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uiC46vxNgMV; Mon, 26 Jan 2026 20:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 622F760DA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769460855;
	bh=m7Yt8X4YSTX5mr8+rrXIDBwkaEPm98BhHECg5r28qks=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kuqMnyz75lN2orB2dzmnPXHX3UqgkNQofn4rQD2LkkJ+KvuTMf/aWNovi52DRHCzf
	 mxxd+bEzJ5ak7tnwAdUzDPpiKCNdR4b+PNZdgA7PyBYzOH/RrMjNCXDC/62FU1AU6+
	 5qCid2E4fKSIcas1RCkemPGRFSigsdvMhTzucQj/FMr9AnYF6plPoWiAzZ5ZWsonnH
	 MOsV3RMPe3NbBb5tzbUKJXayu2QpYog+FGljhtXDtsrpWNjcwYluPMRNhSm/hoCnQi
	 FbPk4oO9mj5XGCIAOjwVdXNQgUfMS9SmweIYj9cG1bPBEX3qGCX1Xs9FLkRFpHH8WP
	 Q6w60UkHVf0MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 622F760DA4;
	Mon, 26 Jan 2026 20:54:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C0F2D2F4
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 20:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF5DD40337
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 20:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SNL4t4fnjFA for <buildroot@buildroot.org>;
 Mon, 26 Jan 2026 20:54:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D55E040316
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D55E040316
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D55E040316
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 20:54:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5A97119F5C2;
 Mon, 26 Jan 2026 21:54:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 26 Jan 2026 21:54:06 +0100
MIME-Version: 1.0
Date: Mon, 26 Jan 2026 21:54:06 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260126133848.91886-1-thomas.perale@mind.be>
References: <20260126133848.91886-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.12
Message-ID: <95312902e0358ea081c09be7be78616e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769460847;
 bh=wsrLD2BnJeNcsIUV1ksjMNqUda3q1x1fGwUtsixAfrc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mzcJjicSBdPlJAR15Vw/UlLZvEDNmAmwPK+4Iu2ld8XjFirdFy0pJVjLmlKHKbWhC
 EPtsS+wKPsbDqg68wnNDIAIOn1pO12djsIKmUh/GoIQwyTYYrMTF4vcAvDhheIjs/3
 WiqRX2uUsk7JMzwFmDJUNMT4Ws8z/CfrzzhYLhy861IsRvddvY6RtD2TWV0grdw3ED
 VoMj8J5kxViJqEMroWfAldEuYr5VOx2bVHlr4tZiWSbLEwxwlFX0ZySzenGCD4uuDC
 2QGXSNbm8HO4CzYZWhA0EmZ1vPCl0yddd3pmTdydEPIYa6KR/3JM5xpzIjfj0wV9Or
 JYNACarcjZYOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mzcJjicS
Subject: Re: [Buildroot] [2025.11.x PATCH]
 support/dependencies/check-host-cmake.mk: set host-cmake max version
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

Hi Thomas,

Thanks for the patch.

I agree with this change. I also suggest to add in the commit
log a bit more information to give examples of which distributions
switched to cmake 4, and also to to explicitly say this patch is
explicitly meant for LTS branches only, and to explain why we don't
want to apply such a patch on master. See my suggestions below.

On 26/01/2026 14:38, Thomas Perale via buildroot wrote:
> Since the introduction of CMake 4 in several distributions

(such as Alpine [1] and Arch [2] Linux)

> ,build errors
> started occurring on those distributions for cmake packages that
> included calls to cmake_minimum_required() or cmake_policy() with a
> version older than 3.50 (see [1]).
                      ~~~~
Should this be "3.5"?

> This patch enforce building host-cmake when the host system provides
> CMake 4 or newer.

I suggest to add here:
"""
Note: this patch is only meant for LTS maintenance branches in which
the host-cmake was kept to a version less than 4.x. This is to avoid
too many unnecessary package updates and patches. We also prefer not
to apply it on the main master branch to make sure Buildroot packages
will get updated or removed (if deprecated).
"""

> [1] 
> https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Best regards,

Julien.

[1] 
https://gitlab.alpinelinux.org/alpine/aports/-/commit/21fe3cb10d65862648a7a65cc258899bfcae9b11
[2] 
https://gitlab.archlinux.org/archlinux/packaging/packages/cmake/-/commit/b634e8ded6d2d887450586f14f404f72518b97b9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
