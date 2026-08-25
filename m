Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB2DC61DBD
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 11:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A4D680C2D;
	Tue, 25 Aug 2026 11:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNIE3-OlfBwV; Tue, 25 Aug 2026 11:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787658545;
	bh=DixvPwDzVVD3MuhoLqVEKqwrTS8KwPN4lgZSWK+lowM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cQQcgtS5zmS6TMoC0814Z6vJtKbm5umR00bg9SH0KUWsEIexk0Y8KwqiIExA3sgzS
	 12N1xGWFUnOqnr8R/og04hhWxEc1VTtgUuFtqwTpVhDgjb90kvE8XVv6fRUfhjEQeP
	 +/HKt/GVvX4Bak0/ittxDIeiHfIoJjNkbKn55iVwUbHsNc9QZdHH7RkoJsX2YostO3
	 JL7GDx5gPUahbQUFYzCXRJkzeoinEuifLvjyABH51B1tQG9UyXrZGHGqRPagH3jgCN
	 ag7p0ECYjfotk0kb0/hoPRYIwSO2gk8UWeXoyWsGtDKyS3VwYEI+tlEGZpzvemoBrP
	 6oPH4HRbCy1jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D15480C33;
	Tue, 25 Aug 2026 11:49:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11DDA35E
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 11:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F6A940074
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 11:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8njBNVW6OlW for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 11:49:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=IA1mR2B1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85FE14005B
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 11:49:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=IA1mR2B18c/hIB0L2wmO62L9lwsyh1CNO2NIsDsE5TTbXhDlhW8j9/zOOwyMYFdnmKPt/J1k0t75bg8m1NMt2x004Jn7LBVs1U7e/DQPZqEjnEfdqT5Aphc5yXtcABxi6p+8Q8DEhl8j1dy8my6MsK2mEzT1i14UDh+umfIGmujawkMmLEFhNAu5wUZrbVq3fKjy3BPTj6W7mxbtEG4ohgsRW8oTD8VwdyaLESMfwwr05TCOuy7zOq/pAmWuCU4bZ83G9KFxj/q6LvwlNE8jg+jQ6RtJ/m3ssnw+aKyJEUkHWR8f2cSBWr614Bm0BAO3i37WJMsjMb6jmrAS7czXbA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=TutUdKqkUlqe1XWFdH2kQ6PGVq8LQp02LP6CfGZamK0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2110501995; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 25 Aug 2026 11:48:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wypeD-0000000Cl1W-1RSF;
 Tue, 25 Aug 2026 13:48:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260824213315.3323882-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 24 Aug 2026 23:33:13
 +0200")
References: <20260824213315.3323882-1-thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2026 13:48:57 +0200
Message-ID: <87o6eqqv2u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/gdb: handle lzma option for
 host-gdb
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

 > For target gdb, we properly enable/disable lzma support depending on
 > BR2_PACKAGE_XZ.

 > However, for host-gdb we don't do anything, which can lead the gdb
 > configure script to detect and use a system-provided xz library, which
 > is not desired.

 > Instead, add an explicit option BR2_PACKAGE_HOST_GDB_LZMA, which when
 > enabled pulls in host-xz, but also when disabled ensures gdb doesn't
 > try to use a system-provided xz library.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
