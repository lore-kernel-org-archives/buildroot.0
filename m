Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D462BC87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 17:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACA67841A3;
	Thu, 31 Jul 2025 17:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8DOva8Y-LFP; Thu, 31 Jul 2025 17:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E225883E8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E225883E8F;
	Thu, 31 Jul 2025 17:29:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C688168
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 17:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88383400E2;
 Thu, 31 Jul 2025 17:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9dVbjUgJGtB; Thu, 31 Jul 2025 17:29:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E672D4026C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E672D4026C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E672D4026C
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 17:29:37 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4561607166aso8636985e9.2
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 10:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753982976; x=1754587776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Jp5QsT1KgxTldS8X0HnHEAxiZz9YLKEudKnpShMKvrA=;
 b=hSbJfzTnBzcNSDvDyK50ST7zHhHYtUflSNIxW4aWWZZThtJlwy2piosWib0u2BxJCi
 Ef8W49S8yPHCKnu0BXyPK3/PFDyJzqXZZWxEKn9AL0ryQG7oBRQaiLkdvD1DhD0DnMi4
 QUW9GJVxn4GM2YJZZxsp8rlVUGKL/vGglXR2riLQ+Ix00eQKHsyoevnwfzuMsb7IcxIl
 HMqtF7QZm3g2kkeSLTDzyVGgLjp2V3CZrTYJpxFoUSOnB9d4/MkSJTNTr7QkbAHOXEvW
 m405V00KzYSilPWfSmmE6Bq5kQOxj7NxZZMPBKw8bCt4H+scck2/sCT0xQwgOvDRGDyM
 ccEg==
X-Gm-Message-State: AOJu0Yw8SJOi/1iNU/T6mDuwd9OXJVCmBa9t+xJhUNsaL28GdIiBbzyB
 iIr0xexU/6XmFFaDuKcMRGKh3wMOm3HQZNWzLS2vS2X4PXy2dNP2LgyC2mhs2A==
X-Gm-Gg: ASbGncuDIS6VGZTMQEqaPidJNi1ogzxzMtl9WcPWSe3LpugKtxkL4+RNR3iawiDkr5t
 3IdiVRUil+pk1xYe1HnlNXOA/u3yEFVK6KcX5jXTzlRo4tbeACAQ1D/cCGwiXa2V9elDK0L71NR
 ZFBwNsjiBBjXzQmBDjc9I3IqQRUh7l2JRgDW0VmjpUfKERPm52xHiN2QQSYbmYe9tv5/1Y4ubb4
 IZVg3vNBJV95vmyVn3YVO7kWdvKIflc6+qm95sGFnI4tNnRlSNbbksO1cGGoZfdzlgH/pUTQK1y
 meyYhfWeV/ehrolnbaTcYTFGflbPfY7hVZf8NmzufCIubNen2O8k1v5UIJqCQFsEhZHV9MfUASX
 SzrDa26GMl2ilJNNpDJbtag7B1ZNBhRJA
X-Google-Smtp-Source: AGHT+IGwC0cEEpJbetJfex3mdhEujtP3xhIlnOlmkTMgfD9PTH+sn1y/8iHH2rjHL94stfJ64zv/rQ==
X-Received: by 2002:a05:6000:2008:b0:3b7:8fcc:a1e3 with SMTP id
 ffacd0b85a97d-3b795032797mr6226845f8f.48.1753982975736; 
 Thu, 31 Jul 2025 10:29:35 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfeaesm79515285e9.16.2025.07.31.10.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 10:29:35 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2025 19:29:34 +0200
Message-ID: <2384243185c70ed34e5c80dd44cc45dff2f11b43.1753982959.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1753982959.git.yann.morin.1998@free.fr>
References: <cover.1753982959.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753982976; x=1754587776; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jp5QsT1KgxTldS8X0HnHEAxiZz9YLKEudKnpShMKvrA=;
 b=eDUWvdZ3NOxWJbtA0ezILlLjk/N4E4I8JRJ/3jaF7h31Ukdf8/ldbJhbms0CeA1bjN
 YCCbmZB5Cvipp0gTzmGeIwTSgHjKPli6aWiwMb6y+UbkRmeVDCyriZwcZKmvuQdSuqzw
 Kg2gAfeNgoTs8B6m+aMzbZyfNIciWfvs927tU5jGs6hOIGP9d9fbQr9k94zQWD2PBmM4
 MKLhoTQLSZJkqXKfB6XprwEfgIXljGRTX++BdPP44vNIu0ry7we2Bz+WGnG+fJaGIavD
 ZyYujK10+keEZVEt8H4NBTx2W03nbpsRUJHaDot0bs6PNCncO1/QGnZdo0JLBPHtFNaj
 lSog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eDUWvdZ3
Subject: [Buildroot] [PATCH 1/2] Makefile: fix list-defconfigs for
 br2-external with weird descriptions
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When a br20-external tree description contains an odd number of single
quotes, list-defconfigs will fail with a shell error message:

    /bin/sh: -c: line 1: unexpected EOF while looking for matching `"'
    make[1]: *** [Makefile:1243: list-defconfigs] Error 2

Whoever wrote that code will have to write this sentence 100 times
on the blackboard:

     Never, ever pass user-provided data in a printf format.

(see commit 49117c102803 (core: support description for br2-external
trees); dang, I knew it... And I should have known better when I wrote
that code, damit...)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c581067320..fa82afa49c 100644
--- a/Makefile
+++ b/Makefile
@@ -1223,7 +1223,7 @@ define list-defconfigs
 		[ -f "$${defconfig}" ] || continue; \
 		if $${first}; then \
 			if [ "$(2)" ]; then \
-				printf 'External configs in "$(call qstrip,$(2))":\n'; \
+				printf 'External configs in "%s":\n' "$(call qstrip,$(2))"; \
 			else \
 				printf "Built-in configs:\n"; \
 			fi; \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
