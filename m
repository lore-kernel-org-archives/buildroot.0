Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90394C61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32A8C60DAD;
	Fri,  4 Sep 2026 12:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCEnXcPowDps; Fri,  4 Sep 2026 12:18:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9D8B160C1F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524320;
	b=pkGh3hrdO6gBoV27Kk2jlNZel9l9Uyb9m+BpC8iOLk9fQEfN44nBLt8vQ2sffb02CuyZ
	 FNUMHA09TYEoxZ2DqrPJycgj74e9fTj14GlZ8jvm+AU+Q5nzXzQp0XLSHPiI92p7uGtUW
	 N9C4wMu+3s+kTV80wUXm00Az3zflQQrJqaIQcY49JFwY+STCsGDZ19rOObGRowvwdJ9Ht
	 49SrGeKSMaHXjs2ppa5Htre7XjHv3U2zts9xdXVaDpLw2AdXmOp9PXNJo0IqjtRY3hoE1
	 xXP0gX8DQwdYKUCuVzQqsmI7duPQpmGfKbYXUGobcj1D/oWKcV0G4FrXiAIVfmwcZ9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524320;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fjBQc2rHLgzchWLD+/9A68a+SC2UDVnPc8LfxFVRD+8=;
	b=jUvK+pA5dWQE9b99eco2DwDdw3kBgR118cPpvvbSwCxOUhzogOoS7wSu5QBGH8SUsN7/
	 XLbNrOmr+1tKkp0+b8sR9uyDrr2kSsYnZQFCK4udM627IDlNoYItW7Xpj1KWH+FK9/NE7
	 F2vmJpEIXHpXDkjfAJ55C7DSMw/HXbSeDk9JZM9WuUyrV+dIWDUGxY7L1gQ3q1ywD3RcP
	 6lOcFWIklP5BJfihpEv/+mrbSGLa2A9mLmRm2Ne1FDQz/nCr6/pONuKcUfOTT1xCmicL0
	 Ae+JYuu7BDm8GarZ4mG6qJ9RgS9FXBEO0+2zqgE5fYYyn+U5gCOACjDKXPXgjtan5zw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524320;
	bh=fjBQc2rHLgzchWLD+/9A68a+SC2UDVnPc8LfxFVRD+8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DoL5gEVn0KckPsiCLPJxJoIdMX6TXx4ia9bd4s8StS6isNFXfImTJWlshxFFRMsFv
	 9x6XT5cOYF9SVwTVB0q/BeYK2Fb1fucfbLq8GVOmLfIYj4jAlQ2c0cX2wAh5dHiXX8
	 Xifi9VdtuWWKC0x8j7QkZtiDWdeBVHC1qt87zFBGfQVpHLmxlDT0zLTTA6V7CXXEAf
	 MHpZegvBuwtvJEHqKxTFtUqqrgA7lK2pLVVhcufaZarFpD/8OmWhphuzW4c73rKH7G
	 CmZpX0jIuN0ebMUnvevVYYBjYCOEBmu9L9AJYsw7KgFScPMP60YafAy9LZtn57YYqZ
	 T5e6ZGew2JImQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D8B160C1F;
	Fri,  4 Sep 2026 12:18:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D705C200E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5A8180F20
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gay9FLPxnc0I for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7B10380F5E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524317;
 b=CQCJRXWITDqp0reUEQMa1GnYnfETJkFuNf7Pg2+6gVGMkyaz1wcn5K14VWV943OPelxQ
 bYfjwQI4jW5IDYm9j7jA04gEaieKpkwWUcubp1WOiLCOuzDVCvteSb5CF3wgV8WjvbMOR
 gx3OPQY0SeEePwFVUhwPXzRYJiCkP3GxjBKAceyctZaVw299BdlJRvSFDgLcsDB31UO3s
 znJdlJeDvtZz98doNqPP3NoR/zYU+1v53tQrxdhY80kDvpWA/pcXxlvXdRQ6BO9DlZ9gy
 4Bphnq4UxV9QCIrcRxYt4mrUDGRArS1k/N41chMaAMdE8pkOpRrCZXHlSjMkSCm3Q1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524317;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=F14HDIBZHO9ywn3ID2JrFlX9DnTHuAsnISyUw8Ef8pA=;
 b=RCTFAEvWlyRtvz/XTCeFsFbhTZswfcIrwS8RtiWWBM73alVtuRK98IjFfbR2QZlJBhoC
 xQFgVxe1TBiQQX/FZZNsCqo7ug9aQDiOxmJcUcQTtBHfH2rQSVXWqd1ECUScf+bVd+TJn
 AzRlHnxdbNJPseDQZlE0p80EAvZnX2Z/4vdEFzAK+5FkRfPYpMfaxUGKqTGgrsPRLa8RS
 mL6ppBxXwb5XDqk9aFsQCm1xiISppYmLrnq2+ZVLZm2ZDB1blT1x5HXM8SWUc0WqrRZpo
 h52fIQH6zhhoZXTS/eHR3fBNgXiYIYBCvqLRAg2iWwq2Q0HQpRgAfzHMlzA+mwsRDlA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LChkXomu; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B10380F5E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49b8eeb3ff2so8691475e9.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524315; x=1789129115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=F14HDIBZHO9ywn3ID2JrFlX9DnTHuAsnISyUw8Ef8pA=;
 b=PB8BiR8DsjqWmu/lO8x7ojkOkERqtPmmgGpxOGlZISmcZG8FGxqceqnql+INxpNwkQ
 uadz3JKqfLO6wPI6YwOJHTtVKPflmQTtr0tn6zKs14c6YQpB9uSvW90nhXUn5iQuLnHq
 Hv4YG5bSdaCcel4NBnc+qDekPTWD5HbxQ3uNa+8056CIaKT2zJ4wl7mUgKv24qW/qjQx
 ia62BgR8ImsdW1hrNLi14cAd4Vyz7xDl1uputuIrD8/RHd5ZaXveiYWCBaowYAtdO6cJ
 T4wgRcHaxZKSVr7URlhmqh2Q11EtIUjfVwZxmQZ0cFRz4gM/weuqIIh0ZA4yM9zb0k0S
 76nw==
X-Forwarded-Encrypted: i=1;
 AKwUvByaI7rZhKQ8cqhtebo090xQu71NtP4kHqIXfC5M+dO9m1sBE8I32CEB/9N/X4qmyv1/rJ1S7PF59e0=@buildroot.org
X-Gm-Message-State: AFuF++kq/5zQOTcLKZef0usFInpObb3a21WZaPxQsE6N4iV+wP+vt9dG
 M3aoBM+KbV0TGxqbH15wJbSEbyfY1xgzwMHqhDAAh/M6G+yRTglWN9aMg9I8QjgZcVc=
X-Gm-Gg: AYBFou2Wn1/WThpYsJ/2eaYddg0NkdtcUgnPYZWXAqbAL1dGQbvuOzRdZ1gTiSLkKtW
 nEvdOvOIBiQVV3ERFVZMMOTevvLOi7KnY93mpVJmuwYyqjXlp6eyR3LXxBf15/DurpNblA9t+Nz
 vMyR0nKDGZ6SYTW0wqjw+pQsu914+rgvRJh77UtEXGjES1QeLn7Mp7TE5Tmo7pEbQEZbafxt09K
 cu8TOQ1yCDdQsNzpGLmDQWjsXonlM0J9IwNKaFRJpLaNtoXpqTA1CAM4/u73ycWzaB3sYkdZA1z
 dKIEKOdk4tTPvZSOOcH2i4Uoxs2z8WPOXRTQdpvAt4YslGxzQnPqIM7hXd9hcHIE+926fkPiCvN
 kYmO9DsGVFkJLXMHMKcQ15jRS6CzJJhJ/j817RiZzO+5+8HfSP8sG0DzJ0ULn3x2H7mDxmGc7gn
 VjuUOQbpX+aszot9QPKA+dECylNl+OUgQNh0PZJXF3QjIWCFJg8VLu0w==
X-Received: by 2002:a05:600c:190b:b0:49c:fa21:e743 with SMTP id
 5b1f17b1804b1-49cfa21e92amr37111015e9.25.1788524314970; 
 Fri, 04 Sep 2026 05:18:34 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce551bf7asm127961535e9.2.2026.09.04.05.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:34 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:32 +0200
Message-ID: <20260904121832.405560-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823191926.2684260-1-thomas.petazzoni@bootlin.com>
References: <20260823191926.2684260-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] toolchain/Config.in: refine
 BR2_TOOLCHAIN_HAS_LIBQUADMATH definition
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
> In commit a2380157f6688c5c065fa19060a2c33145bab95b ("toolchain: enable
> libquadmath for PowerPC with VSX"), the definition of
> BR2_TOOLCHAIN_HAS_LIBQUADMATH has been extended to also be true when
> BR2_POWERPC_CPU_HAS_VSX.
> 
> However, practical experiments show that when 64-bit VSX-capable cores
> are used in 32-bit mode, libquadmath is not built by GCC, causing
> build failures:
> 
> cp: cannot stat '/home/autobuild/autobuild/instance-3/output-1/host/powerpc-buildroot-linux-musl/lib*/libquadmath*': No such file or directory
> 
> We did an extensive testing, building the 27 combinations of:
> 
> - GCC versions: 14, 15, 16
> - C library: glibc, uclibc, musl
> - PowerPC 32-bit, PowerPC 64-bit, PowerPC 64-bit little endian
> 
> This testing provides the following results:
> 
> |      gcc14 |       powerpc64 |      glibc |         OK |
> |      gcc14 |     powerpc64le |      glibc |         OK |
> |      gcc14 |     powerpc64le |       musl |         OK |
> |      gcc14 |     powerpc64le |     uclibc |    SKIPPED |
> |      gcc14 |       powerpc64 |       musl |         OK |
> |      gcc14 |       powerpc64 |     uclibc |    SKIPPED |
> |      gcc14 |         powerpc |      glibc |     FAILED |
> |      gcc14 |         powerpc |       musl |     FAILED |
> |      gcc14 |         powerpc |     uclibc |     FAILED |
> |      gcc15 |       powerpc64 |      glibc |         OK |
> |      gcc15 |     powerpc64le |      glibc |         OK |
> |      gcc15 |     powerpc64le |       musl |         OK |
> |      gcc15 |     powerpc64le |     uclibc |    SKIPPED |
> |      gcc15 |       powerpc64 |       musl |         OK |
> |      gcc15 |       powerpc64 |     uclibc |    SKIPPED |
> |      gcc15 |         powerpc |      glibc |     FAILED |
> |      gcc15 |         powerpc |       musl |     FAILED |
> |      gcc15 |         powerpc |     uclibc |     FAILED |
> |      gcc16 |       powerpc64 |      glibc |         OK |
> |      gcc16 |     powerpc64le |      glibc |         OK |
> |      gcc16 |     powerpc64le |       musl |         OK |
> |      gcc16 |     powerpc64le |     uclibc |    SKIPPED |
> |      gcc16 |       powerpc64 |       musl |         OK |
> |      gcc16 |       powerpc64 |     uclibc |    SKIPPED |
> |      gcc16 |         powerpc |      glibc |     FAILED |
> |      gcc16 |         powerpc |       musl |     FAILED |
> |      gcc16 |         powerpc |     uclibc |     FAILED |
> 
> The "SKIPPED" are when the configuration is not possible: uClibc
> doesn't support powerpc64 or powerpc64le.
> 
> Then, as we can see, the build fails for all "powerpc"
> configuration. Our conclusion is therefore that libquadmath is not
> supported on PowerPC 32-bit. While we were not able to find direct
> evidence in the gcc code base, this practical experiment shows that is
> simply doesn't work on PowerPC 32-bit.
> 
> So, we take the logical action of adjusting
> BR2_TOOLCHAIN_HAS_LIBQUADMATH so that it is true only on
> powerpc64/powerpc64le.
> 
> Fixes:
> 
>   https://autobuild.buildroot.org/results/46d435c9f5086a8695f4f6cd4026bb0d194de13c/
> 
> Cc: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  toolchain/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 7762106bee..128f8faef2 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -989,12 +989,12 @@ config BR2_TOOLCHAIN_HAS_ATOMIC
>  # - At least, libquadmath is available on:
>  #   - i*86
>  #   - x86_64
> -#   - PowerPC with vector scalar (VSX) instruction set
> +#   - PowerPC64 with vector scalar (VSX) instruction set
>  # - When available, libquadmath requires wchar support.
>  config BR2_TOOLCHAIN_HAS_LIBQUADMATH
>  	bool
>  	default y if BR2_i386 || BR2_x86_64
> -	default y if BR2_POWERPC_CPU_HAS_VSX
> +	default y if (BR2_powerpc64 || BR2_powerpc64le) && BR2_POWERPC_CPU_HAS_VSX
>  
>  comment "Bare metal toolchain"
>  
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
