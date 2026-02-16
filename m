Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9481DE83823
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 19:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3697040C99;
	Mon, 16 Feb 2026 19:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsOG0GPmM46I; Mon, 16 Feb 2026 19:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4219440C24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771268837;
	bh=k8qqCD6xQqatVSffo9h2Oo9H19GNDEfYK2+YWH9X3Fo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FdyDedeaUmBDuuffKHnLPenXIx5eE2T7CtmjPZrHjxWtKHhpzrH7nhHMGSrg4tpef
	 S9nsvUNniV4H9vRA/kzbXpsTxgqRExQC6ImuhhXuZIlIepjZ7TOZjIsVoa3RDeWe1j
	 qV2tS5rq4zpm+iWthKEafGCEuGD5Kr+HhYRFo1agwSGFGMvHUrhPPwqBwo+3o3ZuQj
	 1vboEoAQJgiVmMrb+0XmtM48WOEf/i013JQl3z7CfBkvcySUTOBDOU3OnpD4Pa5fRe
	 ouVwoXh1NDwU241xMQOWT1T9MvRVX8bkAk1OIyg189DqZDwMU0x2CAESO3sMXWjDjr
	 fbB0mEFNvEMLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4219440C24;
	Mon, 16 Feb 2026 19:07:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C551035B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2084404FC
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSpi0dJpm0Lf for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 19:07:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C7BB40ACB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C7BB40ACB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C7BB40ACB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:07:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1517889003; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 16 Feb 2026 19:07:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vs3w3-0000000AotI-0Xl7;
 Mon, 16 Feb 2026 20:07:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20260216051314.145935-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 16 Feb 2026 06:13:14 +0100")
References: <20260216051314.145935-1-bernd@kuhls.net>
Date: Mon, 16 Feb 2026 20:07:07 +0100
Message-ID: <87jywcld7o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=QyJYyfIox/FnP93/6ek4XGmTGSb8yFYIXiCvxSPy8Io2rrojcKCPoFRtD4g1b4hKBw5eDmuzT43jhDB/VEldG09fwMVzGTAVmqNfSc8nuns4UqXqtDZ4Zp/6lTC/GXwAHi7gaOCgZmdrwBQ2A+LtjOf73VGt8G0Wgd0L/EyRZMTup4wuJ1NST6FlEEKx9P0Q2M5aHAKFPS8nDpRRj8VgvqW09qw16/7KXC7CjLp8dCHXC3tIqJsNcYaF/u1nJnL/Ez+y4HX6bcVVN2/9pfL96R0YEtKbBAXbV/KA/Hmkdy24OWkX1PTbeVMIPuJpIOm7RUNdPLkYJ5G4iHvj86gxIw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=FS7vx8jKq+QY9S9bDPK/SqohMCW/k9xaA/rF+dze0CI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=QyJYyfIo
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 18.2
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

 > https://www.postgresql.org/about/news/postgresql-182-178-1612-1516-and-1421-released-3235/
 > Fixes CVE-2026-2003, CVE-2026-2004, CVE-2026-2005, CVE-2026-2006 &
 > CVE-2026-2007.

 > Updated license hash due to copyright year bump:
 > https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=aa4b5ebc7640f60905cd4c71db45674e5941b611

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
