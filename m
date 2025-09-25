Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542D6CAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 206C861537;
	Thu, 25 Sep 2025 20:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wL2GhfS4vfBD; Thu, 25 Sep 2025 20:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5148C6153C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5148C6153C;
	Thu, 25 Sep 2025 20:16:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3FD6177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C40DE414BC
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1jlNUtVe53t for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B34854120F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B34854120F
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B34854120F
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:48 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3fa528f127fso1034823f8f.1
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831407; x=1759436207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nGny4bM6wAVl6rqgOvEaQyp0pj1MX1mYtPer0g3U8z0=;
 b=GHwrtqY0/rBT/PMAH4Xpl4uZ34TnzO8w2PZMAbinu9ZC+7wyuP9AA2MXBoGm3T9nOz
 9p419zmK++o2H01cCLb9YF/MSXM8QUMAj5OQe9woYHrRtKuHyZeaAS61sixkCL5qYPui
 qRKysufULt3n1iTEhXzvu6BOnu7cSpZbH+N6/TlzTo/dWuoPSEWZPaAqBmX67+Fbqv3d
 vdSX0ukv9mQ1Ahe+yeH4mE/t0TMVga2TYgkL9Lll6GzLzTxJiwQNcvQQDdxYWFZNvs4+
 egn7TXjAJ6RaCbmksa0IBxVW4iHHk0kLBFCo2zaCJxk3/OtRFGptprGa4mHk0oticXxU
 F4Rw==
X-Gm-Message-State: AOJu0YwJ62NTw5HVgkJEnqzTbLDst/U+f5gY490TB0WPraZYVma9WGdH
 BTsJR61Tp/JbtRN817Ox6kLWM2AucW7B93tBRFze9GhF2w5omgPVDFlF9x6C+o8/ZshQd+5Cd83
 1eoGrIqM=
X-Gm-Gg: ASbGncuyS6pnpALb7sMpjyFJp7PapQNujJATTv74gJUUlgnKQ7IthI6KnxESMZQLbqm
 2KwFEXe1GEXv/O6PoPOUH5enGGSjBwHMXNSIX1+E79yIAWgDcMt6bz5ZnuDkwHe7IrQ5pr3nsfd
 3s8Sc7tOFBmpqbmO1Jp4qmvb7Npg/wQ7Qr20GT6tQRLTC1eUIV/OTqHzWIC9jDBkzH7qcXb70hX
 gbOe2CJ1Pd3LC1uPTOEcpbLHlcKvlQB6XEFm5SBQv4blphwamMYLYY+L3XjuXM7JXjjPsMHVS/h
 OJpEHI+0jVQ592vLnwBAC0BM5BDjHWQDOhZgfvpTSPKi/RicnhEemvUD1hDrfvA+V8ztvyfignH
 3jD/bXM92ezXzvTU=
X-Google-Smtp-Source: AGHT+IG1Jw4pVchplC2o/86Z07HRwzc1w4xH7cd1+LbfsJLmRD+LL3rCDvg81g0yB2C6ZRcsrUzFhA==
X-Received: by 2002:a5d:588b:0:b0:3f5:3578:e538 with SMTP id
 ffacd0b85a97d-40f670d5869mr3103279f8f.21.1758831406708; 
 Thu, 25 Sep 2025 13:16:46 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5603356sm4088376f8f.30.2025.09.25.13.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:46 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:46 +0200
Message-ID: <20250925201646.43495-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916175144.1057267-1-thomas.perale@mind.be>
References: <20250916175144.1057267-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831407; x=1759436207; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nGny4bM6wAVl6rqgOvEaQyp0pj1MX1mYtPer0g3U8z0=;
 b=S3RmfCS2tMw1Xp/Hdod1qVuHhAnBPm2fh2IcaolWgXDewmXvVwL3dlS8VveJwuxNMd
 eoFw2+8LREmd5VXxVjUKzgRPrBLcKHl2W0CDJsdCsWhxeZbC3qt2BmOq9+IiRMA6QvIw
 bT5T68JejJo69F8p96dum8sWGn0qpBK+HDCwVIPuH77sVHDsSoiufCsNhAmZA5qqKiHj
 6aXTfqtVcHzEqcQWs5f+jZIAaDy+LvhUavJ2we6xmmxi7gK2L1TI3SdoNvoHFxsqjCzZ
 DqeAI8Txdw76e3n1ZVvsX+MAMFLF41Z7NGn6xJiTOZdQq2R95s6OZzesxQ5NAYUK8sOX
 kALA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S3RmfCS2
Subject: Re: [Buildroot] [PATCH] package/cjson: update deprecated CPE
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
> The CPE 'cpe:2.3:a:cjson_project:cjson:0.0.0:*:*:*:*:*:*:*' has been
> deprecated in favour of 'cpe:2.3:a:davegamble:cjson:0.0.0:*:*:*:*:*:*:*''
> 
> See https://nvd.nist.gov/products/cpe/detail/70BC45DA-D915-4A1D-96AF-84A6CECEE148
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/cjson/cjson.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
> index 35304ec618..b87ce97ca2 100644
> --- a/package/cjson/cjson.mk
> +++ b/package/cjson/cjson.mk
> @@ -9,7 +9,7 @@ CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
>  CJSON_INSTALL_STAGING = YES
>  CJSON_LICENSE = MIT
>  CJSON_LICENSE_FILES = LICENSE
> -CJSON_CPE_ID_VALID = YES
> +CJSON_CPE_ID_VENDOR = davegamble
>  # Set ENABLE_CUSTOM_COMPILER_FLAGS to OFF in particular to disable
>  # -fstack-protector-strong which depends on BR2_TOOLCHAIN_HAS_SSP
>  CJSON_CONF_OPTS += \
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
