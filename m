Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDB4C87FCB
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 09:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0744561455;
	Tue, 12 Aug 2025 09:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puMSI0ZlPsN6; Tue, 12 Aug 2025 09:28:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 298B961456
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 298B961456;
	Tue, 12 Aug 2025 09:28:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 676F9158
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 09:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 594DC419E7
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 09:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9XBNKxz73x7 for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 09:28:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=victor.krawiec@arturia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64D04419E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64D04419E3
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64D04419E3
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 09:28:53 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-459d62184c9so30960525e9.1
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 02:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754990930; x=1755595730;
 h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jNW+4V9H0A203otqQh/TLUmt1t69/wBoAlv9rxgvxuw=;
 b=o5J8KguG3KjNGRuQcMGK+tSbve5dZrSv53ORP2IrgIgbOrFhlPSLh1kl8kZLunRGXm
 nkan+PDL3YJnd+Hbwn+xiYXoi1Tjuh+oIgZiFyDZ31SBNnP5U0ElSv55brw86m2yIXjR
 gfHh7l8TOsxwFcOTO6jadQtindclweoGdnEMT5/ccq4vyiJo2NDSrrrLWVLr8CHWZyRl
 wU6FSfCBcxcQUxiJRKE0qvSYSFR3zwqOn2l+YYHJ2P0neGxktAhBjiN1uuxvN/Bsh+V1
 UcRG1bBlkrgmwKZVmhImQ7Os9+pfLnrJQFOeTLolV3Czsc+LZJbvQNUZXf/X2S/zfTtS
 TsbA==
X-Gm-Message-State: AOJu0Yxg9G9+3LXnT4d0jMMGW9cJnWCRwtXlDpr/bHa2neboETKEyqwH
 s+YkeUMXsre2C5wAH0P8HJyy1NzqjouJTN6Z5Su1iqoiHyaPvfL4tivmtxxplxpvVMDAI67UjRj
 Eb00MfdicHLnTy5CvGXJG7g8YwCP2u8uBMjQ8EWv0uf3NuQjZbKOi63hyWVvFMemnpfndN1OICk
 voADStX/I8ZQ1J2X6AwBAPBz8q1S2twAUyAvY+40lMDvQxj/HRiVel
X-Gm-Gg: ASbGnctIp2kbasZ3JwfTm8eW1RFOu3qhiDkutEbMIzGKFu2e3TbbXWMTeEIP5B20shh
 im/3KTcHbCH8HDCQDGaD+LmU6zSYBa/V+edxauxs7uxhLjNPl/CmPLGrctf+S+ZF4qF86Waa1dr
 Cyd629SSBgCf3+JW37pd8k72yRCKPm0nQ2BlwLtJR6xpqWKhohSsTvDBN2DUzriI1ngbbcYFpRB
 OT1I1sprk41sS7qisoxcOPEgNrYrIF4oUCAXyTnXAXxQ7vSwcS+2q9UnCRjOM18YX/AYetCYEAD
 L7HxfAecv0Tuih78LWx+fLFV/OE08L43JWEufR+7pbFacJ+etDZ1BQwumWHYNu9A4EMkSODzw04
 lzTfKUL5X+H7Oz7ipO4272ATfty1nviUA9mRRh4HhwwTV/yE=
X-Google-Smtp-Source: AGHT+IGKCr0a0BEoQiFnpPd+AfcpwX9uqWtBv/vtg6rtNdXFoPNcorsXIZlBZ9n1iKsIr2+u6dZH3A==
X-Received: by 2002:a05:600c:4f4d:b0:442:c993:6f94 with SMTP id
 5b1f17b1804b1-45a12040c8emr14637605e9.12.1754990930507; 
 Tue, 12 Aug 2025 02:28:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb15:854c:e000:c8aa:a969:2c92:5e4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459de0d4cf1sm352954415e9.13.2025.08.12.02.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 02:28:50 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 vkrawiec <victor.krawiec@arturia.com>
Date: Tue, 12 Aug 2025 11:28:46 +0200
Message-ID: <20250812092846.24342-1-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250120162808.1219036-1-victor.krawiec@arturia.com>
References: <20250120162808.1219036-1-victor.krawiec@arturia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arturia.com; s=arturia; t=1754990930; x=1755595730; darn=buildroot.org;
 h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=jNW+4V9H0A203otqQh/TLUmt1t69/wBoAlv9rxgvxuw=;
 b=pW+vvuIQvxcUAXFvxlhPulgjAV2Hzk0xNCrLg/IMVjCJg6m4WIfdxTNoKbrg+/Lrjw
 n6MIUavvM3Po36+Ya4xrWh7j15BMdHZYhcO5BdHa3/PkTfOeOshAF5BGJV+dVXECcQXl
 +MsJUnL7JP6beyvXJqraq6/78UIOH8lWiBEDYq3ngIlNEudTcUvBkHJtSw7kdPeEdw9s
 nlJ7kX6PYV910NtmSkvuOt0y3k016AGUUEGyBcHR+k6bBYnW8A2onJX6V19w1g1cBRlX
 kF5bOvtv+1TF1Uar4AhfTaVjduhaMmBp0nravr9m5/ekaieWcxTnSM3Wriy/+1VspSvh
 /0/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arturia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=arturia.com header.i=@arturia.com header.a=rsa-sha256
 header.s=arturia header.b=pW+vvuIQ
Subject: [Buildroot] [PATCH v2] package/llvm-project/lld: fix broken symlink
 in SDK
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

From: vkrawiec <victor.krawiec@arturia.com>

The symlink bin/lld -> $(GNU_TARGET_NAME)/bin/lld is broken inside a SDK containing host-lld package
The symlink still points to the location of lld inside the build's host folder instead of the location of lld inside the SDK
In consequence GCC is not able to find lld linker
Changing the symlink to be relative during host-lld installation fixes the problem

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>

---
Changes v1 -> v2:
  - Change SoB line to use full name
---
 package/llvm-project/lld/lld.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm-project/lld/lld.mk b/package/llvm-project/lld/lld.mk
index c9a2d3796b..e7233e74ae 100644
--- a/package/llvm-project/lld/lld.mk
+++ b/package/llvm-project/lld/lld.mk
@@ -20,8 +20,8 @@ HOST_LLD_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
 # GCC looks for tools in a different path from LLD's default installation path
 define HOST_LLD_CREATE_SYMLINKS
 	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
-	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
-	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
+	ln -sfr $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
+	ln -sfr $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
 endef
 
 HOST_LLD_POST_INSTALL_HOOKS += HOST_LLD_CREATE_SYMLINKS
-- 
2.43.0


-- 
*t.+33 438 020 555 *





_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
