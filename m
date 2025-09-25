Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D115ECAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E7A661569;
	Thu, 25 Sep 2025 20:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Urpnq3xP3_CJ; Thu, 25 Sep 2025 20:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B784A6156A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B784A6156A;
	Thu, 25 Sep 2025 20:16:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B06C12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6693411FE
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RunBV5QLNcF0 for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9068641481
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9068641481
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9068641481
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:49 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46cb53c5900so15259585e9.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831407; x=1759436207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IgeHlu4atLiWdoahMWL6b+fywjecdTB/jb2tVRV2tVg=;
 b=e9RDz3weohQ4tNutbqAaMKsiwT+9ZrAgEjxAJOOvT22+4w4zExq0sOWd6a1KvEDzoW
 igdRO7QjjplQNKcbIgiaK52zXTpSMgLNYZBFGf+ZYL8aMFjG60lKNrp11KI8ZriEm5SX
 nLjhaN+2OHAQrdbaw7xkx8CO6ukHtSLRdKE7oKu5Ox/zQ+f6x1CmbJTIJ2M7kT3bqbGS
 XmcMRgFvPHMDPevLtL2yH4E1loE48fpx9QhCdXxd+QRmMZP7BmBffEBuTYLt38Hire8N
 vlN/JBup7goPMDg9wdXOJ0gpcLFn0Veds6+wAgkfw674mHEOST1qM+m/ci/Hs788r/Kf
 7yrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVudMsizj/OEFWIHwSlyh5pZhRiQstZWOqm7VmYHlUWRhVfEyYBHOUcv8c8pNJdZAODM7n7TZM4lY4=@buildroot.org
X-Gm-Message-State: AOJu0Yza7e8579H/5QmDGdWXhRDNszpLRXF0WEARK8a0B/zJiOjaqLRX
 wIWtQzVqT3EjIeXkqd9tCtZhMmmhpsjIGK8u+ou3ZPAK12FaD9IrjNmzNTTtmg42LXWL0pbNLYt
 gDDy/sCA=
X-Gm-Gg: ASbGnctz15JklmIr/IOGJFuelaoc1EVrS3gnsEu5nKa1awgnchmcvFsCHC/y1XdbNy7
 i9q+NGVSIJfjiMtm44sszgKdrSIn8N3Xsd1LtL+07oKqRflqnixocASmtBQ32nttCtQn5pv7SfO
 sapcyAjy4GySGqt10Xm22O8dFzvZd95cJIVdJjtMOcU+f8hD1yxx8GUFaJUgHjJJvJQ4SHi5kb1
 iSY3CcHZM2rY6ZmMj4cLDwwFRra14G85v9amfh9Rqc5CpNi2aoyoCWtrMU12pm+juR782ATe2kw
 7FrB56RdWLbfoks5l5Uh4vTQqGhiGDYsLK0PSnkxZG81ahSCY4LzTSSPGi/r9Rk86tKrAnIYpCu
 X4DNkJphCeWnpdq0=
X-Google-Smtp-Source: AGHT+IEyLTmzjL6dRsWv5IiKwj4bHcSSa+PM0MkoEW9RNfCYZPMoo4RqZ9Bny6Zy6Hy+gy8883X5SA==
X-Received: by 2002:a05:6000:420b:b0:407:77f9:949e with SMTP id
 ffacd0b85a97d-40e4745e877mr4069756f8f.21.1758831407607; 
 Thu, 25 Sep 2025 13:16:47 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89fb2fcsm4568493f8f.22.2025.09.25.13.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:47 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:46 +0200
Message-ID: <20250925201646.43549-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915221612.1606744-1-james.hilliard1@gmail.com>
References: <20250915221612.1606744-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831407; x=1759436207; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IgeHlu4atLiWdoahMWL6b+fywjecdTB/jb2tVRV2tVg=;
 b=QOP6uyH9NT0yCH7eN4j3EpE+BGMoXgvIErdT6Ef7STE1SIMQBjHgzaQhSx5bEr3isS
 EB9ckDyG9QpzuITMMBQZvyHfq6VC9ZsrQnYh34BWDB37yXhloGaCA2/ZtClYPZOclOms
 yZp7Bxfc8qtz0Xoq3Fe3POLgRGEmvRKzzHBWyf7PaKm13Dr09QPNYLrcJcxbOvmJqa3X
 XxBzIZGD3Q4hhjgO9D61jX5bAjh9OiTQ21soupUGe9a15V1gyBpSnBeH/WVQh5hWSq2P
 gCW4Dk68LJ+qyKuHA/unFYM2xGfIf13AIcZou7l9uNrdR9gDt9a42PJPL4gajsxVg+1d
 +Jig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QOP6uyH9
Subject: Re: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2025.8.3
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
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/python-certifi/python-certifi.hash | 4 ++--
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index bf722c97e8..723e2eccfb 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  e7e7a03aeed4290cc28cc62975aa0149  certifi-2024.12.14.tar.gz
> -sha256  b650d30f370c2b724812bee08008be0c4163b163ddaec3f2546c1caf65f191db  certifi-2024.12.14.tar.gz
> +md5  bb7ee7c24518dc4314ce7a83ca24263f  certifi-2025.8.3.tar.gz
> +sha256  e564105f78ded564e3ae7c923924435e1daa7463faeab5bb932bc53ffae63407  certifi-2025.8.3.tar.gz
>  # Locally computed sha256 checksums
>  sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index fe5b4ff690..996e451d33 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CERTIFI_VERSION = 2024.12.14
> +PYTHON_CERTIFI_VERSION = 2025.8.3
>  PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/0f/bd/1d41ee578ce09523c81a15426705dd20969f5abf006d1afe8aeff0dd776a
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/dc/67/960ebe6bf230a96cda2e0abcf73af550ec4f090005363542f0765df162e0
>  PYTHON_CERTIFI_SETUP_TYPE = setuptools
>  PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>  PYTHON_CERTIFI_LICENSE_FILES = LICENSE
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
