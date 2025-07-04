Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14998C83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEA2260B89;
	Fri,  4 Jul 2025 06:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQRfpE_mxMx0; Fri,  4 Jul 2025 06:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E262B60B0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E262B60B0C;
	Fri,  4 Jul 2025 06:46:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B50A1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F14C160B0C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4lzEtyfEmLd for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:46:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C324A60AF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C324A60AF5
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C324A60AF5
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so469671f8f.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611596; x=1752216396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PCisYl5ty8bKGj6gC5rZ2XhiEnwE5WeB2+ivqDK52dY=;
 b=Goef6jgRUuGLSVHWHDjptHhGaocTlBsBLWvvP/RHuk4EkCQQmIpTpps6tiP5lbShS6
 snjjQDZ0gwxEhs4KJHJn5RUJOV+Brde3x0eAl3wIsueqHS5vdKouezIeV0PE2EiroZGN
 dNuOl8UwZSGaqNPxwPvxweVtan4eOK60H4OphNWfzszwps+BG1a7Ga6e8UUMbWECMTUo
 qaO9zerd9ugOVhs6alXeE48S1SjJuuqfeMdXhBgQxudLQlp+1lvlDxAE/WaHz5Yb3Z7d
 2md4cSkpiOdriIIelgmRMY86g5OtpnQ9BQi29CwKtZ76DcVn/c2Vec6yu1SyWSWL3pnY
 +x5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc8hjT7ywx6+ZXxFRp/vM0Wy3RaBFVxM22nqZgWTdg3sOHuq1iTuPtCCoiX100Numyk7DdjSuIKkY=@buildroot.org
X-Gm-Message-State: AOJu0YwM74Onfs6aojCSrkhLY/uKWDJ/y9iVAOzNqpl8e5XRAhrkMG3h
 Q+dZ4P5oU/edhgs/FUgvbxuA3/kducoMZ54euefo+6G5U3QIw5DkxjMD9kT+pDux9U8=
X-Gm-Gg: ASbGncsXwqsteVyaToMuAJtHtZJBsl1d/BPNshV0LMgeJTe3A0LC2OLxPAcRwPe1to1
 FeMecg8ltOsqJ3sTjjjAAEf+Nh51p2fR3bGJPLXNoYh9hpwAqFL0vs/e/saR0qCF6D32eZ25lKw
 L/qh6O6QfVF2Stj6IvYn9afsueBdFQSvvV7bu4u2t5ZQEUawoX0yyQy9wzlbz29sZtDRF+Zb6lB
 Mz7EcgaOJmeNZB6Jce+6wA+uezCJDm+SaJSQUCS0sAxZk3XT6YUSQw/bY8uDIBYpKEckibCgm4d
 bmNpSbUsdVRKlTjTr0kuso6eA+l2BtVyWR6UZ1LpzrCsQCYPMijaJOsaWxxJF4c2sZS7fy+I7Zu
 9qL1mImOZ/g==
X-Google-Smtp-Source: AGHT+IHpK947g5dbGFpXmi4esXOYkRmheKA14SKDDR8vJPCoOJ3cpFciQPPwvpgt2oRIm9IQS0kFTg==
X-Received: by 2002:a05:6000:3c7:b0:3a5:2848:2445 with SMTP id
 ffacd0b85a97d-3b49701293bmr581892f8f.16.1751611595760; 
 Thu, 03 Jul 2025 23:46:35 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225977dsm1637080f8f.73.2025.07.03.23.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:32 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:31 +0200
Message-ID: <20250704064631.4063696-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623173733.16049-1-ju.o@free.fr>
References: <20250623173733.16049-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611596; x=1752216396; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PCisYl5ty8bKGj6gC5rZ2XhiEnwE5WeB2+ivqDK52dY=;
 b=JVcNtY3NcTyDJi81tcHSOevSo4+CP6LiEAa/qmFUGikcLf+FwK8255GJwfpwr18qT6
 /+TCwbexKhtAT8+8eXnyFwfyPs/l7RO29jUwQvG3hr7IpN9A4DDgUyif4imd42YaDqsA
 1Mx+egZZePtOqGbjzDiAKerIx5XwuaSJsObcPtMzsYRWViSuVGWxps0HiarLUfHsb4Wq
 DLZWV5eObMYbf2aQa6CBsKXTDISmgjMXesGoG2MZsVR7HY8NA28d66xdONTdESgtGQRA
 kbx1hIpycNTphyRlNTMhAphUnr96qEynWHYgQB8WTCqtKufO+PY3+mHYHG4wTqtRjz1Z
 SIvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JVcNtY3N
Subject: Re: [Buildroot] [PATCH 1/2] boot/edk2: add security fix for
 CVE-2024-38805
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
> This commit adds a security fix from the upstream commit:
> https://github.com/tianocore/edk2/commit/b3a2f7ff24e156e8c4d694fffff01e95a048c536
> 
> It fixes CVE-2024-38805:
> https://www.cve.org/CVERecord?id=CVE-2024-38805
> Note: at the time of this commit, this CVE is "reserved" by a CNA.
> Details will come later.
> 
> See also the associated pull request:
> https://github.com/tianocore/edk2/pull/11042
> 
> This commit also adds the corresponding _IGNORE_CVES entry.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x. Thanks

> ---
> For convenience, I also published those patches here:
> https://gitlab.com/jolivain/buildroot/-/commits/edk2-stable202505_bump
> The Buildroot mailing list may change EDK2 patch DOS newlines which
> makes patches not applying with patchwork.
> ---
>  ...Dxe-Fix-for-out-of-bound-memory-acce.patch | 75 +++++++++++++++++++
>  boot/edk2/edk2.mk                             |  3 +
>  2 files changed, 78 insertions(+)
>  create mode 100644 boot/edk2/0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch
> 
> diff --git a/boot/edk2/0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch b/boot/edk2/0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch
> new file mode 100644
> index 0000000000..4cc66eb0fe
> --- /dev/null
> +++ b/boot/edk2/0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch
> @@ -0,0 +1,75 @@
> +From 0a3b2a29b96b11fb858974044359c806c6b0a111 Mon Sep 17 00:00:00 2001
> +From: Santhosh Kumar V <santhoshkumarv@ami.com>
> +Date: Wed, 7 May 2025 18:53:30 +0530
> +Subject: [PATCH] NetworkPkg/IScsiDxe:Fix for out of bound memory access for
> + bz4207 (CVE-2024-38805)
> +
> +In IScsiBuildKeyValueList, check if we have any data left (Len > 0) before advancing the Data pointer and reducing Len.
> +Avoids wrapping Len. Also Used SafeUint32SubSafeUint32Sub call to reduce the Len .
> +
> +Upstream: https://github.com/tianocore/edk2/commit/b3a2f7ff24e156e8c4d694fffff01e95a048c536
> +Signed-off-by: santhosh kumar V <santhoshkumarv@ami.com>
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +---
> + NetworkPkg/IScsiDxe/IScsiProto.c | 29 ++++++++++++++++++++++++-----
> + 1 file changed, 24 insertions(+), 5 deletions(-)
> +
> +diff --git a/NetworkPkg/IScsiDxe/IScsiProto.c b/NetworkPkg/IScsiDxe/IScsiProto.c
> +index ef587649a0..53a0ff801d 100644
> +--- a/NetworkPkg/IScsiDxe/IScsiProto.c
> ++++ b/NetworkPkg/IScsiDxe/IScsiProto.c
> +@@ -1880,6 +1880,8 @@ IScsiBuildKeyValueList (
> + {
> +   LIST_ENTRY            *ListHead;
> +   ISCSI_KEY_VALUE_PAIR  *KeyValuePair;
> ++  EFI_STATUS            Status;
> ++  UINT32                Result;
> + 
> +   ListHead = AllocatePool (sizeof (LIST_ENTRY));
> +   if (ListHead == NULL) {
> +@@ -1903,9 +1905,14 @@ IScsiBuildKeyValueList (
> +       Data++;
> +     }
> + 
> +-    if (*Data == '=') {
> ++    // Here Len must not be zero.
> ++    // The value of Len is size of data buffer. Actually, Data is make up of strings.
> ++    // AuthMethod=None\0TargetAlias=LIO Target\0 TargetPortalGroupTag=1\0
> ++    // (1) Len == 0, *Data != '=' goto ON_ERROR
> ++    // (2) *Data == '=', Len != 0 normal case.
> ++    // (3) *Data == '=', Len == 0, Between Data and Len are mismatch, Len isn't all size of data, as error.
> ++    if ((Len > 0) && (*Data == '=')) {
> +       *Data = '\0';
> +-
> +       Data++;
> +       Len--;
> +     } else {
> +@@ -1915,10 +1922,22 @@ IScsiBuildKeyValueList (
> + 
> +     KeyValuePair->Value = Data;
> + 
> +-    InsertTailList (ListHead, &KeyValuePair->List);
> ++    Status = SafeUint32Add ((UINT32)AsciiStrLen (KeyValuePair->Value), 1, &Result);
> ++    if (EFI_ERROR (Status)) {
> ++      DEBUG ((DEBUG_ERROR, "%a Memory Overflow is Detected.\n", __func__));
> ++      FreePool (KeyValuePair);
> ++      goto ON_ERROR;
> ++    }
> + 
> +-    Data += AsciiStrLen (KeyValuePair->Value) + 1;
> +-    Len  -= (UINT32)AsciiStrLen (KeyValuePair->Value) + 1;
> ++    Status = SafeUint32Sub (Len, Result, &Len);
> ++    if (EFI_ERROR (Status)) {
> ++      DEBUG ((DEBUG_ERROR, "%a Out of bound memory access Detected.\n", __func__));
> ++      FreePool (KeyValuePair);
> ++      goto ON_ERROR;
> ++    }
> ++
> ++    InsertTailList (ListHead, &KeyValuePair->List);
> ++    Data += Result;
> +   }
> + 
> +   return ListHead;
> +-- 
> +2.49.0
> +
> diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
> index bc4049b2de..ad88835f8f 100644
> --- a/boot/edk2/edk2.mk
> +++ b/boot/edk2/edk2.mk
> @@ -14,6 +14,9 @@ EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
>  EDK2_INSTALL_TARGET = NO
>  EDK2_INSTALL_IMAGES = YES
>  
> +# 0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch
> +EDK2_IGNORE_CVES += CVE-2024-38805
> +
>  ifeq ($(BR2_ENABLE_DEBUG),y)
>  EDK2_BUILD_TYPE = DEBUG
>  ifeq ($(BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL),y)
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
