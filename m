Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE88C61DBE
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 11:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F46605FF;
	Tue, 25 Aug 2026 11:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-17cB1CX6Ei; Tue, 25 Aug 2026 11:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787658573;
	bh=/bAos81X4IhKEV5xwo1QbvOyGyAwqstsA6/02Ui2UdA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUWclxLF/VApHIwhofopeSINvcxq3g2AvJTwYW7rpsv6DTwJE5oUC5Wlzch7shUKq
	 rOrHZ6ZUkYKZPHqe1d4whyy4wN86Qh6Rz3Qd9gfpqp1pcdGv4TeWuGmupTotHYk4Vo
	 bjkizeuO++v78arkmfy14GFtuWc7xGjcNgU14tUAu4NMLnfPkG8HGQGYNaotNlttkE
	 YRUMSI42zmPPXKTnQzElo3jwGVM++T02SN17i0/EzbJ1CZ7FXOysACw7O9HLVxDw17
	 rP1sEzmWkwWvmf9bc+QfFGbqY/OKXscv6Q8nLUdw2w/4dVBAvm55yZtmoDi2Ejwos+
	 bdqFqmkc+mfJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BBA060606;
	Tue, 25 Aug 2026 11:49:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D15835E
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 11:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 132DE40571
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 11:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtipNJtA30sD for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 11:49:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=IQ3UX+J0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E970040572
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 11:49:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=IQ3UX+J044PnJ5bfPEwOi9THbJxYBQOotR/CAVXuZU+KcoRCWLlgN2/qR9HO2nf/13O6mqRryhnzuf+M9IehI/dXfUPLvh8eDd8OpDuE4khLz5IQZjE5rdc/q78LsfDCGrcPU01lmUAmuIYaSc30GO/AjxS2S2eh+70jTq+6cpIg65BnffN+TgmlB4I1gCsV41HDEdvOZYWm3/q4TOZZB+X4NAAjQh0il5/oomfH+4NseRhkkTbDl0CNwKenZK98mg2Tu1LmVEm/bOZ0QG2Auxa9iSvQH2Aa/OtIQXe0OnoxN7GsEAdDPu2Tz2vzlq3XpX7/QeiOzeIWynHupuTQ2Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=BvqHqjiciG/osX4RENHufEIAdvp7QAo21D3PSWsLKcI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -534062610; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 25 Aug 2026 11:49:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wypeh-0000000Cl1s-43P5;
 Tue, 25 Aug 2026 13:49:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260824213315.3323882-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 24 Aug 2026 23:33:14
 +0200")
References: <20260824213315.3323882-1-thomas.petazzoni@bootlin.com>
 <20260824213315.3323882-2-thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2026 13:49:27 +0200
Message-ID: <87jypeqv20.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/gdb: handle xxhash optional
 dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Since gdb 9.x, gdb can optionally use the xxhash library. Since we
 > currently don't do anything about it, it's a potential "silent"
 > dependency.

 > In particular, for host-gdb, this means host-gdb might end up being
 > linked with the system-provided xxhash library if available.

 > This patch handles this dependency:

 > - For the target package, by looking at the value of
 >   BR2_PACKAGE_XXHASH

 > - For the host package, by looking at the value of a newly introduced
 >   BR2_PACKAGE_HOST_GDB_XXHASH

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
