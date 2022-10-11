Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99314C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 18:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35C0940BE9;
	Tue, 11 Oct 2022 18:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35C0940BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8tVNroLG-Gf; Tue, 11 Oct 2022 18:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B22140BFB;
	Tue, 11 Oct 2022 18:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B22140BFB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5E841BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D29A418D2
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D29A418D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9E6_mVTHRHB for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 18:48:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48382418D0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48382418D0
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 18:48:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3C314240002;
 Tue, 11 Oct 2022 18:48:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oiKIX-00C98p-7I; Tue, 11 Oct 2022 20:48:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220925082044.445AB85FCD@busybox.osuosl.org>
Date: Tue, 11 Oct 2022 20:48:13 +0200
In-Reply-To: <20220925082044.445AB85FCD@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 25 Sep 2022 10:19:12 +0200")
Message-ID: <87fsfup576.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/nodejs: improve
 0001-add-qemu-wrapper-support.patch to fix build issue
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=cf0ddc89705af989393b1601bbf57d567a9a1b13
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since upstream commit 79da2534737bd090b7000beed68d225618606e53,
 > present since NodeJS 16.0.0, another call to the torque tool is done
 > in tools/v8_gypfiles/v8.gyp, but our patch to wrap calls to such tools
 > under Qemu forgot this addition. Due to this, the build of NodeJS is
 > broken since the bump to v16 in Buildroot commit
 > 07408779cc068041a2da6838fe077d1a679f1736 ("package/nodejs: bump to
 > 16.15.0"). This issue is not visible in the autobuilders as it was
 > hidden by a previous build issue, itself fixed by "package/nodejs: fix
 > 'Duplicate v8 target errors when cross-compiling' error".

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
