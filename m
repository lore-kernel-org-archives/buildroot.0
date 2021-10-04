Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48558C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:23:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B342361248
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B342361248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6046740555;
	Mon,  4 Oct 2021 20:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XYj6u5FO9Ct0; Mon,  4 Oct 2021 20:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3CBB40545;
	Mon,  4 Oct 2021 20:23:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90C201BF215
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81032606A9
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qA57xG4WfOf for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:22:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 500CB60668
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:22:59 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4790FFF805;
 Mon,  4 Oct 2021 20:22:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXUUC-0000b9-JJ; Mon, 04 Oct 2021 22:22:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
References: <20210913072942.30109-1-patrickdepinguin@gmail.com>
Date: Mon, 04 Oct 2021 22:22:56 +0200
In-Reply-To: <20210913072942.30109-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Mon, 13 Sep 2021 09:29:41 +0200")
Message-ID: <87pmskfskf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual/using-buildroot-debugger:
 suggest '-ix' iso '-x' when loading gdbinit
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > A gdbinit file passed via '-x' will be read _after_ parsing any
 > object/core file passed on the command-line. In cross-compilation context,
 > this is particularly a problem when loading a core file, because without the
 > 'sysroot' specified in the gdbinit file, it will give a lot of warnings,
 > like:

 >     warning: .dynamic section for "/lib/libstdc++.so.6" is not at the expected address (wrong library or version mismatch?)
 >     warning: .dynamic section for "/lib/librt.so.1" is not at the expected address (wrong library or version mismatch?)
 >     warning: .dynamic section for "/lib/libm.so.6" is not at the expected address (wrong library or version mismatch?)
 >     warning: .dynamic section for "/lib/libgcc_s.so.1" is not at the expected address (wrong library or version mismatch?)
 >     warning: .dynamic section for "/lib/libc.so.6" is not at the expected address (wrong library or version mismatch?)
 >     warning: .dynamic section for "/lib/ld-linux.so.2" is not at the expected address (wrong library or version mismatch?)
 >     warning: .dynamic section for "/lib/libanl.so.1" is not at the expected address (wrong library or version mismatch?)
 >     warning: .dynamic section for "/lib/libdl.so.2" is not at the expected address (wrong library or version mismatch?)
 >     warning: .dynamic section for "/lib/libpthread.so.0" is not at the expected address (wrong library or version mismatch?)
 >     warning: .dynamic section for "/usr/lib/libz.so.1" is not at the expected address (wrong library or version mismatch?)
 >     warning: .dynamic section for "/lib/libnss_files.so.2" is not at the expected address (wrong library or version mismatch?)

 >     warning: Could not load shared library symbols for 17 libraries, e.g. [...]
 >     Use the "info sharedlibrary" command to see the complete listing.
 >     Do you need "set solib-search-path" or "set sysroot"?

 > In contrast, the '-ix' option will load the specified gdbinit file _before_
 > parsing object/core files. This will remove said warnings.

 > See also: https://sourceware.org/bugzilla/show_bug.cgi?id=28330

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
