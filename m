Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C19CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 709AC41E19;
	Fri, 15 May 2026 17:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B07L6EcdSlQY; Fri, 15 May 2026 17:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88AAD41E28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867266;
	bh=yabyUvakzX0SvcRoNq+kEehpdqS2CZURGUjqxFAjHtg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bjU8m70uc3mwx9pXGoXlKEa/OBTB0aeyO+g7gn5g3fdd2i74bLouLTNBOCTsi5r9N
	 B/X5irhJ1T+vjrtLBN3o75Bd4CYlqcLFiXqAAQ3VMbKY4P7a2tLuAYsmPgoWIMHZG0
	 Ri1R9EbxWxCB+vPG/iaQloVVx9fYFyaiR3d2SzkLm/DVJkqrWkySgXCAb1FyigxddQ
	 Kegbj0fMQ1b2W/w9/HN6IphDIwqdForRqC/BDL1H7qRsdN/k5KS+5OcCXNgK1uIyFk
	 jEZPx7NIxms6wQCKiCRslB8JFDbCAkVersOHNRI0g4vVsX7XwWaZ6fF9tNowuwScOw
	 oIVlyjkIObW9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88AAD41E28;
	Fri, 15 May 2026 17:47:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECF6845B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A64540FB2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xca7vi_ps7KW for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A91B40FA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A91B40FA9
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A91B40FA9
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-449d6c68ed8so53907f8f.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867206; x=1779472006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SIZVSL/UdCkde2OLN5rnIRUhWsMB6VyvZOBU0YVCPS0=;
 b=oYgAxVNK7pmP0CuSsR7DGbILmmHgDdQ57je9kcLaJ7m6tvR8iZxFJhPDzEnXZ+GlbB
 8hEmZX9RmFrhhzDc+cNp65uwZ8w48XDFjjXyJYiztrWbtV+WFWJEPqAimMVLypJy/hoO
 LQloJtSPf64OXMxf1sm40Jaw90F9rR7bI09OiMFwsKFR3+yYi+xWzFunIocVJrGDB/fB
 ROYh9H0FMU0zZZVX6ChMOC+Qb2eP55Q85regJySlJRn9zSqISi5N6L1VPNJV4KaWGL82
 LgChM/Af0QaZbIK/g2QfbDUJGzVB1+rfR0WFa08VOqXsSYrjEIbTi/6k12hD7Kp+CKL0
 IEvQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9OugWtCTrKtuwAvVIDGcLUAzKEnSB8y2kn9+DfA7+6m6vniM4N1jjHO1Ovg0o78GAkcJ/6Kn13anQ=@buildroot.org
X-Gm-Message-State: AOJu0YwD4gZ3+U6aEyVrBGXRY01RaFU5g3Kv6yvndHr8Fwq4S8Gk3WgP
 WyzERDJ1Sajj8BGeYqZyEu2d3aVmv3hOOFm04G2F1Ky1PxWOL1ey5gi02TglyF9S4Xo=
X-Gm-Gg: Acq92OGlurvDD1/vPXAOTdOmnItM7xjGEj9abVM4clKw6W19l9GNbX2rk1m8v9x3btp
 RYJvc3VpV9SZjsrPUn8+Pna871noVI77/h3z0JIXQpuKoMJf6VycCpa/qnpax8fFzRY4zZ5O5Ae
 KBlJlnutj6wB/Yoqw0DIMxWiMBPxxpca2wfcxtdhGZv65HClYmJ0rGTIX8iPU0ad/M2GBpYlskH
 wpGCSrtB8ax77V4iOW+3mp/u2TmcQKiVTQ6IT9ve4N/LOjguyrmCP0rM+v/GqBfkvXgRxq56ZK3
 2b5qxS5ZYkq+dHmWvn5/07SMir0GretgRNw5rPwtf31mfAU2j2OMV/HS3++kPiflJqPcJgUZW/L
 pRAEYHuG9YGQexCCCspAO3yjtVLzawA+wOMXx7niUf/LkiySTPUeu+sdY6U3HXgUnLhBmvPtpC+
 JlxbaR+eui6SFfEiNC4lnb1UZDRihpkyZtw0XETIhuzfqb
X-Received: by 2002:a05:6000:2f83:b0:43b:5097:6f62 with SMTP id
 ffacd0b85a97d-45e5c5952d5mr6784990f8f.36.1778867205933; 
 Fri, 15 May 2026 10:46:45 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec39806sm16218606f8f.9.2026.05.15.10.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:45 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:45 +0200
Message-ID: <20260515174645.530649-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505191625.1031165-1-giulio.benetti@benettiengineering.com>
References: <20260505191625.1031165-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867206; x=1779472006; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SIZVSL/UdCkde2OLN5rnIRUhWsMB6VyvZOBU0YVCPS0=;
 b=ifxUk3popT8E1ohkiLSRcBoJaxjdeMK3k5IMPwyJcjxJWReQ2u7ncGRRtTZE1lZzRm
 8zm/vxrcii2klylqtaLDXE7xjk2CrgliegYGgE2eHrqnGBcY8ZqpS9yPNKdExaoG2asX
 JzYZEDl+UwJ6XmK4QfrO9XgLC3ixClqy4hIXQ9VUJOU/w2zBP/cwsbWMSX48mQMThAHv
 2Ieh4G5gzOez1UubHz1Z7Ll1dBTAIDROlxxePbaf5uePSy+JQ6xCs3IupZtrLJYlHGhq
 Mag9mjX6T98JcIOEDY3+5duZpoWsKf4RGSdaobUlVu6r84sFGNwzxICzVs8hj6rnknXC
 6foA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ifxUk3po
Subject: Re: [Buildroot] [PATCH] package/p7zip: bump to version v17.06
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
> What's Changed:
>   - Fix CVE-2021-3520 affected components Lz4 1.9.3 in p7zip17 (#239)
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/p7zip/p7zip.hash | 2 +-
>  package/p7zip/p7zip.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/p7zip/p7zip.hash b/package/p7zip/p7zip.hash
> index f0b9c27113..d352965950 100644
> --- a/package/p7zip/p7zip.hash
> +++ b/package/p7zip/p7zip.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  d2788f892571058c08d27095c22154579dfefb807ebe357d145ab2ddddefb1a6  p7zip-17.05.tar.gz
> +sha256  c35640020e8f044b425d9c18e1808ff9206dc7caf77c9720f57eb0849d714cd1  p7zip-17.06.tar.gz
>  sha256  555806657dcf0f1e720b581c52643c195ec86ae3f00bd18cc66d2e0f88ffa210  DOC/License.txt
> diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
> index 803fd38b7f..ee5a7d2e10 100644
> --- a/package/p7zip/p7zip.mk
> +++ b/package/p7zip/p7zip.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -P7ZIP_VERSION = 17.05
> +P7ZIP_VERSION = 17.06
>  P7ZIP_SITE = $(call github,p7zip-project,p7zip,v$(P7ZIP_VERSION))
>  P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
>  P7ZIP_LICENSE_FILES = DOC/License.txt
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
