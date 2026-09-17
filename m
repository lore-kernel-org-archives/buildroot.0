Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE0CC88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 11:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6857D80FA9;
	Thu, 17 Sep 2026 11:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KO1PHONoHrU; Thu, 17 Sep 2026 11:38:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6D99280F22
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789645093;
	b=gjkbA9Tz/CLHNykiHqparE8kXrMy8OBXVmavlo4bTuqm+nswYVfGmVob17DnrhkuVh0Y
	 lgRAgai9f6fR6j99xuuLypJ2jwN29RwnqC9pjNT0htGVpyDrw0aAzW/notjFMhuwaChCg
	 1Ip4mFtQrHHoyPvQ3jNfMQE2LEgGoAk/XaaXpjSKeJ/WRvH2ZKAVTIEewnEeqhjX47s1r
	 BDKejv/nKSk/0ob1Nsg8ol1s3zK1FEhQGucWyOKWu9qtRDqkbSX2Erp7LO4w/VtbmsoQD
	 7RR+RmOmXzkavCYWPhsNGIYx/2MaaiI3wWipoYrxAXrCk8lcLIXazzpzRWVYFq+jJuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789645093;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DjkH76hjL1QrLib96sIu4hvnaNB1XKVDVr97+Gt1zbc=;
	b=DV6pgOAnJyXZhQdFNqv2g4yfkCK0XLgtcDDFRx7RXHFbbqX9+eM9d1EqJjriZDzBIeDK
	 ptarFvcuyE+1PoS9pUny4hJ4oRnpN69BYlF+H9+XZcoVnzHK1//NVrvJ4eVuV7U9ENztB
	 dwkWeMEpB8BUoFmSJuJQuW3imwnSXljVjt1vj4/5tjMjMcXtHnU/kIzf6ykA15edPDSS0
	 XqrTzrdQc8sQx6MRtFJzwJsZljbeaoTk2fdUcrpwEt/xO+0Hyz5HkwnzodCuict4NuYVl
	 rS8Ql1OIym4FtDY5JujsFeFvPqA0UeED5xv618Ev4hkGsYyOhMCTjPLj+gVpsr8rREA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789645093;
	bh=DjkH76hjL1QrLib96sIu4hvnaNB1XKVDVr97+Gt1zbc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=UYfzZI7tqZEJ+CJArhB/v8Hto2pW31KGvoqo96tDFoLHz7llVAijpkCHjig9K4max
	 8KA5IvfTspRqs889+uE0BgS9v6/o2GF5ZhJLFC5qeW021yxz5THFCynr9R9mN48Xr2
	 nUvVKdNthdFB72nMeM/sl/NCUoJwjKHSJwRG8MYC0QNPkrn/lxaUMGOSm/bOYOHy3O
	 BmdeFJjX9Slz37D+LZsapZ23g46pSh74yhtMghrWZ3M82ersmR+i/AswmY5royHErU
	 C5EqIffCiEipHmldmXOmyw9wHyttVqcdLpMWzpZSAOtJcVIHujDaOFKJgCyBdzSaYt
	 //QGrQDp+1BUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D99280F22;
	Thu, 17 Sep 2026 11:38:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 823D413D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 11:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8008E4027C
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 11:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKM5gDlkhJLb for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 11:38:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org BAF4940050
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789645091;
 b=bri5s2sOlG9r/889rwB0F+GbVCpm7bGmhPkCJlu0MC314j1pEgAuYk3Cn5CN/Q+HA3C/
 9V8UWL99ubpyea4mjVNQmSj/mx0asUezM7n5xl4g8QwNKM5yAHOjbnSHnc4C2r7uCofWR
 KhtRHilFxs7PCrABE5j8Pt+A/0gxMlEF57l6NosDBjTy3WZSbhjbIaxZaquB0kdTkyocw
 QPOmI3wsUweDP3eLutUQiHyQavbWKUS1gnoRpkxNekp0oSpOiIal4CxkbUujEmiWPmJy3
 9XR5wQVVsFoM+rcJ3X5MdnVyVJXPtWOFjjAKSq51sU8E8lb3k1nqA7co79/8rzbHKyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789645091;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=exM0m7ArvmYep4rJ+DbgUNTUTedEvIfYVhulh0lGp3I=;
 b=nT0QjdFVK6aYKxOLcWVAxzFrq1yURp5NSURKGEv92abQ8glKNZHOeiimf0fm48BAm02I
 sz7LMDJJacRJjFD/I999ijQkSFolLcvGUZU2yJI7pRldo2Kob8bzygTJZqIycwTIbhHdA
 5cxu6xzVaXGRcYk7GNenQLg2HokeIoNMXyhVtr4hFFWKjBnF4BAgDAUUsCtOun/spvj7g
 ceMY6B/LFLE3SdbjHHbre6q0HSpPmwlljGkEEGgIshkg0KsseLSH8cfT68dkyDSvRNnwd
 GFELVByr1Lr04ItGbM9DIX/dKP83oGs7P9rPCeD+bVcejW+aAlF3YBME8ghVYSuZB9Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=jvfwEb5v; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::27"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::27; helo=mail-ed2-x27.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed2-x27.google.com (mail-ed2-x27.google.com
 [IPv6:2a00:1450:4864:33::27])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAF4940050
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 11:38:10 +0000 (UTC)
Received: by mail-ed2-x27.google.com with SMTP id
 4fb4d7f45d1cf-6aa135d6e97so1148722a12.2
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 04:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789645088; x=1790249888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=exM0m7ArvmYep4rJ+DbgUNTUTedEvIfYVhulh0lGp3I=;
 b=i3t14gVgO5aizifsU5vpWHTAE99y4+tKzHyonive6abeF2aVV1s+lRgli4fThjgBBl
 ilj8efu/ExxN/9Bb7ggzhjdiVkw/tB14qaJTOuBuyQPwYcFasqfaJY7huYK/+M9wHiZ2
 j/E3cEplf7hhg4hWkbotx5UsKUgVAg79NYA9qetTBIgVa1w0RzabNsvTMzSmnj24ndzg
 3WzLmkGMRnFvE/c6fSenaPZjf8nWks1MZPK1jg/ejvaaP7qsWrRXyYPTvHB8K0DJKT4i
 L9zYuiudJd/czrNLRcStLgfQdTUSA9MbahptImsuT9i8W+Uwl+ya/lcCiJ6LBpYZEip+
 AfwQ==
X-Gm-Message-State: AFuF++nHfmA4EhxfYrGUtrVhzP2QSrVqoNKYBg5wSihpPx1kFWxsiuRS
 zC3m4UxfPAbl55WSO2xKgzcBFZqoVxqrIxjUwXuBk2ynxSSZSdBJ1ea+2Ya5Eg==
X-Gm-Gg: AYBFou2ckri/ptVtKdjvGnQxzAIn4oT5SXdLUin3Gwrk4ewL3m8BNm8jxGDl40mzqkt
 R32KNkmZq+Z4+eiCZMrgNz7/ThMYHvUxQCheoo9MqgsHQyp5qA6Kl/r0lhkharqUfCG/kyWMJq0
 J5uyLmimw7ewE3powtwXp/3GpKEzj71k3m0oekI+wfT1I2Ee/G8AkEOteQZtqFcgOmI2t4MWDL9
 rOwfFYn9dHBDg5jHuP+YHKyc9xBy4ZTIgXfDSlwaIdM8bIKhCNzBnEmFZFQfJwU3F33hbIjCQbx
 XzaLwLHhEQCX4NABeHxWy16cwnnGlGPJD1UdWovseZBAtQg8Yss3BXbngTAeZC3NJhkiSt9Mtv3
 7une4H+czMOK3qLG4Hlf+g2PcnzoBXR6yNUgt0i4VGTgX/vhaWCsWFeY0yooGoRaQiGG5XrwMtV
 g0LCfj0uSgVXFHVwv6auIE8uFzC0z9rozVr/wdMMHT6kjNcVHxqPJxMgN8r5JOcBYQ/FcdfBXEk
 D/vZn6RdtyKKNQnR7UEkmMvU34Ozzb7gNMDpfUVNapSdVk=
X-Received: by 2002:a05:6402:23c4:b0:6a1:c4f:3153 with SMTP id
 4fb4d7f45d1cf-6aa22247fdbmr9432288a12.2.1789645088080; 
 Thu, 17 Sep 2026 04:38:08 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aa1cfe037esm3687101a12.1.2026.09.17.04.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 04:38:07 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 13:37:20 +0200
Message-Id: <20260917113720.1297345-3-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917113720.1297345-1-yegorslists@gmail.com>
References: <20260917113720.1297345-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/python-grpcio: disable for the
 MIPS n32 ABI
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

python-grpcio builds its own bundled copy of abseil-cpp, which only
implements DirectMmap() with mmap2 for the o32 ABI on MIPS:

    #if ... (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) || ...

With the n32 ABI, the "remaining 64-bit architectures" fallback is
selected instead, which fails to build because long is 32-bit there:

    third_party/abseil-cpp/absl/base/internal/direct_mmap.h:130:39:
        error: static assertion failed: Platform is not 64-bit
      130 |   static_assert(sizeof(unsigned long) == 8, "Platform is not 64-bit");
          |                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
    third_party/abseil-cpp/absl/base/internal/direct_mmap.h:130:39:
        note: the comparison reduces to '(4 == 8)'

This is the same defect fixed for libabseil-cpp in the previous patch,
but the dependency added there does not help here: python-grpcio does
not use the Buildroot abseil, it compiles the copy bundled in the
tarball.

Using the Buildroot-provided abseil instead is not an option today.
setup.py does have a GRPC_PYTHON_BUILD_SYSTEM_ABSL knob, but it is
hardcoded to the build machine paths:

    if BUILD_WITH_SYSTEM_ABSL:
        CORE_C_FILES = filter(
            lambda x: "third_party/abseil-cpp" not in x, CORE_C_FILES
        )
        ABSL_INCLUDE = (os.path.join("/usr", "include"),)
    [...]
    if BUILD_WITH_SYSTEM_ABSL:
        EXTENSION_LIBRARIES += tuple(
            lib.stem[3:]
            for lib in sorted(pathlib.Path("/usr").glob("lib*/libabsl_*.so"))
        )

i.e. it would pick up the host headers and host libraries, so it cannot
be used when cross-compiling without patching setup.py. And even with
such a patch it would not fix this build failure, since Buildroot's
abseil has the very same limitation.

So just disable the package for the n32 ABI. The o32 and n64 ABIs are
unaffected. Note that n32 is the default ABI for BR2_mips64/BR2_mips64el,
so this affects every mips64 build that does not explicitly select n64.

For the LTS maintainers: python-grpcio gained MIPS support in commit
2bfad952c374, released in 2024.02, and the autobuilders have been hitting
this ever since, already with grpcio 1.60.0, the version shipped in
2024.02:

    https://autobuild.buildroot.net/results/e6cb7f473a28af8b53e7cbb8d8a582adffdeb66e/

It is still reproduced on 2025.02.x:

    https://autobuild.buildroot.net/results/9cf98bff7ce05262d6ff4221953901ae5543880e/

so a backport is needed there.

Fixes: 2bfad952c374258e37ffdf46a2c450d860640e11 ("package/python-grpcio: add BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS")
Fixes:
https://autobuild.buildroot.net/results/90405c0a3d0b2e929d5074305906e6fe3679298c/

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-grpcio/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
index 6119991c7e..f52e19dc18 100644
--- a/package/python-grpcio/Config.in
+++ b/package/python-grpcio/Config.in
@@ -6,6 +6,11 @@ config BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_riscv
+	# The bundled abseil-cpp only implements DirectMmap() for the o32
+	# ABI on MIPS, and its 64-bit fallback fails to build with the n32
+	# ABI, where long is 32-bit. See
+	# third_party/abseil-cpp/absl/base/internal/direct_mmap.h
+	depends on !BR2_MIPS_NABI32
 
 config BR2_PACKAGE_PYTHON_GRPCIO
 	bool "python-grpcio"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
