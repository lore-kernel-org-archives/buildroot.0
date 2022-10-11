Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B692C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 18:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AFE6418C4;
	Tue, 11 Oct 2022 18:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AFE6418C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qeagi9gXz1_t; Tue, 11 Oct 2022 18:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C195A418AD;
	Tue, 11 Oct 2022 18:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C195A418AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8ECF1BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91C7D60F91
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91C7D60F91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9itI_sOFbDs for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 18:45:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A5E760F41
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A5E760F41
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 18:45:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17277C0009;
 Tue, 11 Oct 2022 18:45:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oiKGB-00C8zC-13; Tue, 11 Oct 2022 20:45:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220925082044.3B03185FCC@busybox.osuosl.org>
Date: Tue, 11 Oct 2022 20:45:47 +0200
In-Reply-To: <20220925082044.3B03185FCC@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 25 Sep 2022 10:18:48 +0200")
Message-ID: <87o7uip5b8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/nodejs: fix 'Duplicate v8
 target errors when cross-compiling' error
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=5708c5b04f09f49a99c2c9d7a1894d24bce6a3e7
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Reported also via:
 >   https://github.com/nodejs/node/issues/37441

 > Patched in:
 >   https://github.com/minrk/node/commit/5e533cb943eef68b270f55f0cba02c0ec67c699d

 > The error is:
 > ```
 > ninja: Entering directory `out/Release'
 > ninja: error: obj.host/tools/v8_gypfiles/run_torque.ninja:1356: multiple rules generate gen/torque-generated/bit-fields.h [-w dupbuild=err]

 > make[2]: *** [Makefile:127: node] Error 1
 > make[1]: *** [package/pkg-generic.mk:293: <buildroot>/output/build/nodejs-16.15.0/.stamp_built] Error 2
 > make: *** [Makefile:84: _all] Error 2

 > ```

 > Fixes:

 >   http://autobuild.buildroot.net/results/7fe9132236ee8e3a86dd97fe96ffee42990c2d19/

 > Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
 > [Thomas:
 >  - regenerate patch as a git formatted patch, add a link to the
 >    original location, add my own SoB to it
 >  - improve commit log]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
