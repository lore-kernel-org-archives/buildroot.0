Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77FDC77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 20:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71A1882181;
	Mon,  5 Jun 2023 20:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71A1882181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDZZhnUoBwhN; Mon,  5 Jun 2023 20:10:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A381282169;
	Mon,  5 Jun 2023 20:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A381282169
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF28B1BF3A1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B872D60FE6
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B872D60FE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c950ArZ0H0F5 for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 20:10:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DCF060F83
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DCF060F83
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 20:10:38 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3778920005;
 Mon,  5 Jun 2023 20:10:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q6GXC-00DodW-Bi; Mon, 05 Jun 2023 22:10:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230502220451.3087471-1-romain.naour@gmail.com>
Date: Mon, 05 Jun 2023 22:10:34 +0200
In-Reply-To: <20230502220451.3087471-1-romain.naour@gmail.com> (Romain Naour's
 message of "Wed, 3 May 2023 00:04:51 +0200")
Message-ID: <87mt1d656t.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/busybox: disable sha1/sha256
 hwaccel with x86 musl toolchains
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Buxybox's init segfault when built with x86 musl toolchain due to
 > recent changes about sha1 and sha156 hwaccel support in Busybox 1.36.0.

 > From Alpinelinux [1]:
 > "main/busybox: disable sha hwaccel
 >  the flag check for this seems incorrect- it triggers sha_ni use when
 >  the instructions aren't available, but avx512vl/bw is - Elly on irc

 >  causes failures in github actions, which have avx512 but no sha_no"

 > The flag check should be fixed upstream by commit [2].

 > But init still crash with the latest 1_36_stable (with backported patch)
 > and master branch...

 > Disable sha hwaccel with x86 musl toolchains until the issue is fixed.

 > Checked that qemu_x86_64_defconfig with musl for x86_64 for core2 boot
 > as expected with sha hwaccel enabled.

 > The same workaround has been applied to openembedded-core [3].

 > [1]
 > https://git.alpinelinux.org/aports/commit/main/busybox?id=ae2cfdf6f6da3dc46ee09d8ceafa26921f6e058e
 > [2] https://git.busybox.net/busybox/commit/?id=bd76b75f72f717150b909e8c64edfda725cabe11
 > [3]
 > https://github.com/openembedded/openembedded-core/commit/22f639d61127f4b82a79008c5305e44e090a3680

 > Fixes:
 > https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276721

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
