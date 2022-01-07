Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AA6C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 560B7424B7;
	Fri,  7 Jan 2022 21:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYpixsd63foQ; Fri,  7 Jan 2022 21:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80833404C5;
	Fri,  7 Jan 2022 21:09:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0D7A1BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE9CC81DA3
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-KTZx7GKL1t for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:09:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B032881D73
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:09:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 464FC1BF203;
 Fri,  7 Jan 2022 21:08:58 +0000 (UTC)
Date: Fri, 7 Jan 2022 22:08:57 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220107220857.63b9a0da@windsurf>
In-Reply-To: <20220104210727.3634208-1-fontaine.fabrice@gmail.com>
References: <20220104210727.3634208-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qpdf: needs atomic
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  4 Jan 2022 22:07:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> qpdf needs atomic since bump to version 10.5.0 in commit
> b5352c2177011ca389cbb7c68e78447549cbdaaa and
> https://github.com/qpdf/qpdf/commit/c5c1a028cdd3cf345046c46963fb0fdacfb2c33c:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: /home/buildroot/autobuild/instance-2/output-1/build/qpdf-10.5.0/libqpdf/build/.libs/libqpdf.a(QPDF.o): in function `QPDF::QPDF()':
> QPDF.cc:(.text+0x48de): undefined reference to `__atomic_fetch_add_8'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7e18689670dcbe491c35f0597e5c3c787936263f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cups-filters/Config.in | 2 ++
>  package/qpdf/Config.in         | 2 ++
>  2 files changed, 4 insertions(+)

Applied to master, thanks. However, could you do a test build on
sparcv8 ? Indeed normally when something needs atomic, it also needs to
link with libatomic when available, as some architectures (such as
sparcv8) have all atomic built-ins implemented in libatomic.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
