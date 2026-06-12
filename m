Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E962CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AF6F60F2E;
	Fri, 12 Jun 2026 11:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txkiqx_yTEXO; Fri, 12 Jun 2026 11:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A57BC60FBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264235;
	bh=koQmsZEkjADvtEQUIlhXbqRfrbQ5wmKLTLWa0Xnrde8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k4wgLgDfoJzW4exnLGkQQ6InwJe2gLOV1vyANDIYb41va9VLjk7SNp46XBNlJBaFG
	 MG1JoDTDLJjUYLf6kYrpp6khAapGDhShjshFoxotrVwmaa4k3G3v52Yz8JwCpm+3Y4
	 fl1LIzqKt7nlTkP7H2iVE78VOjuYkNrvKgND8Hnzy91GS+mn1qtVzL8StJVbErtQK4
	 kQabnFqUPp1If6h3HgIsEyaP23SH76JCb19JaSaZzhzydDc/xGbNPXpyLTCQSiUfX/
	 06N25hclXFCPOk10KeDLaaHHgos918l1S7+zOraSFiirgkr9TGCrdwV82RoddvtoPZ
	 lKndDopS6xUOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A57BC60FBC;
	Fri, 12 Jun 2026 11:37:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C094321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E1D383300
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hUURoheUic7 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32D71832FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32D71832FF
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32D71832FF
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45fd461e4a5so743075f8f.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264228; x=1781869028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1j5ZaiQfyk5v0IQZbvzRYD4o1qs/rHspBS86pSgjvSg=;
 b=LDITi7MMgvEOJA+5WCKUzXv8lkVNAIlEYT/pj2hwEWnoUGOybmfae4hcIbs6/GfVdg
 SDm3x5ssdlm86auXIaIz6+bVQv6R3rpMI4rvs/Ag8L/7I0/GcHszmpYv6ARAW+bKKUBR
 HEIw+05zd5+nYGcWJKg4DByXwl/SkZgPyOiVt7esUxzNDa+1Rln5Lwgcngn5QCkuAzaY
 xWzMf0A50usprDvBKJmXPa+gi15xigBgryW+1D/PHiYNx3YehTqFOg33cu13XNSfOuJU
 yotk2kKJ2uVGljvlcp9bIM0qppPNuyGO4STCryDUMjDnkz8S7O9SYUCkz+RfEWOnjkHP
 x7Rw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8dmSjsC3ksECHqSWgS1USVDSx/1aBJLR/blZL+N9lldGJ7m6UKkUW4ph+zpvO+3dPlpFdGzbUB6WA=@buildroot.org
X-Gm-Message-State: AOJu0YzkZRTgneCFNQTcPWGYx2JfOp8tVtZh2Td2jabSKJVnCzVWnnDV
 xefezF7r9xJ6wpKpo5Poa12dyE1EIrTQt6Iw5L56geCYqdR9FitZgi2JtimqPCmNyb8=
X-Gm-Gg: Acq92OH4PDZeB2vT163EWv10BEmiZGn5cwjHqlF2gifjzMoFnO+xbZ88sFHO2Eh5ME+
 B89irATT62BmrVHhfpjyfDtv5plbCR5UGQCVEwhTEbgEMvgAhtlhHdQdF4Bt4zXBb4H7PVa3uu8
 CmH8ozoOOnrKKcPmHHGzI6ewGPoe58B7h5w9MijELdc+Pp8/iJ6aMHpP6/PBL0Bh5tin+J7yabu
 MB5wB0mIsmhRulGwZEAdYxfOC0YiUPIHWhN5agdY1b7QKFXt37O3l+4BOmuJvQmJ07UnBBNbyFN
 zbXbGNcuXJ3cdLQjeIIy8eQCs3AbB1TngE/B7Py8BZ0yInbQw2g0H1LT+SVoNl+Zg+JrfZShqUe
 Au/wHULAERRG2m72frTfWq8y2Yinu93uOTflyz9j+RyIaIph0flw+T/LEE5quWpCqRhtKrSaKcr
 5tBnLRzicH8C5JI5EkpAc+Mv+nng==
X-Received: by 2002:a5d:64c2:0:b0:45e:655d:6f7 with SMTP id
 ffacd0b85a97d-4606dbdf7b1mr3681907f8f.24.1781264228113; 
 Fri, 12 Jun 2026 04:37:08 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0c35sm5177812f8f.22.2026.06.12.04.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:07 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:07 +0200
Message-ID: <20260612113707.251351-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603073245.2918813-2-peter@korsgaard.com>
References: <20260603073245.2918813-2-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264228; x=1781869028; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1j5ZaiQfyk5v0IQZbvzRYD4o1qs/rHspBS86pSgjvSg=;
 b=dxJ0AkA7BuSM29k8xyvKHgvsnFh6QrhVeNgab8t/5KYdBrfZbv4eTIr7ZzZTcYj0qq
 s2O6pdRVLphi/0e766dc89LYYnIJqTuJ4FqjU9V3tzhuQviC/pZyTS7zYV+O7m6XLzMK
 2w7xBtdoYGUim8NE1z/nlJRbbzNLeVzkHkPw/7O+YR58QK8iaNOoXjxbPNI3oEex39TL
 nu0CqJdJz4p+F9WRmcKl15cpCv4Cz/4ge9iKqcM262OMFqXfQHLx5MK5JHVRNLm3Siuq
 LjqhvFMKdYKl3kx09N03IitIQUxkLCQNAGsbC6g3XebB3Fauc7y6n+PbK3QqaaeKcxJC
 XadQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dxJ0AkA7
Subject: Re: [Buildroot] [PATCH 2/2] package/docker-cli: bump version to
 28.3.3
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
> For consistency with docker-engine. Release notes:
> 
> https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.3.3
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.02.x. Thanks

> ---
>  package/docker-cli/docker-cli.hash | 2 +-
>  package/docker-cli/docker-cli.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
> index 34d77bb137..1424f95752 100644
> --- a/package/docker-cli/docker-cli.hash
> +++ b/package/docker-cli/docker-cli.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  b65cd415e63be23fcaa63107bc47a762173a06c84fb78b1575edc5443bb39867  docker-cli-28.3.2-go2.tar.gz
> +sha256  172dca437abb36485275a8d43550db90b6878bcc676fc0b73a67a57a15026cff  docker-cli-28.3.3-go2.tar.gz
>  sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
> diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
> index abe0aac348..8d1b8f1bbe 100644
> --- a/package/docker-cli/docker-cli.mk
> +++ b/package/docker-cli/docker-cli.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOCKER_CLI_VERSION = 28.3.2
> +DOCKER_CLI_VERSION = 28.3.3
>  DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
>  
>  DOCKER_CLI_LICENSE = Apache-2.0
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
