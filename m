Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C28C433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B13A41D5F;
	Fri, 30 Sep 2022 15:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B13A41D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vw8tVcD90jxE; Fri, 30 Sep 2022 15:01:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E717941D5D;
	Fri, 30 Sep 2022 15:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E717941D5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 410011BF291
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C2A040C31
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C2A040C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UoRFF89j9iYg for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:01:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93695404D1
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93695404D1
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:01:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8FAD820000E;
 Fri, 30 Sep 2022 15:01:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oeHVh-00Bbki-4Z; Fri, 30 Sep 2022 17:01:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220830124423.164957-1-yann.morin.1998@free.fr>
Date: Fri, 30 Sep 2022 17:01:05 +0200
In-Reply-To: <20220830124423.164957-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 30 Aug 2022 14:44:23 +0200")
Message-ID: <871qrs6h5a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ncurses: drop our custom host build
 commands
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

 > Commit bf446513e7e7 (ncurses: fix hanging installation due to old
 > version of tic) introduced the build of the host tic, to be used by the
 > target ncurses. That commit purportedly built a static tic, but that is
 > (at least now) wrong: there is nothing that makes the build of tic
 > static.

 > Initially, host-ncurses was configured with --without-shared, but that
 > only drives whether to generate shared libs or not, it does not drive
 > whether to do a shared or static link of executables.

 > And in any case, in af23d762e51b (ncurses: enable shared library build
 > on the host) we explicitly stopped requesting the build of a static
 > library, to instead require the build of a shared library.

 > So, we never had a statically linked tic ever.

 > Furthermore, we override the _BUKLLD_CMDS, but we do not provide any
 > _INSTALL_CMDS. As a consequence, the full ncurses is installed, not just
 > tic. And since we override the _BUILD_CMDS, the libraries are not built,
 > so they get built during the install step.

 > And we do indeed need the libraries (host-gettext needs them), and not
 > just tic.

 > So, just drop our custom _BUILD_CMDS and just build the whole package
 > with the default settings. We keep the explicit use of --with-shared,
 > as this is not the standard flag (--enable-shared) and it is not obvious
 > what the default is.

 > The set of files installed before and after this change is exactly the
 > same, and tic still is an "ELF 64-bit LSB shared object" with a RUNPATH
 > that still correctly points to $(HOST_DIR)/lib

 > To be noted: there is no regressin in build time either, since we were
 > already building everything anyway.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
