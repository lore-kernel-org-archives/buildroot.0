Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F42107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FADF60EF4;
	Sat, 14 Mar 2026 07:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hf8kvqLR3YDf; Sat, 14 Mar 2026 07:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3967860EFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474840;
	bh=5fIkmU7SQBXpt0M4M6BRQX9mBSrHk/IOd/vkYJfpw5o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IdslJh0kiLlvvl4fLVn6fNd9x8XruyLfpV3JsaWiA4zvb1/5IH4swQ5208pnudMH0
	 m+99u7ggmRhehsSkZjIyAcjikfbM9sM79hwMBSt5QhXi5L2Tfjv+OSH9zr8bawK1Ry
	 rGXvqHqjyA/Tx2gk5epUAmME/w05J+079yUfWz6/DKfja06SHGyK+UogvMXXXU7WGq
	 sKEZ8385l58tPcfOw6xDEDTF2xlEhf4eB81WK3YuVG8XpJlUdo59tNIhRLw09ZaHUK
	 sEXNWm0MXz7cFqbKKYQrIYd+I13QDSB5+EtJdO+LNvYhNTP7GB9BuD51qb5py0oGmF
	 LVKl+J4khn81g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3967860EFB;
	Sat, 14 Mar 2026 07:54:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4F9A201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAE1840135
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOYENNZThP4F for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:53:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9045B400A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9045B400A2
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9045B400A2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4853c3c2fe7so17476535e9.0
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474835; x=1774079635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZT8z5IOnajhd0vOEjgNqI2tJHxe9bdPGULFoBIYq4tE=;
 b=m4qz5pM1aecmW1EQC1bJkaeomc077ZQHSG6EPwva6A7YBORY8YH3TMOoCUVL0IiEwN
 R9bX25rjVCUs05oLq452oDpTjii3MIbQOsEgwzCf6k4fiv914SXXG6ZPHU1lJ0D8RUPl
 8ThCyWk2AbvMj2EPX+n6MMqezgpH2Jqdh/7ua9eXrhxFjESMOedoCdwtba+McI7d9vFP
 DPqpC+48YdBMv5PoBiF2odzk9loaeAr4LHUbd9sp68Ouz0mpsMN0I8qzvBmgXAjChBTu
 g2piNyAgOPW3TT+MRxVFpkjJFTEpu+Fvh885jBf4b+q5ywD+bj70yVqtQS6r64em+u0h
 /gIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzZfqbyWnbadbEwfMuYJ1GAL984kWRht6U4gl/adBZs4Dzr7m93t7jZKaLRV3T2b7DO+HMP2KDgeU=@buildroot.org
X-Gm-Message-State: AOJu0YwXRIk1hq4Iz88aMSZ2iO2/zdVxcizXDjpdrAUpGYTeX76wb9nm
 vPRpKJv7+SFIL/8Vr/5yJSNRBEwW8peFec03vYu6oUw067bcJNNn93/HwB54eJpiq5NPsw5X3kn
 km9TN
X-Gm-Gg: ATEYQzwhK451hn12umEopLV52CuUYZ0VUcjBm7Zi5kehPiY4fpYMWWgvA8iBaj9X458
 BKftLuA9ONgUMnDCEXV+mqoMmfAc8PO+D7FpJXqzosAufHHJWMWN+aAuHyPOd7M5fvPNkHY/bBA
 lqONvSdTMhQcA7q3bIBtC1HsdJYi3nhPnLb5IFz8Vg6i7IpZCI9aKTIZs/E41h5cCBMvqWnCH2L
 8B7l51s7l+FceyRjZAYDktCBcNmJpz1H/SO0C2Zwdv3u6fzl+Oc9HEwMiNiFZSqVBejGjNzWQm1
 ghs8sq8un4S4kwE95e6wIQvYZU4v8bPlN1ajjr4WBxvy6TnAahWtdcfuc2Y6jUr/BqqCM6sxaqS
 8Qa7+BzGKfBV0caW9QtezqtYUUJXb+TfkIwTD3KCZs5ujQrbvj5IakFgHVpo7fEnyfIRY7xtDLC
 0KWFI74+ll4Jz8TkJXRb4htFAMwA==
X-Received: by 2002:a05:600c:3ba4:b0:485:3f72:3230 with SMTP id
 5b1f17b1804b1-485566d936dmr102879545e9.15.1773474835217; 
 Sat, 14 Mar 2026 00:53:55 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1b22e7sm23147042f8f.16.2026.03.14.00.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:53:55 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:53:54 +0100
Message-ID: <20260314075354.14898-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304192319.3493151-1-bernd@kuhls.net>
References: <20260304192319.3493151-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474835; x=1774079635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZT8z5IOnajhd0vOEjgNqI2tJHxe9bdPGULFoBIYq4tE=;
 b=YzyIHypm/4JFcccSyH8tjA+FSSEMN57OtGOMM/g1VtnP5CGkXUPNcORL8aAH0tDW6+
 p8y2AywYjysLIaehR/GN9hREYiJPohVj5rO1YVeVFn3KORnjG2h7j38/mDKB4IT4nVHz
 ZhwPKje7HZEyRDkkocN5MMxllV1A4+VeFXUeOgAqzm/Tx7qS3riVs7mpS4CG1BMqpm7c
 FgJO7knecWMjMyeTA0Qk3K5veg5oPr7ylC6aGaH8oImaX4CTta4w4i5tQBksvkW79O6d
 rlDZte84O75NBfAxrwrcTppbaXsQXa/D/fmfuzZfawE8PFDvZyEzLF/hv96MB0xgstdi
 FA7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YzyIHypm
Subject: Re: [Buildroot] [PATCH 1/1] package/exiv2: security bump version to
 0.28.8
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
> https://exiv2.org/whatsnew.html
> https://github.com/Exiv2/exiv2/blob/v0.28.8/doc/ChangeLog
> 
> This release fixes three low-severity vulnerabilities:
> 
> CVE-2026-25884: Out-of-bounds read in CrwMap::decode0x0805
> CVE-2026-27596: Integer overflow in LoaderNative::getData() causes out-of-bounds read
> CVE-2026-27631: Uncaught exception: cannot create std::vector larger than max_size()
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2025.11.x & 2026.02.x. Thanks

> ---
>  package/exiv2/exiv2.hash | 2 +-
>  package/exiv2/exiv2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
> index 1c85f2e1db..7c497cf0eb 100644
> --- a/package/exiv2/exiv2.hash
> +++ b/package/exiv2/exiv2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  5e292b02614dbc0cee40fe1116db2f42f63ef6b2ba430c77b614e17b8d61a638  exiv2-0.28.7.tar.gz
> +sha256  ea51b0609f58a9afa063b60daa1539948b62247721e154f4fff0ad3aec9f9756  exiv2-0.28.8.tar.gz
>  sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
> diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
> index e5b55ecde7..d45acae34e 100644
> --- a/package/exiv2/exiv2.mk
> +++ b/package/exiv2/exiv2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXIV2_VERSION = 0.28.7
> +EXIV2_VERSION = 0.28.8
>  EXIV2_SITE = $(call github,Exiv2,exiv2,v$(EXIV2_VERSION))
>  EXIV2_INSTALL_STAGING = YES
>  EXIV2_LICENSE = GPL-2.0+
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
