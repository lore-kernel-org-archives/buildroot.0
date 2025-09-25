Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954FFCAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AD4761525;
	Thu, 25 Sep 2025 20:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ka12-OE0cVhg; Thu, 25 Sep 2025 20:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A66861554
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A66861554;
	Thu, 25 Sep 2025 20:16:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34149177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AFA341275
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0aM9vugarqRo for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21C2140066
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21C2140066
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21C2140066
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:45 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e37d10ed2so10423825e9.2
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831404; x=1759436204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vwj/hvTApim5huZPQjyuRXGecz7tlCgXRBHcAA8Gufw=;
 b=CRCobR5gsHWhZAkAJ2woHcXMFomRoDr7Ubhl0P+fEHzg8YYH8jECPP/m5cnmx+TMy8
 xQGbTvq08AE/JCaj13dh8W/SeX1ZzhSCCbOOWrkAmyScwoeFA9qw0upkhkPaLy+Rm7yh
 9oGGFUHr6X9Q73FnYKF7NnKKr1vHLoVgtS1iRMcvRd0pkXNtTK564ScqxVNXVdXzvLKV
 cro5/WMPlbTGzE/PT9BAuN8mLlpMBwy/POBf0y8h4L8BmhsDc4Kfy9IxH4ie+v5hH6jk
 eZkzJ1VSMFj+BRVqV8VCFOYz2DC1IimnJF8LwuGNOF+VeDIb+6qhGsUKsFKCTUlcbtRW
 xS7w==
X-Gm-Message-State: AOJu0YzCBgL7nFdVvGxJqiLZlE5efugofT4iDyk59XZfUDZjld8igYVd
 +sZIxLJ5hsE0LCM//ptZkwiBN0I5linqanQ50kIBTGfQy8kJuuWWr7Sfhv1NnQ3bHvBrXwh7hUo
 VcuGX9lQ=
X-Gm-Gg: ASbGncv0csunYHtBv/fQnmkQaZSoEvP1JcGxWIlEHEAQvjq4pHcrUnFTlJ4I7yzz6jB
 4t9JGWGeW6+5ryk6Cyl1TIOL/ap8aocucOvMXH+Me3DgrrK4sg1oLySqrodbgapy+ztg5EPlfJN
 +XSu245TJeZhF0H8SPyJxtMdANDsnCqKrGPG3a+yxczA7dAOySc2CewBoi8yzaOOSPLmp902ekV
 93/ohZ0jKEhNq24LxTv5mjc4fYUMeSyDSceLhTG5m+RVU0/+InWaSQjjbIqlSh3w8xU5NBob7L6
 Bt00IAzY1YXtuscn+E1wHCXi8eu77mtOZ7mVGgyXauW0T0AW6E/6pBsrY0Q3rPTAKT8IvVylpiW
 nUQiiGTQeuGebZ2k=
X-Google-Smtp-Source: AGHT+IF1MPaOFH6LXXXctF1k0J2YlZG+shY5HYrhop1PuhXB0kpcSTvOphr/OmduxKQ/v1S/z8JaaA==
X-Received: by 2002:a05:600c:1d16:b0:459:d3ce:2cbd with SMTP id
 5b1f17b1804b1-46e329ee194mr48832085e9.13.1758831404059; 
 Thu, 25 Sep 2025 13:16:44 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31e97sm89933805e9.14.2025.09.25.13.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:43 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:43 +0200
Message-ID: <20250925201643.43378-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831404; x=1759436204; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwj/hvTApim5huZPQjyuRXGecz7tlCgXRBHcAA8Gufw=;
 b=dXlsJ1EYmpWzyX3nkMhByZpwl4zTlYy2cCSLu6p3NkIFBvtJ4ddkcDWz2MRbj9hBsa
 CyEJUNxthWAwaD6aaTd1Esom2e02Wrz/0BODlq6tuxp8lZw1Jd/uGn2iYuvcaBUtVUiA
 o8nthuVhipvE03rjXgTQSTYxe3/BC1Y4svZtL2H4oiNSkKLmwau5s/0K17ckiuiVPgxS
 npscRZ+uiM8AKeiHamYY/XPO2a8s4VOSBGAGGMsTuATcSh/51gRB8SD58oBwBwIgdFG6
 NLCGl7m3ApJ+z5axNeuuasNR4Pj9huVWVYKHBSveX32iIyCTGh37EtFAQD7arGxx8NOI
 xCdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dXlsJ1EY
Subject: Re: [Buildroot] [PATCH 01/12] package/asterisk: fix deprecated CPE
 ID
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
> The CPE 'asterisk:open_source' has been deprecated in favour of
> 'sangoma:asterisk'.
> 
> See the following for more information:
>  - https://nvd.nist.gov/products/cpe/detail/7FC01D7D-5AE9-42A8-B31E-A99E745E5BE5
>  - https://github.com/asterisk/asterisk/security
>  - https://nvd.nist.gov/vuln/detail/CVE-2024-42491
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/asterisk/asterisk.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index 6d682f161d..18af217129 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -26,8 +26,7 @@ ASTERISK_LICENSE_FILES = \
>  	codecs/speex/speex_resampler.h \
>  	utils/db1-ast/include/db.h
>  
> -ASTERISK_CPE_ID_VENDOR = asterisk
> -ASTERISK_CPE_ID_PRODUCT = open_source
> +ASTERISK_CPE_ID_VENDOR = sangoma
>  ASTERISK_SELINUX_MODULES = asterisk
>  
>  # For patches 0002 and 0003
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
