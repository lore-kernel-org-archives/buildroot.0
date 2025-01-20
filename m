Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C33C02182
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 20:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB388169E;
	Mon, 20 Jan 2025 20:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2505-s2C10h; Mon, 20 Jan 2025 20:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E5BB82131
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5BB82131;
	Mon, 20 Jan 2025 20:20:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18FFD959
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 20:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC3CA4061E
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 20:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0r-ROvrXn0H for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 20:20:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20BCB40E07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20BCB40E07
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20BCB40E07
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 20:20:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8250660148;
 Mon, 20 Jan 2025 21:20:09 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38680])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Jan 2025 21:20:09 +0100
MIME-Version: 1.0
Date: Mon, 20 Jan 2025 21:20:09 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <cover.1737357470.git.yann.morin@orange.com>
References: <cover.1737357470.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8b0eb678c38a266c380afe35a1285d1c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737404410;
 bh=YnGXFbtAi0NGfP91ypvlSK7nawjUycyMyWDq7kQKkT4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f/51bfeszmWgqnj1Cfzi9YsRdPEXe0Zd/50fWXXPJVmXg8VqK/HURdLEmpff9a8qU
 NCu+UFXX8Xw5Rvg15k5w8FeZJ240TukSQtzZuZV4cXkiqO6Y6Q4mRp/c77duvEBHJx
 PSsSot3PHrHRXKvF4rBPWinLlqlnU6qYdpsu5dxSeNQU/+NXdJSBp6eLBRQ2J73QUJ
 wlnuSci5fCVQAtRNZkJqSa3VynpMddprWC20Vrvxdw07xJu0UPF/AgDTIaiNGqlxeC
 nQ8YXIkp/wKOFmFJu368izU+OXZ5Mo2rX6kJYPQZMRznv23xwjcFZaJiBDOAK+s2Eo
 nA8SzCzv3ljsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f/51bfes
Subject: Re: [Buildroot] [PATCH 0/2] support/tests: fix get-developers test
 when stdini for tests is not a tty
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 20/01/2025 08:17, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Hello All!
> 
> This small series aims at fixing the get-developers test when running 
> in
> an environment where stdin is not a tty, like in a CI pipeline (e.g.
> Gitlab-CI).
> 
> Then it extends the get-develpers test with an actual test for reading 
> a
> patch from stdin.

Thanks for this fast answer!  I applied this series to master.

> Regards,
> Yann E. MORIN.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
