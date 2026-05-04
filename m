Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D993CCD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACC1C6157A;
	Mon,  4 May 2026 14:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dcd5Y-APkDWr; Mon,  4 May 2026 14:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5B3E6157C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906075;
	bh=k2zDQlqfSCPxjqIdUcSLFWApZM/Qh8ZSxnjEm00Xhq0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FqY6j9WuXHHayPSJB+GpAga1BAppxQzb0kDZnszo+PDUjcze5gBwUH6vLupfjP4gz
	 stWy1IyLPNhJiIjMSzZnqRGtQlMuT4eVbgH5983WO+C2wG6FY+V4p6UrtdjRKYUCbv
	 Smtbs8MmhPwce0yYxlQNayyzzQI8lfWHMMlZ4tgufFWb8S/M5LYMAWp5LBWi78qYtl
	 n6W7L6M/H3nZHfAqTH/hPs2gczFIQzrSO4Gul5AVsbQ9UU5+JkjPQjkzyPygaKZfSz
	 MA+CBBzMSd9SO/LsVWbhjuaiRYN2QbnWV4RByEtobS2KB91y+p6QoAUauQYqdBYuHb
	 hxf2c3HN62igg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5B3E6157C;
	Mon,  4 May 2026 14:47:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A27A525D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88EB441BFE
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYGeSecnwwHy for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D481941BF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D481941BF4
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D481941BF4
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488ad135063so38303825e9.0
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906069; x=1778510869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wMknXs1D568s38YOtUN6idbCDN3m8kNdNBtOgRUG18E=;
 b=bfjdOBQ04TN1g2avHxgVDOqsxBU2nWfA+HuAUBxB7SPvDiGIpSrrnsOJNa8m5EnPYV
 Ame9DzLTLE/S8dWFInNyEdWXdG9sRQnM7aa84r9mJlAGrpNqCQSh7WIXPXMf03mblT6I
 S/6YSEqEVc3G4FLp805UNAbSQKLVdgmOHI974rClyQqgQUVEljXr1ErLPbHPxWrzsOHV
 C05wkclCShHuNWdIeb4sVyPQKzObX3eQ+esvBrRA6EzwobVpvDZJdTQTA7cfGqIYxXLx
 hY6AhFLbaTOJelOPXFaZjR1/hTPKRbggrcosRGOnhNPrJJFlEZIMyfmwvDD/rOiObfc/
 JczQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8y2IwCeHxjGWoH25RGQ6+zpxslCCFjOyt8+CAj4jQeoD1F1XQgyDYjeV0PUtfYaNDpzJuOjXu49rM=@buildroot.org
X-Gm-Message-State: AOJu0YwVjs7T3D6TRQGA826y81bGXdvvNgKcj/gKHmHr8rbiB09L1z5Y
 bIOKiD1IZ1/F6y/fQxQAUzzl9SldBkF6AOn036qfKWNMurUPAG79UY3hPRH18Rtrecw=
X-Gm-Gg: AeBDiet4JsX7AK+pQQu2/tLZriaF1EpwVH4dYJKpyuhPoqoz9cafFXRO0qpv9vlCFoG
 tMxpmPPt3sKB2fYz7C7rH+37TtJFuqoGLUGOHFm2dLrqySKkDSvhQjfgLLitpKHrsUw78z0JPeC
 iNB79qUcyKwAdFfQcclSCYIyzYMo2CkYJ2F3uECk3eRaAbNeb8Rhnwaj52Ddj+FwRdNY4TlC7NW
 pi9UAuUwIH7jgwRdNBrgwKlBYIl6amcDlFMYzKa714nRlDC1DzY4MnKrpm++Br1CqiEMecNaitK
 HsRnBQyHbhByo9WzEm6WQxcIZnJdOFSdLhU1EEsdADxLsMqSbRVGjVzK5rD+M7Yhw3mjSaKvH7q
 gw5aL214x8azoukASGjy8vEKZPzBwiektTKfepE4g8zLVB8yYsdSiCNjloUb4nRLiFGc2fdfLJ7
 XfQbZ5KgnRqGUJ5e3byN6UYZupiw==
X-Received: by 2002:a05:600c:4f47:b0:488:b8bc:6a32 with SMTP id
 5b1f17b1804b1-48a988be27dmr185746255e9.23.1777906069571; 
 Mon, 04 May 2026 07:47:49 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eb75fc1sm288356225e9.7.2026.05.04.07.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:49 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:48 +0200
Message-ID: <20260504144748.10495-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260423210135.2859706-1-fiona.klute@gmx.de>
References: <20260423210135.2859706-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906069; x=1778510869; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wMknXs1D568s38YOtUN6idbCDN3m8kNdNBtOgRUG18E=;
 b=UfhuH9fqvDSgXnNH9Lf0ckKnkO3RgSnG9KsSduKK7ggC99VAAa0sJOWUfZ2L1cH1CN
 FrJQYr4LLMqGtz3uPxjeU3N5geXlTILWzsohgyAKOTcyS9+UQqtNCNNJPWx5dxggD7CK
 8xoqi8IvwvLjNMS2RQIf6DhHBMDdrH5xdm2O9z/CnzZOp8S53tz1aSmrbiOjXwXtzDAp
 cQpfPXRx95bOqiCMoypk53DhGDG/WfROfYUlDEY10RLla42xdqpgCbCAu6470ZckDg0g
 I7fZRvb1hsIFNgQzmkEFNefaBEwq+2glIffCTt852aiL+KIaoNlMV3I6of5ANwhQNxpu
 JEww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UfhuH9fq
Subject: Re: [Buildroot] [PATCH 1/1] package/ca-certificates: bump to
 20260223
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
> Changelog including list of added/removed CAs:
> https://salsa.debian.org/debian/ca-certificates/-/blob/b266ecf6afc2d6fda61391bbeda455572e7f5207/debian/changelog
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/ca-certificates/ca-certificates.hash | 2 +-
>  package/ca-certificates/ca-certificates.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
> index 2112badfcc..d234705082 100644
> --- a/package/ca-certificates/ca-certificates.hash
> +++ b/package/ca-certificates/ca-certificates.hash
> @@ -1,4 +1,4 @@
>  # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
> -sha256  33b44ef78653ecd3f0f2f13e5bba6be466be2e7da72182f737912b81798ba5d2  ca-certificates_20250419.tar.xz
> +sha256  2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56  ca-certificates_20260223.tar.xz
>  # Locally computed
>  sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> index b1903f6166..1f3f192d4a 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -CA_CERTIFICATES_VERSION = 20250419
> +CA_CERTIFICATES_VERSION = 20260223
>  CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
> -CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20250419T084132Z/pool/main/c/ca-certificates
> +CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20260223T202245Z/pool/main/c/ca-certificates
>  CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
>  CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
>  CA_CERTIFICATES_LICENSE_FILES = debian/copyright
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
