Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC5FCA0EED
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 16:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A3483D71;
	Sat, 23 Aug 2025 16:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrrVg9R0VaUD; Sat, 23 Aug 2025 16:47:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BF9183D55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BF9183D55;
	Sat, 23 Aug 2025 16:47:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8885571E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 16:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DB5783D5D
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 16:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XONQp-A3VHiG for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 16:47:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99E138112D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99E138112D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99E138112D
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 16:47:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 95C6619F5C2;
 Sat, 23 Aug 2025 18:47:35 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 Aug 2025 18:47:35 +0200
MIME-Version: 1.0
Date: Sat, 23 Aug 2025 18:47:35 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250822221959.4092428-1-thomas.petazzoni@bootlin.com>
References: <20250822221959.4092428-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <408785260b4697c812769600f094350a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755967656;
 bh=co540a97erhEDCmbFxcwqpUlkKL3q10GooFdcuEXtnA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nNRmDsAHsiB3+zj/vA25LawrpzTSR/v4DtqS4FddTj+0GaqnDQDP9M7MFPWj3P69m
 Era7pcEK6MzAQ/+ekEvwFhzdllE6LzzlQjQhSZEpRUctQTPBYM2BXsfT0F9sMUd+Fz
 4i/FLKxc8Bl9LTBvCwLgmjS2xYXarnM3TYEscqNmTD1LiEHCFkkQdjb7hzdKPgLCKG
 g3/lIy8JtkGXuXyNn2VBB4DSfg3pYvDUGA+zHUaYv8Wp5Ij4hP7EmRFj2fqXFfXYQm
 VxaYDK9GtgiUtHsgACcDmi4RmQh9za5WeD4fK+/Z8E5emYybUg8+Rw5HJ71IXuVqvF
 GRQdzsfOjiCYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nNRmDsAH
Subject: Re: [Buildroot] [PATCH] package/p11-kit: fix build with GCC 15.x
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

On 23/08/2025 00:19, Thomas Petazzoni via buildroot wrote:
> The AC_HEADER_STDBOOL macro used in configure.ac is expanded in the
> shipped ./configure by a fairly old version, which misdetects our
> <stdbool.h> as being not usable. Consequently, the code defines its
> own bool type, with true/false, clashing with GCC 15.x.
> 
> Doing a pass of autoreconf addresses the problem.
> 
> The autoreconf needs pkg.m4, which comes from host-pkgconf, added as a
> dependency.
> 
> Note that host-pkgconf was already a dependency for one of the
> optional dependencies of p11-kit, and we're keeping it there even
> though host-pkgconf is now also an unconditional dependency as we
> expect this unconditional host-pkgconf dependency to be removed when
> we drop autoreconf.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/760df1a8c21afa893ade5181ce797e14c1f6bdce/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
