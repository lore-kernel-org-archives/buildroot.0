Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6162FCC068
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F6B41E88;
	Fri,  6 Mar 2026 19:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCKtFPjz8g3X; Fri,  6 Mar 2026 19:53:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7EDE4213B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826816;
	bh=nhtwtyEOaHZLvpq5Ecp0WStaPz21DdEQHNZ6hrUbe/M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qTiymv1RwXPO8D62cnN+lbHOkZW6i2amNd4whp9+ybvJVr8J3AiWkEB6E1/dXk7v/
	 F2R+WUjl80YVe1eOVqgIhmEJumvZKN8mZo93CyVShve5RZTCkj1R55Jjj6c+knvdkJ
	 GKFAhvRQYrWGRywa0fgV4oQUERVf+URgiuJ5npHqqxygqK+QLi5sKJl/XpQ10ffoli
	 A7aCDCA+75DHPT/QQ1bIqjLwEuvaPOgZd2AjYi7r20w7Tk+DEdgxB0oBENtO/cmNAF
	 blIgpcpJmWgV/xoFmoWzU9qjCYEJYeRi0bTFgMFzbbzUBhU2eFIxuKCEgT5JHG2D1u
	 G1jXEDd7IIARQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7EDE4213B;
	Fri,  6 Mar 2026 19:53:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E9F88169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFE464045B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChXSfYLQQQzE for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFDEC40343
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFDEC40343
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFDEC40343
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso3042845e9.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826802; x=1773431602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mCgbiB38OJ/uijfA4p3PYNVdtMP4Iz+GCVTyxaCCjNk=;
 b=wxoEf1cX44NE1HXfuceNPHOJlF3XioDhnqB+cpxhwq37g7Q3vS53oS7a6VmSI2fVCw
 6KsJzkLcKf7fni3raQP1C6UM3I6e1L2ekIMuWcVBao232FaeNanoMWrF3fEioTfxEaAN
 sPuE/Wrr+dR/sp3ixm3w2lZOM/jz58L2AgJr40nqBSR9BiDyJSy+kOQeT2SOp8L6/yGr
 zumml0OpgvykM/dr5nqi3Tjowp7qbOwdmMEEeU+Ryrwya4AshxJ/+VliCcHi7QTc8M0v
 nhBFOrCuI4CmM5EUGOj7j7YqNjkudwfjVr7AnKwKAsljU/cmbsuVXYr8cMktDycoyYoB
 ctuw==
X-Gm-Message-State: AOJu0Yzy5T+b95BImUBPpnJe1EctbVCSJYcvOydSPq0jJJRHL7ZD24T4
 hp3N0DfGydYLTVyHh/kFAdC4sZvCYexbWORUfmVmR6eXN1hZ9/YHpnRNJJHSRkZQcfqUp1o8wcC
 MyOGN
X-Gm-Gg: ATEYQzwS1rB6wF94vIrgq0Q+8iKxvReDEGF1HK0i/nWVcJoxZXsGai73NwhZforr1+T
 Gk1TtRvX1B8H1ZICYfx9InZDqkicjIJPMoivwJpO2UPHA49k+F7K9PgzMb+3Nqm6Q7Lj3Q9O7Qu
 hpMBEXesUHWOwZxl69lHzzbrHFeAWsNmG/IDbVEGTesElpOIB7OFAwYaQHz7oUsuamtgZ75MU7Q
 TeoD9/HXuBu4ng8E8u9sJQF6VFioOOoZ1DHfkXQL4qC+Qfv45p8WybflyVHDyD4rJDk2yDrtmeE
 D1t1mVO8K9U4Q+KdIZDtleYKYnX1KuwvtpOySAUyyz24JBK5zzaj70hK88yzTfWFaJgsHnyd/fV
 LUu+VqCOTnu/Z8ze/G/fdqEbIFiXmILrCSjqzP9Y3OQizMCJbCF3IoR0u2LK8kVDrUmNSEUqW2C
 YvTJo96b9mr28NjtU=
X-Received: by 2002:a05:600c:1e88:b0:47e:e952:86c9 with SMTP id
 5b1f17b1804b1-485268bd528mr66661895e9.0.1772826801737; 
 Fri, 06 Mar 2026 11:53:21 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb277e3sm123075395e9.10.2026.03.06.11.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:21 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:21 +0100
Message-ID: <20260306195321.8283-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303101254.192225-3-thomas.perale@mind.be>
References: <20260303101254.192225-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826802; x=1773431602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mCgbiB38OJ/uijfA4p3PYNVdtMP4Iz+GCVTyxaCCjNk=;
 b=GsjFPmYspGw7UN+X785e1MbzOI0eRMYrWtJhHSpEqwvH2l8R5n5iQtdpChAhkC708Y
 1/omlIIpoRzcECwmAVUBSxyOAv6FUuxoD23Jn8xdIBhvxYjVnuxItrpp6eOcYgWE2loK
 unIM2N6jXxqK/NTTM1DdOCxt+4XQ5UtM9nikmwbbh0nBSIJPkyeMhTPkKN3dLMjjXijn
 rd4qmnymGPGi/HdjXwb4pu2WV1jies3qV8ZKV/yTWXlYfSuKh11UMTnOP4n+VpBY8Dra
 p1Jbhyn2AFdbVd33g0LhXUP89SLvHw5+BZ5vyjm3udfJGNduYCMfit49NB9+oyZjdl3w
 KgNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GsjFPmYs
Subject: Re: [Buildroot] [PATCH 3/4] package/freerdp: add CVE-2025-68118 to
 IGNORE_CVES
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
> Only affects Windows platform. See [1] for more information.
> 
> [1] https://security-tracker.debian.org/tracker/CVE-2025-68118
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/freerdp/freerdp.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 889c6035f3..4017caa277 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -17,6 +17,10 @@ FREERDP_CPE_ID_VENDOR = freerdp
>  # https://security-tracker.debian.org/tracker/CVE-2024-32662
>  FREERDP_IGNORE_CVES += CVE-2024-32662
>  
> +# Windows only
> +# https://security-tracker.debian.org/tracker/CVE-2025-68118
> +FREERDP_IGNORE_CVES += CVE-2025-68118
> +
>  FREERDP_INSTALL_STAGING = YES
>  
>  FREERDP_CONF_OPTS = \
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
