Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255D2C36010
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E825480CD1;
	Fri, 28 Mar 2025 18:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cy_2unBANwpb; Fri, 28 Mar 2025 18:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52D1680DBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52D1680DBA;
	Fri, 28 Mar 2025 18:05:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0DC512A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6B768596A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAzDT4EQrWSp for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:04:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0E9985967
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E9985967
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0E9985967
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:56 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d0953d3e1so2500315e9.2
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185094; x=1743789894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yu9+lPl5l00YOzVFYbJvnq3B7qih5//gZ0mab05fiGs=;
 b=pr5oS8a7tBAMK20469tqTOTv6+wKjS00DfS0mfvMTA73rCZ8llagTqCTC3MtT0oCmG
 tzXtmPNyRLVToFzY/ehrxLHXRBzUL1Mef4jcaxHVkb5Ddu3xTuScCVzps0UD31bcdWd5
 CKblsKN0+v5G7iUkrtIKIRuYPh4qbf3ln7ez8zcxHEMllch+wGwWoLgOShPIOtjK6Ud7
 q0LfAWgTUIsWYUnC4dKfpKI4RbjX0dceUr1WvE9/hPdP1qBeypBAEe8O4gKDM9MfhRWO
 AzxkRq8jXwH4pKAhcdEx7NrX1cNnSb49b9exrOucji61t20dBhOtMVRyuHfg9A3WBWMI
 nogw==
X-Gm-Message-State: AOJu0Yxp5hAiH5QXAgyQsVvGQHDozAB/QN1IvGg2ifGYNS4Km2MvpMpu
 B/DK1foRWKO65BOY3iU65BlJZ8vdMocBXZ0vYLT/Brb/Xw7UCSVRZ/1Ujxvb
X-Gm-Gg: ASbGncsooR5bTaC8oWiNEFde+0mQClZ73GlrtR2fkdqG2ALdaZoXxSwVyGgYv53sRDs
 wc9DHiLGNm350sIkP3k1ktvxijZsqE0VyNBIiW/WjZjCNcAcPYhltjXZuUNVv/ZvEXlGq0q61vZ
 t2z3Klvrld2AX39TiEbG6uNHzeG2MCmUuIpB51CLRYi34EHFdvwQS6uIJXRCfWVYLOBh5GBYqmX
 C1TdhPI6bdlgSwG+zvhDQuJIiThmg8w9ySZKQbomqoJIqrShz5tEsTypIRldorslAnwPepKAX3s
 SGQhllAPBEFpR9mlx1zJYLO3LD+ckeGGzR/nSw==
X-Google-Smtp-Source: AGHT+IHMdFx9gPdYSJhMuQ1AbBrNk6S+GdsEthtR6e2WuZSPyOCA7t1hd69ufpwvwv+ig2Z/LgG6wA==
X-Received: by 2002:a05:600c:1c0b:b0:439:8294:2115 with SMTP id
 5b1f17b1804b1-43dbc6fad1bmr1326255e9.8.1743185094059; 
 Fri, 28 Mar 2025 11:04:54 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:53 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:20 +0200
Message-ID: <20250328180427.3434693-13-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185094; x=1743789894; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yu9+lPl5l00YOzVFYbJvnq3B7qih5//gZ0mab05fiGs=;
 b=KTp75CnDLFAdu1Kf2qdwUjdkRdZmxsthShyh1Zdx7fUs1JxYQKgUDgsP7yHCq4piJC
 JXxP+9Ky6SHcgKGk06/0MOc2BfbmZ1OleaEstvZkLeRygugAHLk13bUvh+03wYGD3VgQ
 fyisZDKQlihWk1Z/Hb/CPw75sRNVmr/VMGtsLBCo4ZPYzpbnEBcLWRvq1xd+bm6vAJiE
 NbUZV9JuaoXdh5a5sEGl3m1DVqhjE9wIgHAlITDvcf72XAbfVhwQCQ3Tk5PWTJW9N7gY
 FkSLHN8pcV9W91NaPF0j3Lf0mdpMriHpV3FSoWlL1Mx/Xlh7t22e/i1dlSE7BNfId5oe
 1RiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KTp75CnD
Subject: [Buildroot] [PATCH v2 12/18] package/qoriq-fm-ucode: uprev to
 lf-6.12.3-1.0.0
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Concretely, no change. But saves people the hassle of checking whether
any updates have been missed.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: update to the latest BSP tag

 package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index bf494b177bb0..dfad7affe050 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b9e2a5c383fb9288db1459821fc696f3abfeddd080b04c11cf9f712f0d36470  qoriq-fm-ucode-lf-6.6.52-2.2.0.tar.gz
+sha256  18824746f144ff8f39a5f2f62f7777de7c6cb8ab1a3303a5cad5beadd8aac9fd  qoriq-fm-ucode-lf-6.12.3-1.0.0.tar.gz
 sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index 71904e5b1376..6df0839be32e 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = lf-6.6.52-2.2.0
+QORIQ_FM_UCODE_VERSION = lf-6.12.3-1.0.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
 QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
