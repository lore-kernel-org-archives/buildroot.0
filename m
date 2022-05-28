Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B958C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C6DF408E8;
	Sat, 28 May 2022 19:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vQXHUwSLLw1; Sat, 28 May 2022 19:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3187404ED;
	Sat, 28 May 2022 19:34:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A259A1BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 913F884633
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3Zthye4tvcU for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:34:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96BC384632
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:34:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C6733E0002;
 Sat, 28 May 2022 19:34:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nv2Cz-004Kaj-Uc; Sat, 28 May 2022 21:34:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <17102_1652250198_627B5656_17102_437_1_abf36ee4172876cd86eaa1ce6691ddca377f8b0b.1652250196.git.yann.morin@orange.com>
Date: Sat, 28 May 2022 21:34:45 +0200
In-Reply-To: <17102_1652250198_627B5656_17102_437_1_abf36ee4172876cd86eaa1ce6691ddca377f8b0b.1652250196.git.yann.morin@orange.com>
 (yann morin's message of "Wed, 11 May 2022 08:23:16 +0200")
Message-ID: <877d658n8q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: explicitly do not
 download package withtout source
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

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Recent commit f0c7cb01a960 (package/pkg-download: do not try to vendor
 > _EXTRA_DOWNLOADS) got last-minute changes when applied, which changed
 > the expected behaviour for packages that do not have a main download.

 > Before f0c7cb01a960, the dl-wrapper would not even be called for those
 > packages, and the original patch that was sent also avoided downloading
 > such packages, but f0c7cb01a960 now causes the dl-wrapper to be called.

 > It is however an accident that the dl-wrapper does not fail. Indeed, it
 > is expected to fail if no download was successful; we pass no URI, so
 > the dl-wrapper should have failed, as it basically does:

 >     download_and_check=0
 >     for uri in "${uris[@]}"; do
 >         ...
 >     done
 >     if [ "${download_and_check}" -eq 0 ]; then
 >         exit 1
 >     fi

 > However, it does not even go that far...

 > Even though there is no output file, we still pass the path to the
 > package output directory as the output path. So, to avoid downloading
 > files already present, the wrapper checks if the output file exists,
 > and checks its hash:

 >     if [ -e "${output}" ]; then
 >         if support/download/check-hash ${quiet} "${hfile}" "${output}" ...
 >             exit 0
 >         ...
 >     fi

 > The output path does exist now, because we explicitly create it just
 > before calling the wrapper, because that's where we also locate the
 > lockfile.

 > So it ends up trying to validate the hash of a directory, but it fails
 > to, as there is indeed no hash file for that package. And a missing hash
 > file is just a warning, not an error, which makes the download actually
 > a success...

 > So, this is currently working, and this is by pure luck.

 > However, there is a potential issue: if a target package is a virtual
 > package, but the host package is a real package, e.g. the same foo.mk
 > does (or the other way around):

 >     HOST_FOO_VERSION = 1.2.3
 >     HOST_FOO_SITE = http://example.net/
 >     $(eval $(virtual-package))
 >     $(eval $(host-generic-package))

 > If there is a hash file to validate the host download, then the current
 > situation will cause a failure, because there would be a hash file, but
 > no hash for the output path of the target variant, which would then be
 > a hard-error.

 > So, revert to the behaviour from before f0c7cb01a960, where no download
 > is attempted for a package without a source (really, without a main
 > download, now).

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
