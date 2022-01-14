Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26C3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 286024159F;
	Fri, 14 Jan 2022 16:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPG6iL7CIZtB; Fri, 14 Jan 2022 16:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DB0E4151C;
	Fri, 14 Jan 2022 16:37:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5BD61BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A25184040D
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eeddwUuEKmyi for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:37:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3520400F3
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:37:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0EB6D24000E;
 Fri, 14 Jan 2022 16:37:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n8PZn-00013H-Ax; Fri, 14 Jan 2022 17:37:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20211121215713.4167839-1-ricardo.martincoski@gmail.com>
Date: Fri, 14 Jan 2022 17:37:19 +0100
In-Reply-To: <20211121215713.4167839-1-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 21 Nov 2021 18:57:13 -0300")
Message-ID: <878rvi6zpc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/getdeveloperlib.py: fix developer
 being reported for unrelated path
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
Cc: James Knight <james.d.knight@live.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Currently, by following the instructions in the manual and querying for
 > developers for a patch that changes path
 > package/foobar
 > the script reports both developers that have these entries in the
 > DEVELOPERS file:
 > F:	package/foo/
 > F:	package/foobar/

 > Starting from commit "afc112b0e4 utils/getdeveloperlib.py: fix issue
 > with hasfile()" get-developers script uses os.path.abspath() and
 > os.path.relpath().
 > The catch is that those functions return the absolute path and the
 > relative path without the trailing slash.

 > When the paths associated to a developer are then compared to the paths
 > a patch touches, using the string.startswith(), any substring returns
 > True, leading to developers for package/foo/ being wrongly reported
 > for package/foobar/ .

 > Fix this by re-adding the trailing slash after using relpath().

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Heiko Thiery <heiko.thiery@gmail.com>
 > Cc: James Knight <james.d.knight@live.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
