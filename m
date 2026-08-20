Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6A7C5DF85
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 15:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 224C880C09;
	Thu, 20 Aug 2026 15:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMnfAb2G4XXW; Thu, 20 Aug 2026 15:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787241074;
	bh=33QgFWMuQl05t3AeorTivMpKWSooaYecTvM7XCBV5yc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iZSWaUXE60+CzIVIxCiFmdEs/BHVCkOqFxXIGqsk9t/yro8OogtfPLo6Zyi0yHgIY
	 nR+lJn82waMI4MOTUhN/BCUbfeBoBdeHSbDWKQohDG8rCCODqmWr1USLB71eXl1gmb
	 conFRQOeeI9ZHdnsg/MBDrgwdS0/015oluDIgY9zEVzCaDjWZWUldT4WRnEIuF6LG7
	 xzkxbPPAOlj0Cq8FLL5cK8TGBkEKmTO2DvF/wm483LYRnI6Y9IaTRD6PtfkAsDsDbU
	 NOMAHHC8lbuHYh1jRGgUtcR20dniyYqATv16V/BTl5bq0dIGMKeU6RTOqZIIVhlv7p
	 ZmAX4/FaMjlag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29C6080C0D;
	Thu, 20 Aug 2026 15:51:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CEA82FD
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 15:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 490F680C0D
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 15:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PruYwPFc_BMu for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 15:51:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=cKri8uhe
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A328080C09
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 15:51:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=cKri8uheqCjwrrxcGxpES2iUGL70HgSjgOIIZSrK8HvQfaeP2sIhpI+MGXYdHyUy34B4zC56Vv39LgMbB0EPnmxRskppHerSNAheUi0CUkHD5y4HMirgOU8Fx+jHr/uga5E5l1dFyySQBOXR52Fw7K4s+XU/iQyz+BBGVwDqETQ7bYD8JPPC1y57rjHdU4DPZkcg/PVjpYqX6ULeQFdLyM/N6AYbwaKvcpu+FNjBnpIyn5ExNkuo3M7h1uQZP3EpR14v8a5SNUbfbeMN9dVU/r/rndYOH2m99IwyfFm2bBrBk0uDKDfniaLL4lRjamnhtE3FIOvbrs/SsEkEUZI4Vw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=24xG2VvIazk9jSa/Kas2scJyAXkVWTaCzXK/E/wPriw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 765978455; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Aug 2026 15:51:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wx52n-00000005gDJ-2lko;
 Thu, 20 Aug 2026 17:51:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org,  Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20260820115408.3943622-1-thomas.devoogdt@barco.com> (Thomas
 Devoogdt's message of "Thu, 20 Aug 2026 13:54:08 +0200")
References: <20260820115408.3943622-1-thomas.devoogdt@barco.com>
Date: Thu, 20 Aug 2026 17:51:05 +0200
Message-ID: <87cxvchjti.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: fix
 automake-1.18 command not found
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

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > The tarball published on
 > https://xorg.freedesktop.org/archive/individual/xserver/ ships a
 > pre-generated build system produced with automake 1.18. Buildroot only
 > provides automake 1.16, so the shipped Makefile.in files are unusable and
 > the build fails when they are regenerated:

 > ```
 >  cd ../../../.. && /bin/bash /home/thomas/buildroot/output/build/xserver_xorg-server-21.1.23/missing automake-1.18 --foreign hw/xfree86/drivers/modesetting/Makefile
 > /home/thomas/buildroot/output/build/xserver_xorg-server-21.1.23/missing: line 85: automake-1.18: command not found
 > WARNING: 'automake-1.18' is missing on your system.

Given the version number I take it this is 2025.02.15 or 2025.02.16?

I cannot reproduce it here. Such automake invocations normally happen if
the Makefile.am is newer than Makefile.in, which is not the case for
21.1.23:

stat xserver_xorg-server-21.1.23/hw/xfree86/drivers/modesetting/Makefil*
  File: xserver_xorg-server-21.1.23/hw/xfree86/drivers/modesetting/Makefile.am
  Size: 2349            Blocks: 8          IO Block: 4096   regular file
Device: 253,1   Inode: 9050823     Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/    peko)   Gid: ( 1000/    peko)
Access: 2026-08-20 17:32:36.099831959 +0200
Modify: 2026-06-02 02:10:30.000000000 +0200
Change: 2026-08-20 17:32:26.035472398 +0200
 Birth: 2026-08-20 17:32:25.903467683 +0200
  File: xserver_xorg-server-21.1.23/hw/xfree86/drivers/modesetting/Makefile.in
  Size: 36861           Blocks: 72         IO Block: 4096   regular file
Device: 253,1   Inode: 9050824     Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/    peko)   Gid: ( 1000/    peko)
Access: 2026-08-20 17:32:36.099831959 +0200
Modify: 2026-06-02 02:10:40.000000000 +0200
Change: 2026-08-20 17:32:26.035472398 +0200
 Birth: 2026-08-20 17:32:25.903467683 +0200

Do you have any local patches modifying
hw/xfree86/drivers/modesetting/Makefile.am without also patching the
Makefile.in?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
