Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8959CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28404408C1;
	Sun, 19 Jun 2022 13:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28404408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QbjBL6YdM0yg; Sun, 19 Jun 2022 13:23:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44A0C408B6;
	Sun, 19 Jun 2022 13:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44A0C408B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8662C1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B20F81D4F
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B20F81D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGiNO0x55KXw for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:23:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898D681D18
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 898D681D18
 for <buildroot@busybox.net>; Sun, 19 Jun 2022 13:23:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC08F240003;
 Sun, 19 Jun 2022 13:23:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o2uu1-006GZO-2P; Sun, 19 Jun 2022 15:23:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <7ae79f05b1e4275dc7f27bc67344ed5c23229116.1654784099.git.baruch@tkos.co.il>
 <875ykwsstd.fsf@dell.be.48ers.dk>
Date: Sun, 19 Jun 2022 15:23:44 +0200
In-Reply-To: <875ykwsstd.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 19 Jun 2022 15:09:50 +0200")
Message-ID: <87o7yordlr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rustc: add support for ARMv8 with
 32-bit software
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
Cc: buildroot@busybox.net, James Hilliard <james.hilliard1@gmail.com>,
 Oscar Gomez Fuente <oscargomezf@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:
 >> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is not enabled when ARMv8
 >> target hardware is combined with 32-bit software. That is because ARMv7
 >> (32-bit) toolchain is only enabled for BR2_ARM_CPU_ARMV7A which is
 >> mutually exclusive with BR2_ARM_CPU_ARMV8A.

 >> Use ARMv7 toolchain for 32-bit software.

 >> Cc: James Hilliard <james.hilliard1@gmail.com>
 >> Reported-by: Oscar Gomez Fuente <oscargomezf@gmail.com>
 >> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 > Committed to 2022.05.x, thanks.

.. and 2022.02.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
