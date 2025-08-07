Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6829C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 809E380F53;
	Thu,  7 Aug 2025 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjCu1uXXmiIn; Thu,  7 Aug 2025 18:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EFF080EA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EFF080EA2;
	Thu,  7 Aug 2025 18:25:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56A8010A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 475BE4057D
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gudfFgJiaILU for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 22316405C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22316405C7
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22316405C7
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b782cca9a0so760175f8f.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591086; x=1755195886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCRYya5OzpfGLXCGzdVzzrlDnsazMbZF/JAtrBwtJ9g=;
 b=i6EqAHP//nDhR26+3Hn3tOs8m9GzcmtIR+xAIxri0zGLlXtRGnXnQ/0EEtrDxjq4DA
 wGsUpi6OIZtWgVrSCipxSjaR1hDMZkl62+0+bGAskLHPfm3v5fF4vd3/BCbpV0qBJPtC
 Yg2IIMtpNaIkFqBymj4Al/3LIl0oXXSZiioGbHGwEyWgUemS3TFdlz9bnGYdFh+O+a5M
 L+GHWanoJuEmNXS9QhbpqSJJmEgMBK2gcG+iFN8MAdzfb7rFPmezDfcvs4viWMUGhmYm
 oleuk32k63It+StjU+xddWgfmnK1KRUOU2kgtTkq3ovL5Xar77yOaoAAtPsvE+kwVBIm
 Bflw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvCIGCTygfzev8539vg+6Ni2Y8qU807St55MFMDa50sMwbee7FGbd5B404yteYD5T0YZ4wMz9ixxs=@buildroot.org
X-Gm-Message-State: AOJu0Yw/ISWPIyAR6WzQODAR5TOYDnQJb+Kzqfi+Q/DwizwevA1mAbmF
 /zf0lIPCGy95uS4yY/eresnrswXUCeehlm/x4EOoox9qgZwjBNc/ifVMAtggXyjNc/PzX+Jx86w
 7MOO2
X-Gm-Gg: ASbGncuiJ1y8IYaTJ4Mf/oMh68mCujWkMsu1okzx1fcKTYj9vX+0wHL1aO9yUAZcV2T
 5SyCSrex4IiZt2EEOxE/cVNIwoUr1X9jleLq9VRr+g6x+nDaJCEjL7gcrL+zJLxIf+MaBhZVoqz
 qSF672N+lCxOZ7Cjj5q62p9Wi9IUyW9rA9RN6YQ6uk81JYTer7mPjkyQoFc18rjm2Ao2R/Elq7h
 8yh3SO/sDpqqKz5kzpyw8hpJpknFaq0FdPYo0o4P4oJn16b5FBtGB3wI9zZFMFpH0xodu2e9SYI
 WeUCPIEnNTgafRHNtVFWXGzOoodEeo0gYRlzvHVVhpG1QllFamyba3Rn/DKTEd3CEFAoJywto4W
 izmyL3KhQKbeWIA==
X-Google-Smtp-Source: AGHT+IFuwbtPOJQ7J7Lds9yvzBL9DO9pVv4QKwRp6lP/Mp/jhjUFB3IWF2QHowFtneys7VMh5c6lSw==
X-Received: by 2002:a05:6000:25c8:b0:3b7:9a31:2a10 with SMTP id
 ffacd0b85a97d-3b900b54f2dmr205318f8f.41.1754591086200; 
 Thu, 07 Aug 2025 11:24:46 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8f5d7deaasm6678836f8f.65.2025.08.07.11.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:45 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:45 +0200
Message-ID: <20250807182445.726275-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729094732.165580-1-titouan.christophe@mind.be>
References: <20250729094732.165580-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591086; x=1755195886; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCRYya5OzpfGLXCGzdVzzrlDnsazMbZF/JAtrBwtJ9g=;
 b=MG6q0wwdQgzOh4TTzQf38TzqdE7yEhgpe/RPaSy1dZcRgVLRb4U7UMqEhOlfuVRAxG
 RaTN+SiBJYtHP2CrODxl9S+inTlzHSxmq/HH5BSRAOs2339aaLL37zpVm8IFWRPqyqZE
 lW82llFRbq5R3bUNCsgK5wmAO7A4VNEG20pAjho11ry53DhpWrMfcHbvW+27zr/Hs+Ay
 lLnaWPHHr/WL0o7801SbmLW04BeT2w2R1z/AnNfCY3JToIeJyT3FgTMqWUoM6eEqz/Zm
 PGoxFMu5AOKiyNOvbRrs3cjutXHzLnp7LQ9WUu0kh9p5PgFtJQQAOuoe3HWQaveCrKg9
 cpcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MG6q0wwd
Subject: Re: [Buildroot] [PATCH v2] package/rust: add CPE_ID_VENDOR
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
> This gives a proper cpe-id string to the Rust buildroot package,
> as it can be found in the NVD database:
> https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:rust-lang:rust
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> Changes v1->v2:
>     - Add link to CPE listing on NVD
>     - Remove useless quotes in Make variable
> ---
>  package/rust/rust.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 22f3ca1455..9999475c35 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -11,6 +11,7 @@ RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
>  RUST_SITE = https://static.rust-lang.org/dist
>  RUST_LICENSE = Apache-2.0 or MIT
>  RUST_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> +RUST_CPE_ID_VENDOR = rust-lang
>  
>  HOST_RUST_PROVIDES = host-rustc
>  
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
