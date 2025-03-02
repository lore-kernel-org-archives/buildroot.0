Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB80C19F32
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FE4E83F5B;
	Sun,  2 Mar 2025 21:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1XDlC3V5ndI; Sun,  2 Mar 2025 21:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E4D583F60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E4D583F60;
	Sun,  2 Mar 2025 21:52:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 597A9182
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4897140D76
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6d1S12lArggh for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:52:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5705140D86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5705140D86
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5705140D86
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:38 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-439999d2bbfso4367625e9.2
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952356; x=1741557156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x2t9elHJOQ8R1tvA+NekH6Ev232VzQu/oKL0YDkcZJU=;
 b=sEaHbKd29BKWQ3nIOISrFKMhI7TVh+LYLjg+N9WxXLX2VG/K4ZSwlOstJg4QGchlkR
 sUgN4qrrQlL2s1vYGyehSYiP8kTGGUJhCBtOQ0xmwumEnbwerXM8BLnbJ1FAiB048Xir
 gWtOI8BxzhYJs+xgWpZFrjxhH4MO6s+gqOSocXHK5CAH4p9re9BKdXHHRR1Dpq852MT/
 qWoin9YBWuAmiL1oq5nQzQ8d1slZdL73f3W1jFG90LuvHRLQ0t78qy4/eFVpWKSazZRT
 VnexC/stFUMaG3Gt5tEkWRVM7vzYTaad/+KR5NVedFvfrMKEYdE4yJhypOI5PHwhz2oq
 pQrQ==
X-Gm-Message-State: AOJu0Yyl5tLoqfmM157VtDAFUkZkuI9a3qM29DgKLL4TqAHlkcaToHgw
 zQzg//atx12W3kwOVK1LkRNwHAZRFUjEH8uH1kEqw8i7P9aTNvZDzrj4q+Bs
X-Gm-Gg: ASbGncsDDlM3Vbflq4DJNRhNOysBSjN690hRy8WJXX9Euc8T9FVLEIbuMln3auCbBS1
 9Lt8rQwrbr97XCLBKobphb/ysBNzjeN6kMF6tzM1m6HylbZbCpKP8ItkWILUdIhTDnU+T9B/kkJ
 dq/7tLLYIkM919J1YwZzw4UPy5+EwEdfjIb58ANZ3h3w2mHZc8jXnlhamY1ctewHc1G6uBrrOPj
 OJvquLMQgo9CJNQig2JrGgSDohB3/cJg7x5So6rDHBqnFHDljgCPz/9czHhrNSfMflsRA9GKEzG
 cGEoaFIn3guctAYxt+nbenQyGGIe79ThGbgG7Q==
X-Google-Smtp-Source: AGHT+IEN30aA+GPCjTeSDcdp6X4BWsJtXXm+TxOkid2ThhdOO4kvoV8wDjppxqx5rvnWfYXPJ+jCdQ==
X-Received: by 2002:a05:600c:35ca:b0:439:9b3f:2dd9 with SMTP id
 5b1f17b1804b1-43ba6a791ffmr38797785e9.7.1740952355549; 
 Sun, 02 Mar 2025 13:52:35 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:34 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:05 +0200
Message-ID: <20250302215219.1276480-2-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952356; x=1741557156; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x2t9elHJOQ8R1tvA+NekH6Ev232VzQu/oKL0YDkcZJU=;
 b=VzTB3WWX0NTNz9TqqLRcHze7KqPbztuiTYLUVYMVpEMhnZYruIcPhamwiXRaaBPb7b
 ajSgE2HO5EpPptQEkBgHr0I4K42d1TnJbe+UMmfYawKw9JDLbUzvIviopE4rp7Hz/bql
 PAvI3ahR9IQOVMppktWCt22MGl101Mbi3kXqXr5Zz11hPz2HMUWCuqJDFpjx+qPPYXlU
 8e+XIZt0sUUDgpjPTKiFK75htVhduVWNHSvC2HHCfYEztpHE78kM8RGa9w7TWip7XYk4
 i0tGT/JWmRlvr+McvNds45Qu5B9QR8bTljkI3owvGUmisZz5mqsf+0AvvrboLbpgp7qk
 8cMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VzTB3WWX
Subject: [Buildroot] [PATCH 01/15] package/qoriq-rcw: update to tag
 lf-6.6.52-2.2.0
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

Change log:
b77c789f6fd8 lx2160aqds: new SerDes protocol 19_9_2
35a7ba376245 lx2162aqds: remove SerDes equalization files for lanes A-D
0fe5b25266cd lx2160aqds_rev2: extend SD1 protocol 13 with 100G MAC 1 split into 4 x 25G ports
6b912edba08e lx2160aqds_rev2: add protocol 7_7_2 with SerDes2 lanes A and E converted to SGMII
729048acf6d1 lx2160asi: add SerDes 28G register description
00f1030e9a0c lx2160a: fix SerDes lane documentation
a8a91256d190 ls1028a: make all switch PCSes addressable on the MDIO bus
3fee38cec2ae ls1046a: offer SerDes1 protocol 0x3333 with PLL mapping 1111
c60e9195f148 layerscape: introduce macros for the SerDes 10G registers

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
- Break out RCW changes out of larger "[PATCH v2 01/11]
  platform/layerscape: bump Linux Factory tag to lf-6.6.36-2.1.0" patch
- Bump to lf-6.6.52-2.2.0 instead of lf-6.6.36-2.1.0 (new tag appeared
  in between)

 package/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 1f664842f5ea..b9316582ffc6 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  52dfb95a3d8e811609dd8a982a5c6f3ba88fac096ea8448a27b571b7c25e3a83  qoriq-rcw-lf-6.6.23-2.0.0.tar.gz
+sha256  bfb992fcb396894874143257b53d14394ada48df0771f7edb55324fa932bbcdc  qoriq-rcw-lf-6.6.52-2.2.0.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index c6cfe59a5629..c536a12373fc 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = lf-6.6.23-2.0.0
+QORIQ_RCW_VERSION = lf-6.6.52-2.2.0
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
