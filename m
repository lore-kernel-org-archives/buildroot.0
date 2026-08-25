Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F308C61DBD
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 21:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E46A480C09;
	Tue, 25 Aug 2026 21:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbJxAdflemM4; Tue, 25 Aug 2026 21:42:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787694141;
	bh=/8M9KMJGmaDvXRYT/JmB1H3cDNuLVTOzLe96DtuV3RU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bIWTCEVflGeufcdQybTTBBZijv3neXEnPSWQ5pIX5+3+Lqlmcny2aXoCsfoffBNT8
	 Jh2ehnNSCFgUPT59ErPrdCeXrwTdPvg0ewn6vzlaDPjCMLvx6sV/xG5zrW2O0U4xn2
	 TV0hZCjjp3v8Q26bmkLrwsGyWIvVy2H/PPv6Ge4jM5XC4Hrbxbx1kvANDa2ZWsMV0P
	 Z/R6OW2lQgNgkEVb/u/JIZAVT8k/dSuTuw0vb0JAmszKaHZkHLDfOneM+RcsUSdnyi
	 wdvhoJMmj3qiIsrcsZIVBQjGn9tQWEMsbZNCzei4iljtLHdQ9beD8XV7s/PYm5s6qB
	 oWzXjTzbEiGqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1839780C36;
	Tue, 25 Aug 2026 21:42:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C659F105
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B879180C36
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jx0noj0iOrDg for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 21:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B69A80C09
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 327EA4E413B2;
 Tue, 25 Aug 2026 21:42:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DF272604C4;
 Tue, 25 Aug 2026 21:42:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6CDCE11C7A8BA; 
 Tue, 25 Aug 2026 23:42:08 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2026 23:41:58 +0200
Message-ID: <20260825214203.3708181-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v3 0/3] Improve checking of host binaries
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This is v3 of my "check-host-libs" work, completely reworked following
the feedback from Yann E. Morin. Now the check is done directly as
part of check-host-rpath, which we have renamed check-host-bins. The
implementation is largely taken from Yann's proposal, with some minor
fix.

Note: do NOT apply this on master. At best on "next", or perhaps once
there is consensus that we want this (if we reach such a consensus),
then I can do a big build with lots of host packages on a system
"polluted" with lots of system-installed packages, to see how bad the
damage will be. Alternatively, getting some feedback from people
testing this on their configuration/system would be very useful.

Thanks!

Thomas

Thomas Petazzoni (3):
  support/scripts/check-host-rpath: fix shellcheck issues
  support/scripts/check-host-rpath: rename to check-host-bins
  support/scripts/check-host-bins: add new check on host binaries/libs

 .checkpackageignore                           |  1 -
 package/pkg-generic.mk                        | 10 ++--
 .../{check-host-rpath => check-host-bins}     | 54 +++++++++++++++----
 3 files changed, 50 insertions(+), 15 deletions(-)
 rename support/scripts/{check-host-rpath => check-host-bins} (73%)

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
