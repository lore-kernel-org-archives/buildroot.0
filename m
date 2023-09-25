Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0027CCE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 13:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF2FA8141F;
	Mon, 25 Sep 2023 13:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF2FA8141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9o86YCxHE9S; Mon, 25 Sep 2023 13:50:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E13B8140A;
	Mon, 25 Sep 2023 13:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E13B8140A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A720C1BF381
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 13:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80A986118F
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 13:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80A986118F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nirAXHa_reHV for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 13:50:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55DFA61021
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 13:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55DFA61021
Received: by mail.gandi.net (Postfix) with ESMTPSA id 620ED2000B;
 Mon, 25 Sep 2023 13:50:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qklyJ-002bhc-Ha; Mon, 25 Sep 2023 15:49:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230921102857.375294-1-thomas.petazzoni@bootlin.com>
Date: Mon, 25 Sep 2023 15:49:59 +0200
In-Reply-To: <20230921102857.375294-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 21 Sep 2023 12:28:56
 +0200")
Message-ID: <878r8ucqgo.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/ne10: install shared libraries only
 when built
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

 > The install to staging commands of the ne10 package are careful to
 > install the shared libraries only if they are built, but we forgot to
 > use the same care for the install to target commands, causing a build
 > failure on BR2_STATIC_LIBS=y configurations as no shared library was
 > built:

 > cp: cannot stat '/home/autobuild/autobuild/instance-15/output-1/build/ne10-1.2.1/modules/libNE10*.so*': No such file or directory

 > This commit fixes this by guarding the target installation commands to
 > BR2_STATIC_LIBS being empty.

 > The problem exists since the package was introduced in commit
 > 318f3db0dcc052aa770ca57c143b5f7bc40cdaf3 ("ne10: new package"), a good
 > 10 years ago. Most likely it was not seen for many years as this
 > package is only available for ARM with NEON and AArch64, and we were
 > not testing fully static builds, except for ARMv5 that don't have
 > NEON. Now that we are doing more random testing, the problem started
 > being visible.

 > Fixes:

 >   http://autobuild.buildroot.net/results/45b2c1af052271bc2f1bb96544f138d29e4f7dfd/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
