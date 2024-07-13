Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942E0C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 17:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56F8540359;
	Sat, 13 Jul 2024 17:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YX3ulN42H16s; Sat, 13 Jul 2024 17:10:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E3C0403B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E3C0403B4;
	Sat, 13 Jul 2024 17:10:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3983E1BF403
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 17:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24A6360619
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 17:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKk5BXUJJQ43 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 17:10:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DACC3605FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DACC3605FE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DACC3605FE
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 17:10:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67C35FF803;
 Sat, 13 Jul 2024 17:10:07 +0000 (UTC)
Date: Sat, 13 Jul 2024 19:10:01 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240713191001.34a074a8@windsurf>
In-Reply-To: <20240528152948.86337-1-brandon.maier@collins.com>
References: <20240528152948.86337-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720890610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXOb9lMHbuAnEAW7VyeOJXIFELhzShxlC+cWk/qv5EY=;
 b=EOFt1IwidvXksf6MRWSrMxN/j1CN4Y+sTnR9bBhGzObAsFBFX2zYZuNYJmF3auxCEmqwlH
 SZhZogj21521UikA6GLSwDEp0UrY6p0YImBHO3Nc5HhSm8eZCQyhvEtWWBIfEhbE/rl1Of
 jLXWyFUud7Bv9SrbXl2MsG4HTDdHpiLiBBxWwX8943KAn9luNJMo5ZCZzh2CCJqbign2ia
 z6/E7cIeVw2PuALbidVz6DzBlDwiYHxLeNkdokhfpJKB5bOqaho2DV2lWvB+YH7V5rEP8X
 qwqINk94jeLeMrSXQlxuLO+FrtdG0NY9VL7DuV8P/wvEO4Idj5yx9SMYcuFIlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EOFt1Iwi
Subject: Re: [Buildroot] [PATCH] package/pkg-utils: add 'hash_files' to
 show-info
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

Thanks for your patch! Questions/comments below.

On Tue, 28 May 2024 15:29:48 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Could you expand a bit the commit log to describe the motivation for
this change? What are the use-cases?

> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index d1964299af..8970a2a8b9 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -176,6 +176,13 @@ define _json-info-pkg-details
>  		},
>  	)
>  	],
> +	"hash_files": [
> +		$(foreach f, $($(1)_HASH_FILES),$(call mk-json-str,$(f))$(comma))
> +	],

One thing that isn't that "useful" here is that this is going to list
*all* hash files for that package, not the one hash file that contained
the appropriate hash used to check the package (if there are multiple
hash files).

> +	"no_check_hash_for": \
> +		$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES), \
> +			false, \
> +			$(if $(filter $($(1)_SOURCE),$(BR_NO_CHECK_HASH_FOR)),true,false)),

Could we have positive logic instead, such as "hash-checked": true?

Also, here you're basing the value of this property solely on whether
<pkg>_SOURCE was hash-checked. But what about <pkg>_PATCH and
<pkg>_EXTRA_DOWNLOADS? So basically this should be true only if all
files in <pkg>_ALL_DOWNLOADS have been hash-checked.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
