Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A98C5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 953FE41024;
	Fri, 31 Jul 2026 12:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDbEdxwvcMia; Fri, 31 Jul 2026 12:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1349D41005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499543;
	bh=5VoXepkhwO2tuVnWblSKvzia4Y33jsh7UgFMFBhtGCM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m7TcuDr1Xdynwu08CuWppiHHuJgvxGT7OTyJtlf00aTU1OfSbRlOm+PIOmhpS9OkZ
	 8jcKgUBxBd12f/VqYbQAVbnRzwVqrr8f48zPmZjSlt56VKJmRe1q+N0CFsVjjenHi/
	 FWOLrs/pcIEOHRrIPEueooUIPj2O6Kh9acv9S76UC/hxmcVqEYBl/g0XA7oGeyYfKA
	 FLJYl63hgDYNLMg/N0Hl+6ckKnzDao6R/2NypIE2GFUTcE0EBr+cR8Pc3JIiWkjrXL
	 ZDegnKMj1RgZXNe7z5R76SCmyZcNxHugomcZIRKApjXzjAvnVYtylJSQrjX3kz0ePF
	 F4L5OCeiqsXbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1349D41005;
	Fri, 31 Jul 2026 12:05:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5634E27B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3991B60B42
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnUtbb53g-35 for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42B7860B55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B7860B55
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42B7860B55
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:39 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-47f633e6058so915817f8f.0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499537; x=1786104337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VcH0CiNpyS4K2pg4gIq4f3EW2XFaBGCNIR9Cjqq6X9I=;
 b=tSxA+QFTDgtAdtRza+dRHOUe7wtKiFpbMV0ioFDDMsp2T8dd1exix37SPMQowRQcy3
 5ovk6MI//j6cuSyBgq/2WJrRASlDK3hAR2ThQgW2E2WEkr0tpsopO0ZzlpNP3Ew3IJWR
 0sUBr1pxqyk4MuwEObq/5H4Ops0+7vgEDo/BV6eg6aTcINo5Fbq3rhoH1bZI3eSnal5H
 Y6yfn/uGNH4++8RyVKySPtzc3wzW1FN8pwqmbfo5/Yn7AKLqXs0TiENY8UkR4Z0C2mOx
 X25tc9EpjLNmQJfYv9UxqR1aeAl2234S880jO0aHCrMuMGgvDRzWYlkC2zVoN6ZOfj6+
 70ag==
X-Forwarded-Encrypted: i=1;
 AHgh+RpoWlhwVaEAk2LSAzfmBSfBN/v6NGYA4THCNqcuUma/Ld20JmX/WlYNdRhy5UUKqIjMd8YwtMfcQvI=@buildroot.org
X-Gm-Message-State: AOJu0YxK4G01W9KqdSbCIgDmprCKYPK9vI2r3pyTJfElVAXBptg7YXgo
 FFqu/QUso9/DVOiiXb5uvKXgsykEezUrPTdcXTjEWbN2ps2AZbgv0cZy8vjc2Wp1UTA=
X-Gm-Gg: AR+sD12p1B8Jm+IzmLVpjZ314O3m0myVK3jiwA005cakcDaR5L5OQr6XN2HbK7Pp6Uw
 bkFWUFbEU628erkIooGHrxk8zAinZT+4Of9tkejLRgbqCGkwFBVI8ymU/9+5w0aXCfHlwpPCGme
 sOr6oKnmAUs1C6OprIe0tVvLcsAR/L6hXmS+T2rGA/5NzBIqCUqTGPagwa59WTlfutOidp2yWqc
 dfspfb3d18CtPeF+KAgyoFD2T6VeBrFVAJ59Bmd7c5ilaro2w70c3IeDvckuI3s4VJVDlMmS49j
 SjpWtqddWcb1q/EoG1tcA8Eqwp9jwJXrb5JrCZWDL/PjZ9dCe6d5WF0BYSM59yuIXywvmFS0wZX
 pgjGLEbW8xJS/2Deb11Bftmj9VOfGn91xNcJZOVKYY0j0NcZ5RNo6n6dxOUqk8ZbkKrqvEEVcWF
 Nslni+ivfTLZeVKUyFz4MQ0/5uigclkbIkCiAdGGJdGP9LEXsJ03/+ZDvWSKwZNP1Ik8ktoC9Q4
 PTpYwuRLzTDYuiGiWZAenS2bA==
X-Received: by 2002:a05:6000:29c2:b0:47f:bef8:d559 with SMTP id
 ffacd0b85a97d-47fd2b55dfbmr2758927f8f.45.1785499537107; 
 Fri, 31 Jul 2026 05:05:37 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e2abbsm4093523f8f.9.2026.07.31.05.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:36 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:35 +0200
Message-ID: <20260731120535.3796-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722153224.624762-2-fiona.klute@gmx.de>
References: <20260722153224.624762-2-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499537; x=1786104337; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VcH0CiNpyS4K2pg4gIq4f3EW2XFaBGCNIR9Cjqq6X9I=;
 b=hg3yOtG+6t3HUzXciiP6JPcLpy46aSqs6SBPld8AkPbSQPapNZcmbDtTtAYmiWVmND
 MtFf4aR8gep8Ab+RoVghCvBFBT4ihrj7R/r8PmHzQRORley1HYHSXH4WKSFuK5kcisHh
 KEYZWHZVv6ZkIGB0vYVrGzcrUJBveqNg1hcHtQiJ7vIwHLm4oZtKk1GlAcsNa0P3xBJ/
 fHQCcwPys3ha44uniSJUTGBVi1CHy8BTzXv4xUtFdevVmEixsp+GWNkfpPtSgylRrOcO
 4vtHlCEMmuKVXy9RT8y4+oYeDwnsJ2oqi3zYP0rIr140tYUpVQAJYPjAwQzJvFEakhPB
 td1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hg3yOtG+
Subject: Re: [Buildroot] [PATCH 2/7] package/environment-setup: add license
 info
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
> The package is part of Buildroot and thus under GPL-2.0-or-later
> unless stated otherwise, as described in COPYING.
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/environment-setup/environment-setup.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
> index 069ee25f9f..276d5caca8 100644
> --- a/package/environment-setup/environment-setup.mk
> +++ b/package/environment-setup/environment-setup.mk
> @@ -4,6 +4,8 @@
>  #
>  ################################################################################
>  
> +ENVIRONMENT_SETUP_LICENSE = GPL-2.0-or-later
> +
>  ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
>  
>  define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
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
