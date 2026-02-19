Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4251BE9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 173AB60E01;
	Thu, 19 Feb 2026 17:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkOfCEPCN0nr; Thu, 19 Feb 2026 17:25:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CBB060EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521925;
	bh=QDO8dLYWTTSjpqJEycliniXDTeWlMgE0FyP3RBLGB/w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=be2pdLJ3/lO0Q2sVNeJBwIzCbaMfKx7aQU7+t/uqeQT9Hr/4QRVhaPnbiSmAZE+Ep
	 CxNMKJZDuLHNOywlNoNuMnY7WHoDb01s87uubzxkiwalrG5YkDabQtvhJIKE0j4I3E
	 jFeBWaTKg6jYvo7LMFXblM8bvwHx6jR2nHmFMnlTDvj8zhT1YvJ86OmzJB8m1nSIW7
	 T4ZYnOJMIS4NyyBuK9bBw0Fxhd+M90lQB/KgADmjw+Ofnv1TP2+MjNfniE1lzxhNsS
	 5Y7iMjhsi/qMaDirJxnkbRdebzSLO0wCEs92QHZV8/XjxMGM9jr7QWTecyfaenYn9X
	 7+ApkV7CUBXsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CBB060EF4;
	Thu, 19 Feb 2026 17:25:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BCCE206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18F518364F
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iF9kyIge6Rfw for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25E9383827
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25E9383827
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25E9383827
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48372efa020so9882885e9.2
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521921; x=1772126721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jNIViu+ZLL16xMEf4ntrjbYUfS9GgbhYIzOHl6g7QhQ=;
 b=U+uPddM8GYO1D1my24Llhowc2H1YDDKvNs8cco8Qi8thTeSmPKgDbQ1AxwN3IHsTSn
 yFqddhUrY3pbMQp8hI7b/AB2rqxEaTbBkNLeObtW4c+k9yRBGDU8bxIc7sZROtLFVGLc
 BWp0BLEfa+8FKYOr/r5dfQLyfDX+HQeWJ7kogk4NZ6rAcASgEI1tnqLKnGDrljD9z6EI
 LTQhXG0emUiFhyGv+Ds9y2um80fxGQwYI5Gue7ZCQj5A6t3VIYDG2c+dZkd7FXumq15l
 vkicU+qn5Vwg0wHA5VZZO5y827iM33kfolC3tGZKkBb91bWtqGQfMkLYrp/F/6HIyDfn
 wwxQ==
X-Gm-Message-State: AOJu0YyXozsiIQvzM8maR/xgEJc1rkxTdr3mkBcEKMzSmulMw/1bIdN9
 m7SljikmpPxccqFtNthN6oZHmjU99l9k1pk2EQ3UudXoabX+dnxWoV8bCe5398VDi6Y=
X-Gm-Gg: AZuq6aIjpg5UcvJCPVZtqlSLrUeHWb8jNNQVcf6fb7XFaNK91ihAd8kLt71VkLLfgGc
 3R2TrGuS5m/hC2Xq1ftN2UDwupurEHkcHVbqoyFHnFWiy5tdYLbwKF5fLZ02RP51a/0+Wfhjx8V
 LoEGbIVUidL9LjKEZEI5djyUrqMTL0sTdw6umC7NYVgAXUXggN7Bbc9jzHiEkh2SIRwnkq5UH5e
 FDpOdZhaOndih2SEn5iSP96inHYPmckCBATMEbWLTxWDmfzFqh0e+Vjm+ouVH7F+JtDa+W5zzBF
 6q+gTALlEEUcJhpjGPIY2+b2X0AXlrjhH035xWCxKiwOxWwioY6lHcP6Io0x/g2X/g3PcY94QwS
 n7t3tDO0XqCTjXP6hooPsRM/etT7oejpxpJDE3IOd3PfozwtigN6BHYtt8RKAd6CE/pad02KB51
 4pkz9t7mPAH9P6xlo=
X-Received: by 2002:a05:600c:4750:b0:483:7783:5373 with SMTP id
 5b1f17b1804b1-48379bfd6b6mr299608125e9.23.1771521921141; 
 Thu, 19 Feb 2026 09:25:21 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a3db54d9sm132535e9.0.2026.02.19.09.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:25:20 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:25:19 +0100
Message-ID: <20260219172519.339933-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260126133848.91886-1-thomas.perale@mind.be>
References: <20260126133848.91886-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521921; x=1772126721; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNIViu+ZLL16xMEf4ntrjbYUfS9GgbhYIzOHl6g7QhQ=;
 b=hm9+9rQ4HICD7MrxB/77tCSjqPjKkH8xITFFtoG3GxvZ61xd2k/X8eOgqUjvNxdRgS
 0dyOiqo0DIIIz6p9FJHqp3QQN2qCeW+sQQGEQl5Q+Z63p9pdE+SA0g1taLHaMrZVoFWw
 kiure0nDHUKHSYS36X4jcDIjMprgSouiCjSad52ayz2pSGNb+mRUbcAUXgP6hzBVkgpP
 4/NTBgBWnyNvWAvn3zR5x1WCwo0n+YJhgfqA99/yjcsSJeDykiyqOV4pzEEU7MDquzUv
 zcOs7ASr3Y6Uyaqd+tbuw9QNlD49QG25d9Y6VVVF12fhS+sOVNGsO+ZE3KeEW0hLi+Wf
 ulVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hm9+9rQ4
Subject: Re: [Buildroot] [2025.11.x PATCH]
 support/dependencies/check-host-cmake.mk: set host-cmake max version
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
> Since the introduction of CMake 4 in several distributions, build errors
> started occurring on those distributions for cmake packages that
> included calls to cmake_minimum_required() or cmake_policy() with a
> version older than 3.50 (see [1]).
> 
> This patch enforce building host-cmake when the host system provides
> CMake 4 or newer.
> 
> [1] https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.11.x. Thanks

> ---
>  support/dependencies/check-host-cmake.sh | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> index fadeae9f6b..c7aa16f48d 100755
> --- a/support/dependencies/check-host-cmake.sh
> +++ b/support/dependencies/check-host-cmake.sh
> @@ -6,6 +6,9 @@
>  major_min="${1%.*}"
>  minor_min="${1#*.}"
>  
> +major_max="4"
> +minor_max="0"
> +
>  shift
>  
>  for candidate; do
> @@ -32,6 +35,12 @@ for candidate; do
>      major="${version%.*}"
>      minor="${version#*.}"
>  
> +    if [ ${major} -gt ${major_max} ]; then
> +        continue
> +    elif [ ${major} -eq ${major_max} -a ${minor} -ge ${minor_max} ]; then
> +        continue
> +    fi
> +
>      if [ ${major} -gt ${major_min} ]; then
>          echo "${cmake}"
>          exit
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
