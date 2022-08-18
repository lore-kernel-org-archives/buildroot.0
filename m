Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2483C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 05:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0569B83ED2;
	Thu, 18 Aug 2022 05:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0569B83ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7Ke0GZcnKhA; Thu, 18 Aug 2022 05:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3062D83E3D;
	Thu, 18 Aug 2022 05:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3062D83E3D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 996871BF2BB
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 05:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8232F404CA
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 05:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8232F404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u450xOaM3K_b for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 05:59:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63C00400E4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63C00400E4
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 05:59:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 58C151C0005;
 Thu, 18 Aug 2022 05:59:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oOYZF-00Cezl-7n; Thu, 18 Aug 2022 07:59:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20220725221520.95E8685E6D@busybox.osuosl.org>
Date: Thu, 18 Aug 2022 07:59:45 +0200
In-Reply-To: <20220725221520.95E8685E6D@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Mon, 25 Jul 2022 23:52:47 +0200")
Message-ID: <87ilmq852m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] utils/check-package: improve
 shellcheck reproducibility
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

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=eaa1a43ab7281f70754405441501712a4e2b9981
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > shellcheck is already in use to check SysV init scripts.
 > Currently its results can be affected by the existence of a
 > .shellcheckrc file in any parent directory.

 > For instance, in this example:
 > (1) /path/.shellcheckrc
 > (2) /path/to/.shellcheckrc
 > (3) /path/to/buildroot
 > the configs from file (1) are ignored and the configs from file (2)
 > override the default values from the shellcheck binary.
 > So the config file affects the check-package result for SysV scripts.

 > Avoid this reproducibility issue by adding an empty config file to the
 > buildroot topdir.

 > It can also eventually contain configs (different from default values
 > from sheelcheck) that we want as a standard to all shell scripts tested
 > by check-package.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
