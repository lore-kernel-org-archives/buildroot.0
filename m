Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6BBF364B5
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 19:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B21C7410B7;
	Thu,  9 Apr 2026 19:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdau2DKkdLzr; Thu,  9 Apr 2026 19:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69FBB410AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775763880;
	bh=36L9rpPbVjmxX7C/r8uefOQfr91d6F6Yer2OGX+tJ8M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IVel3vv0VA3Ikt2r6t+sO8Ln/CUPZYTOsz+IoFXQgUVoCZyvSCco1Ky+qvs2zSDmX
	 J6+NnD2lvvcNs6/3kfRzb0rRKIcumVdzlyjuq2AeilWBPgvSR8igbqblp2BrhxcaqK
	 D8zarqi5ZSVuM/XAH9f32JpV+KXFa4z3FMJ45CuptOxmPbpX1qGLpC+tfbJ74K/fko
	 YV+kSarYJh4iKp44jGYYUgBYCHlBBWv6Y8TzMquQnTIcINd84Zrw2UzY4quC040MCh
	 E5gED8GcXYiVRhN5MXDARJjhPxUEyCzak9K3uEfkyep3GvRCYhQPxNOVtkyjtKygf0
	 LbdqaBAWkhKAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69FBB410AD;
	Thu,  9 Apr 2026 19:44:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB8CE194
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD3B260B2B
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9UNojoaNnjH for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 19:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E432D60B29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E432D60B29
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E432D60B29
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:44:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9836CB00571;
 Thu,  9 Apr 2026 21:44:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 09 Apr 2026 21:44:32 +0200
MIME-Version: 1.0
Date: Thu, 09 Apr 2026 21:44:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260409131728.278764-1-bernd@kuhls.net>
References: <20260409131728.278764-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <9dcfc6689673f88ff53fa6ad09ecff91@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775763875;
 bh=0XG6vSZcYQzDd8DVeQnsGniPjO8nbJ2bBzCK1Nc0ELY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ow6wF6SFwaeo6SVOUBpy5hgtJ7O5D2kvQ3LBwO/EVIq2lKNHNY2osX7bNwu5AbzDf
 imInKe+fdPf0l9mTmHhiVKtWb27s+tFwMwVNjZbF0PoYX7xIMnTTu/u7avPcmfN10T
 ELEmBDUFIeVuZuay1yfH/68g3k03AV3oW+6c+25xtOzr4i64PIGkUEWOVb73bGQDUw
 gTjbBKY612qMDBLauOP80ALMKmmrDgDms+OitBAyqTDxaUZYoTLzRNi1K+odkjwvK4
 GmSvXHgp17y9KDvb1XXD1xTnhf9ATNV+pgWBK/okEG0m87ogNqhlmoXJ3BFK9gZGsL
 55rScCmlMYegw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ow6wF6SF
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.4
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

On 09/04/2026 15:17, Bernd Kuhls wrote:
> https://www.python.org/downloads/release/python-3144/
> https://docs.python.org/release/3.14.4/whatsnew/changelog.html
> 
> Fixes
> CVE 2026-4224: https://www.cve.org/CVERecord?id=CVE-2026-4224
> CVE 2026-3644: https://www.cve.org/CVERecord?id=CVE-2026-3644
> CVE 2026-2297: https://www.cve.org/CVERecord?id=CVE-2026-2297
> 
> Rebased patch 0010 due to upstream commit
> https://github.com/python/cpython/commit/616e6118442832544fab0b93e9dd7d15411a2a58
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
