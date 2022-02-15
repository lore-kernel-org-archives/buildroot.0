Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829CAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 22:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C02582884;
	Tue, 15 Feb 2022 22:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kcq-rllcCNDk; Tue, 15 Feb 2022 22:11:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51A8E8284B;
	Tue, 15 Feb 2022 22:11:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 393951BF616
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 22:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35FF960FE0
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 22:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRi07KGbaW4p for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 22:11:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E100560B0C
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 22:11:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B276B60003;
 Tue, 15 Feb 2022 22:11:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nK62p-0007e8-Kl; Tue, 15 Feb 2022 23:11:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220126193431.17777-1-ps.report@gmx.net>
Date: Tue, 15 Feb 2022 23:11:35 +0100
In-Reply-To: <20220126193431.17777-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Wed, 26 Jan 2022 20:34:31 +0100")
Message-ID: <8735kjkcfc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/binutils: add upstream patch for
 v2.37 fixing linking of thin archives
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add upstream patch ([1]) for v2.37 fixing linkig of thin archives (see [2] for
 > details).

 > Fixes:

 >   .../host/bin/arm-buildroot-linux-gnueabihf-g++ [...] -o libQt5WebEngineCore.so.5.15.2 [...]
 >   .../arm-buildroot-linux-gnueabihf/bin/ld: .../build/qt5webengine-5.15.2/src/core/release/obj/third_party/boringssl/libboringssl.a: error adding symbols: malformed archive
 >   collect2: error: ld returned 1 exit status
 >   make[5]: *** [Makefile.core_module:90: ../../lib/libQt5WebEngineCore.so.5.15.2] Error 1
 >   make[4]: *** [Makefile:124: sub-core_module-pro-make_first] Error 2
 >   make[3]: *** [Makefile:79: sub-core-make_first] Error 2
 >   make[2]: *** [Makefile:49: sub-src-make_first] Error 2
 >   make[1]: *** [package/pkg-generic.mk:295: .../build/qt5webengine-5.15.2/.stamp_built] Error 2
 >   make: *** [Makefile:23: _all] Error 2

 > [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=1c611b40e6bfc8029bff7696814330b5bc0ee5c0
 > [2] https://sourceware.org/bugzilla/show_bug.cgi?id=28138

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
