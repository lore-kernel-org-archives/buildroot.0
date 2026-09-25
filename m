Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A52C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8101A60D90;
	Fri, 25 Sep 2026 14:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1OVPkfF5ot2; Fri, 25 Sep 2026 14:46:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6CE7460D9C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347619;
	b=WMGljPC68684TrtDu2S2FlxQdSKqD4pn+LTxpJZW8A1srk0qSH4okhw+JWn+p5lHlQtE
	 0f8PBVzDg//k0xg74G87IXwaMQTABfgKxllvr5E7v93ZZOX9JeDJAputwcL3zNJEbhqXS
	 D6zEWsn2HDPg4vB4PL3wZ635UlW0YxAUDxOUZ71t3OjlPPhIm2OMbjovRUp6V+BtnpRUr
	 CrFRTHUP/V/Nffi2Hp2kbcdWhdSg9iF2VghtOsJd98obaNBep/Tq1oXLCEAHpJWiBc3j6
	 mEzThtRO7C4XFAqZ5kF2ELckocrJ5o0tLY8GHQ3CXR6LLOcSRCMSMwSVFCcoSgHyFig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347619;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=i+hrIfP83P2HnFwVJ3kkWufmeHq8f3N+OdOHTis4qOI=;
	b=EjJVZLhf9kwuwO2e7PJC5IRgxT5UwbBdt5WdUyqj/zLhzijMkl3LIiEMnV1uQFLeQ9Yb
	 hBcwTZlPAwSr1hYWaBS5r5pha7zkt5KFrIH9qyqRcyrcyJEgbieMbiP5wYReU9zHiqVZf
	 IM3aMMqk8iVj7RnCNwpt6UvDiTPEzFak8tI4gC679K6ey4KN8oVxNpABL8lsRUULQC22y
	 nxQAGitCaSH7zPWOPt+UQX9qz7xrnjkYJ+wfkyKQSvac3Kk8l7XFiQWJT6OihNf/wdSJ9
	 poTJSShQXXSr/6yQaNgAbCsoqTRh3imQJmkzoOAX5FwWcRvEBvulbIJXjYZajcLyIOA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347619;
	bh=i+hrIfP83P2HnFwVJ3kkWufmeHq8f3N+OdOHTis4qOI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HP3WhaluKVjinlWU/3BIbz/9ldboUB8zdRc56bicdLf4F6Swx2/G2X9NSSYZSf4IX
	 JVjZszfyRaTK18BNmaf2KUjUE2i7QyoHXvWrpxQbcWj/seOpvlcMrLGluzxlYbBITm
	 c3JLqeZw+3Mdt9Mo0kf36kK/ppTSZx35q7Z3IaurqoHgp2Kor83wLjtb2lH7XraLb6
	 muiV/yo8B75b8tAJp37Tk0+/AVy6TSa/t7BRh6uupq/g3glEH4khXoN21gmrNb+chx
	 O6nxNwWjctbnseH0b6NNXVM67Rmhu86x6B8l2xca8hYek79kZYC9i0z74va0zlfiIk
	 YKXoj4YuA1pFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CE7460D9C;
	Fri, 25 Sep 2026 14:46:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F139C334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E245B40BD4
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTZQ1LBH4WZs for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A74CC40790
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347617;
 b=aoZV4s1et1F5cwZ0XImwe/szBi10bXNlMj2rPaAP0kDZ2Qtyj2JvIzxJxH4//PNC7Bk3
 8dJCJxseTAOLwC0QRA2WqLlbJgfdDc+7ikP9i7LexqwcxrBwhhZA0ZSj1wnMiI6/hpBtj
 ivAhJepMbACSq4lW8J+6SS66nTsGX/QUnS2oOgpSklEEnkG0reA9YvHBeQNtOSYQ/MW5W
 XZC3fRvSKCoCDtz2ALf+U+CXv3JAC2rtAXQVnzPEW1ylUkyHeXL+CRmHYRDCIPdbDhvDW
 wcjAhvhfogP3sh6w6wZ+FY/qjCaiWE507Ay1xLjvRrfXbavV9f+EgXEgUTM/o4zTuCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347617;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=UlB/in3PlcAt5M9YExj9jXz9cnlujYC4ZjSt9y4BOkQ=;
 b=VJz1SM310onu0Ffms90/dOXgdoizMxBId1Ak/nqXfg43qIAgVamwzHuC+Fqw4MWjUVjb
 QZp+/TQw6vTCyYpkwI9Q7GR1HzQN6u0zrThOyKD72GyLRdyLp0czCKAVhoxlCQSv91Go1
 M+6UFXo9JO0Ez/ZGlSuWFI2pN2FSZAqb1tjnWuamTJrb0Mw9VsQZpmFsiCWwdsJVmiePB
 2+XHQ1NORgqr+cn+BjM9/9JOXwZdl8dPIcuARMD94JcLQlDzrZ0nXh+oV7YSu65vwkpJ0
 vJBWTqeJ1Vd2yM8DcBbrFd+Xf07mkx3jZbTLAzR4Kr3jkKzWco5B5KeA2v6vT0myT0w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Kbb3683k; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A74CC40790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:56 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e721b5503so10121155e9.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347614; x=1790952414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UlB/in3PlcAt5M9YExj9jXz9cnlujYC4ZjSt9y4BOkQ=;
 b=zOfn/gWTK2ltHtbIBjrigEAZ/jT6yn8bRzRTTTWG7BxRVwAoEhXjvNtaOV4u2HhHL1
 oytodmIBKpFjjxV6NK70zstE6LKlBApfn4WSmKTf5GNzcuuqAGKfs4bWpQfP5v4rg6Qd
 cKxgRglNOkWqsuoJOgC6NSR543FWWd03bxlKlad9lzl1MIG5niUwJn79OmBPLk/vBhJ8
 MxW2WeyRIzZ5B2H1B+ldS4xWoon37h8549x6WW1TSzWXHPDswTV9JzuIKn+02kFam0/n
 MNNFaJNfgzNXVZeh4q156UFyizucHGs8cThagNRveeLMmiS6Wvf/fvU6ouXwwp/noRpE
 Bf3g==
X-Gm-Message-State: AFuF++kuyrtfzeHw2jLe5S4Gh9+uSjwVVGhlF9gs9Z9x+HFugjfdboPu
 u9IVVcAajieBaHZNa0oz+IHPuoqiktqjpmjhgAgwZVG6wdCOnoQm8IELLd2tz6HXLD5ZOqfQcyi
 XOLJPabHDpw==
X-Gm-Gg: AYBFou0rzmwo4lcvHId307zhXlu/dglusABXKnKsTcNiUL10IjJKR+KxCDcIYGkJvMc
 pudgiJX8+XQVXBvo0Ap/Vkx0fa1dvvhsYnbu0opHOUb9qo8vmYeCy3nFZDpVPynNTB1zdkv0KlX
 AW6hahQL/P2sdjpeYWa4Co3xzlEVTKf8xe2pfXKbb+eCtH6VAHIjL5w4uS6TgWqv+EHifRRHnkP
 Oryxrot+S48OC5q2yuzJ7YAXCXF4iEPlZA4vxBjBHIQrRDVZ74ccWscBhhrBZx0/qqhZHxZkFbD
 d1m9gzoABVcQMSB1CbaZTssMUhZ58l6GuGzYW/0ElJ4kMaBKEy6IsgZnoHat1LP2ciq7vg+Ytiv
 hsZebh1WpPOGa0F7kDEA0ORGLLfVL2GT6E3e13T6xbi39ievhSEOPK+FEEF2jpgAuJf5R6ttBIb
 PcyQBrqIqzaiaGSPPORtYdJhn7RyOE+NXMVpKfJiSx4NjDY8J7ez9WCFnu+C+KYeIwX8pPArs3o
 Fio5NZnLg6xmVM4PHQjHWJPM0Z21+7U/IlO+4GEfVI=
X-Received: by 2002:a05:600c:a11c:b0:49f:e8be:ed33 with SMTP id
 5b1f17b1804b1-49fe8beee77mr76834925e9.14.1790347614233; 
 Fri, 25 Sep 2026 07:46:54 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fef5f876esm50482165e9.2.2026.09.25.07.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:53 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:44 +0200
Message-ID: <20260925144646.4100015-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917113720.1297345-3-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-grpcio: disable for
 the MIPS n32 ABI
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> python-grpcio builds its own bundled copy of abseil-cpp, which only
> implements DirectMmap() with mmap2 for the o32 ABI on MIPS:
> 
>     #if ... (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) || ...
> 
> With the n32 ABI, the "remaining 64-bit architectures" fallback is
> selected instead, which fails to build because long is 32-bit there:
> 
>     third_party/abseil-cpp/absl/base/internal/direct_mmap.h:130:39:
>         error: static assertion failed: Platform is not 64-bit
>       130 |   static_assert(sizeof(unsigned long) == 8, "Platform is not 64-bit");
>           |                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
>     third_party/abseil-cpp/absl/base/internal/direct_mmap.h:130:39:
>         note: the comparison reduces to '(4 == 8)'
> 
> This is the same defect fixed for libabseil-cpp in the previous patch,
> but the dependency added there does not help here: python-grpcio does
> not use the Buildroot abseil, it compiles the copy bundled in the
> tarball.
> 
> Using the Buildroot-provided abseil instead is not an option today.
> setup.py does have a GRPC_PYTHON_BUILD_SYSTEM_ABSL knob, but it is
> hardcoded to the build machine paths:
> 
>     if BUILD_WITH_SYSTEM_ABSL:
>         CORE_C_FILES = filter(
>             lambda x: "third_party/abseil-cpp" not in x, CORE_C_FILES
>         )
>         ABSL_INCLUDE = (os.path.join("/usr", "include"),)
>     [...]
>     if BUILD_WITH_SYSTEM_ABSL:
>         EXTENSION_LIBRARIES += tuple(
>             lib.stem[3:]
>             for lib in sorted(pathlib.Path("/usr").glob("lib*/libabsl_*.so"))
>         )
> 
> i.e. it would pick up the host headers and host libraries, so it cannot
> be used when cross-compiling without patching setup.py. And even with
> such a patch it would not fix this build failure, since Buildroot's
> abseil has the very same limitation.
> 
> So just disable the package for the n32 ABI. The o32 and n64 ABIs are
> unaffected. Note that n32 is the default ABI for BR2_mips64/BR2_mips64el,
> so this affects every mips64 build that does not explicitly select n64.
> 
> For the LTS maintainers: python-grpcio gained MIPS support in commit
> 2bfad952c374, released in 2024.02, and the autobuilders have been hitting
> this ever since, already with grpcio 1.60.0, the version shipped in
> 2024.02:
> 
>     https://autobuild.buildroot.net/results/e6cb7f473a28af8b53e7cbb8d8a582adffdeb66e/
> 
> It is still reproduced on 2025.02.x:
> 
>     https://autobuild.buildroot.net/results/9cf98bff7ce05262d6ff4221953901ae5543880e/
> 
> so a backport is needed there.
> 
> Fixes: 2bfad952c374258e37ffdf46a2c450d860640e11 ("package/python-grpcio: add BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS")
> Fixes:
> https://autobuild.buildroot.net/results/90405c0a3d0b2e929d5074305906e6fe3679298c/
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/python-grpcio/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
> index 6119991c7e..f52e19dc18 100644
> --- a/package/python-grpcio/Config.in
> +++ b/package/python-grpcio/Config.in
> @@ -6,6 +6,11 @@ config BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
>  	default y if BR2_i386 || BR2_x86_64
>  	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>  	default y if BR2_riscv
> +	# The bundled abseil-cpp only implements DirectMmap() for the o32
> +	# ABI on MIPS, and its 64-bit fallback fails to build with the n32
> +	# ABI, where long is 32-bit. See
> +	# third_party/abseil-cpp/absl/base/internal/direct_mmap.h
> +	depends on !BR2_MIPS_NABI32
>  
>  config BR2_PACKAGE_PYTHON_GRPCIO
>  	bool "python-grpcio"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
