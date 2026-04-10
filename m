Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BEDE99074
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 10:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7CB982DDE;
	Fri, 10 Apr 2026 10:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvd-pQlgKXdB; Fri, 10 Apr 2026 10:09:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0396C82CE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775815760;
	bh=jM5i0Y9/WanwrCuB4PlRXXoXTZmCu48bldTK/hTwuQg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ru7N9mDNiH8BwmdpnEDS5rds7MH1Ku7KeHW1xdjrBRL8eMR5LP20/XR2b6mpGcqlU
	 66Wi9o1U6Rshen6sXxwhhhG4DwL1Fplm6d/71S25gqezxQzDrVwER28wdp87LWPPmP
	 hRDrfNu+mkPrk7V1mmYlWkvHuPwGtzYkaHQ4uzkcWA3jz9SA7MDKP/AIGMvHQbOqvw
	 jwMXOX8F2FFqI81i8u9/s+WZ2E9Xx+s+s3k1L0DMPj58erJ7UPuHv5RlHmdLXkanG0
	 nLwR46WsvxmsbTHQBY7mUbTKT/+cKX8cdMseDJU7FqGLNhH5b8R4H19xxh9jWnZ9Gc
	 PajbreTFKy/OQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0396C82CE4;
	Fri, 10 Apr 2026 10:09:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A18EA237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 10:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94D5B60BB0
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 10:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGbLCYmwIcSa for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 10:09:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C830060B2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C830060B2C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C830060B2C
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 10:09:16 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso14363155e9.0
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 03:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775815754; x=1776420554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p+nfU0/2kBCK9y7Dh7PO2ZQ0Xi/5I1LP+/yxqBl/R7A=;
 b=XAN/7G+58dYUIm83vCmuhCWIVvCraleemLNMnrHKKHOL4bItAz/lMGxD2X/PU7WFds
 uNQN5GSwlMHSuiGzenPJFAWIMQQU5YZlqzyVH278E5ajdlX3BLN+dnlTAEhkW1QVox4O
 JE1qq+V1llhL6z1nuNvxOCGkdg9K8XOHk8+7qOW2dVo6T39FURUUvq1JTGgcdMDv8xnR
 vqdRcOyz8YCzN4a/89xD0RpWZYDLn1EkrH+AmFEUEQXyIbHb3qVpAQdKbtSVhWeJ5Dg+
 hSwk2yFokrUD4Rh+it6TrIOuJclM/emdQhUC8buzCKCuOoRsCkDpUS0BeYKHH2DUPuek
 V2SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUulmcFtG2MLVgpkXzhjYw3gCYb2KjUB0BPfAuJoemc2+z6ckJM9OBc65tO2+X+3nj031fzq7QrVmo=@buildroot.org
X-Gm-Message-State: AOJu0Yy52ADer6FrWClNSu2OriP9b0ykq5Mpv+qqmm6YMlG0cAlguzmS
 V15rXrlTxy+Yno1DCySykyfv6ZLrU+4MPUYTG6Yl0pvABIkI+XMRclwTdSWpSzZc9ho=
X-Gm-Gg: AeBDiesa13n7ZN5dWmHLQOE7x8B8r3U+sAQ1pcnW05ObNHLJqikbGtJCGuhuFxf9fz4
 bwJ0G2oAHWnN1b3/Z4eh68vTdVReaAWIvxzLd4XWpS2157E4uZLXho4gd20Zd5pbJLdabWraSUY
 ofrRfZKNEF42O+5eHr5P/W8wBs/4sjk6pfLZ1w1GUdb0X+hTrmpxuSt4hc60JQ/BfRXFl4hgPZd
 VhZSRfVvZomMY5s1iMk4BURDOjzEE2GCFQv6MMYn3xL5eSY7YtDTUYWQ/Fx4xcT7CCwmddkNIlz
 foNSCsaBVqHsOvFRsGKYLlw8uk/S1S8Ehjuxcvk1hg0nc1+w1boHPiMXp5WLMG22xOdXuJo4247
 mRiSgu/zIjccIIHiRdT7OAaFuc7AjAN5KO2qfeWdrbC8NDYaXd+Bq9YbklfcnhOmcFQDTMuHYnS
 o6MXWF3qKA+pirOMTr
X-Received: by 2002:a05:6000:1447:b0:43c:fdd9:1890 with SMTP id
 ffacd0b85a97d-43d642c999dmr3467412f8f.51.1775815754066; 
 Fri, 10 Apr 2026 03:09:14 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e5ccdasm6549614f8f.34.2026.04.10.03.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 03:09:13 -0700 (PDT)
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 10 Apr 2026 12:09:12 +0200
Message-ID: <20260410100912.127932-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <fcef4549-6961-4824-a4c7-a73552bf3bf9@cherry.de>
References: <fcef4549-6961-4824-a4c7-a73552bf3bf9@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775815754; x=1776420554; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+nfU0/2kBCK9y7Dh7PO2ZQ0Xi/5I1LP+/yxqBl/R7A=;
 b=ExTQ7K/d/QWik/4NHeQPvrpQ3fELq0JofA3fXwxGaoHBqdmuS6JBX9XYun1dc2fqKA
 01h4wA8WVbZY0B633+j3XeVBhu4Zdt99B8vAFhyIjUh4nN84ay6jSNfX03lCBRXelAcT
 NccRcOoGNpRjnEx/vcOTNZZQZUrQFEO+AuLM999kKTEJQJgzduqdIQhys1H+Ka1KzT3p
 /modNNq34fNxBq5UoInlisK2LvhbutAFf+NZdKpjUjQJCfGMJBHnztyQC7WhH/nPKZ32
 pRLigosIhL6LKMOjYG6OslsSEYiaWPQrdNqKvBbWSK87Ot6fxyHXt8Ey8xZphydjqHDv
 Pmnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ExTQ7K/d
Subject: Re: [Buildroot] [PATCH 2025.02.x 5/5] package/qt5: bump packages to
 latest 5.15 kde submodule version
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

Hi Quentin,

In reply of:
> Note that I made a mistake in v1 of the series for master that I necessarily made when backporting for 2025.02, see...
> 
> [...]
> 
> > diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> > index 3ad2bdfc04..0e375e83fe 100644
> > --- a/package/qt5/qt5base/qt5base.mk
> > +++ b/package/qt5/qt5base/qt5base.mk
> > @@ -4,7 +4,7 @@
> >   #
> >   ################################################################################
> >   > -QT5BASE_VERSION = 2b9835f5c9bcfe3105b60a8dd33c1db7d8611378
> > +QT5BASE_VERSION = bebdfd54917e25d1c100e6bd9f5dd53c2e645fd8
> >   QT5BASE_SITE = $(QT5_SITE)/qtbase
> >   QT5BASE_SITE_METHOD = git
> >   QT5BASE_CPE_ID_VENDOR = qt
> 
> ... there should be a change to QT5BASE_CPE_ID_VERSION here too. See v2 here: https://lore.kernel.org/buildroot/20260327-qt5-5-15-18-v2-5-4c98e853266a@cherry.de/.
> 
> I already didn't like much sending a backport series for 2025.02 before the series for master was merged so I will refrain from posting a v2 for the backport, but if the series for master gets merged, this one here only needs
> 
> -QT5BASE_CPE_ID_VERSION = 5.15.14
> +QT5BASE_CPE_ID_VERSION = 5.15.18
> 
> If you want to modify when applying without going through a v2. Otherwise, lemme know I'll take care of the backport whenever possible.

I will keep this series open on patchwork and do the modification myself when
applying so you don't have to bother resending. Thanks for the notice.

When the "master" series is applied feel free to ping me as a reminder for this
series.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
