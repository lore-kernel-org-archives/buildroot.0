Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A01C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 13:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA464417E2;
	Wed,  3 Jan 2024 13:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA464417E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4jzIJsa2lXNq; Wed,  3 Jan 2024 13:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B589417F8;
	Wed,  3 Jan 2024 13:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B589417F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0995E1BF3F3
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 13:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3BE761027
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 13:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3BE761027
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOXHIQgyU7Ee for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 13:32:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0F3760AEB
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 13:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0F3760AEB
Received: by mail.gandi.net (Postfix) with ESMTPSA id DECE51BF206;
 Wed,  3 Jan 2024 13:31:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rL1Lh-0045PU-2G;
 Wed, 03 Jan 2024 14:31:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231208174217.29735-1-louis.chauvet@bootlin.com>
 <87h6ju62xg.fsf@48ers.dk> <87le9662dl.fsf@tarshish>
 <87cyui61o0.fsf@48ers.dk> <87cyui613a.fsf@tarshish>
 <20240103134654.3240d15a@windsurf>
Date: Wed, 03 Jan 2024 14:31:57 +0100
In-Reply-To: <20240103134654.3240d15a@windsurf> (Thomas Petazzoni's message of
 "Wed, 3 Jan 2024 13:46:54 +0100")
Message-ID: <878r565yr6.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: fix the RPATH
 of fiptool
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
Cc: =?utf-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 03 Jan 2024 14:39:18 +0200
 > Baruch Siach <baruch@tkos.co.il> wrote:

 >> The last defconfig test report shows these failures:
 >> 
 >> https://lists.buildroot.org/pipermail/buildroot/2023-December/681835.html
 >> 
 >> For example (solidrun_macchiatobin):
 >> 
 >> https://gitlab.com/buildroot.org/buildroot/-/jobs/5834758777

 > I guess:

 > 	HOSTCC="$(HOSTCC) $(HOST_LDFLAGS)"

 > should be:

 > 	HOSTCC="$(HOSTCC) $(HOST_CPPFLAGS) $(HOST_LDFLAGS)"

 > However, I don't understand how it could have worked for us without
 > this.

I can confirm that the build fails with the current patch and works
after adding HOST_CPPFLAGS.

Can you send a patch for it for master?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
