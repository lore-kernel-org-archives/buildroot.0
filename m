Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C55C30653
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 07:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E63226061D;
	Tue, 25 Jun 2024 07:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fE-KdaMzK6Zg; Tue, 25 Jun 2024 07:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06BD8605E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06BD8605E8;
	Tue, 25 Jun 2024 07:38:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58EC21BF215
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 07:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4603C605E4
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 07:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0QT6A4IlwS7 for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 07:38:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::8faa;
 helo=smtp-8faa.mail.infomaniak.ch;
 envelope-from=slaveze@smartandconnective.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA73F605D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA73F605D9
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::8faa])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA73F605D9
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 07:38:52 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4W7cCB21J4zK9M;
 Tue, 25 Jun 2024 09:38:46 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4W7cC969T4zfb9; Tue, 25 Jun 2024 09:38:45 +0200 (CEST)
Message-ID: <00b56f4cad554a6c6e13be1346df41673580fb95.camel@smartandconnective.com>
From: Sebastien Laveze <slaveze@smartandconnective.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jun 2024 09:38:45 +0200
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartandconnective.com; s=20191114; t=1719301126;
 bh=i4BXrt/Qhud2SlVw4cZkodC7ypvToUnO+Xg1hg2pfeI=;
 h=Subject:From:To:Cc:Date:From;
 b=nkK2QaRHK7Od2QSP1xd4upgC4qaB0oViFrBcFXMhBGvpa2la3mhYjRVTiYEuLbyKJ
 p/94Yr4/1LVuA5E64EpLpJIZDW6NPT35iBLdk68dpDVuRK5tdydUqNpHzx1azjumG+
 yCPfX5LIQ04cRhJ7MQyJ/kcanw9CDrx02h/ExUQo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=smartandconnective.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smartandconnective.com header.i=@smartandconnective.com
 header.a=rsa-sha256 header.s=20191114 header.b=nkK2QaRH
Subject: [Buildroot] Rust general questions
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
Cc: Fares Chati <fchati@smartandconnective.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I was wondering what is the rust strategy in term of version support ?
Is there a will to be conservative in term of rust version or are you
open to regular updates to latest stable in master ?

Finally, are there some scripts to generate the rust-bin.hash ?

Thanks,
Sebastien
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
