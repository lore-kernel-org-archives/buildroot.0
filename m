Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55492FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1433C4216E;
	Fri,  6 Mar 2026 19:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hGvPACYCfVs; Fri,  6 Mar 2026 19:53:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 249F242168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826820;
	bh=tHviSJB4WcEOdKWQbdXsc2Y8T9RS4QLShFJMimEDVuw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nlJbF6yZRaRh8jgBf41TefoLM9gWD9iIp4ML8V711FP7QD/8qNXp4105sdIU4+spa
	 LuPw9xdn7zLPrAylCPEaFdogoFKH407QYzYxcLU4c/W/JLB7BYPEiOwRA0VaFY8NWr
	 xpYr0hLNvPY6l9TNWRDfPOSqzn7d97pg0JkgIHsUbEkrkYMaZMAOTgagamGxnsDG2E
	 vKNwTnYEHtouDt5tv7TB5rehPn7VL2yuQ80AfCDZNHoGBSv5GFHbkR5wpsJCXWkSmf
	 lOddesbZGsCVCfJrykZWIXGn+bKS97M7ki/+PuEH8ShMcQ1JI0b75um7le0+SoXDPH
	 U03bx+w5tGE8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 249F242168;
	Fri,  6 Mar 2026 19:53:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07C28223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8DB2614A5
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6aIJyrV5uOb5 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC86A614B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC86A614B1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC86A614B1
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4852c9b4158so1483705e9.0
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826807; x=1773431607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AEMCdi91qQlAE7X87lMidQ/kGYOO+3dL7W8HwcV54N0=;
 b=gIgbRZvFxrhnHlGbagSeyjqh/OssWbXWaRMucOpeKp0hB2usW4sfzcup/OzzLTDnWK
 8f8gXRrq1WHHzXJULM71OroNuR0kmSbsk52I1eELlRLCN0AyJ6x0QAut5uOD4XwHQopZ
 dVZd52VzQ1FTg/qE6zHDyna28eDzuqUpAVpm9EOa5cL26/bvLtzdzr9iNsxGVcobxtW7
 FMFmiGtvKtUyC7Ag2u+vJmgQnvABlW0Yrmb5TlHjVLjheH/qgkH0xMm86OSBDcoL3RSg
 WDB2ov7OH+N8EubAoV19mW1lnua4xitxpyTGlNnCxr/15uj5fQo5z5VQSAh6nA8C4vNf
 x5xQ==
X-Gm-Message-State: AOJu0Yw/cw/lm14Drt5Nsw7rETvGAL7HmPgl0WnBNpvBM+g4YeopESnN
 U8U66acUurtJsGgqioU/juQnTHsRT01DmCAmpB1No3GQP46qJmv1M7CBdsmAyYKwnKeWCxlqgqD
 XAHo4
X-Gm-Gg: ATEYQzzvNenQ74oDA/CqznDrrXh3fPlR8kGm9dToNHIxFWuqxdj4eRRfvf4qH75abtk
 XIH0jwahLvk7qdPxp/FL7jeOBLy/SCzNKwnLHztTlpREoi+DWvjSg7JoXkftITDv7W9kjwzeK83
 xJaRJafdieNsyjmU+mHaRckeUvvpvrP5P9DhQo4MuMRYpvMQluCu3h4216/VqvaapYr51QaEBOT
 Mod+rAx9jzqPgxYvTgeXcjq/72OyM3TzS+ZLfwC87wMygNsZBpbzBLjUpYNnaUgJZbPf7CF1zuI
 ZWFvWr900x1Z9kyFSJYCCtJ2oYimgqPR+cVeH76L/Lv7pyMmVNNqoV4Gx7p1y8rHiOnhEDxI6Xe
 qaSI++9zElRd/KY8MshVUDkNUATgC/LHI50TLBLNbxg2MHnnLfCwuFDYg501lyytHPSIwakaU11
 PhowzdE1FxqVwep/M=
X-Received: by 2002:a05:600c:4e04:b0:483:b3d7:2e80 with SMTP id
 5b1f17b1804b1-485269792e8mr52809065e9.33.1772826806850; 
 Fri, 06 Mar 2026 11:53:26 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb27a13sm131829015e9.11.2026.03.06.11.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:26 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:25 +0100
Message-ID: <20260306195325.8484-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303081323.53405-1-thomas.perale@mind.be>
References: <20260303081323.53405-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826807; x=1773431607; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AEMCdi91qQlAE7X87lMidQ/kGYOO+3dL7W8HwcV54N0=;
 b=SaYNLQRmJfPRXd1DvKz/SV0Bb19/1UgSsjL3JxzNXzEUkDkN5WiIg2EhBA/DxCWpmv
 YJuNmaGXqKNnMOuW8QAL2iuEIXnU6Gid4GSUU6ZYNf5ZfCvKUM2qd8SJvmVdhOXfNz/0
 oJiP1iPEW2ZtS+OjToSMibtNgPx5DbqDMVNodCOHvUQASxo8VJv0BC8xMQOxq7uThTl7
 pVLOWHIMVLhjbQD0n/OYdNjg5D7xd++AeZOM/C+AMJ4eCkX7HYCKFUHNdCDiXAsTJ2xG
 oYA1CCwjVvkNXqRe1Jm1Dv5gGHFZsF9PoJrHTkoJGNZFuoNxzguSduZz09x0ZbAFQWod
 LHWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SaYNLQRm
Subject: Re: [Buildroot] [PATCH 1/4] package/graphicsmagick: add
 CVE-2008-6621 to IGNORE_CVES
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
> This vulnerability match on every version of graphicsmagick. Since it's
> really old it's unlikely it will be updated and is thus added to
> IGNORE_CVES. See [1].
> 
> [1] https://nvd.nist.gov//vuln/detail/CVE-2008-6621
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/graphicsmagick/graphicsmagick.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
> index 4b9f3bd23c..40107b3aae 100644
> --- a/package/graphicsmagick/graphicsmagick.mk
> +++ b/package/graphicsmagick/graphicsmagick.mk
> @@ -11,6 +11,10 @@ GRAPHICSMAGICK_LICENSE = MIT
>  GRAPHICSMAGICK_LICENSE_FILES = Copyright.txt
>  GRAPHICSMAGICK_CPE_ID_VENDOR = graphicsmagick
>  
> +# Wrong NVD annotations
> +# Fixed in version 1.2.3
> +GRAPHICSMAGICK_IGNORE_CVES += CVE-2008-6621
> +
>  # 0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
>  GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
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
