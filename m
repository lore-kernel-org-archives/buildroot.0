Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9089EC8727
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 13:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 190D181422;
	Thu,  7 Sep 2023 13:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 190D181422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GE-4bvbYmhAn; Thu,  7 Sep 2023 13:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E0478141A;
	Thu,  7 Sep 2023 13:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E0478141A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEB901BF304
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 13:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97EA28140B
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 13:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97EA28140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n2U63RoSk-cQ for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 13:25:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1013C813FE
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 13:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1013C813FE
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB147E0006;
 Thu,  7 Sep 2023 13:25:36 +0000 (UTC)
Date: Thu, 7 Sep 2023 15:25:35 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230907152535.5b47810c@windsurf>
In-Reply-To: <20230906194420.279926-4-dalang@gmx.at>
References: <20230906194420.279926-2-dalang@gmx.at>
 <20230906194420.279926-4-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694093137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnZq0CDydYPIjJ/o/PEWhxGkkKshveD4hZzNbA1uBcY=;
 b=ZhISLccPWRfmJd4DDgViwhoxi0g8EES7KuIZiOK8uy+COrInUtoZC5iFMjgppRMteWo9BF
 ZRq31ZZwTn2hjc04LWq0EyMF9Toj666xAb4iLuyfu4nwjJhwmAqjuKIIjIe7Ipn+anMZvY
 w/FR+JZdOKNKFxrMF2Dw6wZCHC0spugNNGf0sOxnBxLBl1Ladxx8leHUWoUhNEK1W+TBlT
 +kHnc+7ZI95gaz4oQXIsiDHNnBmsXA6sJKrekMWP1aa8fFPD+n+HJpZ3aV9cafYgigZC5r
 GypTHuE0hNWWQJcX7p7YnOGHh8w3Uf84YCtdVnQndjkAnzfE7DshfU+6g5xbjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZhISLccP
Subject: Re: [Buildroot] [PATCH 2/2] package/libcoap: ignore CVE-2023-35862
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  6 Sep 2023 21:44:19 +0200
Daniel Lang <dalang@gmx.at> wrote:

> According to a collaborator [0] the affected code isn't in 4.3.1
> 
> [0]: https://github.com/obgm/libcoap/issues/1117
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/libcoap/libcoap.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
> index 3773ad293c..94bfc59702 100644
> --- a/package/libcoap/libcoap.mk
> +++ b/package/libcoap/libcoap.mk
> @@ -16,6 +16,8 @@ LIBCOAP_CONF_OPTS = \
>  LIBCOAP_AUTORECONF = YES
>  # 0001-Backport-fix-for-CVE-2023-30362.patch
>  LIBCOAP_IGNORE_CVES += CVE-2023-30362
> +# Doesn't affect 4.3.1, see https://github.com/obgm/libcoap/issues/1117
> +LIBCOAP_IGNORE_CVES += CVE-2023-35862

Then instead the NVD maintainers need to be reported this issue, so
that the NVD database gets fixed. At least for now that's how we've
tried to resolve such issues.

However, admittedly, the last bug reports I did to NVD people were
ignored, while in the past, they used to be taken into account quite
efficiently.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
