Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA9EC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B35C81186;
	Tue,  2 Jul 2024 07:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6xVEjL0KmsK; Tue,  2 Jul 2024 07:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17DD581441
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17DD581441;
	Tue,  2 Jul 2024 07:07:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C00281BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACF3940CD7
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZXYdOWpHLzs for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:07:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5801B40C6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5801B40C6B
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5801B40C6B
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:07:39 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso43722871fa.0
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719904057; x=1720508857;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rBxjO6J1rKyCRJnSLQqyRrOYe6ZLn+nI+apIX+gZM0g=;
 b=fwgwur2RfmTP9RWRUI4LL2RSWY/fU0Y6LFKUv9EvQTp3OctEvkgNHmpHB3FSx0juRT
 Hz5xK75KDZGBIMwqs1/8KIWYqWmckk5EfX47HY6UCy5105Jj9UTzmbuPhXbA/F8bkDiC
 QQ8zuwVbW4q+6tHmAr1MllQhlO1JDXantIkvMuQ9a92fdh59xOgddf7Gj9uZHcY/FiJR
 n9BxCtCBDFHOzKgOdBfguu44vLJRZaY8dgNRLqkvznC3X7WdP6BoIo4Vaj4B9QI2BkI5
 P4uaWQwjn9Hd55i15/Fttn28nbG2x247+JyxDauoJBrO0SNainTev++ZA0VFJ0cI84RH
 nHdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvVjyRbFFuCoCJBHghLoZ3EpKOSSFN7+tkHbs+nwIOuDoKyE2XcbDkwkIXdwGJx/U8sK7d5M/HzMjZyCrrzHBbFYAcaVNX4g==
X-Gm-Message-State: AOJu0YwzuS5XmvKmH/kOlLgykVbYUC3MaD28xWFRLptdeRstOS41TIXE
 ajKKGwM8f6g0u3PaiZPohGQLcBDQrDJ+TCZTulQQeA1YWiUlDkE5J/oBLpdjwp5J/8E0AP2iDNm
 E
X-Google-Smtp-Source: AGHT+IEkCLIOp0TGjdPbRzorNxOkoit9M5BdBVkRilUR8LfV2b8ETpT+UeXRVXFUTTID4gHTjz0gdg==
X-Received: by 2002:a2e:be8a:0:b0:2eb:e365:f191 with SMTP id
 38308e7fff4ca-2ee5e3963acmr68374701fa.15.1719904056167; 
 Tue, 02 Jul 2024 00:07:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42588492b4fsm43857915e9.4.2024.07.02.00.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:07:35 -0700 (PDT)
Message-ID: <658b74e6-c23c-4b24-b4eb-39dec33760ad@mind.be>
Date: Tue, 2 Jul 2024 09:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240702070232.2373630-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240702070232.2373630-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719904057; x=1720508857; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rBxjO6J1rKyCRJnSLQqyRrOYe6ZLn+nI+apIX+gZM0g=;
 b=OLyZGKH74mpHWa61RLFH+6Z1KS7RcaKEaczMs1iqVo13cSV0OLlyI1pdOTTy5YF+47
 ryPYhVHDWW5gSOdci1HvcHzEmf/8aX/hBD/cS0l1BitOQg5JB880r0HO2BfsRFkocAFu
 qNxSllfldVixqURS7Ty2w+i9Cgnfvh/pfPM1fky/czVLQ6uZ0JJCuhpXyrcijCMTwdQO
 HdUjJQxPUxqhfTt2WKApNrwptNrMKPibRjVCyhGzx0BwWS5q3SZyyBfdQINuqBJhSSdR
 ijiP1w27M3DSdMpmwzwNOWaLLATD0yZDX4Uzz5OTGBEvoKjnTp9LAqza2L9KzlYLCt3M
 Zo4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OLyZGKH7
Subject: Re: [Buildroot] [PATCH 1/1] package/gpm: update the patches to be
 applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: linux-amarula@amarulasolutions.com,
 Julien Boibessot <julien.boibessot@armadeus.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 09:02, Dario Binacchi wrote:
> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, gpm fails to build with output:
> 
>      Applying 0003-src-Makefile.in-Really-install-unversioned-solibrary.patch using patch:
>      patching file src/Makefile.in
>      Hunk #1 FAILED at 115.
>      1 out of 1 hunk FAILED -- saving rejects to file src/Makefile.in.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>   ...efile.in-Really-install-unversioned-solibrary.patch | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch b/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
> index 259180197696..2105bbbf6a0c 100644
> --- a/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
> +++ b/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
> @@ -1,4 +1,4 @@
> -From 445be05fba32c512fd87a0c98b4e9936629ef95e Mon Sep 17 00:00:00 2001
> +From 5b83edaa20f6ecf97d16e323be1ed555d8fa2c01 Mon Sep 17 00:00:00 2001
>   From: Bernd Kuhls <bernd.kuhls@t-online.de>
>   Date: Sat, 20 Feb 2016 17:59:52 +0100
>   Subject: [PATCH] src/Makefile.in: Really install unversioned solibrary
> @@ -10,22 +10,24 @@ which created libgpm.so but failed to include it in the install target.
>   Patch sent upstream: https://github.com/telmich/gpm/pull/11

  I've also changed this to a proper Upstream: tag, updated .checkpackageignore 
accordingly.

  Applied to master, thanks.

  Regards,
  Arnout

>   
>   Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +[Dario: make the patch to be applied with fuzz factor 0]
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>   ---
>    src/Makefile.in | 1 +
>    1 file changed, 1 insertion(+)
>   
>   diff --git a/src/Makefile.in b/src/Makefile.in
> -index 7e9e2ef..bca226f 100644
> +index b63e4f4489bd..a1838c300312 100644
>   --- a/src/Makefile.in
>   +++ b/src/Makefile.in
>   @@ -115,6 +115,7 @@ install:	check
>    	if test "x@SHLIB@" != "x" ; then \
> - 		$(INSTALL_DATA) -m 755 lib/libgpm.so.@abi_full@ $(libdir)/libgpm.so.@abi_full@	;	\
> + 		$(INSTALL_DATA) -m 644 lib/libgpm.so.@abi_full@ $(libdir)/libgpm.so.@abi_full@	;	\
>    		cd $(libdir) && $(LN_S) -f libgpm.so.@abi_full@ libgpm.so.@abi_lev@ 					;	\
>   +		cd $(libdir) && $(LN_S) -f libgpm.so.@abi_full@ libgpm.so 					;	\
>          echo "WARNING: We installed a lib, you should now call ldconfig" 						; 	\
>          echo "f.i.: ldconfig -n -l $(libdir)/libgpm.so.@abi_full@" 								;	\
>          echo "Or to update everything just type ldconfig"											;	\
>   --
> -2.7.0
> +2.43.0
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
