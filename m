Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A520EB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 175FF61175;
	Fri,  6 Feb 2026 08:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwodZiwTo6Jr; Fri,  6 Feb 2026 08:11:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3F07611D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365515;
	bh=pm3ZRhRyELxdG4f57Sd8p54euAKjB2uMNgxuwQkzenM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EDMenev8B8O/jyz6DsF5p/hfLp+Lr9ZxIZJ+YR91WdOnGnA3BNa/yCat7MJJh8ouj
	 oDQDrzJg0BAlUdVkWyOXSlUr4Fy/1rfsx65WuAtlwqAj7JxDXfVBRXH8Ml47ARzAJs
	 HThcTQ1TYb0J23I4LS/HdA/D5JqS2o0MdFoD9X4u+NSuDb66eLZV0hjZ7l6fPW9AAA
	 dP1FD7AmSZ+T+rUYLckkADVp6be9FzAHqF4TyNoy9QwdHPK1ahPSXa17zAQtvEcMCZ
	 uI7gHW0nspmJWar29FmCvmXq2L5LuVIUVbioBkcOuHgwFfNCrxkAURYqZXzFDYTsCh
	 tNPWWW5wBSl6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3F07611D3;
	Fri,  6 Feb 2026 08:11:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E2ED173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D49F834C7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4suLYgBqsTO for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 574E583C06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 574E583C06
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 574E583C06
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so26773425e9.0
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365509; x=1770970309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+aT/3XtFwuJqIIrRG5/FCwYF09E0sj8gfZuBUud/u8s=;
 b=c6dgr6WW7ocFhbwaakKG7VYteriNygjT8MMo7p2mDRkVf6L58Q5KRBJjC9l+Cc3l5z
 q04bg1cqLQ0K+OM7GjeGOOaOul+5xQiB+izECKUs1FhDAkOWsZjEnITJJazLf7NcT4w1
 VMNUK1eMQ0yUap840DN6DDdVWlm9FUKZtCHwDqoUmSN1mF646fQW41nFrQEKVyaZPMpH
 b4EcknWIxgYhinLVPL4NzUg+iBAuDovZxkfYimXeHDJj4GAlLHEayiynuJZZHjNcmHFE
 UlWNtq97ZAUpaerczGBKtnmgm/kjtKV7iVCZJPC5WSpiObOg32rb1WlrR71KvrxXkWLX
 +bxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6zq4bY6SRV3GuZj52P1lhAqxXv0wmj+dlv4LDqm20hSLQnK5iQMXehHLuPK4fS3vIdRin0SAIa8Y=@buildroot.org
X-Gm-Message-State: AOJu0YxP1SugpgXx8t1GoKqbCutpE+G4TsPBL566dpgJWneh9ARPX9h2
 La4C9HR8KDVGPkQQToPZxGHRdjL/0aZPyukiN/R3cLVbA8OHwlJyW7bsYMZr5LQ0E7C9pf2E4at
 ttlKT
X-Gm-Gg: AZuq6aKa52+1uADYI0ulS/XEpD+zq1xN4CzOXzsGnWgW1xBNJ46zzZKsE2rsIk8r2kC
 DeFsorM0LPdx61G/6tsH3N41+dolAPqZ01zww6Lz5gJAJa6JsJjjSX12d73BPA4JUHE9GXpnV39
 U0je1jWA8Yv66yL+Bm1Cwr25wj85+cYo/EavdldzaNroIumLAPhckPGhzucDZHmuWPMYgljtjx6
 Hsb7W6C7/bz2Fpce+PYS778qD6gZlXcy1uSCsB0PPxtk4Am0dK3v9oDpc40NRTZ8aKXRz/aF2VH
 yGTKHRQroRIP9nNVcQtq1S3M9albQNH3jpsNmOzpMBipQCGYZDYOTWWTEzOPGz+jqhkl7omziVV
 KfCiozBq3sKoVXKdJ9HpZ/J2WdDgIIzrsoYanRQTubIwJhVWqRdrfC3jw4WKWLAynSFbAe/gAzo
 gBOt4cZB2kx1PU1K8=
X-Received: by 2002:a05:600c:5253:b0:482:f564:d60f with SMTP id
 5b1f17b1804b1-4832020e2b2mr24832505e9.15.1770365509168; 
 Fri, 06 Feb 2026 00:11:49 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4832096c438sm20125065e9.3.2026.02.06.00.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:48 -0800 (PST)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:48 +0100
Message-ID: <20260206081148.32032-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251220100938.517246-1-giulio.benetti@benettiengineering.com>
References: <20251220100938.517246-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365509; x=1770970309; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+aT/3XtFwuJqIIrRG5/FCwYF09E0sj8gfZuBUud/u8s=;
 b=f1e1PfDaxYtGCbZfAOKu49pUo53RsUmqgrUqWf3bZINzfCqVE56xK/fxYfIGcyc+b+
 tUp4IUcK94okQEhlIeJDF0ra4oexoQVkIrMm0v5qPx0Og24qmy0AWKL9hEUXLtkDAdIJ
 IRxKz699/Gy4cmGTYREI9re58/hyPYslbsBp2r/h9QgRe5GITpj9vgqOjgtArvWtMMoz
 Yi4Yib+ZKGVRWJef83/JEBl4d4bVgxTlqFkpoSOLfhNDQXrqtdAysENLIwYPd7EulXP7
 A6zHdG+smmXMdMtkW7uXrAlIDMm2+W8stVzFtfyQXE+4kaT2VKHSPuHJDv+8yCmEN43S
 U0NQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f1e1PfDa
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.3
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
> For release note, see:
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.3/docs/v2.8.3-ReleaseNotes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/cryptsetup/cryptsetup.hash | 2 +-
>  package/cryptsetup/cryptsetup.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
> index e85607cdb6..bbc9171e77 100644
> --- a/package/cryptsetup/cryptsetup.hash
> +++ b/package/cryptsetup/cryptsetup.hash
> @@ -1,5 +1,5 @@
>  # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
> -sha256  dd9ede9875976cb25f3d29bfabf343b1c60f6186646b67ef5e40e60ab4935ec1  cryptsetup-2.8.2.tar.xz
> +sha256  4a8a23b8b9d1a3250452e40acead4421a03e45a38954ad0595634f4266aa800f  cryptsetup-2.8.3.tar.xz
>  sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
>  sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 8421543f41..e8f2f1673a 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  CRYPTSETUP_VERSION_MAJOR = 2.8
> -CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
> +CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
>  CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>  CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
>  CRYPTSETUP_DEPENDENCIES = \
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
