Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8D9E63F04
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 17:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34AA18234D;
	Sun, 15 Feb 2026 17:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvhMAkH1dI9K; Sun, 15 Feb 2026 17:12:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3760682340
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771175579;
	bh=i5fmz+tUyImCAUgfjxu72497QGlwsBy5xOfKrYYtzVU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UNEfEfq3qdxhMGEMPYpw7S3e2u+l/N4Q6nnNCWVF5AoUBWU3ivtNcyqUerVtWGh0y
	 fgjkW4L7Drm7cL+MRhCT/HCnDr4Uzoge56NYpB7IQma5zkaJUu0mkBwZkMpNnd0LPd
	 soSGNFM6AcNkdixmuowhdpODP5sW4+30Nd2YK5jnRr3WYyrRpHuLzIM6ErNUOTO15e
	 DI31uFDRVcEU2Ym6ZoDY0kbTyxi+6/AOqaGmNrY5iNhHSXhLtRlN78epS8dkETQkzw
	 ieGn7pzfK0DKgGKTgUUltGijQn7NyeNmqV3jWYok01XKdFSntn9oYHM5cZdiTwQleh
	 IXNrbgbMwdRVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3760682340;
	Sun, 15 Feb 2026 17:12:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B41D8270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A54D140591
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESbojVSDWEZj for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 17:12:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D2974005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D2974005C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D2974005C
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:12:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8F58219F5BE;
 Sun, 15 Feb 2026 18:12:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Feb 2026 18:12:51 +0100
MIME-Version: 1.0
Date: Sun, 15 Feb 2026 18:12:51 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260215144923.54095-1-thomas.perale@mind.be>
References: <20260215144923.54095-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <a3f022ad16e396cc7eaddfb5d58b10f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771175573;
 bh=Xo/Xe55wdLu6FgUjr9Qtk+slCg0hx0WGnkqcpCBOqGM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GXWEmUJFfje5kChghhvbAiGXbTYlLEgpOqQRBap1sUAFJsigSepI3F0nEDuTblRB7
 3kBvcqrA+0Kco8AUFQih8yQmYuA/7bYLLB4u2zs5dKnX2HCRII2ckoVkvXojnVGEvp
 A6muJtVV3XHsSUk7PgPUtb8Gxa8xS8ufni5kgfJJlIvQ3nqX1iXVMnU9x8AkD9FMJz
 yrcATITwUUYm0WedPRP+oRDs8qwzrFbJzD8gVzUUgW/TcU/ZciRfgE44iblOl2WbT/
 Vj0YA//uJ66dTF6wGbmb4B2vdPpZMKD/swEdXDl/hCMjvZeVwFO5NOOmtsScmszvOa
 Pq+V+wYc5ADNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GXWEmUJF
Subject: Re: [Buildroot] [PATCH 1/2] package/haproxy: ignore CVE-2023-45539
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

On 15/02/2026 15:49, Thomas Perale via buildroot wrote:
> The CVE-2023-45539 has incomplete informations (see [1]) and will be
> reported as exploitable by pkg-stats for haproxy v2.6.22.
> 
> The vulnerability has been fixed upstream since version 2.6.15 [2][3].
> 
> This commit mark this vulnerability as ignored.
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2023-45539
> [2] 
> https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=832b672eee54866c7a42a1d46078cc9ae0d544d9
> [3] https://security-tracker.debian.org/tracker/CVE-2023-45539
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
