Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3820EC87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04EFA405A6;
	Thu,  7 Aug 2025 18:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGxaEmvQXUQM; Thu,  7 Aug 2025 18:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25877405AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25877405AE;
	Thu,  7 Aug 2025 18:24:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55C8D4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C483400A2
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fExDKiwabB60 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B9B940087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B9B940087
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B9B940087
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-459d62184c9so8759555e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591064; x=1755195864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tVazR8XPnMw5osK/nWxjxlDeZi+rxduscUS8zM2XWd0=;
 b=dEIO0QugO3QcG5OiM0rLQiHWsRYxlrGmjK1ckFZ1QpoW/cfdUli3KUrsdQD8sgUzWS
 6Qu8gHnGmuD8IewV5vLsCe07QIA4yY37CFoOm46HXNN1rD2Y8mG2g5FXHZqRraqML5Y5
 4449OTG44hut8C48pX37mNDSHyNdJOlDHGmMH35qyI4ed+HPMJAf0kkUtRgt7jwDVaRL
 eQiYxcSDM0A4DinpjP1SdQzLxtZUn8gU7bwwJayQ0Y2IcJzmx3hu+Ol2hk8vEg4FLsm8
 Oat4u25Rhr+IwK7Q5mBDWacyUNTf4ZovhjBr6jorga45SjefrEWEl+bgafKyri9gK0St
 3PuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/r3Zcz7fk9YZQTCLjGqVkAZ4mhIZurCzGDOi0XF+aW7wAFalA88YFEZ3RH4KtCJzPduzEQASqVJM=@buildroot.org
X-Gm-Message-State: AOJu0YxJuaDxmSnPrSdurNqBkt6hM+ctkyleAil63JgfYzrcIPWkruXT
 AKTNWGaWpM6ARjptp+IaIA3DH4NvvW+DMicC82eOiLaYOgUXmf2WclQdK7s+WhEWqN+HvqLO80p
 0xhk3
X-Gm-Gg: ASbGncv7Xex515VzXPiYC6RF2j31PN/TeKawl+N2ylPpnnZqjYCKd3ZG3GuYfO/Bid0
 aE+l3rLxOT5iGDCpUokLurohBmfq/hX89MJv9enOmi0Dnk2ocWRyJG7Y5Jfo9lJw+fcKgY01ujt
 /UcZR95YDDd8SjTSWjrefhZoXt2ADGJNiS+4vj8/DmW5qlcR5Jhi7qAFUFNyz5DdVuFFzIpi6PV
 OPSW/mkt3zjMImNiRTzuk/ER2VRcO/swBnCEqJG6SYX3woFMm6ru8XUpzQzgDOiN2dK3fUBiryE
 BW4JG21yOj8Xp/Wesvk+tP8gmgyzAQYBk2lbj5UTr8IlkMOKx1yLdYfvad+/TYoQYjOs7CJQ4C1
 rUFNT2AZirzYXXA==
X-Google-Smtp-Source: AGHT+IEw9MbEiWax94RaxY//UJ8rcFbNUWe8CxkyCxb8M9F4RGXPL2IUACg2cyorOdQ0e6ej913oBA==
X-Received: by 2002:a05:600c:3b98:b0:459:e466:1bec with SMTP id
 5b1f17b1804b1-459f4ea0d17mr272975e9.2.1754591064380; 
 Thu, 07 Aug 2025 11:24:24 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459c58ed0ecsm101216125e9.4.2025.08.07.11.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:24 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:23 +0200
Message-ID: <20250807182423.725233-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724202406.958337-1-ju.o@free.fr>
References: <20250724202406.958337-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591064; x=1755195864; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVazR8XPnMw5osK/nWxjxlDeZi+rxduscUS8zM2XWd0=;
 b=bwyIKnkhbbfa6HJ/fMBSA2y9pTEcvRoR/YllEVatgbbXCzqAeabRQ6fUF7yDRTICgq
 VIyKTTjjVlvivoQsJzIXQVMqhzUr63Yy3EG/QvQas5waik9XPQUUofuYBPbQjfIn6O2h
 Pu6lIIEQXgQMFQl/awJIcBqJxxW+nd8Biyeno86n6BO121tzfcJ7gcveI1Oaoa6EK1Pt
 tONJNl/rPDdtSc6s22Z+rBV/nhKTVQisVAZFZg0wYOK3hAhuwQ+80xNnkIXqBRwpqkaV
 CB96CKhWuVa5ZfrrDWbi0lMYgo6V1Q0jPwwPK50XyIjVH3+wZ7WA3x0MRg1YUpUvuvgK
 SahQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bwyIKnkh
Subject: Re: [Buildroot] [PATCH v2 1/1] package/berkeleydb: fix build with
 host gcc-15.x
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
> Commit [1] fixed berkeleydb target build with gcc-15.x.
> The host variant package also fails when building with host gcc-15.x.
> 
> This commit fixes the issue by replicating the same fix for the package
> host variant.
> 
> Fixes:
> https://autobuild.buildroot.org/results/a8051600ab95a63c852960f8dace757b16c665f0/
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/c1d422edde19d07d6406705b1a4b059125dba689
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> Changes v1 -> v2:
> change -std=c99 to -std=gnu99 to align fix with target variant
> ---
>  package/berkeleydb/berkeleydb.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
> index b2d4b689f3..6c487400ae 100644
> --- a/package/berkeleydb/berkeleydb.mk
> +++ b/package/berkeleydb/berkeleydb.mk
> @@ -51,6 +51,7 @@ endef
>  define HOST_BERKELEYDB_CONFIGURE_CMDS
>  	(cd $(@D)/build_unix; rm -rf config.cache; \
>  		$(HOST_CONFIGURE_OPTS) \
> +		CFLAGS="$(HOST_CFLAGS) -std=gnu99" \
>  		../dist/configure $(QUIET) \
>  		--prefix=$(HOST_DIR) \
>  		--with-gnu-ld \
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
