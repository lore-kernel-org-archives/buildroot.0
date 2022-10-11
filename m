Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9B9C433FE
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 18:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D8BC61053;
	Tue, 11 Oct 2022 18:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D8BC61053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m_bgpnXo9YZi; Tue, 11 Oct 2022 18:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EA886104D;
	Tue, 11 Oct 2022 18:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EA886104D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD0131BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C56758176E
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C56758176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 75iiGDwx1xFy for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 18:53:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94D5781757
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94D5781757
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 18:53:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4DE12100004;
 Tue, 11 Oct 2022 18:53:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oiKNX-00C9To-Ab; Tue, 11 Oct 2022 20:53:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220925082044.5702885FCF@busybox.osuosl.org>
Date: Tue, 11 Oct 2022 20:53:23 +0200
In-Reply-To: <20220925082044.5702885FCF@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 25 Sep 2022 10:19:49 +0200")
Message-ID: <87bkqip4yk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/nodejs: build host-nodejs only
 if we're installing modules with NPM
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=1facb09b94bf806b301868539185c0ff9ddffee2
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Building host-nodejs is no longer needed to build the target nodejs,
 > unless npm is needed during the build, which happens when
 > BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL is used.

 > We need to make that host-python3 is built with bz2 and ssl
 > support. Until now, it was done by the BR2_PACKAGE_HOST_NODEJS option,
 > but now that the target nodejs no longer depends on host-nodejs, we
 > are no longer guaranteed to have a host-python3 with bz2/ssl. To make
 > sure it is the case, we select the relevant options from
 > BR2_PACKAGE_NODEJS.

 > Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
