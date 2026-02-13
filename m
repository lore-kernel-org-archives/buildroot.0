Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D29EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F6BA61735;
	Fri, 13 Feb 2026 19:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ny7VSZlRD_q; Fri, 13 Feb 2026 19:40:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12BD66147C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011601;
	bh=T2RlTQjA1oz5IS/ik0oDL8XCW1cUrI/Gn/CDaWeqZVU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hFiRsuBTceYVH3x52pMmjGxQIoFeIsJw6eCTQbQsJ2GA/lz5SEOw3N3vutAmqyL0D
	 C9nyt0ZNAwd3IiK/2xx/o5YWR0xFUiZTl+3Kxb+GL0/HubIsJPba6oxD/6OVQ9ZGWJ
	 MmrqIOJlSNPxL9SL1NbJLRmYz1+pnvXNAFI57q0kdr/zly1PDVqJPJrzTrD11blrEw
	 JHcCPevttFuUQZkLTTy7JxbKEzOPfYWdwhqrt5xklek2ydsNiJOKNmWAV1xNVZ2ZCF
	 jPUy0sEZHuBu2OQcebY1YtehOW2RLDeZuBkh1XfT/jyy03ASg1mRsHp3Nxy9Nm2BHe
	 f1yvFtGCQQKag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12BD66147C;
	Fri, 13 Feb 2026 19:40:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E16769
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 502EA6156B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwGa_liA_cQZ for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 416066165B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 416066165B
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 416066165B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4358fb60802so920823f8f.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011507; x=1771616307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1M1PxK5lN1GpgA4z6JQNHqf/FvmGSSAGFLl5nEMGe7o=;
 b=ISGNt/Wkn6VAiKvYVM2o9dn01dN2r1aIj68yAa1MHzS+HqKjj2a2mrfipkeN36/jub
 c6UCmNeBb4msyQWt1TLdapcXVIsYsof7EdX3GaZg09/Kls012P90YZzh55ALotK1VpSi
 aUO3qyrfRm98wM6k+S9gTi0KCFOHJ/cPI2iGHvpMCGh8tvxXYnN/e2CL4nJ15DS7qnNf
 /vJHqKfHIRsQT4QA8pV6r9X/Pk7ZCD0ylnXHkTMGAtJ/RMsB6A8OZ1v7bvlGmL9u7SyZ
 0wuLf7QXJhTkv3Xuhj9oownFKJWeJWZ4F/IHCwhPfg9NtRSDkdRz9L32e4e7p7M4pAju
 HtjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5wVdCFjHezNl+1P+mtS1vwH3BeaAsyEuY7DetDjT0YHPf4hxfYYmZatD0qTbeHKkc3vrq2N+8ckw=@buildroot.org
X-Gm-Message-State: AOJu0Yycc/mj++5Sp2KHHqK5pcK1EGy4j1nH6lz9D/uXkHykUOg+9Phj
 9Uil7eRYRZ05bDZzOKxGj9YCdMJP8AdXCW+POqHEwqA4hG8e00jtWy9UmgNWIw3Q4SI=
X-Gm-Gg: AZuq6aIOTcSPvBCU9SRdlSh3d2ARLUuQg3aVTfQDvZEAkfm/VciyaysTPS7cD99og+s
 2JysSMjaDjl7hP+1b136ryWlD6t48ihnS/mRVJyNsT0Mm01RVVzVNqBSVpBBdz9FzMIMC/xW7TH
 Ia4XnFE365ryL6ZH6rYTbAIqHpK1aeJRDjNmkT0VnsO7Mc12FzCtnM97pkG0crJmpLdnpL8R+LE
 RjwB9uiWznE7AWJycm/eeQVOE/uLbri7aaQ0nBs4+YNd17KLxEf5k6HTtwSipa6e5ddClOzJC5j
 cMvvKsnTOZitGn2ctw/GGMNmX2KY3LCuj1A8YHZUsTgpnj5zn+p1yzj4TJ4OeJzhFe83vfEeFoz
 u7kMkn1IvJRI4rZdu/9OoLC5rmj/DzNJom23CjMnZey9piV68TrDWXl2I9Mmqd8BogIoWjh9UAi
 1ErUUTsgvr7VD3aXQ=
X-Received: by 2002:a05:6000:420d:b0:436:4ba:59a8 with SMTP id
 ffacd0b85a97d-4379d5da900mr2626766f8f.3.1771011506998; 
 Fri, 13 Feb 2026 11:38:26 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac7d91sm7902060f8f.26.2026.02.13.11.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:26 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:38:25 +0100
Message-ID: <20260213193825.42411-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203193937.2682994-1-bernd@kuhls.net>
References: <20260203193937.2682994-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011507; x=1771616307; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1M1PxK5lN1GpgA4z6JQNHqf/FvmGSSAGFLl5nEMGe7o=;
 b=VoEermar1HyIBcbDFm0yGASPNAk5AxarJK9jfLGLIa0aiyYV85N5ZCL69kptbnXP7j
 qTcpGm6ptDD2vfuSV/k7ten6zfk7W03Bbuy3jAaUGRDt1sEc4haV6wfEqDBIYuhqxMuf
 24idlmUJDPxnBvGAQCYuzjjws6LU8lpX9Mc41D/q8ZFZWv8pqV5C1pDrbEatJeYnW5wP
 kqG7Ivp7clIEJMXAzd0wg67RcPPI5u+1dNfCLNNdSSKImlmg+KLd3h2lVsh1xXLMsXsJ
 vWNitajbb58z1abh8zq5pX/dwLbJ0W/8VHpqOy0q4PGBaV2nPFbpyOKsWpd+kSkQqxUK
 4DFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VoEermar
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: fix aarch64_be build
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
> Buildroot commit 1b8d7e7bedb204b6fb1094a57822a4652206b44a bumped the
> package to version 23.2.1 that contains the upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/77826e835243291df664ccf2a7b8405287b72387#e65744354fdd7dd38342b138e59e40767cfcdaa9
> which causes build errors on aarch64_be.
> 
> The build error was first seen by the autobuilders with mesa3d-23.3.3:
> https://autobuild.buildroot.net/results/b62/b62eba2155b080ed02fde774994f2fffc8a6ef51/
> according to https://autobuild.buildroot.net/?reason=mesa3d%&arch=aarch64_be
> 
> A backport to LTS branches should be considered.
> 
> Fixes:
> https://autobuild.buildroot.net/results/efd/efd07d97df4e0c1ceb07fc26e17898afef5435b9/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...3_neon.c-only-for-little-endian-arch.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch
> 
> diff --git a/package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch b/package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch
> new file mode 100644
> index 0000000000..5e4c89b714
> --- /dev/null
> +++ b/package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch
> @@ -0,0 +1,47 @@
> +From c4292cc5af3278b294c2baa5464c9985228205fe Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Tue, 3 Feb 2026 20:13:49 +0100
> +Subject: [PATCH] blake3: add blake3_neon.c only for little endian archs
> +
> +Fixes build error on big endian archs:
> +
> +Build machine cpu family: x86_64
> +Build machine cpu: x86_64
> +Host machine cpu family: aarch64
> +Host machine cpu: cortex-a53
> +Target machine cpu family: aarch64
> +Target machine cpu: cortex-a53
> +[...]
> +../src/util/blake3/blake3_neon.c:6:2: error: #error "This implementation only supports little-endian ARM."
> +    6 | #error "This implementation only supports little-endian ARM."
> +
> +as detected by buildroot autobuilders:
> +https://autobuild.buildroot.net/results/efd/efd07d97df4e0c1ceb07fc26e17898afef5435b9/build-end.log
> +
> +For reference:
> +$ grep -i endian output/build/mesa3d-25.3.4/buildroot-build/cross-compilation.conf
> +endian = 'big'
> +
> +Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39681
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/util/blake3/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/util/blake3/meson.build b/src/util/blake3/meson.build
> +index bd51cfb68c3..767da2c6ec3 100644
> +--- a/src/util/blake3/meson.build
> ++++ b/src/util/blake3/meson.build
> +@@ -35,7 +35,7 @@ elif cpu_family == 'x86'
> +   # There are no assembly versions for 32-bit x86. Compiling the C versions require a different compilation flag per
> +   # file, which is not well supported by Meson. Leave SIMD support out for now.
> +   blake3_defs += blake3_x86_no_simd_defs
> +-elif cpu_family == 'aarch64'
> ++elif cpu_family == 'aarch64' and target_machine.endian() == 'little'
> +   files_blake3 += ['blake3_neon.c']
> + endif
> + 
> +-- 
> +2.47.3
> +
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
