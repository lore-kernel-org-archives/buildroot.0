Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C07DCA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 749F484198;
	Thu, 21 Aug 2025 19:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUtsiCfwk9gD; Thu, 21 Aug 2025 19:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68B7384672
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68B7384672;
	Thu, 21 Aug 2025 19:21:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E4401C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF07A61706
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBCtnu959c3s for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 22CC561794
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22CC561794
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22CC561794
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:06 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3c51f0158d8so686711f8f.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804065; x=1756408865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQLiNtofHGogtjTWmX3beFk55g3jgnPgN9GhQ/013NA=;
 b=mgtltCa1MrXrcCNXRLGS68G57yS+uU89B3opx28eTDn+gAJ5+mmQ93yQuOC7HvlDPf
 nOG291zfsa0ir+r8R/q5Mq17xIf4e9+jqn2lerM2H/opUALF9IaVgm2GKZyb8gQxvnoK
 zRHhKWltWhiCrBUXZOmXDDgL2/mRaeBJ7hkXzTFXmSplQGKOcttnrmpS5DcAyBdHxz8a
 2KSFBcUWSqD8vnvzeRaWEJhj2EeBbVSYFoasozViS0KrG5kMM765ZgVGjefgkEJGDpVT
 8Pyju6a09H/KlNI0A8wBeuHrCBQhaWvxRclkJMwB7Jm4GTV+a5SXxUTg1fLlqCIFFb3r
 H1YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTc4/4jKeSjuqzqDU2q3M1EiDOXyTFzUu0VXzFJilm6xbnj8nxix0txL8OngoZro9cHj/LQ2Pbq/Q=@buildroot.org
X-Gm-Message-State: AOJu0Yy72pyH+Oc/X4v5SkZUYAWKMX8t/FygerJLuymHOd9zYPX6Y1+E
 5aIDhrdkNPYxTx7sfXHY+kJs1T/tx2yv7dxuQy1doVtHWt27lynqefdqOAiAUHkvuzQ=
X-Gm-Gg: ASbGncss6Dd8p5VO5J1n1jmRGPoCsoM01M2XEPfSW+Rl2mSsg4/aeWqG4H3VsnKPGQe
 GGHrLsYvJ6kpXXFsgWvK+KxQfJmZNYgPQVnbEnXJbJVWukwUeETAWEdrKwZsrXyAxWLLLXJ4iNH
 HcoBaZqHG4FIwR6NmYX6M7FPR0gRD6RuRD+CpXPqhs7gpsc/RyTcR6Nn11guX/7zWryyMewHwni
 c4ffP7yXLaPozUwAdSzP7isnXm9gxBQ26ntrdC9Lo1l1keitveTh6ayM8llUVX3SJuWX6YGbXqc
 W3wgGRZq4KwNGVp8O34DK10xQzoyw5KPW6d5zGUDiE8Y9l05YYGrZPFCNYwDcvnm7Bl6F01j/Ai
 gdG9R9nLxCQ8kqA==
X-Google-Smtp-Source: AGHT+IE60bgOb9t/C0yJaetXtrDH3KHDU9ZOU8UFpSnbPZXkWuiPctP7fylVC3xw7/TjUkxPLRwSbw==
X-Received: by 2002:a05:6000:240d:b0:3b5:e6bf:8379 with SMTP id
 ffacd0b85a97d-3c5db2d92b5mr130160f8f.28.1755804064823; 
 Thu, 21 Aug 2025 12:21:04 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c520d37833sm2416488f8f.45.2025.08.21.12.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:04 -0700 (PDT)
To: Florian Larysch <fl@n621.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:04 +0200
Message-ID: <20250821192104.24062-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812215815.7252-1-fl@n621.de>
References: <20250812215815.7252-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804065; x=1756408865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQLiNtofHGogtjTWmX3beFk55g3jgnPgN9GhQ/013NA=;
 b=PplA2UK1qUS1jD5BVO/ss0LQPUNKasSNTRYV6FEfqUpa+tw2+zqUt3P9AsoiXTidfc
 mlCZlnpSnCDWak97o2EpItujNVlQyuPzvINVDwqn35usoJWxn5G9ObbnTT1RUwS0w4kY
 niUlBn12+TysMAt+PQ2dVe9aTBdGg+yi54SFNhrm7XkbtUtNAbXSW+CAMe6rqyTWrfAW
 HmGN3Mo6o6ufVZw7qWcmSYUpwtP7jSKgEi39uQp1km4U2O0AggdepjU4FOeEiFqugqRN
 NDK4yjtSuL4hcihTX3LCMZNgmP/rigklUct6LHDj1RnooQy1+AyppZmpshn0CY2YwWAv
 yGnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PplA2UK1
Subject: Re: [Buildroot] [PATCH 1/1] package/tinyssh: fix build issues with
 GCC 14
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
> tinyssh 20240101 fails to build on GCC 14 because of a missing include
> for a forward declaration. Import the upstream patch that fixes it.
> 
> Fixes: https://autobuild.buildroot.org/results/e45/e4563317371c90669f6417ee3d1c48a41cb59cb2/
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> There have been a number of newer releases since 20240101 that also
> include this fix, but there also have been some build system changes as
> well as a license change. For this reason and for porting this to stable
> it makes sense to fix this issue separately first.
> 
>  ...issing-bug.h-include-for-global_die-.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/tinyssh/0001-packet_put-Add-missing-bug.h-include-for-global_die-.patch
> 
> diff --git a/package/tinyssh/0001-packet_put-Add-missing-bug.h-include-for-global_die-.patch b/package/tinyssh/0001-packet_put-Add-missing-bug.h-include-for-global_die-.patch
> new file mode 100644
> index 0000000000..99649d4690
> --- /dev/null
> +++ b/package/tinyssh/0001-packet_put-Add-missing-bug.h-include-for-global_die-.patch
> @@ -0,0 +1,33 @@
> +From f863e60d93006019855a0431ea5cd71c8f1fc173 Mon Sep 17 00:00:00 2001
> +From: Haelwenn Monnier <contact+github.com@hacktivis.me>
> +Date: Tue, 9 Jan 2024 20:15:29 +0100
> +Subject: [PATCH] packet_put: Add missing bug.h include for global_die (#84)
> +
> +```
> +packet_put.c:53:9: error: call to undeclared function 'global_die'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> +        global_die(111);
> +        ^
> +1 error generated.
> +```
> +
> +Upstream: https://github.com/janmojzis/tinyssh/commit/f863e60d93006019855a0431ea5cd71c8f1fc173
> +Signed-off-by: Florian Larysch <fl@n621.de>
> +---
> + tinyssh/packet_put.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tinyssh/packet_put.c b/tinyssh/packet_put.c
> +index 17e8d84..7f46ff6 100644
> +--- a/tinyssh/packet_put.c
> ++++ b/tinyssh/packet_put.c
> +@@ -6,6 +6,7 @@ Public domain.
> + 
> + #include "uint32_pack_big.h"
> + #include "buf.h"
> ++#include "bug.h"
> + #include "sshcrypto.h"
> + #include "ssh.h"
> + #include "log.h"
> +-- 
> +2.50.1
> +
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
