Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB90C5DF94
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 08:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F6376068D;
	Tue, 25 Aug 2026 08:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mafvCGF3ku6s; Tue, 25 Aug 2026 08:27:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787646426;
	bh=+JPWXVbnKWO0NeGbRu7kHR2wPUY9yfl9tEszMa0OhXQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnEtrrCaCRInTr5yrRfWBi4bPp4dIL9zZR5pu3W41eRwkSrEUs+tBJfQ552GSqb+E
	 ZeU1yIuTgWgCgUO/Vae3JRATwTLB66Fh7rqmY6Khrmo+hImVg/u63sgmsUeuL25Bjr
	 HlO6KyvFmfjGNmuF2rAyfJ8s3r/0SsPZcDOuT1K954S4TzkNdV5FR2Qbli5zcqI5Nd
	 sOcyWVO3N/fUP1fj8071QOwj533dqhPgzed4C5nP2LwuXa6O+9WM3T9KgUrENJI01/
	 3cisXCEF3nr5tmTUVHFGU9elRk4EPJEes9TuUSngXJW8nW6Lc73pXDdt1ZS+woTfdL
	 md3ODqZgKMmvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 420066060B;
	Tue, 25 Aug 2026 08:27:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87FC3279
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73E1A6060B
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QL3NX9XYzMDc for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 08:27:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Xy87Vz8Y
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AF3B60608
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:27:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Xy87Vz8YM/k7Blm5BJQRJsnt4kdIt+QZPWczwhoz5vKbB9oo5Ppud67DJWS9xH8+Mcu6YSgYMF5d56SdqtJCqgQsab3LeCnK/LtbfSiYMWYry0avUxmRlMKk0muB4HuTklNduqZ1+QlIBSrz6+J4xCJtIDWAuEdxuSbOGCAlfJRa2Z3zwqjgEoMg6HsIpjMdVzNUXowGOF00FfQsy/iwzf9N9jkR5hEMu0iI1drJcVPt2qieOk9rSqFntf4OUOc07Cgu8psPkZHDM9GGELtlqXG+5GBgrvLhqZ3brXszAvrc9vLJra6KsDYca9sdomln1H1bwp47XFQoEclke1SnaQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=V+D25cadM2a5Qbfdc8zs5neqDh/LRs6hiZ27DY3xVgY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -103802311; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 25 Aug 2026 08:26:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wymUk-0000000CPyq-2ooL;
 Tue, 25 Aug 2026 10:26:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260825075139.3470-1-bernd@kuhls.net> (Bernd Kuhls's message of
 "Tue, 25 Aug 2026 09:51:39 +0200")
References: <20260825075139.3470-1-bernd@kuhls.net>
Date: Tue, 25 Aug 2026 10:26:58 +0200
Message-ID: <87o6eqy59p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-27-gae9225d55
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Fixes CVE-2026-19542:
 > https://gitlab.com/gnutools/glibc/-/commit/d6ff274313d79feb864cc10eb775b91c817a67e9
 > https://sourceware.org/bugzilla/show_bug.cgi?id=34506

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
