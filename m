Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7E5C77B7F
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 13:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B454408C9;
	Tue, 16 May 2023 13:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B454408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mj2wysDoHLgo; Tue, 16 May 2023 13:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C68040576;
	Tue, 16 May 2023 13:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C68040576
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 314641BF255
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 086434094C
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 086434094C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmWw49jbsWxK for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 13:08:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDE1040550
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDE1040550
 for <buildroot@buildroot.org>; Tue, 16 May 2023 13:08:29 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-24e1d272b09so10391556a91.1
 for <buildroot@buildroot.org>; Tue, 16 May 2023 06:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684242509; x=1686834509;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=83tRXRYUH5kQgx6iOz9/eMZjfe3GyRW7+FqnKSpl/iY=;
 b=aKm1wuI4Ln+YHkaUVZWJ6aOYNUJyoFDnHaTh8lqBVDdnLaqTvLln+6kIcXFZnmrnRG
 zqtd8Xcj8ORVzJXFhoRR/tDGxGskDSgO9j4SgHmYdlsoNF1Tu4bzChQBhaNnvf3OV61K
 nborzI3Rg0de00aTAJE23hNtLPkJW1f3cKshyIRu+cPY/QIVUo25v686AyUnIc5y/MiD
 gmTLZjZw9DKHTqvpDIh8b5YijSslBxzJ2wXq3YTVv2hK3ozwUpXNMZESWdEvSC49sD2c
 IrlHKHU3by3Q0FI604+GMt5Sn9ToSTSj01upxQG8Z4tLMLqJcghytAoCq0Esssn6puVJ
 yXuw==
X-Gm-Message-State: AC+VfDyy2Ulfkrg+CeGagWpQRI9uaYWu3j92ORFD5XMBiqHxNWTX+/iO
 tIvXpepdsqCPalvm9iy5lsg=
X-Google-Smtp-Source: ACHHUZ74Y6vPHB14nKUwiJ5vo5bI2y3TI5VfJqc7IxYItuW+0HPbAoxz9KeFkuoQFVN/H1P+TFFXhw==
X-Received: by 2002:a17:903:32cb:b0:1ab:7c4:eb24 with SMTP id
 i11-20020a17090332cb00b001ab07c4eb24mr46087751plr.22.1684242509271; 
 Tue, 16 May 2023 06:08:29 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-8.three.co.id. [180.214.232.8])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a1709027ecf00b001a1a07d04e6sm15562161plb.77.2023.05.16.06.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 06:08:28 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id D5DEB106211; Tue, 16 May 2023 20:08:24 +0700 (WIB)
Date: Tue, 16 May 2023 20:08:24 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Message-ID: <ZGOASHQxkCfAJIl7@debian.me>
References: <20230507214317.409305-1-bernd.kuhls@t-online.de>
 <20230507214317.409305-5-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507214317.409305-5-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684242509; x=1686834509;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=83tRXRYUH5kQgx6iOz9/eMZjfe3GyRW7+FqnKSpl/iY=;
 b=nJRqJ3AGFJqYVsGUBLlKr5abxp6WNINTurSjUiEeOyJssKcj5TelQkCX29qnKbIIqG
 PzO7fTgFSsORiZIBIy3ustxfPqNAwpXk4Nkne6V06Z77oQz/J7EmvmoUlYCRzWo6AIju
 vUMWKy1AHKLhHVahSgaWYbmi7uHeQsq25DpzSDsnSIXgssf7j5VvwaVe4AXWcro0UdvC
 9395asfhZ9CwM8DJgZ8ANmdGbagfHFKZJATAqT2UFfwiauxti3aaCrJ2slZHTRaWMtK1
 BXr9iWVCZMUmifEbR1j96mZxIZevXlooKRXtIGIsRvGZA24jtrfRKYN+6MZ9furiOpGB
 pP8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nJRqJ3AG
Subject: Re: [Buildroot] [PATCH 5/5] package/gcc: add support for gcc 13
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, May 07, 2023 at 11:43:17PM +0200, Bernd Kuhls wrote:
> https://gcc.gnu.org/gcc-13/changes.html
> https://gcc.gnu.org/gcc-13/porting_to.html
> 
> Patch 0002 was not ported from gcc-12 because it is included in this
> version:
> https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=ee4af2ed0b7322884ec4ff537564683c3749b813
> 

Thanks for the bump! For completeness, especially for people using
Buildroot-generated toolchain as external one, you need to also allow
external GCC 13 toolchains (as separate patch of course):

---- >8 ----
From 0f12ea1536d8f1c081203bee64b9c8413cce3801 Mon Sep 17 00:00:00 2001
From: Bagas Sanjaya <bagasdotme@gmail.com>
Date: Tue, 16 May 2023 20:03:58 +0700
Subject: [PATCH] toolchain-external: Support GCC 13

Support external toolchains using GCC 13.x.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../toolchain-external-custom/Config.in.options               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 0fd8841e5b..4da07566d8 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -31,6 +31,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_13
+	bool "13.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_12
 	bool "12.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
-- 
An old man doll... just what I always wanted! - Clara

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
