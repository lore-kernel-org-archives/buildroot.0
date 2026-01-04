Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46EAC2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11095405A1;
	Sun,  4 Jan 2026 10:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvBaWbHKPw49; Sun,  4 Jan 2026 10:13:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5414050D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767521605;
	bh=ygiSYcGUmHKU+a6SrwLcwK2qcE1DdjkiuoIAL2iLKqI=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FJkMUTJfv2oZc93ehbCSChG0/MpY5kSM+Yr8dr5XRyZsSsOAb4G7dM7fLfrCTZZcL
	 Cz3SD6QxWqxB83mtC8BqaWt04umLcCGQVZCGBzR3Irwey3rm+Vcj+7YdzNE/lwNV/t
	 xNXs+/d5lx+z1ivJUzMxLXCg33yjmGpVJ9/Z8LrAJ1qxXcy7/oZgAlCj/Dc+4dfzBh
	 yrPLnrxPXGPtotY8gql1JGeITYPYGQxMIS2o9ByMw59zVjbQZcUHUNL4NoDVEFfI2m
	 Nu/2Tew+2aIlDjjL147cYrF6SL8EqS3fj2n/WHUbMCrp4C01YceltGKRYQjXtvYXYe
	 wX4JjqZo58c9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA5414050D;
	Sun,  4 Jan 2026 10:13:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEB032DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A507C401E9
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBmnMzrWROST for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:13:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 393AF4008E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 393AF4008E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 393AF4008E
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:13:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1362368070; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 04 Jan 2026 10:13:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vcL6k-00000001WqN-2DG6;
 Sun, 04 Jan 2026 11:13:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260101181830.35ccf7c3@windsurf> (Thomas Petazzoni's message of
 "Thu, 1 Jan 2026 18:18:30 +0100")
References: <20250929092431.8974-1-fiona.klute@gmx.de>
 <20260101181830.35ccf7c3@windsurf>
Date: Sun, 04 Jan 2026 11:13:10 +0100
Message-ID: <87wm1xn0sp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=YyspyxAp/a4JaNYtC2/6ohYDcRj5RDrrmBVYU16rkzJzK8QlSUiN/qDmMs0trdNN06RCoRv4plWt4bcGQE2UAqLZvPmgPglBwPMo5UesQfIGRIGCB/6ltCC8YbReA/RnkYv5TgtJuIC6F6oZa2Mq8Jq2SB5n+HdBAziOpf/LpURZTo0vmRDNn5iWyc7uu0dqTEgDi4lzbc+VBCig5aFHfqtzIUeTocExZuILY/UM9vnuvqbIVkvFvTn3Gxtg7aaCX0pX/4iSTQUyIAhAsdt4/k3pOa+4Ge0jSQWbLd4ECndVJXMqvJ3ut/qk8DUQa0C4a9Pf4Gdvm81dHqqfORBvMg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=85fFC2exIfT3O9fTWGujs1O8ECGxMhtHGZZGeK1qmlA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=YyspyxAp
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: add check-package-external
 target
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
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Romain Naour <romain.naour@smile.fr>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Fiona,
 > Adding other maintainers in Cc: to get some feedback. If there's no
 > feedback, I'll apply as I don't have a very strong feeling about this.

 > One thing perhaps that bothers me a bit is the naming, as from the name
 > I didn't really understand it was for br2-external, and I was wondering
 > what this concept of package-external was. But I don't really have a
 > good name. "make check-br2-external" lacks the relationship with "make
 > check-package". "make check-package-br2-external" is a bit long.

Sorry, didn't look at the patch yet, but could we instead make 'make
check-package' do the right thing if BR2_EXTERNAL is non-zero? E.G.
iterate over the words in it (and pass --br2-external to check-package)?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
