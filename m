Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D626AC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DC844170F;
	Mon,  7 Mar 2022 21:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPqRagMxBbM5; Mon,  7 Mar 2022 21:07:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A5EC415F4;
	Mon,  7 Mar 2022 21:07:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56D981BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54A9F82980
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w9KbGol3ms5f for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:07:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89EF782978
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:07:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5539C200003;
 Mon,  7 Mar 2022 21:07:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRKZa-001HTE-H1; Mon, 07 Mar 2022 22:07:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <cover.1644506959.git.yann.morin@orange.com>
 <11363_1644506973_62052F5D_11363_173_9_da4c09036712600e0ab76db801a5a5c693bfa267.1644506959.git.yann.morin@orange.com>
Date: Mon, 07 Mar 2022 22:07:18 +0100
In-Reply-To: <11363_1644506973_62052F5D_11363_173_9_da4c09036712600e0ab76db801a5a5c693bfa267.1644506959.git.yann.morin@orange.com>
 (yann morin's message of "Thu, 10 Feb 2022 16:29:26 +0100")
Message-ID: <87mti14gl5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5 v3] package/pkg-cargo: host-rustc is
 also a build dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Currently, host-rustc is a download dependency, because we need cargo
 > for the vendoring during the download step.

 > However, when using a package in override-srcdir, there is no download
 > step, so host-rustc is not pulled in as a dependency which breaks
 > running the build of a single package from scratch:
 >     $ make clean
 >     $ make my-rust-package
 >     [...]
 >     [...] cargo build --offline --release --manifest-path Cargo.toml --locked
 >     /bin/sh: cargo: command not found

 > We fix that by adding host-rustc as a standard dependency too.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
