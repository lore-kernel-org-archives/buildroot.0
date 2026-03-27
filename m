Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BEC10F2862
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 18:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 511D461083;
	Fri, 27 Mar 2026 18:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrTawXkzwlqj; Fri, 27 Mar 2026 18:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5317B61090
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774637880;
	bh=N8x7tCo7bfQK4aBQw2EksDLsemf+84NQmC2XtpODUjA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dhBdUHPFEqGPA0iZa7EHhrFZ09b8AsLpBfSNCYWk6xSZyt2KnwIRoDB4CuFZjHdjg
	 zCt2xzJgtCYttJ+rEcwSTZPS6Dl/Qls+WFkWAa0Fp+YrkCEJ0ZL5ZYWRBZvNmywsh/
	 /gknXzzmfflhSGibxsQUCZuCJGC40ZzdgzTdIo52klHeuaW7F3a2rF6a5COGDdHDuQ
	 gh+TR6PlO6+5S2VHyF9T0/adlULY7JXLre0B1oBy2lhvDI3PVjedgxkkDtYOnJ2aLE
	 3qa8nLhGYbq6dqj8xFCKM4wky0haJhpfzemm1S6dOiyoEfdIYDPyEgMthtMwcLop3S
	 Yi68BcQk8fQ3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5317B61090;
	Fri, 27 Mar 2026 18:58:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 936622AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79D5983E54
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UnyaMBsuTR6 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 18:57:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B681B83E4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B681B83E4F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B681B83E4F
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:57:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CC5C5B0055E;
 Fri, 27 Mar 2026 19:57:53 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 19:57:53 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 19:57:53 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260327175743.1982788-1-bernd@kuhls.net>
References: <20260327175743.1982788-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <4a2d04306a35e8a370fab8830b412847@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774637874;
 bh=4+cYxaLXaZkkEkbP196tKUuoqdRuivdq1TM5ki/mt3I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B05xm4XM8ZFwwIfwF05W9zf3HumBuRyY0pL+goNFK8dRjgKfDzZlfzOOWYAiHC71K
 9DsRuhrguT4i0Ek2Ba6Xkg32Jq/UvJ5Z7eIVS+7JWgBRT6IMHIJe8IS5Lu5urxlvq7
 G1txUXCYm/k74KqcJfJTRfpXjpttw3PVU9EueWKkkd6vcq7FjhfjwvFjJmYniIhpnw
 dLLwlqMIG9srXtqpT/W3OuLG/Fyd3dxDQu4QLG7cC/E6KwuY4VvZR1EWv/RJEmbCk9
 48XjNilEvzBsqG6iG71RW6PbnH11UpIiOIvHLAD+2rb9a/zR5f/dnIMSNLk95NbcTg
 ye+FVRrSKUccg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B05xm4XM
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: security bump to
 version 1.6.56
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

On 27/03/2026 18:57, Bernd Kuhls wrote:
> Fixes the following security vulnerabilities:
> 
> CVE-2026-33416 (high):
> Use-after-free via pointer aliasing in `png_set_tRNS` and 
> `png_set_PLTE`.
> 
> CVE-2026-33636 (high):
> Out-of-bounds read/write in the palette expansion on ARM Neon.
> 
> For more details, see the advisories:
> https://github.com/pnggroup/libpng/security/advisories/GHSA-m4pc-p4q3-4c7j
> https://github.com/pnggroup/libpng/security/advisories/GHSA-wjr5-c57x-95m2
> 
> Release notes:
> https://github.com/pnggroup/libpng/blob/v1.6.56/ANNOUNCE
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
