Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157C8EF99D4
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8AEB61386;
	Fri, 13 Feb 2026 19:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-UI8Wv2HINg; Fri, 13 Feb 2026 19:37:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC328615BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011444;
	bh=3/Dt0H0H/QPlllSpDX77BHhtHnAyOO8IQXKk77vSvSs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KteT7bL+lUxubL8kgz6fhNwR43Bk8wfz9OE+7VkT6CtJiLEl6MICujw8kZfpmOv/6
	 tZmZW7c5/CXaDMF/KIcOZbltn/lj6qdcLvmTLky3jnC8HyPp2DuylKDDK/dvZt3JWl
	 2BEX6Lbg01pSXqpx+rOcskCZF0pUNDPyB2ZZm0/EbxPvtpiMq6tmtAwwzqpZH4oXvg
	 39VQ/fGgU9OodoGAiPfgc9fyIzMXH1IIAITghddm42N87f3wKAdeabs8erzoVIta8H
	 c7LlCxxJTlY2bBT+vJrsGBUPs3WfJU578eQuFVP4obha8e/EzGDOeoacXpY8rPIk11
	 9hB9NPzPvkTqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC328615BC;
	Fri, 13 Feb 2026 19:37:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFEE669
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A701A61442
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZZR1YUE-jo7 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17FEF6147E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17FEF6147E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17FEF6147E
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4837584120eso6429825e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011398; x=1771616198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jJqZkszkTtugl5K1QBCkNxbK8wt1dchg5v0tkGhLxU4=;
 b=UUa8Xfr+VQ3hnk0yJmngm5jPp7AD7fRutqrxthwIs1ke+TknGbknTAencQ7xw4iEd9
 BuWUHWELx5TRU2UZarrJLUv+gRDm0oFiaS3cD4F2hmjIU9PMqb9L99DeDUjcm34rNnsM
 UrFRenUsqcyOnOrVpK8Wr4eiS0+peTNdtxBCURV+iNhRa/FHXRbyGquQaJu/xMkTiE+m
 kZgTP8viuxH/ZDxSNDS2fHwUF2X7btav7Z1qiMfOcD+ILVEro7HUDq+5Nu/wZtW3R6lZ
 Q9W92ZCwR1Az/qJLB8lW31HjarGg9TEAnAYSYGZtGVD2NQbTx8WaA1Ub2kPnOALPczDy
 Rknw==
X-Gm-Message-State: AOJu0YwMVEnXGkZAYSIojDtrlYBH6XVA2WtLAaJ5dfhFFrGwLvimyXqg
 gWL1rDOdXH5tKt5ToWfmgqU0D3R2AH7rpRiOMNwTFlGtgXa6N5HXKZRjgvRLFZw2mt0=
X-Gm-Gg: AZuq6aL08DAsNmZIQvcddFWflg9A/QCTncxprUJuKb7SwFYrBE2UE7LjLgkrTlNrIxp
 EIDL4RTnL5HAuw6Z9Q4xpZd+aIHQbWE1vQJzxuFHmsJeyVH3QqK4YFqmDtKQWBkhXGBYOGoX5xR
 pPCAot+k9Eey/GDEij3jeXi4pHRHfy8hiPUI4YSWHQN59tW1p1fiIYU/K1bH9VpsIHjzWL18Rq6
 /7YVCk+Ig558B8k+0prOdOEV7IJtvBY5uI984/8EjeFgDefLQVhfDxNxCHrmf57C2a8Xujq76cr
 /+LFSQKHlaFiyDmZb2VSeDAPJcjzhyXi2mHz+CcE1T9pasaKTLqj6VLnEA/zSKYF7x4vUwWABA9
 5pQGxRezjh7xMSTzB2SmYsI81HEgLKSoIq3BNYRDVKvnDrgtox8ViqpP2Eh9oPIG/CKPeIfnFMb
 ae4nxQF/uHCyY9CeE=
X-Received: by 2002:a05:600c:4689:b0:47f:1a8d:4f30 with SMTP id
 5b1f17b1804b1-48379be5cacmr5096935e9.26.1771011397892; 
 Fri, 13 Feb 2026 11:36:37 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dcfaae1sm170072525e9.10.2026.02.13.11.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:37 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:37 +0100
Message-ID: <20260213193637.37676-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250727192537.1164560-1-thomas.perale@mind.be>
References: <20250727192537.1164560-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011398; x=1771616198; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJqZkszkTtugl5K1QBCkNxbK8wt1dchg5v0tkGhLxU4=;
 b=OTMF6XIOOSA1RYtVl3tXNwb5eSUvDSk+pm0ru7xxU69eQ2LCwakv0lCixkCYgSVcqm
 Wn3JuKBaIeXmgFqWtW7uz2YD4pIINVSahqH5GP7mOrcxT4v/pV75CkxIgj4Bc42XrVee
 MHQtLnAfd31hkgsqgW7sq4QkR3GWQIxcq+tc4DrgluwHxOunVclAxjb/BSxTBSoCVFqo
 SvQ6bIUBH7iT/1Lca6nsWs0W6EVX0PeHJh8iBZrjLZe8ldQHPsmUeb1oiIsHgQWnf9ww
 8fm0WADLuVsW3ssvacLrg6XXd4402RcuKgfdHkDjYTv0InzBHZoa0ucvBPSZHzbmmFS1
 vngg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OTMF6XIO
Subject: Re: [Buildroot] [PATCH] package/aardvark-dns: add CPE identifier
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
> The cpe:2.3:a:containers:aardvark-dns:*:*:*:*:*:*:*:* is
> valid for this package.
> 
> See https://nvd.nist.gov/products/cpe/detail/5F79D5CD-D716-4190-BE08-31EB5EEB233F
> 
> The CPE version strip the 'v' prefix from the version.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.11.x. Thanks

> ---
>  package/aardvark-dns/aardvark-dns.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
> index 1d2e06fd03..1394218fbc 100644
> --- a/package/aardvark-dns/aardvark-dns.mk
> +++ b/package/aardvark-dns/aardvark-dns.mk
> @@ -11,5 +11,7 @@ AARDVARK_DNS_SITE_METHOD = git
>  
>  AARDVARK_DNS_LICENSE = Apache-2.0
>  AARDVARK_DNS_LICENSE_FILES = LICENSE
> +AARDVARK_DNS_CPE_ID_VENDOR = containers
> +AARDVARK_DNS_CPE_ID_VERSION = $(subst v,,$(AARDVARK_DNS_VERSION))
>  
>  $(eval $(cargo-package))
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
