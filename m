Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50465C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 10:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFA2C849AF;
	Sat, 28 May 2022 10:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2LXoZdSzm9Qo; Sat, 28 May 2022 10:54:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29901849A4;
	Sat, 28 May 2022 10:54:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD2201BF4D7
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 10:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A90B640B5E
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 10:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sNAJ5t1-xhxO for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 10:54:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4E954019A
 for <buildroot@buildroot.org>; Sat, 28 May 2022 10:54:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 51BA3E0005;
 Sat, 28 May 2022 10:54:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuu5q-003rw9-Di; Sat, 28 May 2022 12:54:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
References: <20220512160116.2011627-1-arnout@mind.be>
Date: Sat, 28 May 2022 12:54:50 +0200
In-Reply-To: <20220512160116.2011627-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Thu, 12 May 2022 18:01:12 +0200")
Message-ID: <87o7zi9bb9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] package/gnutls: disable library search
 in /usr/lib
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > gnutls's configure script has a weird approach where it first searches
 > for dependent libraries in the path specified by --prefix, before
 > searching in the default search path. Since we set --prefix to /usr,
 > and it doesn't take into account DESTDIR (which is anyway not set at
 > configure time), that means it will first search /usr/lib before
 > searching $(STAGING_DIR)/usr/lib.

 > Ideally, this would be fixed in the configure script itself. However,
 > the m4 file that does this is pretty complex, it's not immediately clear
 > where to add $DESTDIR. In addition it comes from gnulib which is a
 > somewhat annoying upstream.

 > Therefore, instead, bypass the prefix lookup with
 > --without-libfoo-prefix. Note that we could set
 > --with-libfoo-prefix=$(STAGING_DIR)/usr (the latter is already done for
 > librt and libpthread), but that's pretty pointless -
 > --without-libfoo-prefix in fact reverts to what should have been done in
 > the first place, i.e. use the toolchain search path.

 > Add --without-libfoo-prefix for all options defined in configure (found
 > with ./configure --help | grep without-.*-prefix). Most of these are
 > only used in tests (e.g. libcrypto) or even not at all (e.g. libiconv),
 > but it's fairly hard to discover this and to be sure that they are
 > indeed not needed, so better pass all of them.

 > Remove the now-redundant arguments for librt and libpthread.

 > Add a comment to remind people to revisit these when bumping the
 > version.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > This is for stable, but need to check if the same prefix options exist
 > in 3.7.3.

I instead bumped 2022.02.x to 3.7.4 as it contains fixes and applied the
entire series to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
