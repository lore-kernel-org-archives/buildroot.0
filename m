Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D44EC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F02854064E;
	Sun, 24 Mar 2024 15:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUDQ6_4qutga; Sun, 24 Mar 2024 15:10:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 774FE40633
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 774FE40633;
	Sun, 24 Mar 2024 15:10:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 865B41BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7021A4064E
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_dnwtXHAjRu for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:10:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F023640620
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F023640620
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F023640620
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:10:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3416a975840so2711707f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711293017; x=1711897817;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wSDO/mR/sPl+rnFqYtQBtLJu28vBC8zs9aXJUjIHQQ8=;
 b=tONHVgjQMNvdzpklMQaKBj4dUvEUQUxtB9kPTwAG5zXg2IfcjJwyxxEmfJB1pN0MZR
 yx3ONHi3f8MHMUecNZTSw8aUL+a0YQa1isu1j+GPuAWvryNsEJsxxv0+xf1KMQYYr16l
 l7GHw+2LFsreZwCt18E5PdaDJQCNcgp8b1s+KquauK/6vuAmuAzziKGGCISHVrQNUmL4
 r95KKIK5svT876PgaZ0I/+OMBDJgVJn/tJZ/HnRU2v1xSNCkQG05PhfLj49B1Fut8LWf
 hHAt0TuWSr4dAEBy9nA22u1XjU5fRR7inEtBv8KE0SPbZxN4T1Tm5wWCZS94vGlnK2FK
 3zqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6dpptPRjcadYxHX6hNq+x8+EwG5XyO7Op+zujDloOKbO7GA8hnWQZzEDJsH6ZrdwrGJHAi5j+JPajzL0N2xgFfOcEMnuYgA==
X-Gm-Message-State: AOJu0Yy3DfuX1dnx2j4HUdUO7W6IlNXqycJAV/Q+SjLUwEUwj7ZaPGGZ
 GTgD22dEhvFB/2LU72L6Hjbyakfj8hszJCNz1j6Ya+Hys1ErxK4P2InJrr8+7RUfWljni/isFU8
 u
X-Google-Smtp-Source: AGHT+IF/TXfgU1FYveN1JXPnl67NydxF7uPHQWSL/LG0N8j8e2NroMsREhcDjKDQPJztbhSKSmnPhg==
X-Received: by 2002:a5d:526f:0:b0:33e:4969:f05a with SMTP id
 l15-20020a5d526f000000b0033e4969f05amr2863947wrc.37.1711293016898; 
 Sun, 24 Mar 2024 08:10:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x18-20020adfffd2000000b0034181bea3b0sm7035705wrs.3.2024.03.24.08.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:10:16 -0700 (PDT)
Message-ID: <248edb02-2cb3-42a5-9907-892d521a21aa@mind.be>
Date: Sun, 24 Mar 2024 16:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <20240323232116.3071446-1-thomas@devoogdt.com>
In-Reply-To: <20240323232116.3071446-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711293017; x=1711897817; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wSDO/mR/sPl+rnFqYtQBtLJu28vBC8zs9aXJUjIHQQ8=;
 b=YtSloTPtPQwTWaXLVq7aqCYXVKqTTr7YpzVs/uPnNhuZomGc5YkMzKFYWOBQHmomWx
 e5Ll/bw38A50pc/b6ma+Nw0vtLy63Nfcpn0d4F63UcbjhLkGn8f3wJHP1sa/2PZLUSNn
 MUlcUrlMt1oi+0adc5zGb9FeV7aLQ4VfHH+0tGPGiOxDoZi3ztBBpSqWtKSM5p5OqCXD
 TRIVaAsJSMTur0neKqeG5Oa5607iVY2uSl5z/3rBpKmlrKNGJqSoBoHJ+eFuvYCKFgWI
 kid5Qqoh3a4B9ZCGR4Z+4PnSozYLtY1V6lYrfwVv/c3AKTtcgQ5sQpd14yPseuusgPZ3
 JjuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YtSloTPt
Subject: Re: [Buildroot] [PATCH v1] package/fluent-bit: bump to v3.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 00:21, Thomas Devoogdt wrote:
> Release Notes:
> - https://fluentbit.io/announcements/v3.0.0/
> 
> Also drop 0004-wasm-restore-support-for-some-targets-8401.patch,
> which was accepted upstream.
> (See: https://github.com/fluent/fluent-bit/commit/40bb0fbe17efa6b4b1a96940e9ff7374b1a0c3eb)
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...estore-support-for-some-targets-8401.patch | 43 -------------------
>   package/fluent-bit/fluent-bit.hash            |  2 +-
>   package/fluent-bit/fluent-bit.mk              |  2 +-
>   3 files changed, 2 insertions(+), 45 deletions(-)
>   delete mode 100644 package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch
> 
> diff --git a/package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch b/package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch
> deleted file mode 100644
> index ed6206268f..0000000000
> --- a/package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 4a6c5f56cd1a979b91c168fb8e245587c2927aca Mon Sep 17 00:00:00 2001
> -From: Thomas Devoogdt <thomas@devoogdt.com>
> -Date: Mon, 22 Jan 2024 19:27:56 +0100
> -Subject: [PATCH] wasm: restore support for some targets (#8401)
> -
> -Somehow, support for ARC, MIPS, and XTENSA got dropped by bumping to v1.3.0,
> -so restore it now. Remark that those targets are mentioned in the section above.
> -
> -See commit fa6a248746f9f481b5f6aef49716141fa0222650.
> -
> -Upstream: https://github.com/fluent/fluent-bit/pull/8401
> -Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ----
> - src/wasm/CMakeLists.txt | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/src/wasm/CMakeLists.txt b/src/wasm/CMakeLists.txt
> -index a258dc063..4ea7eba65 100644
> ---- a/src/wasm/CMakeLists.txt
> -+++ b/src/wasm/CMakeLists.txt
> -@@ -51,6 +51,10 @@ elseif (WAMR_BUILD_TARGET MATCHES "AARCH64.*")
> - elseif (WAMR_BUILD_TARGET MATCHES "ARM.*")
> -   add_definitions(-DBUILD_TARGET_ARM)
> -   add_definitions(-DBUILD_TARGET="${WAMR_BUILD_TARGET}")
> -+elseif (WAMR_BUILD_TARGET STREQUAL "MIPS")
> -+  add_definitions(-DBUILD_TARGET_MIPS)
> -+elseif (WAMR_BUILD_TARGET STREQUAL "XTENSA")
> -+  add_definitions(-DBUILD_TARGET_XTENSA)
> - elseif (WAMR_BUILD_TARGET STREQUAL "RISCV64" OR WAMR_BUILD_TARGET STREQUAL "RISCV64_LP64D")
> -   add_definitions(-DBUILD_TARGET_RISCV64_LP64D)
> - elseif (WAMR_BUILD_TARGET STREQUAL "RISCV64_LP64")
> -@@ -59,6 +63,8 @@ elseif (WAMR_BUILD_TARGET STREQUAL "RISCV32" OR WAMR_BUILD_TARGET STREQUAL "RISC
> -   add_definitions(-DBUILD_TARGET_RISCV32_ILP32D)
> - elseif (WAMR_BUILD_TARGET STREQUAL "RISCV32_ILP32")
> -   add_definitions(-DBUILD_TARGET_RISCV32_ILP32)
> -+elseif (WAMR_BUILD_TARGET STREQUAL "ARC")
> -+  add_definitions(-DBUILD_TARGET_ARC)
> - else ()
> -   message (FATAL_ERROR "-- Build target isn't set")
> - endif ()
> ---
> -2.34.1
> -
> diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
> index 2c34583f7a..cc9c976d60 100644
> --- a/package/fluent-bit/fluent-bit.hash
> +++ b/package/fluent-bit/fluent-bit.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  8e7e951b2907e9d29508699c71c8949a4a22d750d54ffa5ee5b96537e59371dd  fluent-bit-2.2.2.tar.gz
> +sha256  e70ae5be2f0ca1cb842a1c8d2762437907c522765f79b5c0c391eaa1b57c9f4c  fluent-bit-3.0.0.tar.gz
>   sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
> index 00a8904c55..33054bea66 100644
> --- a/package/fluent-bit/fluent-bit.mk
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FLUENT_BIT_VERSION = 2.2.2
> +FLUENT_BIT_VERSION = 3.0.0
>   FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
>   FLUENT_BIT_LICENSE = Apache-2.0
>   FLUENT_BIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
