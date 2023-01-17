Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759CFC3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A239404A3;
	Tue, 17 Jan 2023 09:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A239404A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ERz545thUNbx; Tue, 17 Jan 2023 09:27:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6601B40364;
	Tue, 17 Jan 2023 09:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6601B40364
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 204591BF2B1
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08B0981FBB
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08B0981FBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id re2p9kPb1v0M for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:27:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B957D81FB2
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B957D81FB2
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:27:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 194B0100007;
 Tue, 17 Jan 2023 09:27:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pHiFS-008QxF-4O; Tue, 17 Jan 2023 10:27:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230116105032.1890904-1-peter@korsgaard.com>
Date: Tue, 17 Jan 2023 10:27:18 +0100
In-Reply-To: <20230116105032.1890904-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 16 Jan 2023 11:50:31 +0100")
Message-ID: <875yd5fr49.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/go: set GOCACHE for download
 post-process
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
Cc: Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The go mod vendor call in support/download/go-post-process accesses the go
 > cache, so pass GOCACHE= in the environment to ensure our cache directory is
 > used.

 > The go cache defaults to ~/.cache/go-build if not set, so this fixes builds
 > where that location (or GOCACHE if set in the environment) is not writable:

 > rm -rf ~/.cache/go-build
 > chmod -w ~/.cache
 > make docker-compose-source
 > ..
 > failed to initialize build cache at /home/peko/.cache/go-build: mkdir /home/peko/.cache/go-build: permission denied
 > make[1]: *** [package/pkg-generic.mk:189:
 > /home/peko/source/buildroot/output/build/docker-compose-2.14.0/.stamp_downloaded]
 > Error 1

 > We use two different cache directories for target and host builds, but the
 > download/vendoring should be independent of the architecture, so use the
 > target variant even for host-only packages for simplicity.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
