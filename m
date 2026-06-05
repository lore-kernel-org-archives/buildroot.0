Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0677CCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC9C66113E;
	Fri,  5 Jun 2026 12:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFDqxkyKSQI0; Fri,  5 Jun 2026 12:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD1CF61141
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663847;
	bh=2MtlqiggEP0z66ogSBmSDakwynCcEt46YH3Sr8nH18I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lIPbuLLmfn/8TS/gq9oGuTRAc284gqDzoNVgFhok++UnCWWxHXioqh8vSM3oOIFuG
	 t0WMhpWfUwPyHepFFjKNcm7njv+rLssGa5YUuGwzS7/k8UpB8VZjiKRDj7EOeBe2BI
	 56crSUa4mDMyoi9rm+qKvcQVrTZfk1kiU4WIleCppK7jLXG2doc3X2OVWw60J3nU7b
	 0ZDwZoTiYhOCQAU3R0oax2aY0kbmQ2Kpqi9u1LdDfgWRAALwTchXHpEeSWuLbfHjV+
	 +hZOUe3452INKrj5bFN/XK4JJ9S2kfzKjR2CNZMUsTUKClz5vNCbCW9Ky5OIyCFIF7
	 KBAcf+I1+NW5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD1CF61141;
	Fri,  5 Jun 2026 12:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98F5EF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B4B182C61
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBYFkL5Sqho8 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6276882C4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6276882C4D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6276882C4D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490af320e2aso22055525e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663840; x=1781268640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8ZCAmuiw/G4iskQgEPAR4nUOk+H0+Zlape9mBacJhLk=;
 b=krhcuk07USKdE74n6viQ1J972/f1mJskg/SwSErPVfrKMm6Hoi7v9G/VEqBwegWrky
 UqlKZC8ykT6JmlTtoECjb8ooZuRns0HJhm89etCTCNKQe0tm0FGAwkGgyPZASoUfCTFJ
 iR7eRyROh6XS6Hr5tg51xH1rx1Z5Px3wBSovgxR/BO34x7G0YZqgRqLoEqxWBaDzt52W
 G/AqJ2rnqgL6NUEPn1l8QAs6S3k7VbJd9cwa9Z+WR/JPm5f0zSGgdiS5Ol67Ryw0dWpK
 WVmOHHJ9zy0i42qm55+gh3LFnFWuSWZ+DNfF0W+mLyxjqhnH9TwbST5F1/2fHXPVoG4T
 ycqA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ciCVVFVtnh3AilSl7JCU/EK4cHGvhd4w+r28J5IqnQmgyN31ZwQ/97JE5UQ9wgZ1s3FhnAgoFZvg=@buildroot.org
X-Gm-Message-State: AOJu0YypokI52me8cs7rHcH6+DkZhtJcggBXKJMZLjykYep0tcm/9W4u
 wXftm81tK+PvAIth1BgcfzssgxNP7DkaDJrgncbhD6rj3cVrj/W4+40S5D8IE/P36LHHLdotIiz
 EncbJ
X-Gm-Gg: Acq92OGoyr32CpyUI8rvAQGHtIm6+ytgOSGnMLbWs6CiSLQc+dTa7NnvLXbehCbN0j0
 +2NDrL3/JX/D6Y06Ngk2SjrDuW734cFQij2h/iZhHB8c9H+5QmZShdFeCwlzcnBk7tIqynhJxUi
 WCv0IIC5drlmHrlAK+k3twnOmsfuPlCp241zNXymY3m23qreY3vG7mc0s6q7AWU6XxkEAdziQqt
 AhlspKwwOBohtsyetnTSZDQzxFjjB1JhtVmqbftqzwVs2pQWG0+ibgc3ii9zXAVDmauNpUf/oJ1
 QFJEAaS/icJvhkNS95A0HB0p4K07HB7dmfzHyazAha4qjYqbIihlfFdjMh8Jld0RCjjMzfvlX0k
 jCtB7bvfBfPGXgRPy3Xj+KKraj4nkqX/R90J1cRTzkRJnPHMKaqzGEeG3jCoenGf2vce9kgn3sK
 QnWw5sMWogUa/+NN/siS9RPoE8Kw==
X-Received: by 2002:a05:600c:82c3:b0:490:9782:3eb8 with SMTP id
 5b1f17b1804b1-490c25f4963mr52797085e9.25.1780663840453; 
 Fri, 05 Jun 2026 05:50:40 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3c183asm155605025e9.6.2026.06.05.05.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:39 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:39 +0200
Message-ID: <20260605125039.274047-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526200641.939539-2-bernd@kuhls.net>
References: <20260526200641.939539-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663840; x=1781268640; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ZCAmuiw/G4iskQgEPAR4nUOk+H0+Zlape9mBacJhLk=;
 b=W0qRVeET2KFTuPDwMRX/fWRBBa+lq+0MlRJwyS8+ngfi261GqULnU2NGOpql6CXYSf
 H8LmOvj2DxKsscH2gHsWBzK27trlj70G7YcfLN/6gd3d1tnSV34Ps3xFr2XUxGNmDhKL
 1UAV+qJL7ydD9WZiXGsok4P2PX+3xoegvbTObsOtFu3zjJ6VlkMpecmXTCGvOkUCycv5
 ijFuHowhckZJP8cMcp+/aWuYgIpl/Pt69Su4/Ah7qzgkQOW2nQuUxVU+dhcQtV4VmtBb
 tlJuROIYNCJbA/2CiQIRG6VVUGLW2IiVn8U8V/Eyp4HjlTWy/FN/0ZlRMB8RKD1fA5kZ
 p/RA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W0qRVeET
Subject: Re: [Buildroot] [PATCH 2/4] package/libde265: disable neon support
 for armv7m
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
> Buildroot commit d4b8a42fb253116befe539e5529ac4efd97ab421 bumped the
> package from 1.0.16 to 1.0.18.
> Upstream added optional neon support in version 1.0.17:
> https://github.com/strukturag/libde265/commit/f22cf00a86f4a47f9423deb3b1daa35d981b2ec9
> 
> The configure check detects neon support:
> 
> -- Performing Test HAVE_NEON
> -- Performing Test HAVE_NEON - Success
> 
> but causes a build error at linking stage:
> 
> [100%] Linking CXX executable dec265
> /builds/bkuhls/buildroot/br-test-pkg/bootlin-armv7m-uclibc/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real:
>  error: ../libde265/libde265.a(hevcdsp_qpel_neon.S.o):
>  conflicting architecture profiles A/M
> 
> so we add a configure option to disable neon support.
> 
> The build error was not yet detected by the autobuilders but can be
> reproduced using this defconfig:
> 
> BR2_arm=y
> BR2_cortex_m4=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
> BR2_PACKAGE_LIBDE265=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Series passed Gitlab pipeline:
> https://gitlab.com/bkuhls/buildroot/-/pipelines/2554360744
> 
> I am not familiar with the various arm archs, the configure check for
> neon tests 'check_c_compiler_flag(-mfpu=neon':
> https://github.com/strukturag/libde265/blob/v1.1.0/CMakeLists.txt#L120
> 
>  package/libde265/libde265.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
> index d7e3df83ca..b559a9f607 100644
> --- a/package/libde265/libde265.mk
> +++ b/package/libde265/libde265.mk
> @@ -16,4 +16,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  LIBDE265_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
>  endif
>  
> +ifeq ($(BR2_ARM_CPU_ARMV7M):$(BR2_ARM_CPU_HAS_NEON),y:)
> +LIBDE265_CONF_OPTS += -DHAVE_NEON=OFF
> +endif
> +
>  $(eval $(cmake-package))
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
