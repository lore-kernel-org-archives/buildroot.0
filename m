Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6883EC83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4105260B74;
	Fri,  4 Jul 2025 06:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id se1bxpffYPJt; Fri,  4 Jul 2025 06:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 436D960D9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 436D960D9A;
	Fri,  4 Jul 2025 06:47:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C21C01EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8D3B41009
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wq3lDSNob-bT for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:47:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93C5A40FA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93C5A40FA6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93C5A40FA6
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:49 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-454b1d0a115so1378555e9.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611667; x=1752216467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qq0uB7W/5B8thKs48U+cDyw4mngfJt+RoJk/gy450kU=;
 b=KNfM+pKVsg+WRQgpvbqqLLxSlfH0L2rg9+KQwOnmQjLaqPPvNWv8ch71nFjealpfwT
 A/T0u49fzPxM0Wu9ZFg2d5v3ayVxYVsCj780/vAG0I/+fW20Xq0YXIcAJiqUxNWab1aA
 LyovQNLzN/bvzPOL1gwMcQjItzu09iQmkxs4/PP8VZzh4NMTO43aY9w5Ke4uHB4r5Ys/
 jgYIYiF3UO6c137vWdW4o1iAkfKIs6Z9xEhhQ+tAMrxmkl9vzCK3vvrVcd8sRbwLNvLk
 bn6HHabO/BKUACUQQ6AO6FQoVoKLknheR9xxFOxV4Q6VihzTB6DJbbpAccOXAdOU5XwH
 pepQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqlx1DAZ80OY0pLZmcvcDaAjDymAWW0FdbVHZlgdynOjsL8IcJfsj6pNV7hfY2/keuF7RM2BGfI9A=@buildroot.org
X-Gm-Message-State: AOJu0YxNcykiisQ6m//EKsG+Beip3IayaIevHiMGyV8uwPkEdVKhGw3N
 ww6qR5m7hXR0p38AULCzyGBd4Xwy8tf8mfEFHMY/rNYvkHN8glgaeVoMJtpQpj1JtPo=
X-Gm-Gg: ASbGncuLULKeMJIRiK/36SAx0THoiNHhkz3/gfR8PNZhJdlqrDrs0tAqOTJxjJdCvt9
 mPuSvPb1tEQc65QCeBbINC1zLIid2B8GfztKhDQdFoMIUfr/EdWbXkBHKjyaTqoF2CaEyRhtXls
 mDQ+/KevExhdAKh4WQoDqVo8L9PtNk5EmFfuxhU4Vzy1fnLS8St/2aFUPO6d06/zSeq24Bu9aY/
 nmPqRfrxYJCZ+xiA3c02DVNr4rI/CLaENUfnVCanxl2+S44PXJ2Ahw+uZQVzhs8V8acghQaFUv1
 nUrou+4QQ3zCp07OlGEftr9xpaD3xmyGR7yUr749F0GH5wGYgrpX1+SRIDeod0veUsX37enSzBp
 0zyy6TYC9hg==
X-Google-Smtp-Source: AGHT+IEi/M0YzS/32V7wg6ly+xb4ew0a8sabHBOhCoy1HhYh0EO2Rj70uZITzUYKle2Npr76J6uh5w==
X-Received: by 2002:a05:600c:8885:b0:450:d5bf:6720 with SMTP id
 5b1f17b1804b1-454b5e9a2ffmr4161705e9.3.1751611667550; 
 Thu, 03 Jul 2025 23:47:47 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a99693f2sm47378075e9.5.2025.07.03.23.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:47:46 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:47:45 +0200
Message-ID: <20250704064745.4065025-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623173733.16049-1-ju.o@free.fr>
References: <20250623173733.16049-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611667; x=1752216467; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qq0uB7W/5B8thKs48U+cDyw4mngfJt+RoJk/gy450kU=;
 b=bjU/57OmEkPZ4Z4aph7jR9FOWfxS5Sf+H3EVUu8zxkRGQXySKjf0uosdS2vXHU82un
 taCEL4rCoHA1DyusSj3K1q4+bljP72vB10mZ0D3HEJnUPbck67hk8wN5o52ws7rBtvLX
 Ch5waDcmklBfgRQartTBTlDOcgz8V9d4YNcfPvvP6WzBkhlDcwrm6Qc11k+BhpL5BRT2
 xPyo3po3Zo9QG+DMJKP8eb31XlkexqXCMp6L+v46U/ljiIZ3wyKnOwv2RVTzDNQia78Z
 kuyQPMexW2mlWpegU/0rOVVDB8EUdjdCM5Fh/PPIesmvoQ7f/v8l2xZ4BP90h0gBxPoh
 p/jA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bjU/57Om
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

Applied to 2025.05.x. Thanks

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
