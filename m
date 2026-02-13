Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06B8EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8325A4222A;
	Fri, 13 Feb 2026 19:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9KbwrvdKgUc; Fri, 13 Feb 2026 19:39:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AA184223C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011589;
	bh=PjM7JFWe9M920hrShqBfdTmldRwIZn6+/mznUMB+dmc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dD8H/qMKnZfrTxq8yxgrQEFCHYrI0/HDhnImcK0qmYWDJYI0FjYOtFVHTpxoQiZFJ
	 4HrccX5gT1ecquqk4IODn4rUSlX8GxejHvKyLG7wS7pJ7KfQ2RQBp6O/9dUHkJ0S08
	 qAhebsFWmDAhvc8aO99PN4liUjSsT8x0cxaIvTGMbEXL9qthYBJyK9Get5K96xjN2P
	 W+Y+Qw9enb3gPumzoZoSB3iXgXvfOIyDHur8ADHCDlQrdM1HmffEIl/0HJbViT4f9/
	 bR9GWHVgtK8e+tPBXrSBvB0FlbFEp90oB9nqHPK04INXo30kc3ZGga35kHQSUqHzRM
	 qkYPRWBS61AAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA184223C;
	Fri, 13 Feb 2026 19:39:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8778969
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CE19614C2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNtvomX09AHM for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5842661644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5842661644
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5842661644
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:22 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so10399565e9.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011500; x=1771616300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/P6AfvRgGm5IRtsVJ/Py6a/6iZs6Bb+BSTKZAbxLD78=;
 b=nAT9m46uE3zAD86ia3truoi2cBAlm8DzR5LL0t0/1D/QByLF9iqf5Xn8r2oVof6cOU
 47/Nl+res5r3GslvX/nObRn6FMUrad3afw9MtnI9oyJjqyQvZlzU6ZqSQ9v0giwPgUV/
 vqi1N0Ma3DymPXEMe18pe2rd9IXORcdqMb3dc3tb9TjUCgyCoLPsPiX3KKJgGQ+/f8Ly
 Q8hg3SCkjVUxYeMOtiRRqWqCsRG5pGdfL1MPl8JiB8pLDHjgMzWTX9CcWdwpQMwr8BmK
 la7+Em4SKTl0Q5LftJ3cLsNMok0cXJKNoJuissvQkZG/z/6Ic8B+a4ofqoVx1/8oH4nN
 UVBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZERRxeaXNhLYDf2O4EsspQw3demDFdm5j9YfRaSJdfwmYV1GqEqxBgHEiW8GXXQ+1ICnbyYKuaAg=@buildroot.org
X-Gm-Message-State: AOJu0YwP5lN5B1kemJg4f5kDWVvqCKLGTq+2ciqIRwayuk/sz0d8bGJA
 EyQZzXOo2ZXBmLFWdeS/9K6YQ1PxjrI2zzZ6/2QUeaIGAmGqKM+mPy59gTBBx1lgfhg=
X-Gm-Gg: AZuq6aIB8j6qZYqSWYVzf4/fCg/u0EGEi3SMLwzOn6KdpyE4U8Qf2W23rzCzp2+0gRv
 pCSx2jMn1AOWMzfs/tHAF29CreNT3bTQ8yfTvhTP1PjHOyqVeccWXwhT9JmMlcNtJrzYNTdrxVk
 qcIe+N6frtnLmG0j4/oAA4v7PJ9KpGwdK4d5KZWAhF8lr5cg6XXeEe1Ga5uqz6+4nmuC+GRGXoJ
 796Qli2amnab54oeSbMZ446e1wGo1JVVwg9vKYka3oX+gG9FqI/Sx9sAGI+/S6QW+C5iz46+937
 9R2dXEf134dB0xjI9qotHpYhD6sYCroY68hfpY+vT7u6EbPWc3sT24lwmTSomBrj8yEWn/gWTT8
 7PRAmW3K5Y0Px3D+9eUGQm4Q82MChLkwGP+/2OjEKIUz3dc5Gtjc82uYoW1bd2OMgwASna1JXuw
 78OnCoBoVBpmnIKtc=
X-Received: by 2002:a05:600c:474e:b0:479:3a86:dc1f with SMTP id
 5b1f17b1804b1-4837109740amr67436885e9.37.1771011500375; 
 Fri, 13 Feb 2026 11:38:20 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac9d77sm7737608f8f.33.2026.02.13.11.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:19 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 13 Feb 2026 20:38:19 +0100
Message-ID: <20260213193819.42079-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202212814.2607588-3-thomas.petazzoni@bootlin.com>
References: <20260202212814.2607588-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011500; x=1771616300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/P6AfvRgGm5IRtsVJ/Py6a/6iZs6Bb+BSTKZAbxLD78=;
 b=RM1Z/V86dEZZ5F8Uuea8yqRRc2PB0bm8Z3ElhqDuVSheTBZkQ/23buFmo+NxCJb6L1
 FMzpWoHzlaDUqkXKc6ytI1RLDrn1s/aKXGXCtwoY7wBAqRbdTd9H5n0rPMA9PsdZVhd7
 S/H+8XuCTiJ8YpNiADszxULg9BLkrgPxYuHduI90Ta2efxVg8B6V6Za5xf8joEKxxbaN
 LoXrZ2MPEa+2evSrhZeZ9iV8FSCV0H0AT81dRmQ1UwAXwP6CQNWgvsPv/Po0roOUbWu2
 dGh4NWMnw6p63O5ZZsxaQCRBXShyw3BwNGOuCNIQqOMRuFDt4l3ZzBpszO3660rozsCo
 CsJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RM1Z/V86
Subject: Re: [Buildroot] [PATCH 2/5] support/config-fragments/autobuild:
 reduce ARM internal toolchain
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
> Building internal toolchains takes a long time, and since the
> differences between the 3 internal ARM toolchains is just the libc,
> and we're already testing uclibc/musl with external toolchains, it
> doesn't make much sense to build 3 different ARM internal toolchains.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  .../config-fragments/autobuild/br-arm-internal-full.config   | 5 -----
>  .../config-fragments/autobuild/br-arm-internal-musl.config   | 4 ----
>  support/config-fragments/autobuild/toolchain-configs.csv     | 2 --
>  3 files changed, 11 deletions(-)
>  delete mode 100644 support/config-fragments/autobuild/br-arm-internal-full.config
>  delete mode 100644 support/config-fragments/autobuild/br-arm-internal-musl.config
> 
> diff --git a/support/config-fragments/autobuild/br-arm-internal-full.config b/support/config-fragments/autobuild/br-arm-internal-full.config
> deleted file mode 100644
> index b5f10069c6..0000000000
> --- a/support/config-fragments/autobuild/br-arm-internal-full.config
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -BR2_arm=y
> -BR2_ARM_EABI=y
> -BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> -BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> -BR2_TOOLCHAIN_BUILDROOT_CXX=y
> diff --git a/support/config-fragments/autobuild/br-arm-internal-musl.config b/support/config-fragments/autobuild/br-arm-internal-musl.config
> deleted file mode 100644
> index 92788626d6..0000000000
> --- a/support/config-fragments/autobuild/br-arm-internal-musl.config
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -BR2_arm=y
> -BR2_cortex_a8=y
> -BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> -BR2_TOOLCHAIN_BUILDROOT_CXX=y
> diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
> index f5c6c6672a..5c9fe660d3 100644
> --- a/support/config-fragments/autobuild/toolchain-configs.csv
> +++ b/support/config-fragments/autobuild/toolchain-configs.csv
> @@ -44,9 +44,7 @@ support/config-fragments/autobuild/bootlin-x86-64-uclibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
>  support/config-fragments/autobuild/br-arm-basic.config,x86_64
>  support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
> -support/config-fragments/autobuild/br-arm-internal-full.config,any
>  support/config-fragments/autobuild/br-arm-internal-glibc.config,any
> -support/config-fragments/autobuild/br-arm-internal-musl.config,any
>  support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
>  support/config-fragments/autobuild/br-loongarch64-full-internal.config,any
>  support/config-fragments/autobuild/br-loongarch64-internal-glibc.config,any
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
