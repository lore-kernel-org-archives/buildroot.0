Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DF5C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:55:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7E8C6139F
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7E8C6139F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAFC942793;
	Mon,  4 Oct 2021 11:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awc-Y7LtaB1A; Mon,  4 Oct 2021 11:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E2B542725;
	Mon,  4 Oct 2021 11:55:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D57801BF34A
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3CE1400CB
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzdqwEyIMFYf for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 11:55:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B22BD40486
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 11:55:25 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id B1A2E10000E;
 Mon,  4 Oct 2021 11:55:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXMYz-0001yL-Kz; Mon, 04 Oct 2021 13:55:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
References: <20210919141053.3afc7389@windsurf>
 <d2a735d1-aadb-2c28-72f3-babef83448cc@grenoble.cnrs.fr>
 <11632800-793a-6d2d-8ee4-0182092c8f35@grenoble.cnrs.fr>
Date: Mon, 04 Oct 2021 13:55:21 +0200
In-Reply-To: <11632800-793a-6d2d-8ee4-0182092c8f35@grenoble.cnrs.fr> (Edgar
 Bonet's message of "Mon, 20 Sep 2021 10:55:30 +0200")
Message-ID: <878rz9j97a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Issue with capture of emulator output in runtime
 test infra
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

 > Hello!
 > Yesterday I wrote:
 >> Is it just a coincidence that the line got wrapped at exactly 80
 >> columns [...]

 > I think I found where the spurious line break comes from. Busybox's
 > lineedit library has a trick to work around the VT100's automargin
 > feature.[1] When a character is printed on the last column of the
 > terminal, lineedit adds a carriage return in order to force the cursor
 > to the next line:

 > 		/* we go to the next line */
 > #if HACK_FOR_WRONG_WIDTH
 > 		/* This works better if our idea of term width is wrong
 > 		 * and it is actually wider (often happens on serial lines).
 > 		 * Printing CR,LF *forces* cursor to next line.
 > 		 * OTOH if terminal width is correct AND terminal does NOT
 > 		 * have automargin (IOW: it is moving cursor to next line
 > 		 * by itself (which is wrong for VT-10x terminals)),
 > 		 * this will break things: there will be one extra empty line */
 > 		puts("\r"); /* + implicit '\n' */

 > There doesn't seem to be a way to override this behavior, but we could
 > make busybox believe our terminal is ultra wide. Busybox gets its idea
 > of the terminal width from the kernel, via the TIOCGWINSZ ioctl[2]. The
 > kernel within the emulator may not be able to know the host's terminal
 > width, in which case setting the dimensions attribute in pexpect.spawn()
 > may not have any effect. We can, however, override the terminal width
 > using the "COLUMNS" environment variable[3], but beware that values
 > larger than 29999 are ignored.

29999 chars should be enough for anybody (tm) ;)

Care to send a patch for this?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
