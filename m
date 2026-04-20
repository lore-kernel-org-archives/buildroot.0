Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCFEF5581D
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 11:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C01182BED;
	Mon, 20 Apr 2026 11:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h57pZEb6Hibw; Mon, 20 Apr 2026 11:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A931882443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776685701;
	bh=XsLMUk4CRnj/9niNNhXk+9FfvzbycO1eIPx9bSNBu4s=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=VsYkXAe1lWlEkcq9Yoom8lfnvnOK2JVt4rtKJV2xRgI/XElbeBuUJiMT4ino8VYFo
	 OU+Jr1sQP/JXpZm+4H7SPrPewELas10PXp8op4Cfb0jtoU8XBtnE7xGyI9iwzp+cIe
	 Zax3IwM40sXgy86TGu2Qnz7XGIIKFp8NsuFcG/S1mA7UtTQ84vMYtD6wZg7w+/p07n
	 OhQ5uDcqH4uPt7e+nA6cjuTgl/NJN+/vUX2Yro2r2wUqByB1kAvrPn4L7Z/dz0Ot7i
	 +Gdb/+2thbGC6K/2pVegPIvtc0D5ChX1Wi+kMZbFJIsNzr0WtrFOJwWXdJlMemOZrQ
	 Kq1G9hfImfVDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A931882443;
	Mon, 20 Apr 2026 11:48:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E329B259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 11:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D515D8246D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 11:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVzyeSdYT-4E for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 11:48:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCCEB82443
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCCEB82443
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCCEB82443
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 11:48:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 49F914E426AF
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 11:48:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1FE2B5FFA5;
 Mon, 20 Apr 2026 11:48:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44FA7104606C4; 
 Mon, 20 Apr 2026 13:48:12 +0200 (CEST)
Date: Mon, 20 Apr 2026 13:48:11 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <aeYSHz0oMG2Lx3km@windsurf>
References: <69e59cd7.050a0220.1ab584.974e@mx.google.com>
 <aeXymikPfNmmnA67@yd-6wlzhs3> <87fr4qhreo.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fr4qhreo.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1776685694; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=59jPRVaNZRc2H3OThUR2Iii0Y1ZA6o9Yt/+20zcBaPM=;
 b=ICK2iVU/zatdT+btW0KgLGrukIOpoos/c2giMCfQwNf/MYyUouK1cby/pkISEyjX6ovfag
 hrjQ3UGFg+0Nn1JOtj5lnQED7o1KRtDwpJqsXiRcFHdMoESHMrSZh9HvkEuUfGA5UciYPr
 1t3WeZAf4tyQ7aiJVpbRd2EWeH7dwDBIrs69kfmYifsA6l+tCj2AzoEgh4orCLKzFwgQsZ
 JxxErlqtI+9PyB7ejIRt/j5kia9tBI2Xo5q+H/9oqjD5xbep9ngry0/ZxGlqL6QzilQ7vf
 1dLs1gZ9iefWA2di+XAywl/CbRujku9IYI5fso2L1oBtABOP0w+Kh2xjInuC7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ICK2iVU/
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2026-04-19
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
Cc: Romain Naour <romain.naour@smile.fr>, yann.morin@orange.com,
 buildroot <buildroot@buildroot.org>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Apr 20, 2026 at 12:12:15PM +0200, Peter Korsgaard wrote:

> Yes, I noticed the same and mailed Thomas as I was away on holiday last
> week. I'm back now but with a big email backlog, and I will take a look
> once I get a bit of time unless someone else beats me to it.

We figured this out with Titouan earlier today. The "next" branch was
still referenced in the list of branches in
buildroot-test/web/branches, and the script takes the "next" branch as
the baseline when doing this "outdated packages" check. But since next
no longer exists on the main Buildroot Git repo, it was using whatever
old next branch was there.

Immediate fix: drop next from buildroot-test/web/branches (which is
the file telling the autobuilders which branches to test).

Long-term fix: somehow automate this.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
