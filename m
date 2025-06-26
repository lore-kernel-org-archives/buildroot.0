Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA17C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C796127F;
	Thu, 26 Jun 2025 19:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4ATcnwl2F-9; Thu, 26 Jun 2025 19:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 793576123F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 793576123F;
	Thu, 26 Jun 2025 19:53:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 88188154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EDAA6123F
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaFCN04_L9h6 for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:53:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 976216123B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 976216123B
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 976216123B
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:55 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so1090339f8f.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967634; x=1751572434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yCyLEOpUnM6hWoi/CLiucosqxqXS0ZRutsEc/gveWek=;
 b=Vm7ZZdhhyLQ7WsVs+QKZ4qcay2eIIaimfGAeJK0Ii/RFHiZyP2j2zmQbFRiuaqmkPa
 iLtAIXdap7hkaskoPN8MX5GAMhvUjeqYDXePwloVOVeaKzTP/+/BnkhlYTU4cyf3UNjS
 g6DKSasviimegcO479DR/JfmDMYALE4T1PtjaZM3Usd0CzXFe9moNmbjxT976sya2t8G
 kiV+awU/KuoI7mkrK2DGdQJVk4LiLc9pvBMqZRxjnqCZo+SK4PS3gZCq6Q0d31DfrCF+
 suAIpIxRByIgS4hKKZqkNf/rflWs6ivfXGk8T59oCcIshqhRgM7RkHnOL1CAbCiskirJ
 3Sxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAN8GMiUI3nxY4tuLClnMkp8FnKY73Kh05sAgsaYsNqTmcprGJx9qU4MhC4lH2MlZZFiqj+z7yCLk=@buildroot.org
X-Gm-Message-State: AOJu0YwBj0RLjjuUZ3JbRNImIaCe4zDCXsrHrx6iEpzS3VXE6wvCTt0k
 OdXacf5wAViADA4l7VQvOjC3CfhXF9tvQK7wl8JPWVKSSPyN2JRADN5FsdTfnn+vOik=
X-Gm-Gg: ASbGncv3OLoKs3dIqqiM1PL5OPlvd0fc/vzKrmIE8YZXjw4ylukWtHHM5LIZ7dUl8Gm
 CtwdndfZxsi8qPBlO6KY/QjNsqkdpspSNKyFkgDavi5gGt+k0wIrRx5iM4CE1QiUB4oiP4fgZmC
 7UJdAsqYpvZQhCAuu31QkZwUIGH/RUjbEPablJmjjd9hF1EMuJT5vdz0Pgw3+KDfsp54FgiHWMG
 jXJ0KbFuAZiGX7k+d3YZoRB+C+64PpsCK/KoaF6DylcoVSxkKMeVL4tWlsN+3i0jj2f88m6UETs
 krQAx40UzJ0UI2T7pMRsybqrUjn7dQbh9mRn/caEWiOu0ZeROujUPoyvBUcQ+qFHVHBlzQmuxE9
 4XtZNYf60+iRTmajlnu93BFSyEvDRJGvNMlW6p77bUNw=
X-Google-Smtp-Source: AGHT+IHVurdfKsBmMtu4hR/lMxxw1C6lkRf9gIwm25PZ4/f6YHQ8HBHKf8kMYQR9qbHCDlmhGnxL2Q==
X-Received: by 2002:a05:6000:2188:b0:3a4:d79a:35a6 with SMTP id
 ffacd0b85a97d-3a8f482c094mr581280f8f.14.1750967633597; 
 Thu, 26 Jun 2025 12:53:53 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52a35sm730576f8f.57.2025.06.26.12.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:53:53 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:53:44 +0200
Message-ID: <20250626195344.15314-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616164331.3452816-1-buildroot@bubu1.eu>
References: <20250616164331.3452816-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967634; x=1751572434; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCyLEOpUnM6hWoi/CLiucosqxqXS0ZRutsEc/gveWek=;
 b=PA7eGsEA2nb4sRuzqJt7PTxmoJjyjxvm5gCLNyWlz8IJxMEmzysFYMreSYZf1aP7ml
 pLauIoIDsAOz9+9Nr83qaZjQGbQQkMNs6eZxGEBYfdHbQS9IDZHHaIwk03iqtfpG6oR+
 hUfdXwGGaWnVRgzZNbaSMLJlXc7KLGzkLP14Pl22rBJoYaIvHKmmqf5/yXxA6SHj6UGl
 R9S0shRNIGeeGPVv6zw+5EyOhNbFyrKL89qSMxniTuenP8reL6W/3oXscAf4SCGyR9iK
 ok0VEBTKnRJIfQE+QU2u2bR7pdbo+XnkVWC8Zz6wtBCDNQpfaRjH4spBqwSCMYHp+VwE
 4GfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PA7eGsEA
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

Applied to 2025.05.x. Thanks

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
