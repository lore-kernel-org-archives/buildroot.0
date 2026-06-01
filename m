Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDEACD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 847AB40A90;
	Mon,  1 Jun 2026 20:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpCK720dKqvv; Mon,  1 Jun 2026 20:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9324A40A6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780346885;
	bh=QCaCmd0wLsMWNi/bfJQyBiHPzMqt1kLfjafEUp6nAyw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BYW2+xcE699Rl5UjE0aCrF0ZuFSD1N5wl/m1Qt0z/lxDh3mWUt8innXi0mQrOaB9V
	 xL7wddTZh/APxCxTGH/Y4W6QrVsNweKUPXkQpGRKNKSKMpgEHj/xgwoDRK88UVAEGe
	 1sL94yd/OvfoR1vwkGx8YmG0vENiGvozCwfcyqE/1JEURHGD0WUioowb2MlF0+rzes
	 1quzWnUioM7ASg5BMuZrNvAkmlqyiYBk2lYv+Q5WacVxyKLqk7VzmNxM8VtGO539r4
	 rmPzf/Ic8PQ5k7v/lMeuGQc9Bru3OoBIyreecBGHca+DyrYKpi9RQgz3OzY8mMquxl
	 LMLILXTpPsV+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9324A40A6B;
	Mon,  1 Jun 2026 20:48:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 975D9F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DA4340182
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTF-O_acNuZE for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:48:02 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6A6E4017C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6A6E4017C
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6A6E4017C
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:48:01 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5aa5f06b16cso2478945e87.1
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 13:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780346880; x=1780951680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HY+Vl8uwUsjz7G94JFdkXKbCqBb3B5/fxugdFq7k3cg=;
 b=VzpN7hPM/hHo+KoCWi4LzHY0azAqNANf8+B0jKoBROM5Xp5svWPCh/jWTPTWY0neuU
 vEoV6MwxARoIfm/QgEZImojDH3ZPMXtvr4+jYxtvHKGI48lVkB0zy//3E3oWhjKarVI8
 tkxbp64m/76Y6xH8s48bDg33WYTtjVAfiMtFXDdQl21hqFbfwOnBbomOkuJU0lfqGmCA
 ezpvZiaDAPEagn4vIJzfqg83LPEmZrIW2ecMxgNdfuVuxVVZTf+P2AQx6Ct9q1AcnDtH
 ZRQMh0OM1aua44RZW13uGB1OVZWxkSh1zM2EuErcMnxEkLLtnfJV6sdiZm4ACys9SG4Y
 yvxA==
X-Gm-Message-State: AOJu0YzY/S7SF6P0srEGukSNP056O8LZYQbXEm6vXzLXQlAEratmjAxt
 IsAy0EXwzQ4Cy9kyD2x+63PxOKlmrjYzZr6IGvS2wYfwSiiQo9iJiGc735kVJqDcA9c5Yia8ENn
 m78HkJkorlw==
X-Gm-Gg: Acq92OEZSYzNnMkXZMhwnoWq4lVWRDSXaZMMNG63gyzIRdTOQLHw8i6q2WxOK2fQ4Mi
 9g1VRZQb7ntstZp0Sk8lxZdeDDWcP6ylD1slV6iXtJuzu5I4nfKRAB/SYVdZoOy+OM+KoEf3nQ1
 krncDDFipfybDs/5j6ZdHVkDFb7eDeU2j0smC5JT7MW6cYvlSDWBbkkpypfaieSNM2ew302qel6
 uU3oB5G4K3XBXc9Raw6FRIKvjIWas0v4l99FCJhltLRXDxfv8gEiSm44vsWH4FQUC+LvdW/AT/1
 4XgLCO8BynorXfeVO9Sl+uE40oAseSJfSQON5it/h3w9mOwboOd8t4UDnGlyrHU5suTvm18jEVn
 h+OOSaEitcyPKQKCmZOAJDq6YbJrhCg61+aje7TafnWd5mftISSQlScyytaWz6GGFk9UiwmjaoE
 Dtp7UCpcEUlGn62tSsDfmpZyfsVHU1QKK/fBWf4tqS7z7C9VqDVT4oesyQDIiU1Q==
X-Received: by 2002:a05:6512:33cb:b0:5aa:6a2b:d456 with SMTP id
 2adb3069b0e04-5aa6a2bd54dmr2356444e87.27.1780346879637; 
 Mon, 01 Jun 2026 13:47:59 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5aa5b59678dsm2349851e87.52.2026.06.01.13.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 13:47:57 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  1 Jun 2026 22:47:32 +0200
Message-ID: <20260601204735.888967-7-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601204735.888967-1-j@j-ernberg.se>
References: <20260601204735.888967-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780346880; x=1780951680;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HY+Vl8uwUsjz7G94JFdkXKbCqBb3B5/fxugdFq7k3cg=;
 b=j1a69o3KD/9g+eSyxtqjiB2MnvuhYlcAUTrJT10IYZvXf1egrY1Ev50Bx5mDjHFZbW
 QoEgTci4PsNxKNJft2+2hYUxswJ9qDc6SDA7MxYOAiO7++jpzqAv9bWaErTJ0BQcART/
 QGyklWYSczdmbpCa32V9gHZd5x/SU+B+XBGO4BW9K8xN3OTFRP5NAriXrAMs9iB9iAcw
 AyfMIQyQmHUK4LbgFsucESocTDiKo21HzPqk80wPtYWzgDgJLAhOyc5GGczkjpAPBZB3
 jB5sPDcno3at+tkF3G2nk2hdIKfXTFpBzrm9ufYn68Sl2v5pwFLtGBK9JL8YNz3CWtC/
 aBEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=j1a69o3K
Subject: [Buildroot] [RFC PATCH 6/9] package/util-linux-libs: Do not install
 to target
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

util-linux-libs was introduced as an intermediate package to help break
circular dependencies with util-linux, and therefor only exists to provide
more basic versions of the libraries util-linux provide, to break these
dependency chains.

There is no need to install these to target as they will never be used
there.

Under all circumstances the libraries are built and installed by the main
util-linux package.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 6716a656d2..d434a8f461 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -24,6 +24,11 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
 # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
 UTIL_LINUX_LIBS_AUTORECONF = YES
 
+# This package is only used to build other packages that have a depdendency
+# on util-linux libraries which in turn may be dependencies for the full
+# util-linux build. The libraries that are actually used on target are built
+# by the util-linux package.
+UTIL_LINUX_LIBS_INSTALL_TARGET = NO
 UTIL_LINUX_LIBS_INSTALL_STAGING = YES
 UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
