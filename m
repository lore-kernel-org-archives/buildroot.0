Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5235ACA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A782847E1;
	Thu, 21 Aug 2025 19:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuYCJ0hfqu5R; Thu, 21 Aug 2025 19:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AA2B846D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AA2B846D1;
	Thu, 21 Aug 2025 19:22:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 867271C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D1F284794
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkY9qQL0FXmb for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84D5F8478F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D5F8478F
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84D5F8478F
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b9dc5c8ee7so1268635f8f.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804106; x=1756408906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOHQcQaMwE8UGHVdq0n4+Mhx32wFrRfz+5eLOJD7Yzg=;
 b=FkMeH1nelIFeqH+X1xk3dUch0b0f4PvRrqHneB6ch+gQ+orelMpcHdNFFNV3kOsw4p
 vPTxpEOx5PaJzAUzuPcNld/x0x4eCme4dqVO2gHh2kbFg2x4CU75to7KNXjw8hAekgj6
 suTIAanED2feT+PamnPG0gGlS58FhpXnTyAj3MxZXoZ+jxauJ3ShYJ7glWnVrPLagxRU
 0l95/tBMX5mcDdkDW6UzCoEZkuODlq4iOddnLhxhFEu9OKagqszk4sYGpTeLfi8QUdma
 JxP/7qUKMrJq31+9ksPWDWIyXNK4/5nSJP1FxSRSzO0EeNAxBbkM4zpbw5L1VOi2Q9sW
 MVOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0XRgxYkqbS++G0tEDdJ2MauVqC8L7ORKgHKjboYXPLht4Lv33RMzVjWiqdp9+iAJWp0lgyrDhrek=@buildroot.org
X-Gm-Message-State: AOJu0Yw0WiuxrfpNr/bLgWQ9ZJ5YVUEeoL6kZWV7G7ifCXv9WxJqNSGw
 ss7tAt9ElEqHYfe1ZB/Z5T/pSljWKDL0WZGB8kiak0B3QNf1SX8es920ivnM4MzMmtU=
X-Gm-Gg: ASbGncuxBa/LcXnKA2X3cLTK1A2tqaO/ZrkMCUE9DOBGV7ERQf1lPOT0wh/BVADq8lJ
 cg3lSU+LyXEoZM4fA2iEVqTo/mZWJmLirqFieWtiK8WuhgUC0Ut5RgJabxB//ym2iymXpbjOgCx
 JFpZzB/oF0Rkgg+3YIk9EViIUObXJcDBZKlUKt268fEa/eCpsl+gY3yVpFMI4PJyHUJCQEX8bfK
 4YVCYNJ7cGaMIZTGTjpcV4xrZMqNix+R1MnF0JHSHYpX5oi1n3eEfBNn0HtPCkAZq8B7eqeM5vd
 M3wGYwcbahFqcri5bYAqEs3xswoDS/JV0t/LJkhfGTvSKCl0c2PAQVTK3KvYOOL3V06OjC9iZ3Y
 DJteaiXDzDLmKEQ==
X-Google-Smtp-Source: AGHT+IHXj7rnd1/xIciMN/C78RqYIMomLZKnk79V+r14e4sa+5eKsIK/lQCh9NKPjl/jKJPRCj82fg==
X-Received: by 2002:a05:6000:2c07:b0:3b8:d79a:6a53 with SMTP id
 ffacd0b85a97d-3c5dae0659emr132784f8f.23.1755804106507; 
 Thu, 21 Aug 2025 12:21:46 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c077c576b7sm12408479f8f.63.2025.08.21.12.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:46 -0700 (PDT)
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:45 +0200
Message-ID: <20250821192145.25182-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812075237.1214602-1-nemaakhilesh@gmail.com>
References: <20250812075237.1214602-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804106; x=1756408906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOHQcQaMwE8UGHVdq0n4+Mhx32wFrRfz+5eLOJD7Yzg=;
 b=hViskXNzhrSKff+ieY4W2JLgqobag24Yc7IZaM7yEmfwG5BwqyhIC3t/NwYPAcROqc
 DM23JuDZZea2kyo5kI4OeI55MjssLWuO/bRO9xSj1q1pL/ItH11c+lKj7T2TLXwAuNOU
 bVpGPYO9szE9ZQavSOiuNJctOoSU+m7LZ9UMPF3ieax+2nGsFq3pzLRW3gxX2LV2gpeE
 KJ94tq/PF6+48zs5heXOo7/fxWFuya8j8i4HZqI5pMPMgFhzKgo8K61RFtfDbRLtThRk
 ina6HfrRQlvsDmtJpQ8V2Gs6xEvzuV3Zzk1Tg9NCjywo7MnFqMrqlxsowLo0KbWsWDMW
 JcQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hViskXNz
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf3: security bump to
 version 3.19.1
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
> Release notes:
> https://github.com/esnet/iperf/releases/tag/3.19.1
> 
> Fixes the following security issues:
> - An off-by-one heap overflow has been fixed in authentication.
>   CVE-2025-54349, ESNET-SECADV-2025-0003)
>   https://github.com/advisories/GHSA-8xx8-qrh3-q8mq
> 
> - An assert in authentication has been removed. (CVE-2025-54350,
>   ESNET-SECADV-2025-0002)
>   https://github.com/advisories/GHSA-r6x8-74x9-5mc9
> 
> - A buffer overflow in the --skip-rx-copy option for zerocopy
>   has been fixed. (CVE-2025-54351, ESNET-SECADV-2025-0001)
>   https://github.com/advisories/GHSA-xjwm-4pfw-49g2
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to 2025.05.x. Thanks

> ---
>  package/iperf3/iperf3.hash | 4 ++--
>  package/iperf3/iperf3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
> index 1ffb2c6c02..3d9ff0cf5d 100644
> --- a/package/iperf3/iperf3.hash
> +++ b/package/iperf3/iperf3.hash
> @@ -1,4 +1,4 @@
> -# From https://downloads.es.net/pub/iperf/iperf-3.19.tar.gz.sha256
> -sha256  040161da1555ec7411a9d81191049830ef37717d429a94ee6cf0842618e0e29c  iperf-3.19.tar.gz
> +# From https://downloads.es.net/pub/iperf/iperf-3.19.1.tar.gz.sha256
> +sha256  dc63f89ec581ea99f8b558d8eb35109de06383010db5a1906c208a562ba0c270  iperf-3.19.1.tar.gz
>  # Locally computed
>  sha256  7c9ba0385fcf35c4c9e08ad0c0cba72d4315f36f0f742fef4de826a28cc33a97  LICENSE
> diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
> index 69c4792f98..df6b32abc1 100644
> --- a/package/iperf3/iperf3.mk
> +++ b/package/iperf3/iperf3.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IPERF3_VERSION = 3.19
> +IPERF3_VERSION = 3.19.1
>  IPERF3_SITE = https://downloads.es.net/pub/iperf
>  IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
>  IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
