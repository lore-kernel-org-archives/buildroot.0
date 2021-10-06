Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED7CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 07:11:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55CC960FD8
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 07:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55CC960FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0138660E68;
	Wed,  6 Oct 2021 07:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CYKlu8i0Ub7c; Wed,  6 Oct 2021 07:11:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D36360E64;
	Wed,  6 Oct 2021 07:11:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 683751BF40B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 07:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5792660E64
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 07:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id unICcuUgcgdL for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 07:11:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27152606BB
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 07:11:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id D79EA100002;
 Wed,  6 Oct 2021 07:11:04 +0000 (UTC)
Date: Wed, 6 Oct 2021 09:11:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211006091104.0e61efd6@windsurf>
In-Reply-To: <20211005200111.GC2081069@scaer>
References: <914a4374-e517-b730-c45f-f37ec8147649@grenoble.cnrs.fr>
 <20211005200111.GC2081069@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/infra/emulator.py:
 prevent the commands from wrapping
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Tue, 5 Oct 2021 22:01:11 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2021-10-05 19:17 +0200, Edgar Bonet spake thusly:
> > Traditional VT-10x terminals (and their emulators) have a "magic
> > margins" feature that enables the last character position to be updated
> > without scrolling the screen: whenever a character is printed on the
> > last column, the cursor stays over the character, instead of moving to
> > the next line.
> > 
> > The Busybox shell, ash, attempts to defeat this feature by printing
> > CF,LF right after echoing a character to the last column.[1] This
> > doesn't play well with emulator.py. The run() method of the Emulator
> > class captures the output of the emulated system and assumes the first
> > line it reads is the echo of the command, and all subsequent lines are
> > the command's output. If the line made by the command + shell prompt is
> > longer than 80 characters, then it is echoed as two or more lines, and
> > all but the first one are mistaken for the command's output.
> > 
> > We fix this by telling the emulated system that we are using an
> > ultra-wide terminal with 29999 columns. Larger values would be ignored
> > and replaced by the default, namely 80 columns.[2]
> > 
> > [1] https://git.busybox.net/busybox/tree/libbb/lineedit.c?h=1_34_0#n412
> > [2] https://git.busybox.net/busybox/tree/libbb/xfuncs.c?h=1_34_0#n258  
> 
> Woot! Very, very good commit log, thanks!

And very good investigation too!

> The thing is, as Thomas said, he had the issue with new tests he was
> adding to the infra; we currently do not have tests with commands that
> are too long to be wrapped.
> 
> Thomas?

We do:

  ./support/testing/tests/package/test_python_flask_expects_json.py

is such a test. The test is doing:

        self.assertEqual(output[-1], str(expects))

instead of:

        self.assertEqual(output[0], str(expects))

precisely to work around this issue. I.e instead of getting the first
line of the output (which would be the end of the command being
executed), I test against the last line of the output. It works in my
case because I know my "interesting" output has only a single line.

So, if that test works by using output[0] instead of output[-1], then
the fix of using stty columns 29999 would be confirmed to work!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
