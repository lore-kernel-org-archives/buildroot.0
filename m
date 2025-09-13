Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5442CAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 10:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D73E843AB;
	Sat, 13 Sep 2025 10:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V173VoicL2rJ; Sat, 13 Sep 2025 10:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB5DD843A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB5DD843A8;
	Sat, 13 Sep 2025 10:31:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFAB825B
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 10:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B168A6179A
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 10:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gofEJnxc-0Yb for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 10:31:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A45861797
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A45861797
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A45861797
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 10:31:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CAE79B00585;
 Sat, 13 Sep 2025 12:31:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Sep 2025 12:31:09 +0200
MIME-Version: 1.0
Date: Sat, 13 Sep 2025 12:31:09 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Petr
 Vorel <petr.vorel@gmail.com>
In-Reply-To: <20250912212302.1057923-1-giulio.benetti@benettiengineering.com>
References: <20250912212302.1057923-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a76a993a002d416a1acc5326bef519b7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757759473;
 bh=aiWfBLPWBo6zKKsRy1nz2ipcb0UmRTxLaoY/jIKjsY0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gqA4wHFr/Ucd+FPHNUse1skypR+uD1MfNUmedSpWYmc6TNfdiqTWUMiDySep9V8jh
 wCVQZQMlHdr8tTjUCey/HqlKkJwjDkQCIXF7PvNmhXIA/y731RsewcnIZ0sA8GnDNy
 lbhJCnaFsFXbtavRDX81FQwshvIyFE0TwMr0KLCa9+Foo0vdEFB97+lrNq6rrijIEt
 X5k9tMDG7Vv/aqcCj3jfRwo8BN+NzBvYrt14gkYRm2m7SAecHIkHEZgWncpBZKYEoJ
 GxD+0KKu8AEgrJAmhS0QAo0sKXjNop4HpeRVftw6ISIdY+4cHGFJZRM0qj+hsmemxf
 A32CUFXftOg4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gqA4wHFr
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 11.5.0
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

On 12/09/2025 23:22, Giulio Benetti wrote:
> Release Notes:
> https://github.com/harfbuzz/harfbuzz/releases/tag/11.5.0
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
