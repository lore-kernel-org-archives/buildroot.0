Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54846CAC588
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C1A384F99;
	Mon,  8 Sep 2025 10:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZlT_CPCFs0w; Mon,  8 Sep 2025 10:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4086884F95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4086884F95;
	Mon,  8 Sep 2025 10:56:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7D24186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B8BA615A5
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dujXaBUzdJGX for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:56:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8930A6152E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8930A6152E
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8930A6152E
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:56:22 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3df2f4aedc7so2444157f8f.2
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328980; x=1757933780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RBriMhIFG+0ApbtQTJpniBgUUaAYOnXpQRB5l2Z8mvw=;
 b=AUUsiTRl4lStQmRhC5bw9uqhcvR6E6xr89D0NtXYuMDJxva5JTJ/Fugm5SlOGxgDsl
 E78pJyQQuWmfFhLXda4F3K96YHeTXN1ZXQ/BLezvBsMv4VDYLcfBeao4AUSJb1vi4by4
 1L+D0uqEqHcx/VcOja+6FtC/XByzjwZ0fJ8p0xghTGvjGRLH/3TrHDLPP2/o773q1NKW
 NQq52AE0d9+Zqk27H1IFBOG6GkzQVWyTUPEmbMXQmG7JSdlHbGGfZwsWEAoecEZPNA7p
 5pC1yZlCYRMcF8z7yuC2FqlsLvf3qUuvHtCvqzOqBrrKFObm7zEoaDyF3xWwP19O/uSr
 AiTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/TW/qf/cxb15Cn1Gh435zBOvzdaEIDyxXNaEuF8r+ZXta5k6Q0WMnkPG8f4RoZs2GMHqhP88eYLA=@buildroot.org
X-Gm-Message-State: AOJu0YxL5g9/6ZY/TMswJqDqhvWgTq2IPnhIGyoKsn9pkeUXl7D3pf7N
 iMw5vcltpAMjhZlyEEN3erhzp7ZH1NDASbi5ZJjDMdnKOkBq3ph69lzXMsWaCqIWZWI=
X-Gm-Gg: ASbGncuntiyYdmWu6eMB8bGiNaEb1lrviUGluwkEb+yit4AZGlJPW/wIF1R8cF6Rlrx
 leOg/TL4a34PaAU2JX5t3LQ0S+TgCwbxomko4bMfERSBmA5KY0heuWdnlRibyMk8bxRupkVkpqs
 43Td36EGmHWGeS7fWRXzmTu8xF+pUYsES8thbtfwhLo8zBfadoNBjzebziNQxF7iuWHfY2Ae9fq
 OU1pq0AFaVqK/uJkEmgkKK989CquevM8EsaxLBTL94io1BoDGf89Fm7vcfXoAos8YDtdffJuzke
 75HWtsL1Zq5jM8V0UZ5/nGhTdkSUU2GxYAC2mfYINyKyjS1g7itVEC0hvzVhlIMhw9IyAEb9yv7
 5GBuMGkH3CYY5iJzpmWudOBJL2ZJgZbkQ1ImpYSIljR4tnDa2nkuVaDIhPwaY7hGZeePLWcEvSG
 ExeO5mALpb2mvKzA==
X-Google-Smtp-Source: AGHT+IF4XqPeEMVLIEzZrn73FNxxAY6xCnAPGKV4sy9yIFOVKB0w9ULKJunoHmlz6GgaUhiIUYsG9A==
X-Received: by 2002:a05:6000:2882:b0:3dc:1473:18bd with SMTP id
 ffacd0b85a97d-3e636d904d8mr5214144f8f.3.1757328980503; 
 Mon, 08 Sep 2025 03:56:20 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e411219ddfsm11964052f8f.57.2025.09.08.03.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:56:20 -0700 (PDT)
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:56:19 +0200
Message-Id: <20250908105619.682311-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250820165502.1984588-1-angelo.compagnucci@gmail.com>
References: <20250820165502.1984588-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328980; x=1757933780; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RBriMhIFG+0ApbtQTJpniBgUUaAYOnXpQRB5l2Z8mvw=;
 b=C37KAotAMEeaOa5NzbvMkItmXkWM4z91eKZciO5dBppQ2kugLt8+RV8+hGzaKuRF+D
 DCZwZjGcN8zvrmulOcRudTETf8Q/T+CrneBWp0us53e4OtVWfJjHLf+UGkihiH5Oyjf/
 9yLDYP2mdL9W09hnh2Zvh0JTYf47Xi4y5aIOgQbR5Q8lhQQKQ5baOc6lV3Xp3NwK4M2V
 79Ol9qpFoWsHP6g5CkxUtlSdsu6SJFfcNyncE2SsJiHogY5sNa5WhjDDjEZhoJRc87Wv
 fOgNucTgBM+OomQaf1mxW5GVWwvTZNSffF1hoCGtJ8+o8gs0eUOGrwsAS4wQEuFIRYBE
 DaJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C37KAotA
Subject: Re: [Buildroot] [PATCH v3] package/jq: security bump to version
 1.8.1
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
> Changelog:
> https://github.com/jqlang/jq/releases/tag/jq-1.8.1
> 
> COPYING:
> Add LICENSE notice of NetBSD's strptime() to COPYING
> https://github.com/jqlang/jq/commit/78045d8aa9d155ec0f82ab102aa752300c2349f1
> 
> Fixes the following security issues:
> 
> - CVE-2025-49014: Fix heap use after free in f_strftime, f_strflocaltime.
> 
>   https://www.cve.org/CVERecord?id=CVE-2025-49014
> 
> - GHSA-f946-j5j2-4w5m: Fix stack overflow in node_min_byte_len of oniguruma.
> 
>   https://github.com/jqlang/jq/security/advisories/GHSA-f946-j5j2-4w5m
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to 2025.05.x. Thanks

> ---
> v1->v2:
> * Updated COPYING hash (Thomas P)
> v2->v3:
> * Adding new license (Julien Olivain)
> * Adding security issues links (Julien Olivain)
> 
>  package/jq/jq.hash | 4 ++--
>  package/jq/jq.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/jq/jq.hash b/package/jq/jq.hash
> index 344f73d463..4596134620 100644
> --- a/package/jq/jq.hash
> +++ b/package/jq/jq.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c  jq-1.8.0.tar.gz
> -sha256  ea9e53f5974239869c51ace8bb6849c9751dee7c9d592180957987a1a133caff  COPYING
> +sha256  2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a311dc33ca837eb0  jq-1.8.1.tar.gz
> +sha256  ad2b4a266b2268939c1446979759706077421cf906a203aa188c6f396e8cfd74  COPYING
> diff --git a/package/jq/jq.mk b/package/jq/jq.mk
> index f3f4704f37..c1b47ce829 100644
> --- a/package/jq/jq.mk
> +++ b/package/jq/jq.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -JQ_VERSION = 1.8.0
> +JQ_VERSION = 1.8.1
>  JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
> -JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
> +JQ_LICENSE = JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation),
> +	BSD-2-Clause (strptime)
>  JQ_LICENSE_FILES = COPYING
>  JQ_CPE_ID_VALID = YES
>  JQ_INSTALL_STAGING = YES
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
