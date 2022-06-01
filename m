Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFBBC43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 16:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1501061174;
	Wed,  1 Jun 2022 16:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cR5O6yZfFufN; Wed,  1 Jun 2022 16:11:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 397A36117F;
	Wed,  1 Jun 2022 16:11:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5738D1BF573
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44D324053D
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNadYXmrCnDp for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 16:11:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66CF540220
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 16:11:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E75FCC0006;
 Wed,  1 Jun 2022 16:10:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nwQvx-008tNb-GJ; Wed, 01 Jun 2022 18:10:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joel Stanley <joel@jms.id.au>
References: <20220518034225.373194-1-joel@jms.id.au>
Date: Wed, 01 Jun 2022 18:10:57 +0200
In-Reply-To: <20220518034225.373194-1-joel@jms.id.au> (Joel Stanley's message
 of "Wed, 18 May 2022 13:12:25 +0930")
Message-ID: <87v8tk2wku.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] toolchain/glibc: Restrict ppc64le support
 to power8
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
Cc: mpe@ellerman.id.au, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:

 > Glibc restricts ppc64le support to Power8 (or later):
 >  https://sourceware.org/git/?p=glibc.git;a=commit;h=a27d2c19355a15569dfcdd5da741b57acf1a106a

 > The autobuilder has been attempting combiations of BR2_powerpc64le,
 > BR2_TOOLCHAIN_USES_GLIBC and

 > BR2_powerpc_970:

 >  http://autobuild.buildroot.net/results/89eae4c6e28658444ca5bc67caa2644358de97b7

 > BR2_powerpc_power6:

 >  http://autobuild.buildroot.net/results/bee990c9c34d391cfc4a351a30abc1a0a53a2415

 > BR2_powerpc_620:

 >  http://autobuild.buildroot.net/results/a0557172757d3bba2b5fc6244c7b9b17ef6be0db

 > When Power9, Power10, etc support is added to buildroot we may require a
 > BR2_PPC64LE_AT_LEAST_POWER8 or similar.

 > Signed-off-by: Joel Stanley <joel@jms.id.au>
 > ---
 > I don't think we can boot a ppc64le kernel on these machines either,
 > which means we could instead set depends on !BR2_powerpc64le in
 > arch/Config.in.powerpc for pre-power8.

 > (A power7 can boot a ppc64le kernel, but outside of the lab it wasn't
 > really a thing).

 > Signed-off-by: Joel Stanley <joel@jms.id.au>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
