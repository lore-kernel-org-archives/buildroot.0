Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE162C83F1D
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 20:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CE3C8203A;
	Sat, 12 Jul 2025 20:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1sRabSSe9KP; Sat, 12 Jul 2025 20:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5AE681ED0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5AE681ED0;
	Sat, 12 Jul 2025 20:59:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 321751CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 20:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1832581ED0
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 20:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JxAYz6Joh7U for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 20:59:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18A4081EC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A4081EC5
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18A4081EC5
 for <buildroot@busybox.net>; Sat, 12 Jul 2025 20:59:52 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a522224582so1604423f8f.3
 for <buildroot@busybox.net>; Sat, 12 Jul 2025 13:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752353991; x=1752958791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5POM+VSHJ+bNAryzj9F5yfu59l1W5U2vQExNSLmnwqI=;
 b=UwTYbAjFl0KFNRjY4hpnwdle1H8R2S6sDZ2Lvl/5V3Ej2ARIKpIgIF7ZuGUJQx+gMd
 XyIX5O5etYCS+Y6fXa4Q6AC8l9EhT3+PDIzzPm2Mut25Gktw/qyFEAK2/axJSiXWO7o5
 eEPkTOild04NYm46vVw5DHh2HdUdKgXNwnw9/IlqTBjTnN4opoxiqKGRzxVmTnCx36Cb
 rl09RmRVnrrPJL0/1CsJG6WQDxmbXcSJznGpJ0oG7TRwjV5YoGnoSDQYM6hLbLW8IQCC
 dxlnmOE0zyGKWaQIsvjUPbjg7lU1Bbpt/1ggHMTGgcxqirrDHa83JGLW8k1pXIdC3jxz
 PrIA==
X-Gm-Message-State: AOJu0YzkJ+uFadI+/q6y9Vbz8i7mEs3Zx2yHKILQKzxcBfxdlxIJyotx
 keDik1tmQw1+jrFXAJfF415rCASZ1YJW9BcGUMwEeLLdWytPAfcGo/XKQClAvTuzdGJrPbBBaA/
 C3oTKyQ==
X-Gm-Gg: ASbGncu4uz1WGwnMOsdmIcrbHs8L4RPorjN1mpmKMoXVb2GF1MAvUVdSbTCNlY0kEiD
 gMOO75cadYH/Ij50L0WUS1518bN+niVa+HdpIFC4REBOYMgjWlWSRkK2Yrsj0CL3XcbsAzB2cCR
 ijrDWpKBN1/ZM9TTVxahRlyQ/DBxE8zxIx365BNwCisNfUYyL0RKA/770DC4Tp6QZLdJVpqJjjw
 rHy+CIUXGa7Kc7hL6ngmCbpIEWVzVMN4rtXImhuPIxm60gHCMhxid9Tk98QJE78fgmQVLgpbtb6
 rdh9BhhUnhi/m3ilZ2jncHf+iFWS2POvDLfXxatlBNY0GF85d7bT8UTga6arVROS74dcI/MQ5m8
 J69s3jKZ3m141I2rOIWOzPF4rrIlt2aNStx7+V1ro94hMc4mWe1Q830sV
X-Google-Smtp-Source: AGHT+IHIfwbMhSlqtj63ND14jX+m51ymfTAO4SQuTAAhy1/md1TYPMUGUrG19tAvfEBnaChHp4zX/A==
X-Received: by 2002:a5d:6f11:0:b0:3a4:ee40:6c85 with SMTP id
 ffacd0b85a97d-3b5f35973ebmr5477131f8f.54.1752353990486; 
 Sat, 12 Jul 2025 13:59:50 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5032ff4sm125341045e9.8.2025.07.12.13.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 13:59:50 -0700 (PDT)
To: buildroot@busybox.net
Date: Sat, 12 Jul 2025 22:59:42 +0200
Message-ID: <20250712205943.1300274-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1752353991; x=1752958791; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5POM+VSHJ+bNAryzj9F5yfu59l1W5U2vQExNSLmnwqI=;
 b=L8HWuDgvGH5ZTbMwYfOXlj7atY7w2AZMeLaAjjeKwtoe8gBgG3ED58XKaJRZ3vK1Wp
 nhj9EmLo/aFcIcdoTIZgouBehUcbDCGyRCX4yYOJRsxQqR6DVLpIbTL03GzQIwg8uBj3
 wxvwpE5NizgqQfTO+wHvqLuyPmno/9fkAWlnZ/n9zKh5hSopGp53sjHDZJ2XYDcAjGrK
 P50N/d21JsX+P0ah8HlQ0Wdw+6OVUsfdpe4klLmzmys51t7XaVRbx/AikcrZgNAd5dZ7
 tLP8XGEt9EPUwPwpBnvohjIN3PEUnwcctvcY/Xhc3cPQxsgU84QjQ2p574fm0BTIEY3J
 zLwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=L8HWuDgv
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.12.2
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 02474d036..9c69e31dd 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3d4c8acddf9b975e77da68cbf748d5baf483d0b6e9d703a844882db25dd61cdf  luarocks-3.12.0.tar.gz
+sha256  b0e0c85205841ddd7be485f53d6125766d18a81d226588d2366931e9a1484492  luarocks-3.12.2.tar.gz
 sha256  660773f53ed17cd0d8be7d67168c25e8cc664a506788c7b5971192bdd2994a9d  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 37d48a947..43d099726 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.12.0
+LUAROCKS_VERSION = 3.12.2
 LUAROCKS_SITE = https://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
