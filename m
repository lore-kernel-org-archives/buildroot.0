Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA68ECA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92D8284023;
	Fri, 29 Aug 2025 08:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWC6fjNFE_sX; Fri, 29 Aug 2025 08:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C822684025
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C822684025;
	Fri, 29 Aug 2025 08:51:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C779769
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C45AD84023
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZyMG3IGkoBp for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:51:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B80D8401B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B80D8401B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B80D8401B
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:51:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1218309036; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 08:50:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1urup1-00BBJF-0P;
 Fri, 29 Aug 2025 10:50:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250828080814.65891-1-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 10:50:59 +0200
In-Reply-To: <20250828080814.65891-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 28 Aug 2025 10:08:13
 +0200")
Message-ID: <87frdajyto.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=JQyv92+vAIKKDHeses0qwtIv95n7fZn4xU+T3k34ITp6uToGAwYbBQb3xr/sInRf+KrBsVc5qYPhD0g7Um2xwccZj2c3tpOkYrIk9rlZjU7erJmeAufY+jmImqX5EgPtgg5NlDqDDUT9mcDUIV82eph/T+ZFSF2z1N4qnML2ihTcWLYvai6osuWk+sqXuzKHS8pbL/xaMEOrqZ6QI2Ays1TDOdyTdFDUXtHjfM2qyoTem3lV4Lu8QIxpRSS2OG6SpLoEiSibh/NRiQ2x+f4cqlZ7bT+X6BxJbhXQELrUZ/k68oNl4dJaraqizgDWtmgyHntzIVQzVtSgh3h9zSmKDQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=wcudXvF5/uqIfbDwikv4Y6tr7wjgee3qFOAWlzYsRZk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=JQyv92+v
Subject: Re: [Buildroot] [PATCH] package/b43-firmware: fix upstream URL
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

 > Unfortunately Larry Finger passed away in June 2024 [1], and
 > lwfinger.com is now squatted, and no longer has the same content as
 > before, causing a breakage when trying to download the 5.100.138
 > version of b43-firmware.

 > Since the exact same file is available from the OpenWrt mirror, and we
 > already use this mirror for the other b43-firmware version, let's use
 > the OpenWrt mirror for both.

 > Fixes:

 >   https://autobuild.buildroot.org/results/daf0aefbb10299f150c2c6a93df759ad07974752/

 > [1] https://lore.kernel.org/linux-wireless/77997185-86a6-41c5-af7a-74e4e9064437@lwfinger.net/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
