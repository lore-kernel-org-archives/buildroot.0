Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53446E9129C
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 09:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26A67840E1;
	Thu,  5 Feb 2026 09:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5F9fdBFAk0V; Thu,  5 Feb 2026 09:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E16D840FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770283633;
	bh=4FfVRlS316oBh1H8auNDKB3RfI+8TjBRcZakVgJQK6c=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AJ/HVqDMlT6F/OJu6nTux4o2XyxaX5u34H8JnLsDN1QXinFWpS5GlUoCI4pnKWnJ2
	 Ie2JkP9nkpwNbqDqik0OBLK/jFYwSCdGMYXxPBKeWV3r0nA+gOXkeGDHpYC0XaGf5z
	 ncs0oKgFrYcdA20fNkCBHXZi3YaHfo0WMxd6l7f4bptjyoyjiE/MKu5DCYl1z9yYvR
	 v4R+o/kEjwi4e5V2lpFswyh3iSPQps+k7ZczNC6gysUObIcGHKkzhyE6siA+fSrouI
	 4NkzNs4KzgMVk+QTcxjKQPGV1/ehBSwEXo0TQNCkGaCVi3paA3rZvQxJ7nOTEF3x5l
	 SOgj6eckP+6nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E16D840FB;
	Thu,  5 Feb 2026 09:27:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56751F5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4481940D4C
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJy0SHaoRJQL for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 09:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 095D7403F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 095D7403F5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 095D7403F5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:27:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1758529210; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 05 Feb 2026 09:27:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnvdc-0000000DfKj-04fB;
 Thu, 05 Feb 2026 10:27:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260204200544.3753631-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 4 Feb 2026 21:05:44 +0100")
References: <20260204200544.3753631-1-bernd@kuhls.net>
 <20260204200544.3753631-2-bernd@kuhls.net>
Date: Thu, 05 Feb 2026 10:26:59 +0100
Message-ID: <87fr7fo80s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Fgl2nLl4y2qkwMuHJoz687swfdXDmCp0Yt6pExGTzeZsrH9UvpuqsPq0usdz7fTxjJ0xWPOy8heUzS/7XpDn78wp+Jg5X/765J/aew4tli8kzrPSX72BYL+JkGfj1V5KSWhudVc/UjGWhZHhdyDx7dBcNSnjH+U2x0hho8jsiykWMV0kuqghouOczO7fesZKxgyBnKbkzQw6On6/opT+0kLmmMrzEUJE4IMRxjAGAf/OAt9ZmCnWagmyyg/eLRaB5kjJWjAOe0UpbE9kPPwAWQ5t0knK3aAsvwpgm9ZDDNwp9QKQi7pYhQ1PGrY/pAJgQODpAsxX6TX9IHwhvDGdEQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=qvD7LLCQ2jQZqTGjX6DOfrSJ2ja5nWARti+i/Iuotko=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Fgl2nLl4
Subject: Re: [Buildroot] [PATCH 2/2] package/kodi-pvr-mythtv: bump version
 to 21.2.14-Omega
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

 > https://github.com/janbar/pvr.mythtv/blob/21.2.14-Omega/pvr.mythtv/changelog.txt
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
