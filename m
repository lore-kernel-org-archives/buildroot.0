Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFE7C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 13:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42C2F421B4;
	Fri, 10 Nov 2023 13:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42C2F421B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 348q86j2QYSW; Fri, 10 Nov 2023 13:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 856B14219E;
	Fri, 10 Nov 2023 13:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 856B14219E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B64B1BF3E1
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 13:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74D6C60FCE
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 13:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74D6C60FCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GWoyGg8rm9Qc for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 13:36:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 724FC60B99
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 13:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 724FC60B99
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CD941C0015;
 Fri, 10 Nov 2023 13:36:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r1Rgk-003zpO-2h;
 Fri, 10 Nov 2023 14:36:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1699297749.git.yann.morin.1998@free.fr>
 <31d36b28454ccf0134e74f2a4b9b11a41a6fc6e5.1699297749.git.yann.morin.1998@free.fr>
Date: Fri, 10 Nov 2023 14:36:46 +0100
In-Reply-To: <31d36b28454ccf0134e74f2a4b9b11a41a6fc6e5.1699297749.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 6 Nov 2023 20:09:13 +0100")
Message-ID: <878r75logh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/3 v2] package/pkg-download: lookup hash
 files in global-patch-dir
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
Cc: "Martin Zeiser \(mzeiser\)" <mzeiser@cisco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, we expect and only use hash files that lie within the package
 > directory, alongside the .mk file. Those hash files are thus bundled
 > with Buildroot.

 > This implies that only what's known to Buildroot can ever get into those
 > hash files. For packages where the version is fixed (or a static
 > choice), then we can carry hashes for those known versions.

 > However, we do have a few packages for which the version is a free-form
 > entry, where the user can provide a custom location and/or version.  like
 > a custom VCS tree and revision, or a custom tarball URL. This means that
 > Buildroot has no way to be able to cary hashes for such custom versions.

 > This means that there is no integrity check that what was downloaded is
 > what was expected. For a sha1 in a git tree, this is a minor issue,
 > because the sha1 by itself is already a hash of the expected content.
 > But for custom tarballs URLs, or for a tag in a VCS, there is indeed no
 > integrity check.

 > Buildroot can't provide such hashes, but interested users may want to
 > provide those, and currently there is no (easy) way to do so.

 > We leverage the existng global-patch-dir mechanism to look for extra
 > hash files. We use the same heuristic that is used for bundled hash
 > files, and for each global patch directory <dir>, we use the first file
 > to exist among:
 >  1. look into <dir>/<package>/<version>/<package>.hash
 >  2. look into <dir>/<package>/<package>.hash

 > Reported-by: "Martin Zeiser (mzeiser)" <mzeiser@cisco.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > ---
 > Changes v1 -> v2:
 >   - drop <dir>/all.hash

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
