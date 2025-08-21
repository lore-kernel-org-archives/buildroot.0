Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B02CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 641E18478F;
	Thu, 21 Aug 2025 19:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDoSIA5zw7o8; Thu, 21 Aug 2025 19:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9744384751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9744384751;
	Thu, 21 Aug 2025 19:21:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F0201C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15CC140B62
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ca40enzUwxm6 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3884240B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3884240B26
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3884240B26
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45a1b0c52f3so8510175e9.3
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804070; x=1756408870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f2K0QIA4NQbf9vD3G1gzVirdRAbhBfT+g2BSmEKYNv8=;
 b=m98Tep6tyhM/2xGDPmvKilqW5dUnLvCFZ3qTjXDsvQ1r5yYjQgKbp43NZTDK1fDuOk
 v86/cu18dXI0FRr8NysTzIdQqTQlvzLeOc5vkLEUs6U6cwMvdotUPbh5oUSwaZjbQBVc
 Cg1Jrxmk92cm9EHwQcHlWvQe+4WanH+4Bty65O3de04QJuTNVkp5K9M9CqJjMWh7dBgT
 ZhKVFBXA66bWZADEPGDeaUOiHNgwGIdCXab1IX+JScuRNnrKSA61Jj2pJvLu/b7g+nSm
 DuyIekmoDuvYzxyrEJybZVC/iD2KSHA3RNashjcsswIkYVN7mZkc66zknu3UWm1WoDdV
 fe9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuXALT/nveCJ951Hh3fe4YUUZ2Irg2xkbpUdkdcCjt6Lguzyn3oIaKeixE5lTeBr4OyRgmtwKlAvU=@buildroot.org
X-Gm-Message-State: AOJu0YwOBMOFIIh3GfoOQA4CfewmxG5IFqTfg454m8GAx0XtDE0vtghs
 j/dFhSCkTwYGEs5rk4nAOZv/VoYA5JqQrdc1uKr8FZjSbrxqX6q4NmNDeBnu9B7Cf2U/oVvAqhl
 UtFjo0sQ=
X-Gm-Gg: ASbGnctA82xmugM6RwZbT7WCHxc6aY+LxfiJRH1PeUToToDEz+e2u+1ajX3iDKvQizx
 Qyt/9CaNJaBxxtTSQ/fqUKIoltv/Pppy5zSxfqY3lClwwaaPEBLesSDb0mnYKwV9z8NSHAe4yZ3
 TKTC4LIXT8CNXV3cN1Tx/TR+3lbyBup95i5bBB6At8EkJeT44+p2iROcZCw/Md7N+kGX/rtcSkU
 rMspkgBmTvlWx91JI9kwpQjNsNmPg0p22alIKNSrPr9ov48EAI7vJUt5NxAtyGqKs9G3xigFieJ
 2FqDbX2dv8e21bxmdrmc0hNA3T3xyiLju8xmrwywgYc4mMF8Ik3zRYraXnFM+/WCPxHfQc2GBmG
 8UB1a392TQMPIzFOzNCPz/St/
X-Google-Smtp-Source: AGHT+IGyaphaoT+d5BNTlxmYHMpBgRtp6q16C3Hix3aAnFs9qIqbVMqh1u/Up+MnjMOu5H6pdjwz4A==
X-Received: by 2002:a05:600c:4506:b0:456:1bae:5470 with SMTP id
 5b1f17b1804b1-45b5179b6camr2306575e9.8.1755804070321; 
 Thu, 21 Aug 2025 12:21:10 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b4e9cff78sm16331945e9.6.2025.08.21.12.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:09 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:09 +0200
Message-ID: <20250821192109.24272-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814210758.563308-1-giulio.benetti@benettiengineering.com>
References: <20250814210758.563308-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804070; x=1756408870; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2K0QIA4NQbf9vD3G1gzVirdRAbhBfT+g2BSmEKYNv8=;
 b=HoTuWDEHy8oomNS4Ek3DxxM7Tc+iH4ZlTY1qM4vvegJG+aLivWrNaduJoXJf+jLodW
 FBZc6BAltdjp4rb7uq23j3nrGeaVPH32tIWnl1epx1MrIfMHxxIwNr8+v80V0VEatc4y
 z4lhJkZ1DsboT//V5cKmQTjrTyVSsJd2tixidaeXa0gih8V2f6CdD+S5ECWN1ugLABqx
 d590nzsVtI6O3Gnhd1aFTqbUSrOsfRz7skO8rdKUEU8KN086SepVja7Spp0k/JYphzKA
 SrXAJYPS9lpaR/uAGhGaSPEai0dholJeex5W+96nR9HMMrGcx90dr8WpX4E9z9CcJsms
 suWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HoTuWDEH
Subject: Re: [Buildroot] [PATCH] package/libtracefs: fix build failure due
 to missing NPTL
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
> At the moment package libtracefs builds utest that requires
> pthread_barrier_(), so since we don't need utest let's disable it.
> 
> Fixes:
> https://autobuild.buildroot.net/results/69b/69b75908bebdf9382a4cd9b138fcaf1e34daba09//
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/libtracefs/libtracefs.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
> index d24763fa7d..6b8f838c2e 100644
> --- a/package/libtracefs/libtracefs.mk
> +++ b/package/libtracefs/libtracefs.mk
> @@ -14,6 +14,7 @@ LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
>  
>  LIBTRACEFS_CONF_OPTS = \
>  	-Ddoc=false \
> -	-Dsamples=false
> +	-Dsamples=false \
> +	-Dutest=false
>  
>  $(eval $(meson-package))
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
