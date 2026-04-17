Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87C1F436BA
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8256560E43;
	Fri, 17 Apr 2026 15:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zl15OreFmPUV; Fri, 17 Apr 2026 15:24:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 716A560E26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439480;
	bh=waKO1FIhS5bF6AoQ/QURx9CEorD7j1M309/d9ZOPHkw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AtPqpdzBi/G2wb6ZcTb5slVoBq7/kaz86it96BYLh/mJA6OwqPCNQzFpgx5wU+lfB
	 PQuHJF/jUafjyn2lKxCt7677Sw8Ku9CdFtJ8jWed5sqrORvaLJ3kzhHRWMTTmGytcu
	 gomgWkIEm1zMnAA32XUICSGWd4AVy+sz6uEhFCgi2oKLVriQR0t6F+AdGpQ3DSEsnA
	 +9spva2vM9H4BbcawWv43KvCBrTYyLBHZKctNcVDHptXrEnkK1HCWH2jqMMy2lkhSh
	 Kev8lz0yxS8ehKAuZGLzInDDS9OeHmAnEMpnYiFPYZDjnrUbFakIaPtKaR9/Ew0Zvk
	 7MBKVWbyy3VsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 716A560E26;
	Fri, 17 Apr 2026 15:24:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9F92259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B94181518
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4ZRoUZpoMtQ for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8111380B32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8111380B32
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8111380B32
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso569087f8f.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439475; x=1777044275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qt51Nz9yOH75Z71kr262qHogGfvZiSjQkENsKnKWw2M=;
 b=hCxbUviF1qGASviFaTiH//JIEEH746NcoD+yPIhgQuuCucVXINo1lesTJbmGzoExf7
 e6uWqAzDSmrHxRGnOzKVLeRobJwyWOyb+6NGzgyTleJZcmYAUGdLgk0Pkcvg3cVSlNzt
 AeUo8VipWtxjtg7w06S5YTEgXcz5Nn/2LuTcmau2tmv9BMPkqCLTjYsdK6goC1HrbgK9
 1WifXvI2STXOaYJEIcBLSjCzMtDq6iZiH7NllvK7wJHN8Zkaz6tIfo36qHYKx7VcB7li
 RA6NRTq48m1tJ/ZgptuiCLiE99tX88rEazkOggqsb/nLw39T0Vebd3fsq7C6y6aRJ5yz
 L3RA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8VnCoxs4VifurEWnV36mP2HpXB3a6ZS0SWXOSsOSxfzndxTlOcuv5eLofCuICLqkRmYzhEWWNJzF4=@buildroot.org
X-Gm-Message-State: AOJu0YybM5IeD2Nu0VtmPndeCTul39RKAwF/qzd4z1fC7z7hTHaBn4GT
 iu3CtiNQAGn1wLuEggkvQhlV6Nh0KOBviHttojymbLev7fLGn47wGMvzyMwM+TBKfgV29JKLigS
 P/Jdr
X-Gm-Gg: AeBDietNCP+TtpEBS9n+jXK5UypHcBXiFLyOAsr5dr+8r1Z2Ow5usVVjr49NTttiHu0
 IThq3dbD4HM8B648XebpggSl96kuXEwDJc59532oGBDcYvSEL11f19Z7Y95xIPkXvcAndJhK9Ol
 a1/lOOJF8ySv5T26U3UP/pUzr/TMrhu1Lh0b4w6Xa5MYp16xBU45WFPlYlK1X8KDopyviVScuG8
 dHyleNseOS8waW9ic9979OW6Mc948/vna77tmQdRa222O5I7OqQqQlCXKl/g6ZQ3jvsUgr+hJ48
 D5BTnlHP0QtzjYpKHokb9XnuBx+GSTt3PzpyJWwr8f4Gkb+3vkVe1Psy6S040FuoFT9fDX+JOmX
 M8gfCk+c16/hRQkEDZuJhEjt+ytV5Qc8yIMJ8Ocw1SJ+8FbP3g21yqfTS4zqjtNUPSTDYsOt1P1
 7wO/bzSSHk1wd61vgPtkS1lNoCjfDYHMprduoEiQ==
X-Received: by 2002:a05:6000:1886:b0:43d:7e11:1b72 with SMTP id
 ffacd0b85a97d-43fe3dbece0mr4617788f8f.9.1776439474765; 
 Fri, 17 Apr 2026 08:24:34 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1249sm4642731f8f.5.2026.04.17.08.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:34 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:33 +0200
Message-ID: <20260417152433.312685-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250516143310.2308959-1-peter@korsgaard.com>
References: <20250516143310.2308959-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439475; x=1777044275; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qt51Nz9yOH75Z71kr262qHogGfvZiSjQkENsKnKWw2M=;
 b=bq/fpL4x7dPboOT8FCb/6xbN1JV++4O6R1pA93XMiCoDDQv8IKwnirl+0H5TCAzcSz
 6bqdEhwJwZoItSRZExOtkGSJ5ZVHAJRmIWm149NBqFLf7Yd9/3pGylbQIWq3QpvztOuh
 qy1iXzmff1GvdpCfUsHUQsT2bKcFqdkYVyGDlVnaVYGYi/MY+EZ5M//mtkzOpiSM2k6r
 0wKOERWotP4OZamorMA3kc6Vfq8ZQ2u7hfXVxL6a5deniftyiSiCVdSKfS/rjcZgpYiO
 jRnjk+uqdtDAnBDWygQh9c3Mqf4x1ss1seZ/EYAQOKFdA9jZchJ7VaZZotcIYtRKMh8h
 +DHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bq/fpL4x
Subject: Re: [Buildroot] [PATCH] package/ibm-sw-tpm2: add upstream patch to
 fix builds against libopenssl 3.5.x
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
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x. Thanks

> ---
>  .../0004-tpm-Update-to-OpenSSL-3.5.patch      | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch
> 
> diff --git a/package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch b/package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch
> new file mode 100644
> index 0000000000..36a9cb97dc
> --- /dev/null
> +++ b/package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch
> @@ -0,0 +1,39 @@
> +From 720ed4b8c74c3b517a46b442be9482319ed027dd Mon Sep 17 00:00:00 2001
> +From: Ken Goldman <kgold@linux.ibm.com>
> +Date: Fri, 18 Apr 2025 13:41:59 -0400
> +Subject: [PATCH] tpm: Update to OpenSSL 3.5
> +
> +Accept 3.5 as a supported version
> +
> +Signed-off-by: Ken Goldman <kgold@linux.ibm.com>
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +Upstream: https://github.com/kgoldman/ibmswtpm2/commit/720ed4b8c74c3b517a46b442be9482319ed027dd
> +---
> + src/BnToOsslMath.h | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
> +index 165304d..5fd5323 100644
> +--- a/src/BnToOsslMath.h
> ++++ b/src/BnToOsslMath.h
> +@@ -54,7 +54,7 @@
> + /*    arising in any way out of use or reliance upon this specification or any 	*/
> + /*    information herein.							*/
> + /*										*/
> +-/*  (c) Copyright IBM Corp. and others, 2023				  	*/
> ++/*  (c) Copyright IBM Corp. and others, 2023 - 2025			  	*/
> + /*										*/
> + /********************************************************************************/
> + 
> +@@ -77,7 +77,7 @@
> + #include <openssl/ec.h>
> + #include <openssl/bn.h>
> + 
> +-#if OPENSSL_VERSION_NUMBER >= 0x30400ff0L
> ++#if OPENSSL_VERSION_NUMBER >= 0x30500ff0L
> + // Check the bignum_st definition against the one below and either update the
> + // version check or provide the new definition for this version.
> + #  error Untested OpenSSL version
> +-- 
> +2.39.5
> +
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
