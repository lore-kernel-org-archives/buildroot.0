Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727A1D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B8F2406A3;
	Sun,  7 Dec 2025 17:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0aYZo3rDB2Rr; Sun,  7 Dec 2025 17:00:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E50324063B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765126855;
	bh=6EsL8Q294usWPWknu+VVtXSNqfoas5igN6g5nrxw+7Y=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pV0OpGKlDSR7/hNcfxzFy/SfnU31oeSXdmd1sblSzTHN7DmDacwmUJ4S2xMfqn18A
	 xpiqKLqrLAa1PpQQm9eb1kky39rQVSuOA4hDgBJt7wOxNs1OnsgOdNbZUcBSCoOrfT
	 nX95LVbap9nssoBTfJ78x6vauerZCzdgCaXUsWhYql915d3bSGD9HrjJmYdOE2D58M
	 jHAZjYBsedNzBcR1Yi9y9cTN6Pg79wlIY5UxWpS3PswOKM4CH0goQvuhjjzwyBOXc1
	 Mulpy7GGAmycuAV9+sCbK3Y8FX7LBIngWnvvKKZIscOW17gY7GTj1wOJQfpOJGACf4
	 EyAoLecQ1O0VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E50324063B;
	Sun,  7 Dec 2025 17:00:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 075962CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E282A4063B
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZEukHpbYHiF for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:00:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D512C40584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D512C40584
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D512C40584
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:00:52 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -789099204
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 07 Dec 2025 17:00:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSI7p-00000004Yyg-2ZTw
 for buildroot@buildroot.org; Sun, 07 Dec 2025 18:00:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>. francois.perrad@gadz.org
Cc: buildroot@buildroot.org
In-Reply-To: <20251206213818.2301716-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 6 Dec 2025 22:38:18 +0100")
References: <20251206213818.2301716-1-bernd@kuhls.net>
Date: Sun, 07 Dec 2025 18:00:45 +0100
Message-ID: <87ldje9qgy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Rr9De3VbdvEs9S2fr3+dX0l3ABhztmQybTApZDqJmPOqM5gc8k/AwppBqjsvQ3+zQGIUbeBDMwb6lUB5mKasrwgFfZ6Q2131a+3sKMTzb2PbaVUNALdeIdFpSd8Tk8zKH89ULM8cGTJQ7UWTi8+icKOqHuqd+3ZzwQ58+kFTlS25XaetBGmWgEewMPD3Fn3p3FcR4eqO7mKrrLllbAo/3h5WHW6cwPsZ3KSNQb1AQuYYK2d5tkXWWMZfBdAI0Em9v8MSk/1N+deIOpqvlezhGdPWgJwvbrcioz5OdR7ahKZE4BFCJufoskbfb2xxisBKe71I8R0dU0D1wRSDaxzmdA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=vyfC8hNSXci4R/H4EOsko9S+oo67EX6Ujyy5fbvwJl0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Rr9De3Vb
Subject: Re: [Buildroot] [PATCH 1/1] package/ficl: update SITE
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

 > Upstream moved the tarball to another folder:
 > https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/
 > and also retired the package.

 > This patch just fixes the download problem.
 > CC'ing Francois to ask whether the package should be removed until a new
 > version 3.x is released.

 > Fixes:
 > https://autobuild.buildroot.net/results/125/125fa1c0a3b37b4d09389a49640b90121838c665/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

Francois, should we drop ficl?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
