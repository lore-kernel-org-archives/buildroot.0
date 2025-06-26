Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24329C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED0D760784;
	Thu, 26 Jun 2025 19:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uu7Nz3nvDC_9; Thu, 26 Jun 2025 19:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 162F960767
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 162F960767;
	Thu, 26 Jun 2025 19:24:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59801154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F4EE60790
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Towtl6CiaOI for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3EB5D60717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EB5D60717
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EB5D60717
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:24:29 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so976987f8f.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750965867; x=1751570667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=meKF4YjRxPAx9NS5PTPcVvsl5KY2VfY43bftUb7zNQg=;
 b=gN/1s5QL7OBQ9uc1yOtEWw+H35g8oZPkHSuYJHHwjtlFe5mtGSjvSNe4gUPGXaJasX
 4s4xcS0Ge123JHnh2qKExhAmFJ1rSuif0f8tBDdaRFGKtnrSnfFjt77MqMY3rHIF7Rf/
 a1Uw3YxrzBj6NbZhzk7cBh0D5OdOqdoFPJPL770Qio7OwSoWNuDb9qLr8XGQvV0/8uVW
 Rgp6O+yTFb8RXVMneEvNt5HvGjH2JzaPtF+VmNIDWA2GZ3KoHw7vxMeRdagANHlM8Z74
 XxfcBLepd3yDSBjmHyVAZjnj/urOm/aREGfXySwgi4vainlhgC9j0xk1Dh0KaN/fiWlj
 yb7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKiaUCX2iihwreg9m54sT2D1Y3f13dNnERxdHNHI7X2rw9yqQpdtjMNpRfquIoHIlU1qTKafpcrjI=@buildroot.org
X-Gm-Message-State: AOJu0YzQOV1YtR3DUmWHR0cpmRY2XtMw5Ru8DYvSeZEg42m74ADm6pW6
 IJfOFU3OdD6hYr6fm7C57smJY3pHrb4OMn2WaB6nTp/7JQJy8skmxNEP3z3EUeOkWoFwQLSi5sp
 DWDh7
X-Gm-Gg: ASbGnctDskk6fPumVvSaPkPOnpXADCIAm13r+QzZFWI5vY/PmjksP9nA7EOm9j8cw/N
 GTp9II0gEF48u9Vr/tJDRCqTB6J9uZhLwXX3H5QomTkIR7dvKiec2IgZ0RS1Ff7oLXFHC2KraGy
 7pAAK/Cz6ga2n89+eP8bBtYfSroC/Gi1JkDtklU1hqCc7K71/OWuHYwfU9yUjiqfKnvO8DApTF3
 xMHSr0rTfTAUuSdbP4tSuN9o2zO9iDmM5nJsnLgzo8mU3Q4k//UUHwnB0mCL9d/4jXxiX18HZs9
 6hmaM9LmxdZLgmogBlMp2KT1TM/WFPe7R1hr6y0PD6E1NWiLZLuOpjM5c+AcKy1ybLUxa7eVv8m
 /6deCgoms2iclvxzmsVjVtvU2yCiuDDjv
X-Google-Smtp-Source: AGHT+IG1eu3GHv8c1Es9CudM9c3hKLrqqVNLPBIuh/eI0DYqvRpIXAX6OX3Yb8T8VFcYZf8je2O6KQ==
X-Received: by 2002:a05:6000:400d:b0:3a3:7117:1bba with SMTP id
 ffacd0b85a97d-3a98ca6f3admr200101f8f.24.1750965867277; 
 Thu, 26 Jun 2025 12:24:27 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fa750sm681413f8f.25.2025.06.26.12.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:24:26 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:24:18 +0200
Message-ID: <20250626192418.8583-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616164331.3452816-1-buildroot@bubu1.eu>
References: <20250616164331.3452816-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750965867; x=1751570667; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=meKF4YjRxPAx9NS5PTPcVvsl5KY2VfY43bftUb7zNQg=;
 b=bXYXV+u6sgjaGVMnkmn1Qo5IOaPczDcU0rJ5bkXqJonsu7dnAzyTzS+WwS04jJ92e1
 0zlOla11RGitxdfapghIBKhAMQh/Y0tDAfkvBLrEdBt7lyUPAdJ6oTZKb44tx7N1xAZ0
 4oKuROOdqxjRaH387z5ZGRQyXgqb/9iQUesrYvjfCaK6TRM44cHWQggDC2cthEwfSou5
 x06IvAhuHgQ4o3WiXqHVx6HNWI9FsmPiP6TNI7kpWk2DAXPjOOJTTYcaIU/RVhTl83VH
 Ft8ln0Rg7Adn6gEje+AR/5MjtDHptFaCcS5/4TL0IpvaxNj3D240Um5ozFFLFuVuIGbF
 LRMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bXYXV+u6
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: bump to 20250419
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
> Changelog: https://metadata.ftp-master.debian.org/changelogs//main/c/ca-certificates/ca-certificates_20250419_changelog
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x. Thanks

> ---
>  package/ca-certificates/ca-certificates.hash | 2 +-
>  package/ca-certificates/ca-certificates.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
> index 363f43e13a..2112badfcc 100644
> --- a/package/ca-certificates/ca-certificates.hash
> +++ b/package/ca-certificates/ca-certificates.hash
> @@ -1,4 +1,4 @@
>  # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
> -sha256  dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903891b003cd9b1ad7e03  ca-certificates_20241223.tar.xz
> +sha256  33b44ef78653ecd3f0f2f13e5bba6be466be2e7da72182f737912b81798ba5d2  ca-certificates_20250419.tar.xz
>  # Locally computed
>  sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> index c354eb037e..b1903f6166 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -CA_CERTIFICATES_VERSION = 20241223
> +CA_CERTIFICATES_VERSION = 20250419
>  CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
> -CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20241223T143500Z/pool/main/c/ca-certificates
> +CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20250419T084132Z/pool/main/c/ca-certificates
>  CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
>  CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
>  CA_CERTIFICATES_LICENSE_FILES = debian/copyright
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
