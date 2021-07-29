Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94F9C4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 10:17:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63C5960E09
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 10:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63C5960E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FC2083B12;
	Thu, 29 Jul 2021 10:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sRIVqcJR95ua; Thu, 29 Jul 2021 10:17:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65EEF83AA3;
	Thu, 29 Jul 2021 10:17:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF3BC1BF4D7
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 10:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB7766064C
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 10:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6IWtOtcJh9cD for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 10:17:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 951026070C
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 10:17:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 10668240015;
 Thu, 29 Jul 2021 10:17:03 +0000 (UTC)
Date: Thu, 29 Jul 2021 12:17:02 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gleb Mazovetskiy <glex.spb@gmail.com>
Message-ID: <20210729121702.275561b8@windsurf>
In-Reply-To: <20210701062432.978633-1-glex.spb@gmail.com>
References: <20210701062432.978633-1-glex.spb@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2: Fix sdl2-config.cmake
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
Cc: Michael Fischer <mf@go-sys.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu,  1 Jul 2021 07:24:32 +0100
Gleb Mazovetskiy <glex.spb@gmail.com> wrote:

> SDL2 autotools-provided sdl2-config.cmake uses the absolute /usr prefix.
> For this reason, we previously removed it (as of d59261836a).
> 
> This commit fixes sdl2-config.cmake to use relative paths instead.
> 
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> ---
>  package/sdl2/sdl2.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

I have applied, after slightly reworking how the SED replacement is
done. I'm using the "i" sed command to insert the line, and then do the
"s" replacement separately.

Yes, it requires two sed invocations, but I found it to be a bit
clearer.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
