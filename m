Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC49C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 06:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47877843BA;
	Sun, 18 Sep 2022 06:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47877843BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mWUw97VZLb6; Sun, 18 Sep 2022 06:49:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79D608438E;
	Sun, 18 Sep 2022 06:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79D608438E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9447E1BF484
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 06:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 704EE401D2
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 06:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 704EE401D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xmZG4TYySFth for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 06:48:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C56E400E2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C56E400E2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 06:48:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 99983E0002;
 Sun, 18 Sep 2022 06:48:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZo6n-00BAnR-Bj; Sun, 18 Sep 2022 08:48:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220727083753.935654-1-romain.naour@smile.fr>
 <20220830191638.GB68979@scaer>
Date: Sun, 18 Sep 2022 08:48:53 +0200
In-Reply-To: <20220830191638.GB68979@scaer> (Yann E. MORIN's message of "Tue, 
 30 Aug 2022 21:16:38 +0200")
Message-ID: <87a66xxjmy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCHv3] package/rustc: needs C++ compiler with
 musl based toolchain
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Romain, All,
 > On 2022-07-27 10:37 +0200, Romain Naour spake thusly:
 >> While building host-rust with a musl based toolchain without C++ compiler,
 >> the build fail since libunwind bundled in rust sources needs a C++ compiler.
 >> 
 >> cargo:warning=i686-buildroot-linux-musl-gcc.br_real: error:
 >> [...]/host-rust-1.62.0/src/llvm-project/libunwind/src/Unwind-EHABI.cpp:
 >> C++ compiler not installed on this system
 >> 
 >> Note: the issues can't be reproduced with a glibc based toolchain
 >> without C++ probaly due to extra steps required to support musl libc.
 >> 
 >> We could add the C++ dependency direclty to host-rustc but it would
 >> requires adding the C++ reverse dependencies to all rust packages.
 >> 
 >> Instread, we add the C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 >> only when a musl toolchain is used. So we can still install a prebuilt
 >> rust compiler but without the rust standard library (rust-std).
 >> 
 >> Usually we should not add toolchain dependencies in a _ARCH_SUPPORTS option but
 >> BR2_PACKAGE_HOST_RUSTC_TARGET_TIER... options contains already some
 >> BR2_TOOLCHAIN_USES_GLIBC or BR2_TOOLCHAIN_USES_MUSL.
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.org/results/636/636fb39c8f1b8c05e4ca451ac506cd63c7166d82
 >> 
 >> Signed-off-by: Romain Naour <romain.naour@smile.fr>

 > By lack of a better alternative (like using a standalone libunwind as
 > James suggested): applied to master, thanks.

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
