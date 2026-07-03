Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87F3C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1399413AC;
	Fri,  3 Jul 2026 14:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9Xt3PsGTtxK; Fri,  3 Jul 2026 14:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44C4D41395
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089209;
	bh=68LJDNfdw68Y+3NYB7utXvT++n+G6zidOKYG9QZxfKM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A6MyG4H80Ap+C2Z5GF9xsGTDyCl+XHnGEI4ra8Ii/O0bIUumia9LOyxIGfNs/Johd
	 Ax6nIM00Mpna3p7Tj26sh6HsF2bp0k2bp8DSh33LjcUWyAV760QMHgUkwZsIY/l9pE
	 3RZ3unO21saOz0WbzeQCDxw7t1Ui/rrV4AWeAp4MLxG+neugXa65zWEmIJg10SZG/7
	 DLgiMBhBqmEUP4ZTtBcKeak/ZQVyQSmpYXKMn8cBag2n4y8gJJiDPoWHzLNQW8w91z
	 Let4Pj2fbUJBI8keu0UBZPrmnLdTY7Srwo1J+M5dUWhEXXNG86gKmZ8xOGWTogipjr
	 3nDqeUgvxrFVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44C4D41395;
	Fri,  3 Jul 2026 14:33:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E83F914F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA76F41300
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lFiDLl76NLx for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B842041385
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B842041385
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B842041385
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-493c00f74baso3987385e9.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089204; x=1783694004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YsxocMwwygz47Qc4bajUHIH6O63BE4tINLkX8whNgsk=;
 b=ovCvC/gyOFgpQAfSSPS5BlzNT5aUDcOpn3jSzBDb6veqfQrHG/uJ52ga69vpNVHWDN
 5ZvSgC8bHwPP8KOaaIBUlmgFXGxy2ObBFAVF/KP1rk7Ds5Q5wvl4z97g3bXui6FkPYIT
 Gxe8ynHO8jg5Rw+VV6iBhILz3QnBPWIVBbYLNoxDCwYjkMkt+mzthJKvo37kV6/kIPUE
 foAeEDAGZ3cWIfDKDOvcxQvolVqbrOw+x/7qawb0uzWIFWyvbXun56K8wis2jOFelptr
 6Mb1Pf9Rw0GCyEP08fmk4mUU/hT2bfBFuP/bxQdgdd9hgqEUi0CLaXPw5M3PtfaN16LL
 LziA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9RlZzCE65h67qZJFscQYcWy/kW8IKyqn3z486fKsUUMvaVDagDU9uZG0xQs50/Qp3O4erUBSz/kbk=@buildroot.org
X-Gm-Message-State: AOJu0Yz3dv9Qn0vwFqjC2r887VRn0CzQZVVeFH75RR2CYKOoOUXZCHKW
 TwS+Jc6MTCbXWaT0tgtx56aTMKFyLeoe4cKjPZVPlMnVvQdN2XNI/Eo9w7KdOEOiiOlZEKFgqi/
 K01QW
X-Gm-Gg: AfdE7cmuYWsSgfNU4TT+4/GIbKF8JrEUDt2EVHrDNpIXiKmCA/+unrWI4W+gzPSgGWa
 JFxK2DBqzQVtYnAk3Gn7imHpzU/Jji0oOh62oOSsW1/DRalZ44EsglezALwbW8bSFzWzh5OeA2S
 RQYJmupYiS6No2Th4UA806IdxiDrsbMkvIvhgQZ98SZyATG4310lfuOWqDq7Ozer8TjqU6maeQ3
 B3i/YuWDZDo9IwzDGl+H+LnjB3kkr4xSih7EWXsaKAkPnjaCmMLLCcR1oQ1ADe3rKD8KDbIPx8J
 vkUPjYOto1bJWwmOdIZKMSdFI7TLBXr4OMyEVPf5kXPsh59fSr2CjZ6QjJSQD8GpBowRCJJKZhw
 pBv9CKr//X2YWy84gPttNJHanQKNbKfmzTAObybul0vjhFvxrWMzbzq1KLtJtdYDjqRmm2EWq6E
 hLqDS4
X-Received: by 2002:a05:600c:46ce:b0:493:c548:87fb with SMTP id
 5b1f17b1804b1-493d0f464afmr1142405e9.36.1783089204498; 
 Fri, 03 Jul 2026 07:33:24 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cfb6f199sm28380915e9.3.2026.07.03.07.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:33:23 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:33:23 +0200
Message-ID: <20260703143323.275776-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5eb533070f62b66decb39cb42067e453ef577bfc.1781861320.git.yann.morin@orange.com>
References: <5eb533070f62b66decb39cb42067e453ef577bfc.1781861320.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089204; x=1783694004; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsxocMwwygz47Qc4bajUHIH6O63BE4tINLkX8whNgsk=;
 b=Fc23RZMPfaiuHBCnG1jM5cuY/YF6jUMbSqXj4lSzFSgizkABSiC85K8LlRwiqUdge1
 tgJwRFIT2Ej6BN4CU7OTedHwPhQLFM4NCTao4givJFyJC65z8lzkxR21naU2nrKu/4kq
 vWvLbSlQUpR14mCvROt2Udwdg1A1cNnpw5Hvh3iY3kSCQXqliPVcCRLucDqsPV9ELRUr
 DwREJQXDHfVmej+mzbGEi+N50kseys9v+FDBQgEAby1oi5S+XLejbXbkHyhGAzkVY0uw
 VQ7zl4CrZXXcFgFmgen8NIxFGlSgXzxoIk/DrwG8l57r6HuBIbUi3mIlRoWoYc3OoR0/
 retg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Fc23RZMP
Subject: Re: [Buildroot] [PATCH 1/1] package/mosquitto: requires cmake >= 4.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> With an older cmake version, like the 3.25.1 as available in the docker
> reference image, mosquitto fails to build when ccache is enabled:
> 
>     [ 98%] Building CXX object lib/cpp/CMakeFiles/mosquittopp.dir/mosquittopp.cpp.o
>     In file included from [...]/buildroot/output/build/mosquitto-2.1.2/lib/cpp/mosquittopp.cpp:17:
>     [...]/buildroot/output/host/opt/ext-toolchain/i686-buildroot-linux-gnu/include/c++/15.1.0/cstdlib:83:15: fatal error: stdlib.h: No such file or directory
>        83 | #include_next <stdlib.h>
>           |               ^~~~~~~~~~
>     compilation terminated.
> 
> Officially, mosquitto only requires cmake 3.18, but that proves to not
> be enough, in fact...
> 
> We workaround that by requiring cmake 4.3, which is the one version that
> could be tested with our host-cmake.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2026.05.x. Thanks

> ---
>  package/mosquitto/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
> index 08223bc5db..d553d2fe5c 100644
> --- a/package/mosquitto/Config.in
> +++ b/package/mosquitto/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_MOSQUITTO
>  	bool "mosquitto"
>  	depends on BR2_USE_MMU  # lib peeks in malloc() internals; broker fork()s
>  	depends on !BR2_STATIC_LIBS
> +	select BR2_HOST_CMAKE_AT_LEAST_4_3
>  	select BR2_PACKAGE_CJSON
>  	help
>  	  Eclipse Mosquitto is an open source (EPL/EDL licensed) message
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
