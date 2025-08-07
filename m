Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF780C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7E5740691;
	Thu,  7 Aug 2025 18:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9N0-gRYiCdRK; Thu,  7 Aug 2025 18:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14362405E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14362405E4;
	Thu,  7 Aug 2025 18:25:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 367454C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3240F80F0A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rr-BmVIOQISh for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:25:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A676780F0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A676780F0F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A676780F0F
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:15 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-459ddf8acf1so12127345e9.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591114; x=1755195914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oQ2v/h/uSWFPPNBvT60pG0QbBmTWs8wTzygIVPrwjwg=;
 b=txl/nvkxwMyGBMnrDGENukpdws+8zjiqLnawYQshMVcdeJdEg8bemlkkjJjTdAtcMS
 ABShRLilnZ7MVnZwGs+KcongtXCwFcciNFuNxU3m8fS/eOap1iyZhffnD8NjAtOIQzXY
 etXa92ery449yontlVwaO/6kjPZpqYi8ZfOMxNOrs36qwsQ9ay+OnpHKM29hWRI5oXm/
 fv1BuibCZBEIL3QQBUSp9e/DVSTtKUqmMG1qgnlUDBZ9jP/EoHwp9i+pVHEXI9HFk7b1
 GPH3zmiIClcuUh2Ak9DmTWuRcA3FsR2K+/wiFlEifLe2zH74WJffMmsFZ2cX4aOoZnbS
 L38w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPlAu+pzcH82BLiBaGmxovcKVX0F0DicVP3MoG7LOjucbFOKazYiUfT9A0mgUaIy/xMHwESHsnbFc=@buildroot.org
X-Gm-Message-State: AOJu0Yzne/RLGQLg2I/4J5m3PV1alwVe8QNTXp8v6CPVbk9kp60Lg/Pn
 gw4leML09k2M3tos6BFdOrO5KfISixkrDJQfsQsjp5xb9UC6DD5ABodgfyPaAupts6u6U3CfxtD
 XKDU+7Hs=
X-Gm-Gg: ASbGncvEif5lIxlDyvyCHJzyUKVU0jBV3q+7Na0Tlu5usWTbCHY6KPdViK/tNSyaWIv
 nZbikmULMcAJPvJAlfGAsynKpLQDCQGsznsUPyB3UPQ7oRJddnPW4RnpgBT6NyXgU6x2Y7CdMdu
 cdwCDYtFgvy/CY0dkt2Ggn7EKRwdqHN1lyO3Du1ejW/lzz2Hn6myX6rnu7XZLqKcDknuS5esRlj
 BrPlRHeX5F8HWWvo2XSm45Is5E/LjrSyTKNcdfvxx8euLisZ9Wdss3P2NmmcSDixmiZGNOY5/W5
 USuC+IvUdeCPVpFTH4Qlb6ddrzb5y0THgYWIOvmxDrt0ao/AsNL4g+bOsuAfayhSeJwmF49cjny
 MoAX6KOc5jRf1g3V2LFt8cLxn
X-Google-Smtp-Source: AGHT+IFPXe3uRZikxsxRqrJSTufKsnJKxTGly1YQp3P1D6pmfKH8zbYujQ3/9DDBjP2/WlqDp8uNhg==
X-Received: by 2002:a05:600c:a03:b0:458:a7b5:9f6c with SMTP id
 5b1f17b1804b1-459f4eb4d05mr145225e9.11.1754591113775; 
 Thu, 07 Aug 2025 11:25:13 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459ded356b9sm172933255e9.12.2025.08.07.11.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:25:13 -0700 (PDT)
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:25:13 +0200
Message-ID: <20250807182513.727042-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801-fix_libspdm-v1-1-48138baca30b@bootlin.com>
References: <20250801-fix_libspdm-v1-1-48138baca30b@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591114; x=1755195914; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQ2v/h/uSWFPPNBvT60pG0QbBmTWs8wTzygIVPrwjwg=;
 b=iLg9lYaHDgufg3dnfsYk5TeNfFuGxikcAAcw9UYo/UA1FgRkzwKZ+b4KmjyyQDHtY2
 4CVOLJ5M9zyuAd5IMo2UbKlagSN30qfH760LOo6gwWkvy6f3L432d4KXYBAppYHmwHeN
 ka63CQi8nhUThp+fRrL7YrRx+zlGlGqKvrdIbDqb0iWaF0xxzWSHTdPH7S4NnW0LhA3V
 o+Lk9A4kQ48kINtM01gVv46aPeleO5fb4EC5mBIirTF6Q1qFZdtno3zGWcePIFj1K3Cz
 prxIqdw1bmDdDJpjYCDtN59jIhhH/6/xIrxQzVwDCI6CAtCbikN3RSq8zwM4NgMidScU
 KvqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iLg9lYaH
Subject: Re: [Buildroot] [PATCH] package/libspdm: bump version to 3.8.0
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
> Following the upgrade of libopenssl to version 3.5.0 [1], the build
> process for libspdm encountered issues due to the new openssl API.
> It requires some modifications in the asn1.h file of libspdm.
> This build error was addressed by a specific commit [2] in libspdm.
> 
> As Buildroot 2025.02 isn't impacted, this commit bumps libspdm to the
> latest libspdm version to fix the build error.
> 
> [1]: 9868ca6e
> [2]: 88797f83:Backport API introduced in openssl 3.5.0
> 
> Fixes : https://autobuild.buildroot.org/results/87b/87b8805975ef132a58c40e622e2e023199f6ee2a/build-end.log
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Applied to 2025.05.x. Thanks

> ---
>  package/libspdm/libspdm.hash | 2 +-
>  package/libspdm/libspdm.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
> index e29c5994a32e0a949b807efbb066915348a2f728..cab1c5259e8cb40044dc108ec50d217f5d6a1691 100644
> --- a/package/libspdm/libspdm.hash
> +++ b/package/libspdm/libspdm.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7b8a556be64120bab9c321964e67b90f5e6adb59abf3992c5c7937f37a4e7c8f  libspdm-3.5.0.tar.gz
> +sha256  e7aefb9bc546bbd3ff10d707a6f05213cfb2e679354438ea0d1b5c483b5daa85  libspdm-3.8.0.tar.gz
>  sha256  c6ffa7e6889e63893078cb21b89594070183f7e2cf5b4ea01a4fb23eac59ed32  LICENSE.md
> diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
> index 9d8da2a3c6f4fbf374a3ca7186b1b955f204eb97..4d294298117f7673518016cde39248a1aaef4414 100644
> --- a/package/libspdm/libspdm.mk
> +++ b/package/libspdm/libspdm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBSPDM_VERSION = 3.5.0
> +LIBSPDM_VERSION = 3.8.0
>  LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
>  LIBSPDM_LICENSE = BSD-3-Clause
>  LIBSPDM_LICENSE_FILES = LICENSE.md
> 
> ---
> base-commit: f5101638b9f917dc4c569828ff3fee0c486ba8f8
> change-id: 20250801-fix_libspdm-fdf9bb810343
> 
> Best regards,
> -- 
> Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
