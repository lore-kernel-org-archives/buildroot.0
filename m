Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACC3C5DF6D
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 09:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C69605F3;
	Wed, 19 Aug 2026 09:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjKLycYYNwTq; Wed, 19 Aug 2026 09:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787133116;
	bh=I3PG5e6a+rf/3LHFXKyJAAD92tp0eOMfGkkua33glFU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZZH04412u6nP+j7E3Qn+TnaqQHv+Sq7YtYRhfKKjOMXHBhsD1LFBsoYlqVn4SuBZ
	 L3dIThiYV7H+1K4AmPPNvMO0h7fN0DCEh+JNQxPsJKNVy8PYN75nmB5XjDE2D85o4o
	 Jka6KST2h+eDdnbnz9ILuXALbXgqRRUOTR2+0Z9x/EJJxoIR943MiybU4pLt0UXUJO
	 XpUiyM4tLSdhFnYQ9c8bMh8/qUNE8gyPZ2wEsqFXu4l+1/ZQQ4Gz9N39NBv5KHy7pE
	 BWuqrzfgUQ4pkDbMEG4Ue3CAMr9NUiZPwLCQPCy76iRCmPDX438js9ChciyglkKc72
	 Hnx+sv+zrorUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D40160606;
	Wed, 19 Aug 2026 09:51:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FE09334
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65C7F605F3
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HMi8rkf9XRz for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 09:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=n4HsiK6S
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5752F60606
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:51:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=n4HsiK6SFRjnhTyFbr2LgW7Ad3uSkAXyx+UH9LlAuBSKm0jFe90vV35vNA+FII/xBL12xcJDMz1teTKrHvTZVKnstBdJ65l4opaEaf5/fHpjN85ks9qFaRMfvy/zf8q/+PFev4xZSPjWahKU3/g/C1WdsRWA7B3euQiZuOoSS6XZY1+lLAIGlYjuiRQ1oYHr5YC2yYy3JRmCWRJL3OgCUxkRDCEULpMcD8WeosvINKN6xYv57dqaCSaSh7muMynAn4TXWzFAllYp3aOQ4IvZ6NpTiSHh1E7z3FzNWhzkD0rfwzwbHypa59YkvfqRKICdilx3uRS+IXK/U7my+7xj5Q==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=gQbPnMeSBsKL+6X+VA7CJoI/mthWsrYML/IxQw5+eGY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1383976906; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 19 Aug 2026 09:51:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wwcxY-00000004FIp-2Nfd;
 Wed, 19 Aug 2026 11:51:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,  Marek Belisko <marek.belisko@open-nandra.com>
In-Reply-To: <20260818221058.2704747-2-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 19 Aug 2026 00:10:58 +0200")
References: <20260818221058.2704747-1-giulio.benetti@benettiengineering.com>
 <20260818221058.2704747-2-giulio.benetti@benettiengineering.com>
Date: Wed, 19 Aug 2026 11:51:48 +0200
Message-ID: <87v796l9or.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.18
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > For more information on the version bump, see:
 >   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.18.html

 > At the moment this version fixes a CVE called CVE-2026-xxx that is only
 > a placeholder as stated here:
 > https://gitlab.com/wireshark/wireshark/-/work_items/21469#note_3696467312

I instead added the list of vulnerabilities and the links to their
details and committed, thanks.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 >  package/wireshark/wireshark.hash | 6 +++---
 >  package/wireshark/wireshark.mk   | 2 +-
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
 > index 917ac47471..3d8fdb6131 100644
 > --- a/package/wireshark/wireshark.hash
 > +++ b/package/wireshark/wireshark.hash
 > @@ -1,6 +1,6 @@
 > -# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.17.txt
 > -sha1  d46443d5bbca3580f944f3effcdfcc59e24eb7f4  wireshark-4.4.17.tar.xz
 > -sha256  b89a8c60b9282f29be4db91437a6e969e61bc17e8c92ddd980cc38c7304dd772  wireshark-4.4.17.tar.xz
 > +# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.18.txt
 > +sha1  482fecbe21a876f53a26bf5beaa5b0ee0ad16e50  wireshark-4.4.18.tar.xz
 > +sha256  f77a7939983758383797fed0a34a491f785e541cca397a7a44e9cdd7c6f847c6  wireshark-4.4.18.tar.xz
 
 >  # Locally calculated
 >  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
 > diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
 > index 1fd81515c1..c500a49336 100644
 > --- a/package/wireshark/wireshark.mk
 > +++ b/package/wireshark/wireshark.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -WIRESHARK_VERSION = 4.4.17
 > +WIRESHARK_VERSION = 4.4.18
 >  WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 >  WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 >  WIRESHARK_LICENSE = wireshark license
 > -- 

 > 2.47.3

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
