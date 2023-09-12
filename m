Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D0ACA0EC3
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 06:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE512610C3;
	Tue, 12 Sep 2023 06:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE512610C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYSwOE--8A3f; Tue, 12 Sep 2023 06:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E6B460FB4;
	Tue, 12 Sep 2023 06:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E6B460FB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECB8C1BF27E
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C12344049A
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C12344049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpDTByzzUdSw for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 06:18:00 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F902403CC
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 06:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F902403CC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 019B91BF217;
 Tue, 12 Sep 2023 06:16:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfwhL-00G0lt-V0; Tue, 12 Sep 2023 08:16:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <ZNYwAHizfBKfreRi@waldemar-brodkorb.de>
 <20230812140430.GL421096@scaer>
Date: Tue, 12 Sep 2023 08:16:31 +0200
In-Reply-To: <20230812140430.GL421096@scaer> (Yann E. MORIN's message of "Sat, 
 12 Aug 2023 16:04:30 +0200")
Message-ID: <87zg1r7w74.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/util-linux: fix compile issue with
 older kernel headers
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Waldemar, All,
 > On 2023-08-11 14:56 +0200, Waldemar Brodkorb spake thusly:
 >> Linux added mnt_id member to struct statx in commit:
 >> fa2fcf4f1df1559a0a4ee0f46915b496cc2ebf60
 >> 
 >> Linux 5.4.0 was released on 24. November 2019, but it seems this change
 >> never got backported to 5.4.252.
 >> 
 >> Upstream added a patch to guard the use of the member in commit:
 >> https://github.com/util-linux/util-linux/commit/c0136ac0c98b18208508fbcfac31a843e0bb8a37
 >> 
 >> Add the patch to fix an autobuild failure.
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.net/results/d50/d502bc9236b577e2470a30ffc39c21579b038a1c
 >> 
 >> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

 > Applied to master, thanks.

 > I tries to look when this strted to appear, but we do have quite a few
 > different kind of failrues for util-linux. But upstream added use of
 > mnt_id back in 2.38, so we can backport this to our maintenace branches,
 > which all have util-linux 2.38.

2.38 does not have libmount/src/hook_mount.c, so it cannot be directly
applicable to 2.38.

I'll skip it for now, but feel free to send a patch for 2.38 as well if
needed.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
