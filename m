Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD925C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 14:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84E7F60ECD;
	Sun, 10 Aug 2025 14:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vd6rJgx0touV; Sun, 10 Aug 2025 14:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C810760ED8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C810760ED8;
	Sun, 10 Aug 2025 14:53:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C088154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61DEB60ED8
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOJTYLcPOLxy for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 14:53:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7550860ECD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7550860ECD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7550860ECD
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:53:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 433EB13F861;
 Sun, 10 Aug 2025 16:53:50 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 10 Aug 2025 16:53:50 +0200
MIME-Version: 1.0
Date: Sun, 10 Aug 2025 16:53:50 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250809214151.2423583-1-ps.report@gmx.net>
References: <20250809214151.2423583-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7d8c373813f2e36ccfac4a9f0fa3dac8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754837631;
 bh=BZghWnjfd4CiOEGg1XEFBzNbFtfdYg5cIMMhaXmX9bY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nC+rc9sH6iEXbC14UVA8FWnl5Y06RPvaqSgyPKfPTMslYDByLtn/DG9LHw17qTYky
 R95thq+1SzssBo4A5DuIwQBSORN5uVSslz3rnWUN4bsvRZ70ZVZVkulXVE++c5RnGT
 zyvVUdR4Kvn6dYi7Ms/Ms0jbF7vHItBeyhIN6OZjqFjOs6IqWW4MsEV8RD2V+33fwx
 fGFb6v5xFleYRnXhbHIwZNk3l6rRHx+Kx9Yvf2So+ACzPPMPQkgLho48u22eCSUBEw
 8zTBlKKRkzm8M1DmXLhyellj+iyQGybXkv0tg+PEv0rCPlmS+Zoi903sm9CyXOqOM9
 2MWsJ5ucffjKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nC+rc9sH
Subject: Re: [Buildroot] [PATCH v1 1/2] package/iwd: add optional iwmon
 support
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

On 09/08/2025 23:41, Peter Seiderer via buildroot wrote:
> - add option for iwmon support
> - enable linux kernel CONFIG_NLMON option needed for iwmon
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
