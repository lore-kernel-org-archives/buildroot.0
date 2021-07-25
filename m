Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E90AC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:23:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB40460F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB40460F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9399D4027D;
	Sun, 25 Jul 2021 21:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZ3IsUUEpplh; Sun, 25 Jul 2021 21:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F352540278;
	Sun, 25 Jul 2021 21:23:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21AE41BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1191740278
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bn3vUZ_hcOKm for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:23:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AA1E40274
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:23:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2977DFF803;
 Sun, 25 Jul 2021 21:23:08 +0000 (UTC)
Date: Sun, 25 Jul 2021 23:23:07 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Message-ID: <20210725232307.777d4ba7@windsurf>
In-Reply-To: <20210608151840.20917-3-patrickdepinguin@gmail.com>
References: <20210608151840.20917-1-patrickdepinguin@gmail.com>
 <20210608151840.20917-3-patrickdepinguin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCHv2 2/3] toolchain/toolchain-external: fixup
 gdb pretty-printer loader for libstdcxx
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Tue,  8 Jun 2021 17:18:38 +0200
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> gcc installs a libstdcxx-...so-gdb.py file that gdb will load automatically
> when it loads libstdcxx.so, via the mechanism described at [1].
> 
> However, the auto-load file installed by gcc contains hardcoded paths
> referring to the location where the (external) toolchain was built, which
> are normally not available.
> 
> Fix up the paths in the load file so that the pretty printers can be loaded
> automatically.

So I wasn't really sure if turning them into absolute paths was really
the best way. For example, in the ARM AArch64 toolchain, the
libstdcxx-....so-gdb.py file contains relative paths.

But I checked, and the absolute paths get properly fixed up by
relocate-sdk.sh when using the SDK feature, so I believe it's good
enough.

> +	pythondir=$$(find $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR) -path '*/libstdcxx/__init__.py' 2>/dev/null | xargs dirname | xargs dirname | head -n1); \

I found this xargs dirname | xargs dirname a bit odd, so I replaced
with a sed expression.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
