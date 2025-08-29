Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720C8CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 19:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 250D241496;
	Fri, 29 Aug 2025 19:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_HMm0jw5_E5; Fri, 29 Aug 2025 19:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 567F2413D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 567F2413D6;
	Fri, 29 Aug 2025 19:36:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0946D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 19:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6B626174B
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 19:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3o5JrGwQq79 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 19:36:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5153D6174A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5153D6174A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5153D6174A
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 19:36:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2076958206; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 19:36:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us4tn-00D0qL-2H;
 Fri, 29 Aug 2025 21:36:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  =?utf-8?Q?Andr=C3=A9?=
 Zwing <nerv@dawncrow.de>
References: <20250829143407.1970907-1-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 21:36:35 +0200
In-Reply-To: <20250829143407.1970907-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 29 Aug 2025 16:34:05
 +0200")
Message-ID: <871pothqd8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Ode8+pTdPBbQd0vlUQOA1zL9L+90pVFcAGEUoTL9PMpRggboOCkLiOLIZKkTY3h+jX8Jpr/j3MkYGO5ZECpAlCqj4On9i4fCZqQVsj8J/l3A8CtEsLZt59Sy0lshz60H5/ffy9g/jX32oBeT1UptPx2yAZvqYn+sPhb+AzBOo43rMli/tsLDbJH75L5eKgVgXE6NtJVO/P6cPMVdKReXY8lJBaQ6xMGYlGKPLNLAog/vrzGoi7EcfyJ4YDeCERlprgBKRg5l6HlYvtBk5VLC9FDwOGi/bPZKgHpBobyKLFxmEL+TrOJrEceGRAtss0d6EbY2OuXR+OX1Ae3mFp+xoA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=DgVyZ9U2ovMwaE/uQsIimnZBPld+91ZYQzPxZ/7K56M=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Ode8+pTd
Subject: Re: [Buildroot] [PATCH 1/2] package/libkrb5: fix GCC 15.x build
 issues
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

 > Backport upstream commit 4b9d7f7c107f01a61600fddcd8cde3812d0366a2
 > would allow to solve GCC 15.x issues, but it's a 313 KB patch. So
 > instead, let's build with -std=gnu99. It requires a bit of
 > reorganization on how CFLAGS are handled.

 > Fixes:

 >   http://autobuild.buildroot.net/results/4460089f5989277e6143f6e3d66f71371913ee4b/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
