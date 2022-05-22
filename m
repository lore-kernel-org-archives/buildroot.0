Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB1AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A771417DA;
	Sun, 22 May 2022 10:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t81oWqnA4fDW; Sun, 22 May 2022 10:31:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8FC3410D6;
	Sun, 22 May 2022 10:31:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82E051BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E40B40122
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:31:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RyE93CJ6UeP9 for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:31:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11CEA400B8
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:31:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33C2840002;
 Sun, 22 May 2022 10:31:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nsirU-00BmLf-7e; Sun, 22 May 2022 12:31:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
References: <20220419111714.1647112-1-marcus.hoffmann@othermo.de>
Date: Sun, 22 May 2022 12:30:59 +0200
In-Reply-To: <20220419111714.1647112-1-marcus.hoffmann@othermo.de> (Marcus
 Hoffmann's message of "Tue, 19 Apr 2022 13:17:13 +0200")
Message-ID: <875ylxzwnw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/gzip: security bump to 1.12
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

>>>>> "Marcus" == Marcus Hoffmann <marcus.hoffmann@othermo.de> writes:

 > Fixes the following security issues:
 > CVE-2022-1271: arbitrary-file-write vulnerability

 > zgrep applied to a crafted file name with two or more newlines
 > can no longer overwrite an arbitrary, attacker-selected file.
 > [bug introduced in gzip-1.3.10]

 > https://www.openwall.com/lists/oss-security/2022/04/07/8

 > Other changes:

 > ** Changes in behavior

 >   'gzip -l' no longer misreports file lengths 4 GiB and larger.
 >   Previously, 'gzip -l' output the 32-bit value stored in the gzip
 >   header even though that is the uncompressed length modulo 2**32.
 >   Now, 'gzip -l' calculates the uncompressed length by decompressing
 >   the data and counting the resulting bytes.  Although this can take
 >   much more time, nowadays the correctness pros seem to outweigh the
 >   performance cons.

 >   'zless' is no longer installed on platforms lacking 'less'.

 > ** Bug fixes

 >   zgrep now names input file on error instead of mislabeling it as
 >   "(standard input)", if grep supports the GNU -H and --label options.

 >   'zdiff -C 5' no longer misbehaves by treating '5' as a file name.
 >   [bug present since the beginning]

 >   Configure-time options like --program-prefix now work.

 > Release Announcement:
 > https://lists.gnu.org/r/bug-gzip/2022-04/msg00011.html

 > Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
