Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85A0CCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7CD941204;
	Thu, 30 Oct 2025 08:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YESVqLS2EtFX; Thu, 30 Oct 2025 08:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E901241200
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E901241200;
	Thu, 30 Oct 2025 08:24:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03BA32A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E95B461360
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d30wkljaWNZV for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E61C36128B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E61C36128B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E61C36128B
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:57 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-475dae5d473so5818535e9.2
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812636; x=1762417436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fqu4ZyaNrGOLzSutZRZRWJmunzUUvYQ+TUmhavkGb0s=;
 b=aVN+VPORBZWcEMyc8nBBlqkwdn0bhCPQY4sFYrizEKw9VKXXUaNuj6jYBzZOjHHdO5
 6KvzNJnZMly9kNtl1cLaBFrlAXCMEHVFoWBYPu4dMNainOYcBN6aw69WvkOVY05M+78p
 Ffj30amb4jRzM6AAqYK4UBEtsUlIMVlU3sZAs8y2d/ce51ZUVuT1nH2H4fIDXrW9Nx1u
 1b8SD6duVm0HGy+qi0fyOuskkSAKY5zyn4frvNXI4hp1LhLtxqUpFj4qrLKVh8EU1RT+
 GETEVWZzTzoKX1jBIlOfVgQ5HwTzusmtVj+ARXnDdbdfIxQMBU7l+l0wvkjXzMYHwlMl
 2Mag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQh4z/dszeaGq744BMcu+fQMu9p12i62LqlxjYiKTGf8Mqn9uXM8kVhj+v6u7sS7DazI/jPaXepYI=@buildroot.org
X-Gm-Message-State: AOJu0Yzo5Sb4jQTn4RwqU91hGEC4gwb3FJR70m9qV9f4WmuqU1iJabDv
 tRzwW8zoA8SUnhe+Ulr6vb0y+s0sXQXwKn/ZCfUNdYspPITgTJtbiOmQyvW5lBsl5Mw=
X-Gm-Gg: ASbGncsYQ0F78BopYIGIM2glK975k1KXvYq91j5V00uxxmivAMRMFHyvUDnms8fys0+
 da2zDOYKNV/JlmybcDoxMiT7UnNQdaf5OmRhnyiFQmveuXjPZ7aT1WZJ89220FjuMkGYonHC47m
 c8Uye6jYWpvB1WqQ2L10hj98MhCf0h3CiNNCoxMFxB4c1Z67ey5Mu1jhWVyNlBLx8bsFPuKt6I0
 ruXXozbWgHBxwHg0mVLv7tp4eAq+s+s1YnSyH0YRI1VopGLSNpJWTK71A8uL8qcP+ab541SEKeH
 vG8R1oQaOYYehdvWfvX3h4QnWcwE0d1SmrvEpBnhMUbZr/Ln8d/QBzNd0M0mKoY0y5ZurKTWVuD
 yKU584V9jsN/1Y11f/8k6js94HNtDUDZuAa2CRuo5F7RiQNS9NWAlwKq5MotLYfPGfOcpt7XcjV
 Hg4QrC708rbM66Adc+auDSdoJ0QRiZPoWfs1ZC
X-Google-Smtp-Source: AGHT+IFxdXF7sUdH+DDHDGFH0xSRIPvZownRswefUb0+iXhd+PBiUzPAlXDUuqmCeELiaxmCgpnFXg==
X-Received: by 2002:a05:600c:8485:b0:477:19b3:eb62 with SMTP id
 5b1f17b1804b1-4771e32f68amr53107665e9.3.1761812635723; 
 Thu, 30 Oct 2025 01:23:55 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289f7f84sm29273215e9.17.2025.10.30.01.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:54 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:54 +0100
Message-ID: <20251030082354.35440-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023140527.544948-5-titouan.christophe@mind.be>
References: <20251023140527.544948-5-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812636; x=1762417436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fqu4ZyaNrGOLzSutZRZRWJmunzUUvYQ+TUmhavkGb0s=;
 b=OKsli5OhGTWWlh6gKx0pES5rzxwVySnCdDxDNEKu9f/kMg0SQtFB98BOwrV7oFuuoh
 TyEnfYNybfDKJCZ32jOluZS52sE1KYYxklJZoChfTr3jevJBabl/zNssg6OaAwfp7DJG
 bhGtEV/gL2DdDyJLUDI4+pWhBQ+PJza4HteIBoLIVtXrEnYmtx/elKWUsu6Zl+yHM/U9
 owYsaSI8z56Ywd6iZ/SrOS1KOgJ3S0W5hLE7pVISyuyhGhaf+4/uw06jPW60Vn1lih0U
 ri2XP8We5JN0SfYjCnCY2qZEfFu+E776bLAubuzc4J9REPCw0wjsTxZUBKs/sdCgUiVo
 Sc7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OKsli5Oh
Subject: Re: [Buildroot] [PATCH 4/4] package/tpm2-tss: ignore CVE-2023-22745
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
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
>  package/tpm2-tss/tpm2-tss.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> index e1f65c384d..81a1a0e59b 100644
> --- a/package/tpm2-tss/tpm2-tss.mk
> +++ b/package/tpm2-tss/tpm2-tss.mk
> @@ -16,6 +16,10 @@ TPM2_TSS_DEPENDENCIES = openssl host-pkgconf
>  # 0001-configure-Only-use-CXX-when-fuzzing.patch
>  TPM2_TSS_AUTORECONF = YES
>  
> +# Fixed in upstream commit
> +# https://github.com/tpm2-software/tpm2-tss/commit/7ab42953216adec046d000a5e3085f3ee5e9cabf
> +TPM2_TSS_IGNORE_CVES += CVE-2023-22745
> +
>  # systemd-sysusers and systemd-tmpfiles are only used at install time
>  # to trigger the creation of users and tmpfiles, which we do not care
>  # about at build time. groupadd, useradd, and setfacl are used in the
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
