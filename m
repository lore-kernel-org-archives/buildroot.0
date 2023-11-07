Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45075C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 10:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6F0A4213D;
	Tue,  7 Nov 2023 10:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6F0A4213D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xzm500KebwdX; Tue,  7 Nov 2023 10:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EC7642013;
	Tue,  7 Nov 2023 10:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EC7642013
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A76BE1BF370
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 10:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FE6E42012
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 10:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FE6E42012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJPOI2hITIOK for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 10:46:20 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6445F42011
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 10:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6445F42011
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC4D41C0007;
 Tue,  7 Nov 2023 10:46:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0Jb6-00H6BS-0n;
 Tue, 07 Nov 2023 11:46:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1699297749.git.yann.morin.1998@free.fr>
 <e9097a9727dce27b9124e803a6c0a58091ec3e34.1699297749.git.yann.morin.1998@free.fr>
Date: Tue, 07 Nov 2023 11:46:16 +0100
In-Reply-To: <e9097a9727dce27b9124e803a6c0a58091ec3e34.1699297749.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 6 Nov 2023 20:09:12 +0100")
Message-ID: <87a5rpyh6v.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/3 v2] support/download: teach dl-wrapper
 to handle more than one hash file
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
 > directory, alongside the .mk file. Those hash files are thus bundeld
 > with Buildroot.

 > This implies that only what's known to Buildroot can ever get into those
 > hash files. For packages where the version is fixed (or a static
 > choice), then we can carry hashes for those known versions.

 > However, we do have a few packages for which the version is a free-form
 > entry, where the user can provide a custom location and/or version. like
 > a custom VCS tree and revision, or a custom tarball URL. This means that
 > Buildroot has no way to be able to cary hashes for such custom versions.

 > This means that there is no integrity check that what was downloaded is
 > what was expected. For a sha1 in a git tree, this is a minor issue,
 > because the sha1 by itself is already a hash of the expected content.
 > But for custom tarballs URLs, or for a tag in a VCS, there is indeed no
 > integrity check.

 > Buildroot can't provide such hashes, but interested users may want to
 > provide those, and currently there is no (easy) way to do so.

 > So, we need our download helpers to be able to accept more than one hash
 > file to lookup for hashes.

 > Extend the dl-wrapper and the check-hash helpers thusly, and update the
 > legal-info accordingly.

 > Note that, to be able to pass more than one hash file, we also need to
 > re-order the arguments passed to support/download/check-hash, which also
 > impies some shuffling in the three places it is called:
 >   - 2 in dl-wrapper
 >   - 1 in the legal-info infra

 > That in turn also requires that the legal-license-file macro args get
 > re-ordered to have the hash file last; we take the opportunity to also
 > move the HOST/TARGET arg to be first, like in the other legal-info
 > macros.

 > Reported-by: "Martin Zeiser (mzeiser)" <mzeiser@cisco.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

 > ---
 > Changes v1 -> v2:
 >   - restore legal-info  (Peter K.)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
