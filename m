Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33191C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:46:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E2186136F
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E2186136F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF8460684;
	Mon,  4 Oct 2021 11:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtP21_uxnMIJ; Mon,  4 Oct 2021 11:46:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80F0B61B2A;
	Mon,  4 Oct 2021 11:46:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C2381BF34A
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDE4440486
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:46:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQ46jd9URIyT for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 11:46:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BCC5400CB
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 11:46:09 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 97F2F24000C;
 Mon,  4 Oct 2021 11:46:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXMQ0-0001SW-Ja; Mon, 04 Oct 2021 13:46:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210918124739.GN1053080@scaer>
 <20210919005154.461600-1-giulio.benetti@benettiengineering.com>
Date: Mon, 04 Oct 2021 13:46:04 +0200
In-Reply-To: <20210919005154.461600-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sun, 19 Sep 2021 02:51:54 +0200")
Message-ID: <87h7dxj9mr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/mesa3d: fix build on m68k
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > To build mesa3d for m68k we need to pass -mlong-jump-table-offsets CFLAG
 > since 'switch' blocks are pretty wide and lead to build failure. This way
 > 'switch' blocks will have a 32-bit addressing by default instead of the
 > standard 16-bit. This can be done only with m68k gcc version >= 7.x
 > because gcc flag used to fix this(-mlong-jump-table-offsets) is
 > available only from that version on.

 > Fixes:
 > http://autobuild.buildroot.net/results/60c4653c2a93125edbdd0beb43cd47301643464a/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 > V1-> V2:
 > * add gcc >= 7.x dependency to Config.in as suggested by Yann Morin
 > * improve commit log according to Config.in change

..

 > +# m68k needs 32-bit offsets in switch tables to build
 > +ifeq ($(BR2_m68k),y)
 > +MESA3D_CFLAGS += -mlong-jump-table-offsets
 > +endif
 > +
 > +MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
 > +
 >  $(eval $(meson-package))

Does that really work? mesa3d is using meson, not cmake.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
