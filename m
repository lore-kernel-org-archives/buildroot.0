Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7246CDB482
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 15:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DD9260C1F;
	Fri, 13 Oct 2023 15:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DD9260C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nOk2nU94U9Q; Fri, 13 Oct 2023 15:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36D3C60BEB;
	Fri, 13 Oct 2023 15:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D3C60BEB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69C951BF37E
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 417234053F
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 417234053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojFplpecKFF4 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 15:15:13 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB2E54049A
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 15:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB2E54049A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45CE840007;
 Fri, 13 Oct 2023 15:15:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrJsV-007LD6-Pf; Fri, 13 Oct 2023 17:15:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230913212000.987236-2-ben.wolsieffer@hefring.com>
 <20231001231123.58838dcb@windsurf>
Date: Fri, 13 Oct 2023 17:15:03 +0200
In-Reply-To: <20231001231123.58838dcb@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 1 Oct 2023 23:11:23 +0200")
Message-ID: <87y1g6366g.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gptfdisk: fix bug with util-linux
 (libuuid) 2.38
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed, 13 Sep 2023 17:20:01 -0400
 > Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:

 >> Fix the following error message by backporting an upstream patch [0]:
 >> 
 >> Warning! Unable to generate a proper UUID! Creating an improper one as a last
 >> resort! Windows 7 may crash if you save this partition table!
 >> 
 >> Additionally, now that gptfdisk uses libuuid again, the build fails
 >> because passing LIBS to make overrides the default value in the
 >> Makefile. To fix this, this patch adds -luuid to GPTFDISK_LDLIBS.
 >> 
 >> [0] https://sourceforge.net/p/gptfdisk/code/ci/6a8416cbd12d55f882bb751993b94f72d338d96f
 >> 
 >> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
 >> ---
 >> ...to-deal-with-minor-change-in-libuuid.patch | 40 +++++++++++++++++++
 >> package/gptfdisk/gptfdisk.mk                  |  2 +
 >> 2 files changed, 42 insertions(+)
 >> create mode 100644 package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch

 > Sorry for the delay, I have applied this patch after improving the
 > commit log:
 > https://gitlab.com/buildroot.org/buildroot/-/commit/58fbfe870640cf20678d4f6a40999ea5223c6fca

 > Best regards,

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
