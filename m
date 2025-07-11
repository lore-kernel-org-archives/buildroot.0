Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBB0C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C11E614F2;
	Fri, 11 Jul 2025 10:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-ycdjhwvWel; Fri, 11 Jul 2025 10:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0D07614A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0D07614A1;
	Fri, 11 Jul 2025 10:45:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5806B199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5508840549
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1hZon-t4m0Y for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66C78404CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66C78404CA
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66C78404CA
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so1885842f8f.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230695; x=1752835495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mT46GOyArcMDhORlZDAouG6F13Y3Mpt0Ia2Uw0TIBhI=;
 b=Ed88CHz2CF2U3WjwOLEYUMh4hUroxckNU3mGbJKnw1TuvtEd3QOjk9Q2u8DbFdAKX0
 5vzv2oaE6lGmcMl5P++hn2bZ1c+qDiiIoXRvt9csYhncSG9CW0shzSv5t2+kt9O9SrOX
 8Fk93EY1kDP/plC5RbaJFkAnNOqohlAuDWlVgqGD2jnBoxJbpKbE/NKMTEDEiAhtHztL
 A6e9dp5KzTQWDMvftD0DuG+2dGELD/keZNf11lLO2vD+cG7DKN7e6gDVKjLRE271P2XX
 J935Zq8e9an+OnegSJehHuDqHXQVru/kno3HZQoAuXOnEmaDzCzp+pfgSKZ5rKf2ELPS
 gV1Q==
X-Gm-Message-State: AOJu0YwqzzX5GNCBjZBiL6UQIZuK4DZNCJVk7k0vN7HpccQksXt/yHjs
 X5X9SKLOMoE6kWCxFqWkXh30Rj+FxaRBozwKt3x5MUCo33W5BkhbF+oN9XFv7VyFeaY5+mfHpn3
 g3oDG
X-Gm-Gg: ASbGncs1OWdNk8qS82EMTYmJoMFwYMiPSAv58iLR1Xdm5zGZhtQxAKDr6TY3HnCgTMA
 s16SOhMOtYMKgopuUnc0QZbVIQSgrg8lpNguCA++cRAnLJvbJfj38ziHavvJEFAmrDf2JjQO5wV
 a1kdjJvkfibigLLB1A5c+weE+OJzVtEvLwrd0b6txDlgek4TFRH2DLZJcd9Ng9YERVLcF3i9y1l
 rGCoHpP9wtAnrhcmGN9AbXEDBHdGW8c9FiP6f8j47c0jgGgMt6pk8Psqwsjizr/nUG3rNclXnfJ
 Lpp91whu2WuF8nEhWdZOqPGabwazBgJSX5T8YcEFhJ4dNIMGw7MuKUiav5D5pA7dGz05/MKyBMm
 f2BGOLgn+NFKVMw==
X-Google-Smtp-Source: AGHT+IEdjy4g/wcPbXDYbEoM4pmPXAQxNSlUY1prut8ckJxbblE1w2kH65MGUBE0tPt7c8ymDLrfcQ==
X-Received: by 2002:a05:6000:144b:b0:3a4:f661:c3e0 with SMTP id
 ffacd0b85a97d-3b5f2e272e5mr2068263f8f.45.1752230695473; 
 Fri, 11 Jul 2025 03:44:55 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e262c6sm4053571f8f.85.2025.07.11.03.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:55 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:54 +0200
Message-ID: <20250711104454.824099-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703200917.4054251-1-thomas.perale@mind.be>
References: <20250703200917.4054251-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230695; x=1752835495; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mT46GOyArcMDhORlZDAouG6F13Y3Mpt0Ia2Uw0TIBhI=;
 b=dczYvOQ5nAPI+nIvlfGDt3ftlBar2Sg6SmXaKmjk6pM63k+Sd05QjzGKdyGpdAqx4b
 ZfF/9KLsnaYUDTA8a4X5TRTW8fJPNzarGi4tq3USZBGrxvdnj5nlkRC9yiaib2bpSfXt
 aHtKGeb+5iLc0kTh3wtd2W8d8OOibHev3dtLIl94D1HrKSxdoV5Dj6oIiTnmiQEUDXcB
 21E9ilv+PretQKX8hwEgTaDl+8eZo4souY6peVFIF4E+NahMVSIZfKtbPsFEyOU+ftYn
 2Wzv+X6PuwSntMGwHm4uoWwSa++plFkXdNwoHLJlwPE2gSKTdc/G3Fza/n8a10H2B+ov
 Gw9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dczYvOQ5
Subject: Re: [Buildroot] [PATCH] package/fwupd: add CPE identifier
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
> The cpe:2.3:a:fwupd:fwupd:*:*:*:*:*:*:*:* is valid for this package.
> 
> See https://nvd.nist.gov/products/cpe/detail/46E1E3C0-2F72-49BA-8374-1FBF203AE0F0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> See for instance https://nvd.nist.gov/vuln/detail/cve-2022-3287
> ---
>  package/fwupd/fwupd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/fwupd/fwupd.mk b/package/fwupd/fwupd.mk
> index b35f90839f..d143740c43 100644
> --- a/package/fwupd/fwupd.mk
> +++ b/package/fwupd/fwupd.mk
> @@ -9,6 +9,7 @@ FWUPD_SITE = https://github.com/fwupd/fwupd/releases/download/$(FWUPD_VERSION)
>  FWUPD_SOURCE = fwupd-$(FWUPD_VERSION).tar.xz
>  FWUPD_LICENSE = LGPL-2.1+
>  FWUPD_LICENSE_FILES = COPYING
> +FWUPD_CPE_ID_VENDOR = fwupd
>  FWUPD_DEPENDENCIES = \
>  	host-pkgconf \
>  	host-python-jinja2 \
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
