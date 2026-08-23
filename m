Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90788C5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 19:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E551E80B00;
	Sun, 23 Aug 2026 19:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1DKbJffz1_T; Sun, 23 Aug 2026 19:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787514404;
	bh=eKh78N1TgTRkF2zKOEMq/joDYVgJySdtOIEQOGMJLFo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZLVYb0KffiiDQZlE75Z9pS3z734zmsCGEWepvi+4sQUhi8PA9ib5jHOaj16URbxob
	 bM0/RMtCIJi6uI5cyZ6P3imE86sTcBtWFIHxioY4sBPfVIvn1GlrX/HeC5WbSV/IU4
	 1Xk9DYDlHT5oWgOkwBPUWjYHdrgTayjI2SZzrowwJrRrm1IZOJrH3BeTWEhEBRClDN
	 w+3gDOQQnKFq1itPL06D50BM40PeMZQMr9/sFgkP7bCoXdaWQg+D1ZepH4BRs3VE6a
	 neyCa7Dl0MsTgJGKt26IDR0c8yGshnWZF2jeA79Vk5TeTs2wpt2wA20e4TKfmgj1Vy
	 JApIqHfhn0Kwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF38980AF9;
	Sun, 23 Aug 2026 19:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DF54336
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C0A940059
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKXCxQA2PsFT for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 19:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=jzB1cAx/
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E60BC40057
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:46:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=jzB1cAx/MkgU1VBuXE8kGlmujFnWP4sMEQJ5CUvj0mIeydBzG0g39wEHM8+TrwoBXxNmTyMN7Km/r0iuPIKVcOFm/HK9J5aB3fufHzAKyxQgysomNOTstKMEItadoe0f2A6kN+Mmv7dQXndGuyL1pJiBYavz5RpBh4Zn4yzUn4XBDSVaFJJLrUqr8fpN7QL8EA2WTJnfYV9272GRWo8sv3FPj+E5a8/Q8q40GV/UwCmpZHz8PH+72iqXs4nPt35VSuH5lcRXLCCDtqaXSh1vW57sUGH4teFe2ptwTDDSqDBGyuLAJbHIHYH+72vKKCRkL3SM66y/shpyk9VaqIbakA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=5mW8wfzUK9bNcOhaPOskchZs4bV/0+zXxRlJs0jJLN8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1320007834; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 23 Aug 2026 19:46:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wyE9N-0000000ANI1-2MJf;
 Sun, 23 Aug 2026 21:46:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Quentin Schulz
 <quentin.schulz@cherry.de>
In-Reply-To: <20260811134312.170306-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Tue, 11 Aug 2026 15:43:12 +0200")
References: <20260811134312.170306-1-thomas.perale@mind.be>
Date: Sun, 23 Aug 2026 21:46:37 +0200
Message-ID: <871pbod3he.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] docs/website: link LTS tooling
 documentation and staging branch
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Users asked where the notes are available and if the information are
 > publicly available.

 > Those changes clearly explain the location and convention of the staging
 > branches and also link to more documentation on how to read the
 > annotations.

 > Also update the timing of the different steps to be less specific.

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 > v1 -> v2: took into account review from https://lore.kernel.org/r/f6b4e9a2-8ee5-4799-960f-36dbf5710da6@cherry.de
 > v2 -> v3: took into account review from https://lore.kernel.org/r/8d6fa46d-8200-454e-b5ac-aeccc4809647@cherry.de

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
