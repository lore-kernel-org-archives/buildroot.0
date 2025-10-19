Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0488ACCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 13:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF31E837AD;
	Sun, 19 Oct 2025 13:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDvt-WaGib2L; Sun, 19 Oct 2025 13:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D03F183837
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D03F183837;
	Sun, 19 Oct 2025 13:39:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B32731CC
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 993F341249
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1NgCQO-J5UF for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 13:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A40F1411E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A40F1411E2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A40F1411E2
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:39:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 044F1B00565;
 Sun, 19 Oct 2025 15:39:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 15:39:47 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 15:39:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alexander Dahl <post@lespocky.de>
In-Reply-To: <20251018135626.788605-1-bernd@kuhls.net>
References: <20251018135626.788605-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <de3f42ad8262b32e59fd6ab710037a6b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760881190;
 bh=T9uivfV2c6A47iSiqDJOD5hNjEgQweR8muVArHHdwII=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LKtfa83tTDuhJf8y4pAXAXE85LDRpCMyRoIrnMqgcPuue9ApK933wcTtVZSqSQ3+5
 V+fHZ5cc49LnT12bTr7RpQMlsPVH56/dg/k5NTIuGU8tuqKqRPBTAUtqFs0YxLYfF+
 JO5Rck+OjPo+n73dd7RyKeAbS4ohYFHHVTNNr1toxR4arfsDS5BWfKYhrkEUFqc5x8
 eaYSf6oMW/gOuKn1BFSMJPkY6vpd7HXZcFLebJJ9/5y0yB44MU1zZk6FmnBNlRZDMP
 HLHNb1AxU6g1LwgtjaSl+dteTVRKZJ2ImOkY0OrmM1236ucd7jYshNSk/eIW2BE5wx
 OcklUqIs4dKkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LKtfa83t
Subject: Re: [Buildroot] [PATCH 1/1] package/siproxd: Add upstream patch to
 fix build with gcc >= 14
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

On 18/10/2025 15:56, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/679/679fe86eea2001aed2baf066abf3ae43b38567b5/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
