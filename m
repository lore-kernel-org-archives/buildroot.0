Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEA1C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 12:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E05160B6E;
	Wed,  1 May 2024 12:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpCHUCZaONKB; Wed,  1 May 2024 12:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89AC160B9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89AC160B9E;
	Wed,  1 May 2024 12:11:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3FFD1BF842
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 12:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E5B660B9E
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 12:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPCbq_zgopyo for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 12:11:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 993E560B6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 993E560B6E
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 993E560B6E
 for <buildroot@buildroot.org>; Wed,  1 May 2024 12:11:29 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A03883521169; Wed,  1 May 2024 14:11:27 +0200 (CEST)
Date: Wed, 1 May 2024 14:11:27 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <ZjIxbxoSB21tkquV@waldemar-brodkorb.de>
References: <20240501092328.323236-1-dm.chestnykh@gmail.com>
 <20240501092328.323236-2-dm.chestnykh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501092328.323236-2-dm.chestnykh@gmail.com>
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1714565487; bh=+tFidPRcK+70ENFxUZDT95Sj1de51NQgjUewsMGJkXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HIF5cTS8K/Z16Y1UlxP/bInOgh188c5DHQOOR6A8w12/Y2ZSTfNnKC+7AoN1d/qIg
 inriyNkA0L5qKAFC4euodtzOhU95UnAkjp7EG/43IXh9lgwIDOLymPnhpcxfGwQESP
 tUJbb30E1Lb3SFY+FjRxhaGyrgGEvMYRKycxzWvzGDs+u4+5hVLlpIwv0ZYozdMdhY
 j/ejFAxqaibJ48IwmWjiL5SxHx+grw0qOQOGaau7WlsR1HoR6hhY14ofOijGoS1/kC
 A/yjhdooPDQMX4P5IWwvyOXkfzoymnKclIBOjmM6bvX4dST6dVTUWm/a1u7VbXy3mD
 JTTbN3CYu/IOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=HIF5cTS8
Subject: Re: [Buildroot] [PATCH 2/3] configs/qemu_sparc_ss10_defconfig:
 Restore.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dmitry,
Dmitry Chestnykh wrote,

> With uClibc-ng-1.0.48 we can restore this config
> because now sparc systems work without reverting GCC commits.
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>

Tested-by: Waldemar Brodkorb <wbx@openadk.org>

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
