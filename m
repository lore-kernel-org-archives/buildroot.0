Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14136CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5FA284ADC;
	Thu, 11 Sep 2025 19:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLxplwL9VHuh; Thu, 11 Sep 2025 19:22:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D461B84A26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D461B84A26;
	Thu, 11 Sep 2025 19:22:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F6C1E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9A7684A26
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANsVEAg-M09h for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:22:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C822184A1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C822184A1C
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C822184A1C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:22:49 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b04770a25f2so155158266b.2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618568; x=1758223368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VrSL4dOuCORFHrzahfpvPs5gOsAJWh1UEwQHahyKPCo=;
 b=cdnanrpTdgU7G4DJiKQX8AotPgoGvme/V1mjC2sm6yaoBQx+5QuVMNtYkcDL+KAeaS
 ZvSe+stk4mSKqK/ZfR9g2bqMXbzMJPtYshFS8A702v6MUD2BCoJi/SflOlD6jWD446rr
 ZHoM0/JU9XLFapvB7Qa+q5zaOawgsgrhHSgI8mHVXc9LMn8Yf7L+43twjqP5vC1T+Aw9
 jF9CmpwBUJl/tdboiVKEVWKjCpUo+HKBB/bmYJ5AOizt+68XZc24Rl0Wos+i+NaUGCaD
 fHB+q2VydzR9/JVbTiDrQlTralB7bkH2mJ+FIpK8Rql7PRt1iDgT9v1hn4Rrp8sN9/9P
 gX1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRO+rXtmbYvoDozGV4dVJLn4Q35pKvDLve/N6sz67mPDSmpdQ1fJnC6/s7tMmHKn+1YuMpg3OjQL8=@buildroot.org
X-Gm-Message-State: AOJu0YzwqM2QpPNPm7wUdzZ28ZRSe2fQiBD9OrKI9Pi3s6bbqZVZl4xY
 9yLqxEDAUEtgzg0FfsBbQgQttiRDsAd3gayiv/6SrfF7l+0+WDznlkv18kvcPH8mggj6huh0dm7
 hlnfgMJE=
X-Gm-Gg: ASbGncs4F3I18GDS7lv1vMeoU7S3fLxEyRZ5tvqKs+xR3EHWe8qOOVx0KVqzeIJHG0H
 LIfPboenUL3wp4V9ZzNKUOYBe6u8awdB8faRlcKwIGp7DNc3k+oc9bjTz5jiP/EbM7DTIv1r/0v
 otu6Y9q1mUjyPIlFz08zL2cnOLPRNvhYhZQektBMaLT4qDwBRnDIBhVr8lsPtsXOh/yaXM+U8f9
 fR4J5Zx3IOXXa1J6CYzHaasceIRIBmQKSGk6qow784Hdb5A6akdcyblRNrFfurAnd6BdpukaecL
 W+hDP0ibZTe56dqsIRRF9MEvt1Nlt/VL5z0cvroHpAZ2AdTyPgRPTTXVqjyy9gKQtBJ61Hc5cLl
 judjaICbfDfD/d419LJXNewObNrnUNlFg7bXo
X-Google-Smtp-Source: AGHT+IE0tEHIScgDD/VE84q28sRL7LKvr/XKOvuZzyRD4g5OoEpqM+beX2eAj66j3JRXbReShH956g==
X-Received: by 2002:a17:907:608b:b0:b04:6cf7:75cd with SMTP id
 a640c23a62f3a-b07c3a6dc8bmr28893966b.54.1757618567521; 
 Thu, 11 Sep 2025 12:22:47 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec3400cd4sm1761454a12.41.2025.09.11.12.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:22:47 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:22:24 +0200
Message-Id: <20250911192224.2671690-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250831213843.1310171-2-romain.naour@smile.fr>
References: <20250831213843.1310171-2-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618568; x=1758223368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VrSL4dOuCORFHrzahfpvPs5gOsAJWh1UEwQHahyKPCo=;
 b=hdV5+1OatHKeyVI06BFYWcInqpBLC5uqAGt6ChWDd9GGUGkpQHHgzNkIUcUsxHg2ix
 0ESPDusErdl7wAc9Fzjx4oBqksVTL6YtVIIwq/XGMFEYOu+I9AgXINBAGhu2eYRRNLt1
 g6v9cFk1k+YW7MYhdZXVGFf+UOKkKllsmKA6MxMbMo2BIg2ldk1qyTBtlgpvA0J/Uw4q
 RUTBXGfMcCRALNt03ycuPyUXMoVorPOMxMd2vjs5XWgcmV7C6i57Nyacn3DcbAkuJh9x
 hO/pzlCmzpp9Yio44dbDP/z4cdK7CYDn/uKjbB08LnOZkrGjF9/LOKLJupGeUgNsbRXA
 SyWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hdV5+1Oa
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: TestOpenJdk: remove
 stime() function call
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
> stime() has been deprecated in glibc 2.31 [1] and replaced with
> clock_settime(). Let's replace the stime() function call used in
> BR2_PACKAGE_OPENJDK_JNI_TEST sources with clock_settime().
> 
> Apply the same change as busybox [2]. Make sure that timeToSet
> has been zeroed.
> 
> With that fixed, the test "Call Native Library to Set System Time"
> succeed:
> 
>   [BRTEST# java -cp /usr/bin JniTest
>   Test: Get JNI Version passed
>   Test: Read Native String Constant passed
>   Test: Write Java String to Native Library passed
>   Test: Write Java Char Array to Native Library passed
>   Test: Write String Member to Native Library passed
>   Test: Set String Member from Native Library passed
>   Test: Execeute Java Function from Native Library passed
>   Test: Instantiate Java Class passed
>   Test: Call Native Library to Set System Time passed
>   [BRTEST# echo $?
>   0
> 
> The last external toolchain using a glibc 2.30 was the Bootlin
> aarch64--glibc--bleeding-edge-2020.02-2, so since then TestOpenJdk
> is broken.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774851
> 
> [1] https://lists.gnu.org/archive/html/info-gnu/2020-02/msg00001.html
> [2] https://git.busybox.net/busybox/commit/?id=d3539be8f27b8cbfdfee460fe08299158f08bcd9
> [3] https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/readmes/aarch64--glibc--bleeding-edge-2020.02-2.txt
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  .../br2-external/openjdk/package/openjdk-jni-test/native.c  | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c
> index ed87e345af..9e926a27d9 100644
> --- a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c
> @@ -29,8 +29,10 @@ void execute_function(void(*function)(void*), void* context)
>  }
>  void set_time_in_seconds(int seconds)
>  {
> -	time_t timeToSet = seconds;
> -	stime(&timeToSet);
> +	struct timespec timeToSet = { 0, 0 };
> +
> +	timeToSet.tv_sec = seconds;
> +	clock_settime(CLOCK_REALTIME, &timeToSet);
>  }
>  void write_internal_time_in_seconds()
>  {
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
