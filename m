Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D34C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3506A4098E;
	Wed,  1 Nov 2023 22:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3506A4098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XLn1-oq6q6q4; Wed,  1 Nov 2023 22:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C0A408D0;
	Wed,  1 Nov 2023 22:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C0A408D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E32B1BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4404980C3C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4404980C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kpoElk0IRrXS for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:44:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC47B80C18
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC47B80C18
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E902C0003;
 Wed,  1 Nov 2023 22:44:50 +0000 (UTC)
Date: Wed, 1 Nov 2023 23:44:50 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101234450.5d1b0287@windsurf>
In-Reply-To: <20231015210125.1587623-1-fontaine.fabrice@gmail.com>
References: <20231015210125.1587623-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698878691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UtBdmlKXbi6F31izDFDalvQxnVerft1jogXHN/USEso=;
 b=OigbKi4V66MLa+NE8qI8LvscaQvY9xspgdIAjRvUuWQuS11AlwciynTHd9BAX6YS85evxp
 HyFI3KWTYSVPI0VmF/s6mvRFx/RM6kWn3cZGGaw0GAmpiqWAMaqceqqUsulYezmOUnbwYM
 tmpBppLXI2QDom2FXogB5mwd/bmvqw4M8wqN9LlATTg02+frPEfFpUUncz5pc3SxTiqokF
 yqVrv/u0M60yuK01FCGKvSCeNzOu1GNfWwwRI05eBmlliZ7tqc4JoftZmgQJxjjuQ0pDBI
 MEbsScSxlf864XDJpPIaDmv7JKXTlqqq6GDwtaoR6aW0OKw3c8ZR4FZlF8YCqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OigbKi4V
Subject: Re: [Buildroot] [PATCH 1/1] package/monit: fix openssl static build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Oct 2023 23:01:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following openssl static build failure raised since bump to
> version 5.33.0 in commit 8cedb39764f70f9d467bf0cc1acc99a8bbb963d6:
> 
> configure: error: Could not find SSL library, please use --with-ssl-lib-dir option or disabled the SSL support using --without-ssl
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b2fe4ecd1d84c3cf7d0eb8f606b20bc6638d6d65
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/monit/monit.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks. It would be nice if the monit configure.ac
script could use pkg-config directly, though.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
