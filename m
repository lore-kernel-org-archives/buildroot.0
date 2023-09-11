Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3292AEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 07:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82831402FD;
	Mon, 11 Sep 2023 07:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82831402FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdcgewW3dUqW; Mon, 11 Sep 2023 07:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55F1C401DB;
	Mon, 11 Sep 2023 07:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55F1C401DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33D181BF3FB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E5AA405E9
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E5AA405E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CxilX0IO9TBu for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 07:23:14 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D34AF40122
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 07:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D34AF40122
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11B74E000C;
 Mon, 11 Sep 2023 07:23:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfbGI-00DAen-2d; Mon, 11 Sep 2023 09:23:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220409160921.GA3547512@scaer>
 <20221005091032.3014-5-br015@umbiko.net>
 <20230806224547.207cadf5@windsurf>
Date: Mon, 11 Sep 2023 09:23:10 +0200
In-Reply-To: <20230806224547.207cadf5@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 6 Aug 2023 22:45:47 +0200")
Message-ID: <87pm2pcgwx.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 4/4] package/mpd: introduce sub-options
 for expat and yajl
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
Cc: Andreas Ziegler <br015@umbiko.net>, YANN E MORIN <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Andreas,
 > On Wed,  5 Oct 2022 11:10:32 +0200
 > Andreas Ziegler <br015@umbiko.net> wrote:

 >> Make inclusion of expat and yajl libraries in the mpd build dependent on
 >> user selection, not presence of the libraries in the target filesystem.
 >> 
 >> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

 > So I handled this differently:

 > - First, one patch that adds the "missing" dependency of
 >   BR2_PACKAGE_MPD_UPNP_NPUPNP on expat:

 >   https://gitlab.com/buildroot.org/buildroot/-/commit/6cdb48a0482a093dcdf73d0d748f5435262515ab

 > - Second, a patch that takes care of expat and yajl, but without the
 >   intermediate options: as soon as expat or yajl are available in
 >   Buildroot, their support will enabled in mpq:

 >   https://gitlab.com/buildroot.org/buildroot/-/commit/3693462a1f8bd328c1a4f8fb68f00ce9127c31cd

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
