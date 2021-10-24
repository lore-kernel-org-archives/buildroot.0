Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20AAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:07:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D6660E73
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64D6660E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18C4280F13;
	Sun, 24 Oct 2021 13:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKIn7SsIaNDA; Sun, 24 Oct 2021 13:07:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2376780F12;
	Sun, 24 Oct 2021 13:07:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B138C1BF2F2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC6B240131
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGzRfFlF5zCC for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:07:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A32F040240
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:07:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6EC5E240004;
 Sun, 24 Oct 2021 13:07:41 +0000 (UTC)
Date: Sun, 24 Oct 2021 15:07:40 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211024150740.02b0a723@windsurf>
In-Reply-To: <20211023170939.2099257-1-fontaine.fabrice@gmail.com>
References: <20211023170939.2099257-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gensio: link with -latomic if
 needed
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 23 Oct 2021 19:09:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Link with -latomic if needed to avoid the following build failure since
> bump to version 2.0.1 in commit 0f8d4a6ecd874770ce677b617b2c7f459eb1505d
> and
> https://github.com/cminyard/gensio/commit/5528267b54ac5a8ac0ecd7fd9ba481d654b0e92b:
> 
> /tmp/instance-0/output-1/per-package/gensio/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libgensio.so: undefined reference to `__atomic_fetch_add_4'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2114f9cb3d820fc620932e793f53341a0c1f10bc
>  - http://autobuild.buildroot.org/results/c1b397eea1c2eda19149844cec4a87d55651862d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gensio/gensio.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
