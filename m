Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E397C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:25:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4187B61452
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4187B61452
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12B1183640;
	Mon,  4 Oct 2021 20:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8baj1AZxioTv; Mon,  4 Oct 2021 20:25:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6146F835D9;
	Mon,  4 Oct 2021 20:25:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BD001BF215
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B47A835D9
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udUEh12oxufp for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:24:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 359AB83294
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:24:58 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C4CB4240002;
 Mon,  4 Oct 2021 20:24:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXUW7-0000jX-W8; Mon, 04 Oct 2021 22:24:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
References: <20210913072942.30109-1-patrickdepinguin@gmail.com>
 <20210913072942.30109-2-patrickdepinguin@gmail.com>
Date: Mon, 04 Oct 2021 22:24:55 +0200
In-Reply-To: <20210913072942.30109-2-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Mon, 13 Sep 2021 09:29:42 +0200")
Message-ID: <87lf38fsh4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] toolchain/helpers.mk: gdbinit: set
 auto-load-safe-path before sysroot
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > The gdbinit supplied by Buildroot does two things:
 > A. specify the sysroot where gdb can find shared libraries
 > B. mark the sysroot as a 'safe path' for its auto-load feature, to make sure
 >   that pretty printers for libstdc++.so are added automatically (see commit
 >   6fb3216a80c64c08375429d89497eaeec5622150)

 > When debugging a core file, and the gdbinit file is specified via '-x'
 > rather than '-ix', then the order of these settings matters: If you first
 > set the sysroot, then gdb will immediately start finding the shared
 > libraries it needs for the core file, detect libstdc++ and its associated
 > libstdc++-gdb.py file, then give a big warning about safe paths:

 >   warning: File ".../i686-buildroot-linux-gnu/sysroot/lib/libstdc++.so.6.0.24-gdb.py"
 >           auto-loading has been declined by your `auto-load safe-path' set
 >           to "$debugdir:$datadir/auto-load".
 >   To enable execution of this file add
 >           add-auto-load-safe-path .../i686-buildroot-linux-gnu/sysroot/lib/libstdc++.so.6.0.24-gdb.py
 >   line to your configuration file "/home/me/.gdbinit".
 >   To completely disable this security protection add
 >           set auto-load safe-path /
 >   line to your configuration file "/home/me/.gdbinit".
 >   For more information about this security protection see the
 >   "Auto-loading safe path" section in the GDB manual.  E.g., run from the shell:
 >           info "(gdb)Auto-loading safe path"

 > and the pretty printing code is not loaded. This is because the second
 > line from the gdbinit file was not yet parsed at this point.

 > By changing the order (first configuring the safe path, then setting the
 > sysroot), this issue does not appear and everything is as expected.

 > Note that when '-ix' were used instead of '-x' to pass the gdbinit file to
 > gdb, then the order would not matter, because the entire gdbinit file would
 > be parsed before considering the core file.
 > However, even though the Buildroot manual now suggests '-ix', users may not
 > have noticed this change and continue to use '-x'.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
