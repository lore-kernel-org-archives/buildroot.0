Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A10C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 11:29:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E70C660F35
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 11:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E70C660F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB94C60B79;
	Sat,  9 Oct 2021 11:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apfkNvmxZPyD; Sat,  9 Oct 2021 11:29:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A2D660B5D;
	Sat,  9 Oct 2021 11:29:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 516AA1BF36E
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 11:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40B8860B58
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 11:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uC-VGZlQTdKC for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 11:29:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40F6160ADB
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 11:29:00 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1EEFC100005;
 Sat,  9 Oct 2021 11:28:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mZAXB-0005jk-BR; Sat, 09 Oct 2021 13:28:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
References: <914a4374-e517-b730-c45f-f37ec8147649@grenoble.cnrs.fr>
Date: Sat, 09 Oct 2021 13:28:57 +0200
In-Reply-To: <914a4374-e517-b730-c45f-f37ec8147649@grenoble.cnrs.fr> (Edgar
 Bonet's message of "Tue, 5 Oct 2021 19:17:58 +0200")
Message-ID: <87fstav3ly.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Edgar" == Edgar Bonet <bonet@grenoble.cnrs.fr> writes:

 > Traditional VT-10x terminals (and their emulators) have a "magic
 > margins" feature that enables the last character position to be updated
 > without scrolling the screen: whenever a character is printed on the
 > last column, the cursor stays over the character, instead of moving to
 > the next line.

 > The Busybox shell, ash, attempts to defeat this feature by printing
 > CF,LF right after echoing a character to the last column.[1] This
 > doesn't play well with emulator.py. The run() method of the Emulator
 > class captures the output of the emulated system and assumes the first
 > line it reads is the echo of the command, and all subsequent lines are
 > the command's output. If the line made by the command + shell prompt is
 > longer than 80 characters, then it is echoed as two or more lines, and
 > all but the first one are mistaken for the command's output.

 > We fix this by telling the emulated system that we are using an
 > ultra-wide terminal with 29999 columns. Larger values would be ignored
 > and replaced by the default, namely 80 columns.[2]

 > [1] https://git.busybox.net/busybox/tree/libbb/lineedit.c?h=1_34_0#n412
 > [2] https://git.busybox.net/busybox/tree/libbb/xfuncs.c?h=1_34_0#n258

 > Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Co-authored-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 >  support/testing/infra/emulator.py | 2 ++
 >  1 file changed, 2 insertions(+)

 > Note that I tested that the command

 >     stty columns 29999

 > does fix the wrapping behavior on an actual board, while using a serial
 > connection. I did not test the script emulator.py, as I am unfamiliar
 > with the testing infrastructure. Would someone volunteer to do that
 > test?

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
