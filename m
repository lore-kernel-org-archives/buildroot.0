Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3648CCD1AB
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 19:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F2098223F;
	Tue, 21 Oct 2025 19:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hbSPP9mVkc3; Tue, 21 Oct 2025 19:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B719D80E44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B719D80E44;
	Tue, 21 Oct 2025 19:40:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 810B1277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 730F740249
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1iRmtJ4Ia6v for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 19:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C69940225
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C69940225
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C69940225
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:40:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A7DA178034D;
 Tue, 21 Oct 2025 21:40:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Oct 2025 21:40:09 +0200
MIME-Version: 1.0
Date: Tue, 21 Oct 2025 21:40:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251021172655.3584823-1-bernd@kuhls.net>
References: <20251021172655.3584823-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <6ff719b5328eef86801da4cf99cbcf03@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761075610;
 bh=EGLdprcBd3v1J8TrmvqmmLQx0an2Xq506eN74Zs/j9Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=msbfmQ6pt3kLhlI9FuzDttPicv4g+Cil0olmS2HEYPPXqf5W692sAUYklDwyXW/+x
 sSdJmWnLAb/wof7JKDj8cH1VjLgyYgIJRS8uBsa7ZgXUtlGAUiOspP8UueeU7KzKiF
 N/YiGOpbKJlZcyTflAsvaElaQaW5r9iTYyGOJE+2R8l1JJtMtgsUoXkbniFZfezrEm
 2AEO8vcyXryVBttRW9h7YLiVjIGnOgL/IJoyvD+4auOsHuUNJrPhvVCmgBAqWiJOle
 4H3/esqKpGGIa6tW1678ORF2DjaAljHRZ63lNyEYTZdQrABRMSS08HHYwIgBKqBrdO
 Zj7vQ7IV43meA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=msbfmQ6p
Subject: Re: [Buildroot] [PATCH 1/1] package/dovecot: Fix build with icu 76.1
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

On 21/10/2025 19:26, Bernd Kuhls wrote:
> Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 bumped icu
> from version 73-2 to 77-1 causing a build error during linking.
> 
> Upstream is not expected to backport this patch to 2.3.x:
> https://dovecot.org/mailman3/archives/list/dovecot@dovecot.org/thread/VT7D6XWB5ZRL7KIER445D3JR464CALPU/
> 
> Fixes:
> https://autobuild.buildroot.org/results/94fc2de03b5d6afd32c457be7faf0ac06cc37212/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
