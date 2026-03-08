Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF0BEA8536
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 16:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAEEC41A4F;
	Sun,  8 Mar 2026 16:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeUfEesWUZQb; Sun,  8 Mar 2026 16:43:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 097B6419C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772988233;
	bh=Gcl5NGyL0vlZbxRF1Ajf7AS9p7qBG84mZFEAvJvkl20=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CdOtsIGqeuuKJ5XwfPkQGl7cxkmGgRKMOkJN0+yl8H/vVowGwSC1ylKz3XLUreYD2
	 7usSNSpXrSmKCz4RV5baZhJc1k3wN9J9sUjvywH6Tie2gwOUGR6EnbzskahKcGfPNd
	 dOhEvSBrrKP3xfE4S3kijehzUhLHGQSUQ5Da4hTgvLafZImsL6IYoccaoWUfkKeBpD
	 b59Hb4hSxdjorbshbL/aCmFENaaNvb7LCRpiEx9/FzSPun7ix0h3mokyvGwj/dAN19
	 0yHWnbHe8RxFqsC4ItclOYSMxDtgzQcIuXUDH6Q5Df3Uno8x4AbkTUXpI00LqFAlZS
	 Wky5oyhNj1OXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 097B6419C3;
	Sun,  8 Mar 2026 16:43:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3207158
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8FC6419C3
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iwaiw1fh7w4H for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 16:43:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8539419A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8539419A0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8539419A0
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:43:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4EF2578032A;
 Sun,  8 Mar 2026 17:43:43 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Mar 2026 17:43:43 +0100
MIME-Version: 1.0
Date: Sun, 08 Mar 2026 17:43:43 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260307092701.14217-1-bernd@kuhls.net>
References: <20260307092701.14217-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <6f86ccc873ae4935a20aea83c0c63cda@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772988227;
 bh=W8Z206cOl9mskqKuiR9YH98rcBJdJrjfqDQxXZrKTyE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZYGAhRSoCsL8yoUAcmdGdUO1t9xk0yMYSjqNijpstpcMIoubyWWwIP8APKJwLFckr
 9q8ZGIDWN99SSGjWbNprGmL82lSdTw3m+mK4eojGMaiW9v4Lr9wr7NAehETE8x0sM5
 +s8IkuB7l+0t2RaucK+b+hvyvCH7ppWllsTMgc499NpGmD4OAXdjQSucxE/KKNQjxB
 +Bc6zBFeIH6kEqeWbX3or06LdxU2ehyvXgYMAXKnnptNgdJNkNe66zxeT91H25WZIy
 0hii4wVmJIG6kCiqYWFBKRQnQl/iC3SV0Gv+9RDn0iMjQk7QrbDTGPO5VhyGH1CoLq
 pPxiiM6bEgVKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZYGAhRSo
Subject: Re: [Buildroot] [PATCH v3 1/2] package/gcc/15.2.0: fix build with
 glibc 2.43
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

On 07/03/2026 10:27, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
