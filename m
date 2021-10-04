Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119B3C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D39261528
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D39261528
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D874056D;
	Mon,  4 Oct 2021 21:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJmuOlA25tm5; Mon,  4 Oct 2021 21:45:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 016BE40560;
	Mon,  4 Oct 2021 21:45:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54B751BF20F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44EF7606CA
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e12bxlbo9_bJ for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 21:45:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55E1B60698
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 21:45:10 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7DEB160005;
 Mon,  4 Oct 2021 21:45:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXVlj-0007Kb-TB; Mon, 04 Oct 2021 23:45:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20210922192612.EA64B8C9E4@busybox.osuosl.org>
Date: Mon, 04 Oct 2021 23:45:07 +0200
In-Reply-To: <20210922192612.EA64B8C9E4@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Wed, 22 Sep 2021 21:20:30 +0200")
Message-ID: <87v92cea70.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/ghostscript: add upstream
 security patch for CVE-2021-3781
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=4e415b4164551e712643e9608d8813cc749fd279
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The file access protection built into Ghostscript proved insufficient for
 > the "%pipe%" PostScript device, when combined with Ghostscript's requirement
 > to be able to create and control temporary files in the conventional
 > temporary file directories (for example, "/tmp" or "/temp).  This exploit is
 > restricted to Unix-like systems (i.e., it doesn't affect Windows).  The most
 > severe claimed results are only feasible if the exploit is run as a "high
 > privilege" user (root/superuser level) \u2013 a practice we would discourage
 > under any circumstances.

 > For more details, see the advisory:
 > https://ghostscript.com/CVE-2021-3781.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
