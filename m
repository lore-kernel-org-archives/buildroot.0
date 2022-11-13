Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F21C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 901AE60B9D;
	Sun, 13 Nov 2022 14:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 901AE60B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwEOq9P4NngY; Sun, 13 Nov 2022 14:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B19106080A;
	Sun, 13 Nov 2022 14:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B19106080A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1141BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CD8E40496
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CD8E40496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eDgnQNnrH8jp for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:18:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D00A40165
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D00A40165
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:18:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5DEFB1C0003;
 Sun, 13 Nov 2022 14:18:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouDo7-005LSw-8H; Sun, 13 Nov 2022 15:17:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221026183427.3933387-1-thomas.petazzoni@bootlin.com>
Date: Sun, 13 Nov 2022 15:17:59 +0100
In-Reply-To: <20221026183427.3933387-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Wed, 26 Oct 2022 20:34:26
 +0200")
Message-ID: <87mt8vq6p4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/toolchain-buildroot:
 introduce BR2_TOOLCHAIN_BUILDROOT_NONE
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > In the internal toolchain backend, we have a choice..endchoice block
 > to allow the user to select the C library, between glibc, uClibc and
 > musl.

 > However, there are situations were no C library at all is
 > supported. In this case, the choice does not appear, and does not
 > allow to see the Config.in comments that are within the
 > choice..endchoice block and that may explain why no C library is
 > available.

 > For example, on RISC-V 32-bit, the only C library supported is glibc,
 > and the minimum kernel header version required by glibc on this
 > architecture is 5.4.0. In a future commit, we are going to add this
 > dependency on glibc (to fix build issues on configurations that have
 > headers < 5.4.0). But since glibc is the only supported C library on
 > RISC-V 32-bit, it means that the choice..endchoice for the C library
 > contains no entry, preventing from seeing the Config.in comment.

 > To address this issue, this commit adds a "dummy"
 > BR2_TOOLCHAIN_BUILDROOT_NONE option that shows up in the
 > choice..endchoice only when no C library is available. Thanks to this,
 > the choice..endchoice is never empty, and the Config.in comments can
 > be seen.

 > If the user keeps BR2_TOOLCHAIN_BUILDROOT_NONE selected, then the
 > build will anyway abort early because package/Makefile.in has a check
 > to verify that a C library is selected, and aborts the build if not.

 > Some could say that the problem should be resolved by instead
 > preventing the selection of headers < 5.4.0 on RISC-V 32-bit, but that
 > is difficult to do as the user can choose a custom header version, or
 > simply specific that (s)he wants to use the headers of the kernel
 > being built. In those situations, it's difficult to prevent selecting
 > headers < 5.4.0.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.08.x, thanks.

2022.02.x does have the BR2_PACKAGE_<foo>_SUPPORTS, so I didn't add it
there.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
