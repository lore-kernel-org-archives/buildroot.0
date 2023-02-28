Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0122DC64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 20:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A19E8607B4;
	Tue, 28 Feb 2023 20:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A19E8607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQpLGdr7btW1; Tue, 28 Feb 2023 20:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5E8B607E1;
	Tue, 28 Feb 2023 20:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5E8B607E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 336D81BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C44A418A9
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C44A418A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtI7aZ_s969q for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 20:21:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99509418A5
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99509418A5
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 20:21:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68F3E40005;
 Tue, 28 Feb 2023 20:21:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pX6TC-00BJEz-9W; Tue, 28 Feb 2023 21:21:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230210223129.C431885174@busybox.osuosl.org>
Date: Tue, 28 Feb 2023 21:21:06 +0100
In-Reply-To: <20230210223129.C431885174@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Fri, 10 Feb 2023 23:29:10 +0100")
Message-ID: <87ttz5h77x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] configs/asus_tinker_rk3288: fix boot
 by prepending tpl to spl+u-boot
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e738d5b7251918a62922f3f3b6491b642f9ec182
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > During the last U-boot version bump it's not been noted that the TPL
 > was not prepended to SPL anymore preventing the board to boot, so
 > let's copy TPL to the image folder, prepend it to u-boot-spl-dtb.bin
 > and place it at offset 32KB, where RK3288 bootrom expects to find
 > it. Let's also place u-boot-dtb separated from SPL at offset 8M, where
 > the SPL expects it to find it.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This is presumably the case since commit cb3b484505d6e1
(configs/asus_tinker_rk3288: bump to Linux kernel 5.14.13 and u-boot
2021.10), so committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
