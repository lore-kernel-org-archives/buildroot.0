Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8569EE9A058
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E1AF61233;
	Thu, 19 Feb 2026 17:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaOnmMgfg9qE; Thu, 19 Feb 2026 17:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F089561236
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522014;
	bh=v/OWtNeqVAAew2MI6YDnkknY4zmOk6YQdHSTvRWbz3g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Oj15NiySu/O/vEqbCJ9AmKfKqeQa3XtprzK3aL2gaSuVfnsmttCTD86y7mGCMfVMN
	 e+PPoEIaFTDf0s47pYUq1S1J73f2+niNqEGqfMqGOgJvqOk6cVoSTL3txkAdfF5lFW
	 3zKvceYxBKWVpIBb0N3iV4+8+SVKbgOQA05KQjgCGVQE4DdIXNf8R16HQRNObzwSP9
	 OiQWKNI/kpsExP48SODz9jY5gXL38JMEbgUDHopNP5XF7SNkKEPg8790sld7dvfRxZ
	 IFb9vhbcGH5zLS1muM+EqWGtCUnt2SPzkb4TaGVoxIGC9b05MtVIfuu2eXBbELCta9
	 gutzXdAhy6nCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F089561236;
	Thu, 19 Feb 2026 17:26:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D744D1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB8204054B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3t0bFTJF4aG for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C24E2406CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C24E2406CE
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C24E2406CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso21673175e9.0
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771522001; x=1772126801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P1WfLVlaFya6nSj2v3vEsfWKh6D95dOmZflmr1HzTSM=;
 b=gaFQngmohMNMxwA0wfJwJIsdDMsGfZdc07eJtst3MWgs7IVYfqI7Ww4eVLpWr96BFr
 MgHyE0vIszPufutWf4TtEQnHfY7FN0QE7/bNT1aE/AnRwqOvhGKV+5BC3j13gGmxYscG
 w3vlEGDenT8fmqVpCcu+tIo8djCMOQMyXtcG5Qx8XwvtEU8BqXd7VZLDVBACRcUbZ3mJ
 hAQopryVI5HLGp/51qPw7YOVgJKBsBSyNYGXUVUQqNuDuK3DVXYpmDEGHNTfTFgqP5V2
 g8Hg3lJbLClyXJiAe8ZNlN6S9Qlv7xcBrDGsFkVBBLT3h9Q85822swthZ89AzHihcUQy
 os6Q==
X-Gm-Message-State: AOJu0YwUP2ckxjsjuyE4hqTWc4lGNatGXFSaU+QtK/qKsiSyVFt6fDId
 N9U0n9qkBMAPUrQsTMA9LhhLIVpBdz/nUmnXu5kj2QKz74tRG8RdvaRIkcgv+irAf/XW7LOiUEb
 ISkIU
X-Gm-Gg: AZuq6aJXLEOkstoQ3ycU5BoeHcWmEQC82PVYVRSJuSig+f+hpYdDMbFz+ER5Meyv5fB
 7yGOAQCA0Z/zUL6LaP4DmE1BmcySXRKGjf6WvyzexTffR3MTrJw8OktOs4U30wzEbWO7ANZe/Z4
 LVZxWqS/z6zmXzPrADWYAutK/UxYvvee3BfUA8Mwhwp1SyJ5HFk3ZWwUKqf+3zm+1nUTdmm0A2F
 eOUnB3jUHSRBQajNIAe9ee05y1UjRFztZ338GY5vOPFNTxSKnwfAm/5tK06MXztFIh13jSFYWUo
 gcJRb2aphu5vZzTzsB8IQUhDYkzAp3hyE40MgBHUaj9JjerC9XzQXuAGJzqEQKDGCCpC7xsNeKe
 48tPKAtQjo4QTxq4YV1bD4UzZyWCLaJPGoSpItAfDanAYu5tn7n/z2MCihneDDy79gtmDaEQkqO
 1lr9/HywqG2onoUOk=
X-Received: by 2002:a05:600c:6814:b0:47e:e59c:67c5 with SMTP id
 5b1f17b1804b1-4839ff90c42mr49135605e9.8.1771522000703; 
 Thu, 19 Feb 2026 09:26:40 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31bc068sm13418915e9.4.2026.02.19.09.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:40 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:40 +0100
Message-ID: <20260219172640.341273-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213143500.528726-2-thomas.perale@mind.be>
References: <20260213143500.528726-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771522001; x=1772126801; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P1WfLVlaFya6nSj2v3vEsfWKh6D95dOmZflmr1HzTSM=;
 b=WQetbi+u7GIeMQmFjIwlbV8WVG5nodDdCSlbFcYgE8uTMOFwqb0sssOavBgqHVfQmL
 2MSnrd63FC1CPasqMaMMwrzb6ictYcMGfNODL9XyUS4kM/wBRB5DN3nhaXDRhUFVm8jx
 vW91Ohk4XfBlZRQLx3jP1/6wZodaNZfeviG9ZKCGqZD3AUJc8MbMYWEmbQR7mkziwdFZ
 iFb7UTfDqOCBvzdl0wrrAXnSuEMDUQwy51PKdXrH59+lUk9KCnmpxZfLTSJDYXmjqMFv
 pfmL727/7+f41A6gPxBkWNijtaxnCL8iKp9U73VPMiEuts0fasEYRkAkVIze48kXKiyI
 FRvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WQetbi+u
Subject: Re: [Buildroot] [PATCH 2/3] package/python-jinja2: update CPE
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
> The `pocoo:jinja2` CPE introduced in commit [1] is not deprecated but is
> no longer used. All the security issue on the Github Advisory reference
> CVE with the `palletsprojects:jinja` CPE instead (see [2]).
> 
> This commit updates the CPE accordingly.
> 
> [1] 165f60a092 package/python-jinja2: add CPE variables
> [2] https://github.com/pallets/jinja/security/advisories/GHSA-cpwx-vrp4-4pq7
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/python-jinja2/python-jinja2.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
> index 74360ec258..a52fa77275 100644
> --- a/package/python-jinja2/python-jinja2.mk
> +++ b/package/python-jinja2/python-jinja2.mk
> @@ -10,8 +10,8 @@ PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/df/bf/f7da0350254c0
>  PYTHON_JINJA2_SETUP_TYPE = flit
>  PYTHON_JINJA2_LICENSE = BSD-3-Clause
>  PYTHON_JINJA2_LICENSE_FILES = LICENSE.txt
> -PYTHON_JINJA2_CPE_ID_VENDOR = pocoo
> -PYTHON_JINJA2_CPE_ID_PRODUCT = jinja2
> +PYTHON_JINJA2_CPE_ID_VENDOR = palletsprojects
> +PYTHON_JINJA2_CPE_ID_PRODUCT = jinja
>  
>  # In host/target build, setup.py tries to download markupsafe if it is not installed
>  PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
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
