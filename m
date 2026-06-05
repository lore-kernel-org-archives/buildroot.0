Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5597CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F55D41F28;
	Fri,  5 Jun 2026 12:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjsIB5H6yY8j; Fri,  5 Jun 2026 12:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2168841F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663820;
	bh=jlzRMRvfobeu3EyxQhZ2DeaE8sy4R6itpX0E8CcACLc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A3rQQEycDs4iUm18TaXghMepUXe9TntU2d0YHkaRxuO6Sls7OG8iDJUoz0QaFwI8S
	 EiVBJptLu4fhk9+oVgjxoz+H+qb/so4ZGYJbWL3vZ2G+EE4H4TdimHG+M9vWuY2/fn
	 fgzVgkon1sgwyEs4aZ5it6b2HAzqzAn62/OwQNNdhKeYHI+erHd+5P3UykyQbtgjFW
	 zLOCoQA/4TpMNR3LUecruwqkRzXdMvvMfJbz/Y1aVmjdQcX8mww8Ck3sLf5LVeCi/V
	 SfwQ55G87WkrLV00tHmFtzmBdaOwBqttHevr+AvgM0txkslOQoFfoWuh2NcNrJrywb
	 uL/Lr9leqMjpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2168841F1B;
	Fri,  5 Jun 2026 12:50:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 948843B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8561141F08
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmZdoExjwUhW for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A56F41EFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A56F41EFE
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A56F41EFE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490b2b037d2so16752585e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663814; x=1781268614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ICWCU+FOCDasO8POxzIOtxwtVLro4OYGd+eWQBUQ3lE=;
 b=Sokj8xmvX4h91ONiu2cebA0DjbE7mw/DdqX47VWV9hhTdev7YlVV4Ee662dArl5xqc
 gqFEtTRpFuRCmEjTDogGea4mzHnn1t5MNNuV+a4I+mO/dUQ67TK4NX4SnnmntmMVyqta
 Uwk2AJA+nAACICxMcXVSVT0w0NjGqfwA2rpdAtoXLWDR4DSKbI0xC4+cupXO611lgLnp
 ipHt8YXC5VDkPYkXh/21eFzfGQbrhtYtIBVc3odUvrVZ/yfFRXFAobN2P0j0dNPvNlW3
 NNMefytLLTIhd7Z7TAbCaBMHk8DjB70/PrSSwycmMCGZFx/F1KG0k/xUZUl9DY0rz31P
 nGJw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9KCrDvZaXsONva0SZNB3svWqSShBsyoTWsvesEDoj6L09leDDvNUPERvDVcHJMxRV0nzxDOWbqhIM=@buildroot.org
X-Gm-Message-State: AOJu0YxeHFaGk7+7ysR2JvWA6TDo0uYgsuw/qVGLRlnzpEx5XW5RTkfD
 ABTzNvKbKNyL/nm9DtBe+FFGtFnIvJk4M77hyvY/5V5MLasKbxAwoD8qgxhd0Dnx0ZHFIrhLxRn
 QfUpu
X-Gm-Gg: Acq92OEyeBHyUd3z4Vtf7t7VUn4oYL02+L22mbHoJehiWBMm7s/FyQjhz/4EaHI2wak
 JLf6ynlPXpsVKprHdF9jvR1u0LXZdvAOPalagU+KFlElstIYMmpUdfMaU0KegfHOWmyfh18PQpm
 ks5dO01LdHSEliJVJNQ7RLwYSpHi9IoQiNn35UCfLUxYazKPu4XwWsBFIc1EwtSBM08n1JFDoVp
 wUltX1YLkgfn6d9jSmAY0T0ysGu40C1aCrQJTh9mhW3BryNNumYDe2xWWOvbUjv8amszAHPdK+y
 KyKmN1ApLL9T5u/v2y9NPyUQ4EW8/PIQTxEkKwHF7TB363u1S0kSRVxp1I9nB8vpxCr+UIGyXkJ
 R83j9em15AhneMg4fvSAnTaDIOLKA6U1kIhp777FtcHslbY7WFoZIflJByoPpS4/9Aub5O6F3+1
 TPVJefc6P1QATe0RB8dTyk+aJm7Q==
X-Received: by 2002:a05:600c:8b6a:b0:490:bb19:b110 with SMTP id
 5b1f17b1804b1-490c26216ddmr50689915e9.27.1780663814355; 
 Fri, 05 Jun 2026 05:50:14 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344541sm23682449f8f.22.2026.06.05.05.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:14 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:13 +0200
Message-ID: <20260605125013.272766-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260324-qt5-5-15-18-2025-02-x-v1-4-9d25b343a6e3@cherry.de>
References: <20260324-qt5-5-15-18-2025-02-x-v1-4-9d25b343a6e3@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663814; x=1781268614; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ICWCU+FOCDasO8POxzIOtxwtVLro4OYGd+eWQBUQ3lE=;
 b=W1CfEEuhb6+Y3o6BXVrFdzuCSMHo2NyIS6RXjR7A/V5cAEv2zOklZg76NY6Ddbh58P
 oaXSmvpVZCd2TxCiMEu/K6mxHguzVmWTU9nH+aNZS04vavkX4u9WI7jTFC12s9Vf+Rkr
 K9KS1ATbMr1oJbO/ao+7hwneb8NldbI3NtAIvwD0BarXLgKAd4xBcvlQDreyNV75erqG
 Rpj9asYinK2l44KwSHFIIJQ7TO7irnnZtDlW/2+nTM+P1wd61u93+zdZI26qwVMx9IWG
 znOQS/nS9/V82/+HNNX47iJEv3d57MHTwWBZcCVHmw04FPzh0OJrRbEvruVXzKSI7Wr1
 riEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W1CfEEuh
Subject: Re: [Buildroot] [PATCH 2025.02.x 4/5]
 package/qt5/qt5webengine-chromium: fix zlib license hash
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
> Commit c53455ea4ffa ("package/qt5/qt5webengine-chromium: bump version
> after qtwebengine bump") bumped qt5webengine-chromium but forgot to
> update the licenses.
> 
> The diff of the license is reported by
> git diff 0ad2814370799a2161057d92231fe3ee00e2fe98..18c9261dc5b8aa57a0bdd5b62ce6f648cca1ef5e -- chromium/third_party/zlib/LICENSE
> as the following:
> 
>   diff --git a/chromium/third_party/zlib/LICENSE b/chromium/third_party/zlib/LICENSE
>   index 9f056865b57..8aca25d8c7a 100644
>   --- a/chromium/third_party/zlib/LICENSE
>   +++ b/chromium/third_party/zlib/LICENSE
>   @@ -1,6 +1,6 @@
>   -version 1.2.11, January 15th, 2017
>   +version 1.2.12, March 27th, 2022
> 
>   -Copyright (C) 1995-2017 Jean-loup Gailly and Mark Adler
>   +Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler
> 
>    This software is provided 'as-is', without any express or implied
>    warranty.  In no event will the authors be held liable for any damages
> 
> so it doesn't change its actual license, let's simply fix the sha256 to
> the new value.
> 
> Fixes: c53455ea4ffa ("package/qt5/qt5webengine-chromium: bump version after qtwebengine bump")
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
> index 270da153c6..8026c3f697 100644
> --- a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
> +++ b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
> @@ -1231,7 +1231,7 @@ sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  chromi
>  sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  chromium/third_party/xcbproto/src/COPYING
>  sha256  b244f73c3d21edaf44ec253b9a7c389ec43313c417f52f8b71914b0c40d87325  chromium/third_party/xdg-utils/LICENSE
>  sha256  1cf71700f3403ca26f002e2dc1d1861dcb3d2af9bb9d98d529a903be9d7f06fc  chromium/third_party/xstream/LICENSE
> -sha256  942755efa272dbfbcd7afea7a38556801e36c16dcad002d572378367094a2593  chromium/third_party/zlib/LICENSE
> +sha256  e1cfcc55c325b3f78cf55df9664abaa066e2271dffe8213347d9fccdfbac8f2c  chromium/third_party/zlib/LICENSE
>  sha256  1744e977d24e20e77b1e97d745fe43779430a1b84247b6c0e89d16e116e7ff92  chromium/third_party/zxcvbn-cpp/LICENSE.txt
>  sha256  a4c8c5abf82b36c22f8c9f8bd6229584f32eb9f7a2429dd9664dda43e63e9fda  chromium/tools/grit/third_party/six/LICENSE
>  sha256  63f0c0039b477857e54708d9501ed91b7a46e828ac3c623bedbc318129ceb174  chromium/tools/origin_trials/third_party/ed25519/LICENSE
> 
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
