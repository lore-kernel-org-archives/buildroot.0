Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C188EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E033340BEC;
	Fri, 13 Feb 2026 19:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOgqRj-jIoiY; Fri, 13 Feb 2026 19:41:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B7640921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011683;
	bh=BP06bIFfrrZuQ2VlQG5bZFDyalAFArysasdwQOY4LLo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VPGx8s7KABTbON2P7e7r8pqZcpik/qEKpHwd/TjJUeOSHMCBiXtkCn3kQX8z02FXI
	 264/4Hr0rr9vGBk8vPoVUhvtmCkWdB3cd+UerRxp/vlnCt1deHdjurIJVQspHxVpWw
	 DrJUgHvZulnxB0+qCm1vu0Xv4/PHcaqSKwFcO6OTyH6biTUTx2vMCgLU3y6KXs+VK9
	 yCYXpb5SsetS4Kr/SvCV/wWjVpuCVlrYMxT1VeEeJ+Ea/83rJqOcBaoOGWbttQ+D3N
	 /KweXijTQLHScb15QzWuC1ptXmrAEtGnAyaY2hjf/3wsT9vKjyla0oQHV1eLsa3wCf
	 I0ISHbhvQJ9vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B7640921;
	Fri, 13 Feb 2026 19:41:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 455A069
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3F2040055
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s71A-KyK1-YS for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F6BD40272
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F6BD40272
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F6BD40272
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-436e8758b91so1002433f8f.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:41:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011674; x=1771616474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UPsEgbIUBniRSPN5D/iepharzFVHobVMgVSSXr7HQ60=;
 b=A4b19RkzCjQI02cXY0Y2vYihJTBcwjf6NZBB1fVi55JmM03zc2sCvtzd5phPyTJk1v
 H+w/BM6Ua/yMeGdL0/82qsKsITNIRGoFi2xZU5rfSaX+sAsKNE2Fkckr0aGq3DiFBh7H
 mbcT64SQpC7M2KnvwD4trdbWQAnfmKvvIr5M4Vwx2DaD8DIPTp2A2gb58YLrT75QmG/k
 ymmNiOwFnmo5GSaoaSUpO9JmuNO6zWcDmo7iWYZwwvy9kfwVY3iGplwza3dB9ns6PSs2
 +91TxCIUiZDfdhlXOfvwd2WwgOrx0CdCHGSXnUj06ZaRBdKZ95wJL72NVs+4Po5YYcs1
 tk6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXRwvJXkQsHOvO6fiNSMRUCSzSFx1hnlwMky7WoBQlFg03883O2TJZYCSnbQGxtrJKRvpN2iEHnLU=@buildroot.org
X-Gm-Message-State: AOJu0YzzZpzGDYbv7DgR0CqhQVIibh7xiflOhwtpSbazBOVIMXpxeLSI
 vxsPewZPzy1TV86HYDktYDgDDag1+pzmgx17xO4sJMmu6MY8i2G4sCB4ogrHh9MfCYBF0DQUPDd
 tH4Pj3Gs=
X-Gm-Gg: AZuq6aIDckJwoMUqXo33fCGkflg5hfeP/yTciaUqSzWNMzkscu5cVuYZ+COHrI2Ocrb
 9tjsv7prAxWgA32w9G2bHag37pXh+8KCLTfd0xxRsrSaDk1X73177g+kyH7c28Wn4poB7x8doiV
 JvaibVB5zqW1h8oYgc71FDHuARRjKwSMc293ik6cLgbgg7mai4o6EekKxW1EdWkv9fgyIldWstc
 lPFKYfzO0VyXiW+lgWzY/8R9k8zScskGsT+s4Ebgw5raP+KEmR90bvzWHbbPMqWIgiITTpSy/os
 qLWX+j3EVb3O5hknumeXOSZ90OlthZ7UU86dyuZCq5WqABeaSxdIJe38Vb/FHpmX8RK14P9tuYN
 b6ERDp4ak34ah1XUu1CQdv/4r8SugMYr04EH48Y92ydJizS/jeiboDf+ivy+KfxNAq3PRN1hRS7
 1EvHxeorc12ik8ICU=
X-Received: by 2002:a5d:5f47:0:b0:436:3475:473f with SMTP id
 ffacd0b85a97d-4379db8cd9cmr1136531f8f.36.1771011674474; 
 Fri, 13 Feb 2026 11:41:14 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5b07fsm7363090f8f.2.2026.02.13.11.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:41:14 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:41:13 +0100
Message-ID: <20260213194113.48662-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204135639.2603782-1-peter@korsgaard.com>
References: <20260204135639.2603782-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011674; x=1771616474; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UPsEgbIUBniRSPN5D/iepharzFVHobVMgVSSXr7HQ60=;
 b=F8xM+/ANAE11llGtfG1dRDLp3OuZEOJmO55VEJGIjue1df2f607MvUtEnlHNFF4OCb
 5dU95SgeyAJYtWYOXqiQPD5CU6lrkW80plECvZQpXpmd7Os4ch/cS3Fy+N2L7yHh94AX
 B45lfDMe00IactsjDX94dnQMu5KTA1/5f1X7y4H+G4NuAWTywXE1qhu1jgXhAvwr/NGH
 hW2FQff1tnmDKx+S4ZEcbyGSS4ZLwc6sCPStDa4KRJP1bqGn4j/RshRitUDxcXtU0A7J
 VSKUQEwwtxFGUyqd3DheqNpxnT002Mya5+8me/Sj5fqCrpvj4T7dlsvn1OoWl0Ss9UcV
 5dCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F8xM+/AN
Subject: Re: [Buildroot] [PATCH 1/2] package/shadow: default to
 BR2_TARGET_GENERIC_PASSWD_ algo
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
> Make shadow follow the the BR2_TARGET_GENERIC_PASSWD_* system configuration
> option when changing password rather than DES.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/issues/134
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/shadow/shadow.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
> index 2ba7a0e03e..cf05fc1bdc 100644
> --- a/package/shadow/shadow.mk
> +++ b/package/shadow/shadow.mk
> @@ -140,4 +140,19 @@ define SHADOW_PERMISSIONS
>  	$(SHADOW_SUBORDINATE_IDS_PERMISSIONS)
>  endef
>  
> +ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA256),y)
> +SHADOW_ENCRYPT_METHOD = SHA256
> +else ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA512),y)
> +SHADOW_ENCRYPT_METHOD = SHA512
> +endif
> +
> +ifneq ($(SHADOW_ENCRYPT_METHOD),)
> +define SHADOW_SET_ENCRYPT_METHOD
> +	$(SED) 's/^[#]\?ENCRYPT_METHOD .*/ENCRYPT_METHOD $(SHADOW_ENCRYPT_METHOD)/' \
> +		$(TARGET_DIR)/etc/login.defs
> +endef
> +
> +SHADOW_POST_INSTALL_TARGET_HOOKS += SHADOW_SET_ENCRYPT_METHOD
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
