Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189E1C53200
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 14:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9C6360B8F;
	Fri, 24 Jul 2026 14:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ke3GaiERuOrn; Fri, 24 Jul 2026 14:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B90E660B7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784902491;
	bh=adt+Ta+UP7bVc7sThl4247AqGZ40tNp9wFd8UdTNVB0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GIkNuePIuFsJFk+DNh7HSbQNMDXQOgMFmZoHzkacKWXquGnd/6vmYjNAB+PW7V/kD
	 extmMG5+qTo5kztNtlYYxy7Y02+vuQtxoJ+NqXczXztHkYHEw63K634NMPAeZZCJhs
	 26J1yY0HSH8OPn0FjM7jyNaMRQy1YDNtW25mH/qyraPxoaTr/4kbWP1AN2YqEH6k6k
	 6b/w1NR9N12wVMZdg0xPHCPBciamZGgSqN8jtU/SO03cYAHIv6MUUb7JCRYHIdMJPX
	 G/grESvUWVWHTNxOdJxgq9055slrcEFYTlPaGuQFybFuVXt7055WNfZfa6zxBx34Bo
	 S+gS9n891QJBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B90E660B7C;
	Fri, 24 Jul 2026 14:14:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5037A3B1
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41CCC403CB
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRNr1O2oeifK for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 14:14:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24818400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24818400BD
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24818400BD
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4956869750eso4223055e9.2
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 07:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784902486; x=1785507286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5PH+JJrAviaEBDC/y95t6WYz/7uNUlzRQNqCnImIjjo=;
 b=Po4cZaVle4TSN9u3fZZ8DwqOZ/9A1iy4IR23yXbnADXJ2geeYjDtP9nOhKhqcZ/R1B
 5TXPUXb18sXOM5uZaINtd84M2Adq5AlHSJQySNJduX9PW4FBopCaGz0IyvPpPdOiXMo/
 6ClFf/AZiBH7TcSmFV4VT08MNZnVlFbevyiiisTKWFGe7EWJl343bNJ+yO7NXLc67mDX
 6MNJUvdsGOrszOMBsC15u+WvHJrIpvSziHB3fSm9OCG3r8G0+YK69EKwJ7ccnm0ukJsK
 s2js57LVdqJ87q7OQjgMFloTxg5H4f5quenc2KhjFvSVWNLXddY48y1UYVwfXGsLk2Nw
 ZD/A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqcLRePk2GhacSG9BSrogt2ZctXD8t4SRawQCH3MynO7YzaR2uDVTMzZOGoV+rZlfI8mNZWvGgfWRk=@buildroot.org
X-Gm-Message-State: AOJu0YyJSsk8isZiUNj/HWNowMZprstmGJqb80ZMjwWUTmk8DkS4290x
 ATJjo1hV2Ksp8rNw72/NnA35BpvDIaeQ8VVlm71WrOylgpLw1VZK2glADrY2cP+JHbk=
X-Gm-Gg: AR+sD12MKAvPG++krSPuwb79e19ddYYfOV9u9jNaC+/GVIl8iiHHWb28gWt+00D+2MH
 gtIQnc2FSX39JE+dVjF25NtlRu5VCjRLaVK6gXigZW63oGuexocoUOPz0ioxgifN9GS78OsUikR
 yEXfxDu81qqWd++ltfgd1FhdC68zV+oX6Vd0R193NN8EaZLCVxAjXr+KBGlLoi86GHuDOHa2rcT
 gkS93NPOlKAS8DoIJgE2WWY+ryxxlESr/p7eAH0guZNUkoaJQm9m4wlytsuQxD82RDYdx48/Mz0
 2vSm/SBmEd8RUvYGT1nYfNE3iGP/baX2hUhSSauCMuYW9Fes942NAxy+cxmdy07TqrCDk13ohi0
 xowa1zzxo8OVjEiALMoXfX0Sqy0t+5zBcu3kA+yoe3Ortqi3ZbBO1mgIsDl/iocrGOI+XbRM=
X-Received: by 2002:a7b:ca4c:0:b0:493:aa0a:45ad with SMTP id
 5b1f17b1804b1-49573cc2e68mr62079505e9.2.1784902485688; 
 Fri, 24 Jul 2026 07:14:45 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957af5d4d7sm79490715e9.2.2026.07.24.07.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 07:14:45 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Jul 2026 16:14:44 +0200
Message-ID: <20260724141444.477787-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718065215.928877-2-bernd@kuhls.net>
References: <20260718065215.928877-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784902486; x=1785507286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5PH+JJrAviaEBDC/y95t6WYz/7uNUlzRQNqCnImIjjo=;
 b=L861NjmFHWftcOvt2sPV9s5rziuEnbzmuThODRjn1sqzxH8J4cQTYqjhK7PwpzNd9M
 AcgKhW3tCvCO46JZBgKvJ8YlGcLmVE1PIc5Jacm35eRkoMLcmzVEI0UzxXZKKuV4afLy
 I2j1BnFBKUGwYGUcXZqfL4bdVqoNa3JHp1QSByBUxxUssJ3digwa0eokmiAbOqWIYav+
 AMxMthiChbsgwXSbl7J2XIQHzULcY0XweDU5Oyoy/1+mXjRBBH3aJfNN6yOYV3qGwII1
 GL/iZdKQJGgSaPM7BqUPAtkofa+geB0GIJM4QiaMDJTSU9bZf+rVm0UsifoO0mKJxLOw
 uOnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L861NjmF
Subject: Re: [Buildroot] [PATCH 2/3] package/bitcoin: Fix build without SSP
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
> Buildroot commit fabcd7c8cc44e7e03c68bfcd2b4e2d10331a93f6 bumped the
> package from 28.0 to 30.0 which includes upstream commit
> https://github.com/bitcoin/bitcoin/commit/a01cb6e63ff3940f0773b37e2fe1e148f17acad9
> that was first included in version 29.0 and added among others
> -fstack-protector-all to cxx_flags guarded with a new configure option
> ENABLE_HARDENING which default to ON.
> 
> This commit causes build errors with toolchains with SSP support:
> 
> [ 44%] Linking CXX executable ../bin/bitcoin
> /home/autobuild/autobuild/instance-40/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.2.0/../../../../i686-buildroot-linux-musl/bin/ld:
>  CMakeFiles/bitcoin.dir/bitcoin.cpp.o:
>  in function `fs::PathToString(fs::path const&)':
> bitcoin.cpp:(.text+0x4c):
>  undefined reference to `__stack_chk_fail_local'
> 
> Upstream later removed the forementioned configure option with commit
> https://github.com/bitcoin/bitcoin/commit/00ba3ba30341a9073049125334f176d6c05d1b54
> that was first included in version 30.0 so we need to remove
> -fstack-protector-all from CMakeLists.txt.
> 
> Fixes:
> https://autobuild.buildroot.net/results/093/093253c79fed1c5b93decc3124e9ef4622168efe/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/8d17d8107a074b94d628061a3c18917987141483
> 
>  ...sts.txt-Don-t-force-fstack-protector.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch
> 
> diff --git a/package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch b/package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch
> new file mode 100644
> index 0000000000..40370d1bf7
> --- /dev/null
> +++ b/package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch
> @@ -0,0 +1,30 @@
> +From 4d33b5bcc924c9271c40a19796f8316ba6aaa276 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sat, 18 Jul 2026 08:10:21 +0200
> +Subject: [PATCH] CMakeLists.txt: Don't force -fstack-protector
> +
> +This allows the environment to decide whether SSP should be used or
> +not, for example to support toolchains that don't have SSP support.
> +
> +Upstream: N/A Buildroot specific
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + CMakeLists.txt | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 892f30d94b..93ccbf71ec 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -532,7 +532,6 @@ else()
> +   unset(cxx_supports_fortify_source)
> + 
> +   try_append_cxx_flags("-Wstack-protector" TARGET core_interface SKIP_LINK)
> +-  try_append_cxx_flags("-fstack-protector-all" TARGET core_interface)
> +   try_append_cxx_flags("-fcf-protection=full" TARGET core_interface)
> + 
> +   if(MINGW)
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
