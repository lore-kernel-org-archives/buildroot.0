Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF08CA9EC8
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53CBF60B9D;
	Sat, 10 Oct 2026 09:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pU13KmBK4grI; Sat, 10 Oct 2026 09:24:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1C4F760B48
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624267;
	b=OSPAEie6LzP5+KXne0w8xjyEyjnIlZC/bSK0LuNvhk7942QoYPbikNQNhme0HEa7y3hK
	 DjYF/fJelDANxI+MvsmJx8m+R/nTOiAyvNRZL97SXo/QwCcoLsQ8ADrpw+TlRO5Md3+OF
	 HxpARp6QpMOtFIf27ymh4T2TYIFWKgOBJ+qcDNQC0Y98AIVqQ9mo/aWSERZpHsSANVL+X
	 TEcJ9z3dhhgHXNnjJuytDQDgh4AcTh3P1YgXiPi5iYDHF5JVdzjn7ffCLIoFVUtJ45Z3y
	 vLvj87Zgvd9X7xY561lrgma6GUSdRsyWxb/+/JGOyzkkO5aOag5uYxG8J3KvmHRxedQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624267;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gG9tjCMDxYDEOZx2p9+nXC/gU86q30uBIdlpk1jE2rA=;
	b=oE9LOEfizsvJ4hErI42E1xGIAWQ1K9Axp2Kd0ZjVTieUgrxD7MRcnAZ05ek/DSrM5e9C
	 wZluj06SAp+Zud0eN7RIDMXpfylfK0Nb+ARcQnnWmPhI+OaAeX9cjb0Hc8LBDLcKmnAMD
	 EZLTgkbWN0B1Q3dZNO/hiaN6OtIpm4qUSrwVWTIX8FEDxT+ctkaka7+SBCXPuUoN17R48
	 5AvPvohheRUGmrYJFqnk1UHesL80uwe7KbNgp0i+ux5VG3jRNqxh3S/RmMi9CkRhVOYfn
	 zV4j+7akkhwWTXuGb4b8Rxok/WvFPs8Wf+PSoY2/Cy/mwcCqArIXnj3+DQ6zVd2pxXw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624267;
	bh=gG9tjCMDxYDEOZx2p9+nXC/gU86q30uBIdlpk1jE2rA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GxQRjeJf0pGyYGJBzgWzlqcsFQLqeu4yCdEkHXjMmvyKoc2JLILTuA4Wssw1Q7x5G
	 CDyTw7fz+MaU4bYT/qKOLvpf/e0EmGdIzSEEEP1p29wxx6ReGTsG4yM5XPPfXv45Gx
	 e31UC/snozEwHgbAnSrhiNL3M54znGevtKfNe/KeDRkNqb274d+cUrw2M0R2cX/Vsg
	 neuPGZ1AHlkpYQoxtX+m7vH5nEH3EXoUSuiilmbKE243hxnDMCNH8d1s77lNB926K5
	 TZ+KXrCCo63XoUfAWmTV7TGwGJgez0PVIlUGSJ113sWBF9/869xUrhi8vtnkQOHVOy
	 uf9gF0BE3rk2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C4F760B48;
	Sat, 10 Oct 2026 09:24:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D22F356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F750400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXtMGRKddusZ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2006A40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624258;
 b=Hc0cAdkUf2nw461Vs0YHd3cmrCpnYriAfkylUcWP74X5weBgeUxPIhwtzoScDMJE0iI3
 aOfBjHL6TWRsiCHwDKey9322x8RnrZ9IHmyd+GDnwrZ3MP7AQ63ysAaOfwsguZjaPcZmj
 eOrtMHQkSupTNODqB6EFRy4WoFbbgJnLjy1qVmvApvdeXOdXP9uEXYIaIYdmEvCQCAJ9/
 YvbXu/Pb+GDAp8nCFi51xJa8g4rfQMK8B4+rK/9I8S0OSoWHjKDo58TTwRtIDCA9RatSZ
 XapxxvQsicGThG2JnCRyUluuOx6rkbsKwnWmYrNC/8GxOdmHj2SUHMTzXb/WHJ+EjKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624258;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=cS/GMuBwXAjXDHECXO5U5fOAHjxX772YsDG0qdv1Tlg=;
 b=ESR5HdDeZgv+Mgx5rJhJ/B2VeeZurci48pmraQSYmnZ977umamTSmZaChl3sPbW+M1zE
 QnAnal2TSy1T2AJrwbIkjURNDSTtQ2jH8zNciUe3df64jQ/zNYpMjK+K/stpc/XOOYwBR
 RtVngHxtVBjw8yjj5Um74/rwTSc3rx/6p5eHsijfaCuoxWq8CrAKp9p0X20ySBkCrja/+
 LkLTWD9wpoYLNHTZ5vm6KUAgE6ZC9jetUW3qsdtmYDKx4IaVzTqKCJOJCAaIb7CnUfyQY
 0tq+8vHG2Z3x9n0LDlYYvR3H/M5xySe8B/5fLDk3iXJbR+pVU7HgDvmSmHVhtrUUKHw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="TtAn/0Ez"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2006A40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:17 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48b060ec084so260328f8f.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624256; x=1792229056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cS/GMuBwXAjXDHECXO5U5fOAHjxX772YsDG0qdv1Tlg=;
 b=WZ4K7KVHQ6TIdP0FYaWuNO4padokbRzxWvXxhYs8afeHHvUShI86+undL2SbvNKFrG
 T+TMVJ4C0sfWcwPK9dSVAW/tWgTo6S7rR6xaQoovN/qz7bWjQR6chOqPKPz/3i/jQJ17
 Y1sE7NCAkYyNjXS2jgX7qnQDMtXwSlyhvvNAFAVenLVkBcRbReVolztbQjRcxRbZgS9O
 zTtsDbBHiqSvvk/fHBMAAnTfb7EK5oCOiuokRUp72XQMNR+R9WOuBj1+y2vtSVO/Stkv
 xVUKJ5McFJFJa5HmY/6nKZq+XOSCNV+wopXf/HGoQhqN2CImWsVnycUFp57qVysyM2tI
 CFDg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzO9CcVu315ac2nlvapSQ+a8unSI1+FdQTg8Ux1y4+Qly6ZKLXCOJdbZvXYpDNXnTx5RlTCzGdbaj0=@buildroot.org
X-Gm-Message-State: AFq9FYKF5Mrz4cWlf2k5aCBfMK5p/HBDR+1CWS2AiS0AAVJuCPL2q1uW
 EN01i2Wj2aFPm80lnIzygaigtSMWK1uO+sYbCr1xuNDvhQvhKQOkNLaSxC3q5VcJ+oc=
X-Gm-Gg: AYBFou2Y1J/XRWmO67XFp8lFqOQh0M2aSghQr4hNFvXbtz7ZMy4c6Czvu4g5CgndZbD
 IMrWtEZaNUc8uVdrpxcfzhZwalDHMdWuvXMdGN0KG+lQ55C1Jelz0w9aQYFEsfV1KK1NGDFdgz2
 Zx9foy3ReIJa8JYd7kB4CBw/95roRSpxIZaCLpKoAt2c53q3fe5IQLSiqlv7JUnVhAbW8yCYue0
 x9EyWTq0qjR9sz1Jgvqe5y8zb0zUCZI1wiUqevkijCIy7IcR7JRZVsMLz7rxuzXbi69ZBsmFkw7
 AymrXakmH/LNJUbx9DGQbJ7OiJlc1Y48imZQsHPTAs8S2HrOIMN3B9QSDmCw/SGjWDnwibbs9wv
 MXLOkFsZsCU94NXAj0Ql635iJx35dr0hkIzzbsWnIDEjmQCYoK5tPYE0zqp5zbcEXNnvROIalW1
 sHBhSiJOhIBhRaHilE7FMlMnz4QlWbuTLc7fMlKUjf9ivgvYdVY1PLUsG9dCWnlAIziKaLBQ+Ac
 g5rEyV/S+InLjWp89P0FhZL0vh2R4fPIQq5DM+9tngyto+ImJnTTuAt
X-Received: by 2002:a05:600c:6215:b0:49c:fa20:cbfc with SMTP id
 5b1f17b1804b1-4a18e4b72e4mr67735235e9.19.1791624255646; 
 Sat, 10 Oct 2026 02:24:15 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be8c601sm118227795e9.3.2026.10.10.02.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:24:15 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:24:14 +0200
Message-ID: <20261010092414.140068-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003151639.3618082-1-fiona.klute@gmx.de>
References: <20261003151639.3618082-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libseccomp: security bump to
 version 2.6.1
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
> The upstream changelog [1] lists three security fixes (without CVEs):
> 
> * Incorrect 64-bit comparison merge in libseccomp can weaken seccomp filters
>   https://github.com/seccomp/libseccomp/security/advisories/GHSA-4q85-33p6-j5g6
> 
> * Oversized seccomp filters can trigger libseccomp double free
>   https://github.com/seccomp/libseccomp/security/advisories/GHSA-46fr-jh49-xvhx
> 
> * Oversized seccomp filters can trigger libseccomp heap corruption
>   https://github.com/seccomp/libseccomp/security/advisories/GHSA-2hqh-5c36-grrm
> 
> [1] https://github.com/seccomp/libseccomp/releases/tag/v2.6.1
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/libseccomp/libseccomp.hash | 4 ++--
>  package/libseccomp/libseccomp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
> index aaadc8424e..58aee03e6c 100644
> --- a/package/libseccomp/libseccomp.hash
> +++ b/package/libseccomp/libseccomp.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/seccomp/libseccomp/releases/tag/v2.6.0 (PGP-signed checksum)
> -sha256  83b6085232d1588c379dc9b9cae47bb37407cf262e6e74993c61ba72d2a784dc  libseccomp-2.6.0.tar.gz
> +# From https://github.com/seccomp/libseccomp/releases/tag/v2.6.1 (PGP-signed checksum)
> +sha256  501f66c667225d53791b97e1d7cf85ab764c297d04881f60f38f451c4b0ee1be  libseccomp-2.6.1.tar.gz
>  # Locally calculated
>  sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
> diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
> index 26585b1887..e1d1271d71 100644
> --- a/package/libseccomp/libseccomp.mk
> +++ b/package/libseccomp/libseccomp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBSECCOMP_VERSION = 2.6.0
> +LIBSECCOMP_VERSION = 2.6.1
>  LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
>  LIBSECCOMP_LICENSE = LGPL-2.1
>  LIBSECCOMP_LICENSE_FILES = LICENSE
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
