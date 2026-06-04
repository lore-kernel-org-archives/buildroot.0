Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7608CD6E4A
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 08:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 772EA42C08;
	Thu,  4 Jun 2026 08:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBLZZbtmS0O8; Thu,  4 Jun 2026 08:09:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF7442C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780560577;
	bh=WYBwYbE+veIDLIqLLL4roMMh9MaEF762JXjecomy9WI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KzS/wUBHKmUvQnfh/FjG7HZ79UUBL1tqFYe/0cCZe+9Qv1uu/Zmu4/h2AWF4QrQs5
	 bMVB0EoyNb6ltatHnR96fkK5JgbiSQpPA/9ewdSw255j8Iu8E2nGeikFS4pd4tRv6y
	 LTk5NuuuiGivMiRxZCcA3cb1R2cHovCndYiMl8yGZYfzhL9wvx4HIi3PGqC+3ohBA6
	 5p4lAcTHIuw4O78qj/lvmx9G9dhYADTq/w1bcYQ9cbPa639Xi4q0s3KyrnTCKkdCtS
	 1yj7dM/wLWdg8v9bk0BmiFSC5rlDIpO+gO1aUDWAedSq2ljL7/Xgnbcj8JaioRwf++
	 2SexPVdE1nNcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF7442C26;
	Thu,  4 Jun 2026 08:09:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65319DE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 08:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56F9A423E0
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 08:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdOXseNXA0vH for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 08:09:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14C9940389
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14C9940389
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14C9940389
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 08:09:33 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2125162349; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 04 Jun 2026 08:09:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wV38q-0000000FW5p-3sLK;
 Thu, 04 Jun 2026 10:09:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20260603210920.3450528-1-romain.naour@smile.fr> (Romain Naour
 via buildroot's message of "Wed, 3 Jun 2026 23:09:20 +0200")
References: <20260603210920.3450528-1-romain.naour@smile.fr>
Date: Thu, 04 Jun 2026 10:09:28 +0200
Message-ID: <878q8uk9qf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=hUiC7N707ZvSCedhlopstgETYBnLWDlVKke9WnZTzNJJxjJlVXUgkuGA/mgRXazcvb/+u9Z5rg/+EjgzrzImC/RmwJpABIDUOc/ODm5jGVNQtNrMX9wGMmhMro9x125D2xrBJPGbHpqZS6sp1AX1mjX/1Ps8pYgnPeK28a9+PVxFv+l1Y6JvPCC3v3jMK+sRWt6R/+iH1Pa16qQ54dkGRXuzF3CHEGMGRyPQVRmaKuq94Tluz+yX3rodnc4Vl/Gnd308B4bPPscgIXAY+bIiO6s9EiRKgnzwKO+jLPJN4fo/MvigcpqoXxZ7wl8DR1hONZsvTEIVabfA7qUwVqbdjg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=MwTwZMWieQ4jbEQyRqPI4Dk5413t/JDzuTwqJkghU4A=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=hUiC7N70
Subject: Re: [Buildroot] [PATCH] support/testing: TestJailhouse: revert to
 gcc 14 based toolchain
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

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > The jailhouse runtime test doesn't build since the last ARM aarch64
 > toolchain version bump [1]. This new gcc 15 compiler use a new C
 > standard by default (c23) but since the jailhouse build system
 > doesn't specify any versions of the C standard, so it doesn't build
 > with gcc 15.

 > As reported by John Ernberg on the mailing list [2], jailhouse git
 > repository has not seen any activity since 2023.

 > As a short term solution (and eventualy remove the package), revert
 > to the previous ARM aarch64 toolchain used by this test.

 > While at it disable jailhouse package for gcc 15 and newer.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843463

 > [1] 8d413d61792724877bfd886fe3ba519fb5259566
 > [2] https://lore.kernel.org/buildroot/20260601204735.888967-8-j@j-ernberg.se/

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Alternatively we could grab the GCC-15 patch from the NXP fork:

https://github.com/nxp-imx/imx-jailhouse/commit/2be7793ca658015470fe0d60c0c973e12ce68d73#diff-1204ed3c95d71ee6a950f5d277db87fb3cf9209d56d60ff4b1df9f2994bad296

The patch looks sensible to me, except that the check for C23 support
should probably be:

#if __STDC_VERSION__ < 202311L

instead of:

#if __GNUC__ < 15


But longer term we should indeed get rid of jailhouse if it is no longer
maintained.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
