Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C3CC10F1A
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 12:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DB9060B9E;
	Wed,  1 May 2024 12:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjUHIwoxlGlu; Wed,  1 May 2024 12:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16EB860BA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16EB860BA3;
	Wed,  1 May 2024 12:12:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25C801BF842
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 12:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F9754022E
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 12:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqec0iW4KxsO for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 12:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68D4440125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D4440125
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68D4440125
 for <buildroot@buildroot.org>; Wed,  1 May 2024 12:12:30 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A01C63521169; Wed,  1 May 2024 14:12:28 +0200 (CEST)
Date: Wed, 1 May 2024 14:12:28 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <ZjIxrMbUFn43bnFU@waldemar-brodkorb.de>
References: <20240501092328.323236-1-dm.chestnykh@gmail.com>
 <20240501092328.323236-3-dm.chestnykh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501092328.323236-3-dm.chestnykh@gmail.com>
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1714565548; bh=+bA+A/PZb9fs90g6EFaOByU0RcuaALrruVteJce9cZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HBRP5PmfIzjMtbeeYnrLi2xj14acksys/XKIB9QS2xrAKncDkf5SiZd2OEdLMNXrA
 V0GkdnlCpqsX6xl35EzImyEuPGCykV3Kt+ZgZhRBy5REHSqUIgJXbpsb/L2WsaQJP3
 b7husFcL5dKYJxN18IrIFnGkIDReBwJ2RcpIKM00i/jhpRJylru+syHH1xIfXzTrgG
 51/JdResjSB+4Z2F3vqHPiKWyfeFEQs8BPMqlgbw7xgTqa8YHtq1/rK2QswhfsoS72
 MiX6zvtq4AEXI1OhD6owIMLIswr5GoJ3z++AQ6SXxu0H+D/rK3dNH5c1k3H9bohkOQ
 k+KB9C+F6cccQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=HBRP5Pmf
Subject: Re: [Buildroot] [PATCH 3/3] package/gcc: Remove unneeded patch.
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

> sparc systems work with uClibc-ng-1.0.48.
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>

Tested-by: Waldemar Brodkorb <wbx@openadk.org>

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
