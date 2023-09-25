Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ECFCE7A89
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 05:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C631D81E69;
	Mon, 25 Sep 2023 05:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C631D81E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w7oOOo1Qd2lt; Mon, 25 Sep 2023 05:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21B1E817A2;
	Mon, 25 Sep 2023 05:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21B1E817A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EC1A1BF3BB
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27D41409FA
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27D41409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4rzY_ph0Jmal for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 05:33:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECBC24098E
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 05:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECBC24098E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 814A860006;
 Mon, 25 Sep 2023 05:33:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkeDk-002Eon-K7; Mon, 25 Sep 2023 07:33:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230917152303.1300577-1-yann.morin.1998@free.fr>
Date: Mon, 25 Sep 2023 07:33:24 +0200
In-Reply-To: <20230917152303.1300577-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 17 Sep 2023 17:23:03 +0200")
Message-ID: <87o7hqes0r.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gdb: gdbserver does not need zlib
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since 3341ceb1e585 (package/gdb: zlib is mandatory, not optional), zlib
 > has become a mandatory dependencies of the gdb package.

 > However, zlib is only needed for the debugger, gdb itself, while the
 > server, gdbserver, does not use it.

 > This means that, when building an SDK to be later reused as an external
 > toolchain, the zlib headers and libraries are present in the sysroot of
 > the toolchain, tainting the toolchain and making it unsuitable to be
 > reused.

 > As Julien noticed, for example, tcl will try and link with zlib if
 > available, and at build time it is. But at runtime, it is not, and thus
 > tclsh fails to run; see 7af8dee3a8a0 (package/tcl: add mandatory
 > dependency to zlib)

 > When we only need to build gdbserver, we still need to configure and
 > build the whole gdb distribution, which means we call the top-level
 > configure script; that script has no option to disable the detection
 > of zlib: it wants to either use a system one, or it will build the
 > bundled one.

 > So, when we onlyt build gdbserver, we tell configure to not use a system
 > zlib, which triggers a build of the bundled one, which we do not use...

 > Reported-by: Julien Olivain <ju.o@free.fr>
 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
