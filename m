Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0BFC83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 248A060ED7;
	Fri, 11 Jul 2025 10:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTgBTp35lPRj; Fri, 11 Jul 2025 10:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E212061407
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E212061407;
	Fri, 11 Jul 2025 10:44:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A6BF199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3114D40251
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OytZ-ccnis20 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 446E940094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 446E940094
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 446E940094
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4537fdec33bso11669405e9.1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230677; x=1752835477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BP7QRlee1/DO90KrTwcARnRMHoRdZGC6ddxZFe3tlbM=;
 b=cEeuKItOCU2I1P0ooAPZu/NBBfhxbviRsPG8i1xmLF8uLwlu0ZXvlFF0cd8afoicRP
 oJay8hv5voTArmBgqqCvPueUJCLQwXcLGTyE2ZbVqAryN7xAkpFXyZimQN8uqyEP3mwh
 XNieXtVojwObtMdjVwzlyMo/8zkBZfMZBx5QPvHyMAp6p06zbxguwX4hrM/ERr6M/64h
 SmWB12N6f6291Q5UGFtUUCqhGSK7+agfE6/Bf/3gV3XSk29NPByNmFbNcjLWeH1iaadF
 QaHqsq3KxG3+awXzYdVe8NrUYgY8/4pG7eNDQpsJD/EBs2FHSgoYOwbD8o7dK1lgx9DZ
 p7mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvR/hPap3sSX8unhRG/ttAYaf0+8dHOlAix6XiDyBlCGNXUXpVED6qcTSMyJxbdKYGDBZMGbjqTwU=@buildroot.org
X-Gm-Message-State: AOJu0YzMxOuXm5p5BiF026ZMamwmAH1p61L1/Cr8AajvXYL2mnZE/LWF
 d+QOprCM49mZDj3l54M6vv6u18abPHBHDu+uLRSKiINP5iX6WHGYto2KKempHrvxulI=
X-Gm-Gg: ASbGncubHYu9/emFZ891Ea46O1+8WHXNp4deCYLslSAhpMT3POCnTnk20F1fLKCesBI
 zzEFTko2VehcLoIryJaNkkH9lWUM3TCkZLaKpsUP03vGvKLPh8hxpl9+aORjo5vX4xlxPgsqtnf
 BsqmGAYMHD5w53B7vgz5LGrLV3a31nWaRgwIB5jSe/GxBhjBkZ6CNbGbylyLU9kpzdu5ZbsWL6/
 Tds7VK84KKKWCrnAnH04NCfoRPEhdrljq6WhvlgO7IxpZVoguBzNorL3cOXsoIzCM8wke7CUQdM
 VEJKW69n8QOiN+nISIA26b0VxJQD/F5flTswR2hFzuUKHuGK7QHh39fEBFS3x9/X6jzIBnXib9q
 J9vsAVKg1T+GFCg==
X-Google-Smtp-Source: AGHT+IHHzpJBxjG3Zio3l6rVPpJtwMGX34qht5FTNQ8p7FdIfRLLrNYqve6rJXrVb9BK+lxr84QbPw==
X-Received: by 2002:a05:600c:c176:b0:43c:eeee:b713 with SMTP id
 5b1f17b1804b1-454ec263d7cmr18464675e9.20.1752230677270; 
 Fri, 11 Jul 2025 03:44:37 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd437fb0sm43961195e9.5.2025.07.11.03.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:36 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:36 +0200
Message-ID: <20250711104436.823387-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250701162116.1319941-1-titouan.christophe@mind.be>
References: <20250701162116.1319941-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230677; x=1752835477; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BP7QRlee1/DO90KrTwcARnRMHoRdZGC6ddxZFe3tlbM=;
 b=XWHymXfdbfPNl8MYWonWHGlNUe/fUJnpD0ARIKAtNiLmpm1uFMVUUaEea91ToP5fac
 L5S1z3ej7APiaj8dZjNH05d50Vj8DU/A17YH/31Ouk6KujxqeUv8AdyuLINE6dLWHc0k
 gMGOduMOwyu/jyA+Kis61OI3JnwZ4YQ5Kj9uAAgZyvt3fJmG8eYN937yBP8nUjRddKrx
 cTZW/yVJ/tLEmLYh9tx9xeWctstuK7nl2sCd1SXtm4SRjZmrd7Z7/zk9vtkGgrJgXjjd
 bvfSQFaEiNvV1XiCJGiDYdD5r1zzAsRqoAYiB1IlMZTGQtg+9CkjW4QqGvKltUH2oMb5
 OlTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XWHymXfd
Subject: Re: [Buildroot] [PATCH] package/python-urllib3: security bump to
 v2.5.0
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
> This fixes the following vulnerabilities:
> - CVE-2025-50181:
>     urllib3 redirects are not disabled when retries are disabled on
>     PoolManager instantiation
> 
> - CVE-2025-50182:
>     urllib3 does not control redirects in browsers and Node.js
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/python-urllib3/python-urllib3.hash | 4 ++--
>  package/python-urllib3/python-urllib3.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
> index 2391108e26..f4162882f7 100644
> --- a/package/python-urllib3/python-urllib3.hash
> +++ b/package/python-urllib3/python-urllib3.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/urllib3/json
> -md5  787104cdecd70e6688713f8a079ffd3f  urllib3-2.4.0.tar.gz
> -sha256  414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466  urllib3-2.4.0.tar.gz
> +md5  2b8a86438e4d35fbc90572dbdb424759  urllib3-2.5.0.tar.gz
> +sha256  3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760  urllib3-2.5.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
> diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
> index 7294742909..9ec6c7f3c0 100644
> --- a/package/python-urllib3/python-urllib3.mk
> +++ b/package/python-urllib3/python-urllib3.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_URLLIB3_VERSION = 2.4.0
> +PYTHON_URLLIB3_VERSION = 2.5.0
>  PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
> -PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/8a/78/16493d9c386d8e60e442a35feac5e00f0913c0f4b7c217c11e8ec2ff53e0
> +PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/15/22/9ee70a2574a4f4599c47dd506532914ce044817c7752a79b6a51286319bc
>  PYTHON_URLLIB3_LICENSE = MIT
>  PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
>  PYTHON_URLLIB3_CPE_ID_VENDOR = python
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
