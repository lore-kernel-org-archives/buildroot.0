Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B23C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 20:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9876760D66;
	Sat,  1 Jan 2022 20:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJDzRn1rSLTp; Sat,  1 Jan 2022 20:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDCD560B6C;
	Sat,  1 Jan 2022 20:10:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D52C81BF479
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 20:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1E3060B6C
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 20:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id togGT1iCbIDf for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 20:10:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FAEE60AB1
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 20:10:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 72AA120003;
 Sat,  1 Jan 2022 20:09:58 +0000 (UTC)
Date: Sat, 1 Jan 2022 21:09:57 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220101210957.0fde77e5@windsurf>
In-Reply-To: <9c4d8993-46b2-8f1a-6aa3-bdd9957b783c@benettiengineering.com>
References: <20210930231424.249681-1-giulio.benetti@benettiengineering.com>
 <20220101115058.0515c8d9@windsurf>
 <9c4d8993-46b2-8f1a-6aa3-bdd9957b783c@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [buildroot-test] scripts/autobuild-run: extend
 timeout from 120 to 180 minutes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 1 Jan 2022 16:10:09 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > Please
> > note that this HUNG_BUILD_TIMEOUT value is the per-step timeout: it
> > verifies that one step of one particular package doesn't take more than
> > 120 minutes.  
> 
> Ah, I thought the entire build, but that makes no sense since some build 
> can take way more than 2 hours.

There used to be a global timeout for the build, but we had false
positives when really large configurations were built. Due to this,
commit 86892c63f754b4f6c9a4a517fde30160127b3506 change to a more fine
grained timeout: we monitor the file build-time.log (which gets
appended everytime the step of a package starts or ends), and we time
out after HUNG_BUILD_TIMEOUT minutes if that file hasn't changed;

> > Did you identify that the python-uvloop and python-lxml packages really
> > took more than 2 hours to build? I did see at
> > http://autobuild.buildroot.net/?status=TIMEOUT those timeouts dating
> > back from ~November. Did you reproduce the issue, and verified that the
> > build indeed completes at some point? In general, if a simple package
> > such as python-uvloop or python-lxml takes more than 2 hours to build,
> > it means that the compiler (or linker) has gone crazy in an infinite
> > loop, and the build will in fact never finish.  
> 
> It was only my suspicious as specified in commit log. I couldn't 
> reproduce it and I thought it was due to the autobuilder's host.
> 
> And yes, now that I know it's a per-step timeout it doesn't make sense 
> at all for such little packages.

Yes, for such small packages, it clearly hints at a compiler/linker bug
that stays stuck in an infinite loop.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
