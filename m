Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1786BC282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 05:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D6280EAA;
	Mon, 10 Mar 2025 05:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvvvQZ302BtU; Mon, 10 Mar 2025 05:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAFB280EB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAFB280EB9;
	Mon, 10 Mar 2025 05:52:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 415F01C1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 05:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E36A40627
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 05:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1YGkh1fwpYw for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 05:52:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C279540566
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C279540566
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C279540566
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 05:52:56 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-224019ad9edso86732585ad.1
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 22:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741585976; x=1742190776;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u6CQRfvyfmY3v2TnP4czesvYquVCN6HPgFOOKBOtIRg=;
 b=qpumCNdUtr/GN8oaAkxNe4zWKE0o17ny/X/itUnz9m/LWopAgGTmG7Vpy8suDPlJ5K
 MxlXsB7vGN+p7Gw22+CvlGpakv0zHV2UkhKPeT5jh6d06CuXri7629nKoG+b+8j+7ALS
 wd0hJAdx4bWRBjcHW+04tIOq9HeNaJ5MduY5UaXcL0OewdrsoOK2V3qv/lY/syydaZBb
 cyjVr3OV55tE15uymAdtbKfXya/fXN2+NOeO8oTEyjIlsejOjM+Ev7jqa5SIas7bzFyb
 bUptuBakvQ5fpND12/UB+HHeQ2ao6TqKTEdrhg7v5N3yDuASMvif0P4Asz2yT1SbQy2m
 ng2A==
X-Gm-Message-State: AOJu0YwSlhHFfgFxQ5d7xDG0GX4Ng2UN2n+Ceaaa7Iy0j2dXnX8uLGlH
 RUm7bgw248Vo1U8ftLm+7OVf5w7xxJ024lB/cYp7ExkbgI8erblA7nIX1eD1qyeMmXUYBQfb+B+
 d
X-Gm-Gg: ASbGncv6jSq+WL7XolHyHMMQRQWwdiBBb3iqYbhjtin6xGrUoybJ1FiWA01ySVMaTZ8
 ssnUiCaGMM7RS6rMLXh5tUi/olFgrsHgdB21yEpQTQnOLR8l+b6xbML7652bvn/zRTWCPLB1ZwY
 8qbVDER6DydYrsD0jCVmx/uX5ZVgRPjtY+njTVRK6+bjVOeI6cEbwLVA+7dePe2Kg1vja+CSKis
 ESlzqjR4kJS8DOBg2y0g8jd7MvVk3mG8xu6mIdV7lHMRJJ5Az2FRrOELF6knknTNP2AQ8Y9Wc/t
 TqPFTvY827fTKgjgKVPSbZI6ha+jU5ln97H7BLM=
X-Google-Smtp-Source: AGHT+IHflxOg51Hj1MKNajViulVT+CXILR0Wa1Sy/YqL3vXc5nu1QsT9aiaBaXLKHKvGzDyvX3y/Rw==
X-Received: by 2002:a17:902:e84f:b0:220:e896:54e1 with SMTP id
 d9443c01a7336-2242889f4e7mr174612115ad.26.1741585975832; 
 Sun, 09 Mar 2025 22:52:55 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:677:c5f4:a978:3253])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410a7f773sm68978965ad.117.2025.03.09.22.52.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 22:52:55 -0700 (PDT)
Date: Sun, 9 Mar 2025 22:52:53 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: buildroot@buildroot.org
Message-ID: <Z85-NfSRZVA9VxK6@ghost>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741585976; x=1742190776;
 darn=buildroot.org; 
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u6CQRfvyfmY3v2TnP4czesvYquVCN6HPgFOOKBOtIRg=;
 b=H0GAg7D8rm0KmfRaScS7j4ZspoFHZNN7+SqBfnXfEK4a5ClopVyGnzEK0byP8/30Ss
 YBBB2QbXuJYU/XuMzrfILhSRh1Jn4/d7SMjI2iB1hICgeaYxk+8noPd57pULteu8oIa6
 rHjeoVsE9T+T9y51NNr8xcpDgT+PDbEpg6ywG+ctv8dqhaV+ApbE5RfTiXJsJZXvgGAt
 JQt1J/v4pMJn8SUxZdmbXjiX6XxlCTAETF7ePITXE1hW2N0STr92cgdHH21Zlz4kCc8H
 o+7ECbBknFDnNEfMsSvtfikTSM+RWZD+7rxr4hounS/aDSxK4j1R3rkmZuoHNQyyAVKu
 75cA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=H0GAg7D8
Subject: [Buildroot] Crosstool-ng external toolchain with
 BR2_ROOTFS_MERGED_USR
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I am trying to use a crosstool-ng build toolchain in Buildroot with the
BR2_ROOTFS_MERGED_USR option enabled. However, crosstool-ng installs
the sysroot libs at /lib instead /usr/lib as BR2_ROOTFS_MERGED_USR
expects. I am not sure what the best solution for this is. Should
BR2_ROOTFS_MERGED_USR be ignored for toolchain packages when an external
toolchain is being used?

My crosstool-ng config is:
CT_CONFIG_VERSION="4"
CT_ARCH_RISCV=y
# CT_DEMULTILIB is not set
CT_ARCH_USE_MMU=y
CT_ARCH_64=y
CT_ARCH_ARCH="rv64gc"
CT_KERNEL_LINUX=y
CT_CC_LANG_CXX=y
CT_DEBUG_GDB=y
# CT_GDB_CROSS_PYTHON is not set
# CT_GDB_GDBSERVER is not set

My buildroot config is:
BR2_riscv=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="<path to built crosstool-ng toolchain>"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-unknown-linux-gnu"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_11=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
# BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
# BR2_STRIP_strip is not set
BR2_ROOTFS_MERGED_USR=y

- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
