Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFB0C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 10:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D58D342158;
	Tue,  7 Nov 2023 10:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D58D342158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhH40N4wP4X5; Tue,  7 Nov 2023 10:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25B2E42150;
	Tue,  7 Nov 2023 10:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25B2E42150
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88BFF1BF370
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 10:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EE8E61125
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 10:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EE8E61125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6E2DIz_XZo8 for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 10:47:50 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1E5160B15
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 10:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1E5160B15
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A8096000E;
 Tue,  7 Nov 2023 10:47:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0JcW-00H6DO-2a;
 Tue, 07 Nov 2023 11:47:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1699297749.git.yann.morin.1998@free.fr>
 <31d36b28454ccf0134e74f2a4b9b11a41a6fc6e5.1699297749.git.yann.morin.1998@free.fr>
Date: Tue, 07 Nov 2023 11:47:44 +0100
In-Reply-To: <31d36b28454ccf0134e74f2a4b9b11a41a6fc6e5.1699297749.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 6 Nov 2023 20:09:13 +0100")
Message-ID: <875y2dyh4f.fsf@48ers.dk>
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

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
