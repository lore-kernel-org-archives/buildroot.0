Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEFECA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 19:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0A6D80B6F;
	Mon, 18 Aug 2025 19:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enVUhCs62nPQ; Mon, 18 Aug 2025 19:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFAFD80B10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFAFD80B10;
	Mon, 18 Aug 2025 19:28:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6B6675
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 19:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FBA540702
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 19:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZ6MKc5AgQHy for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 19:28:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F399406C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F399406C1
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F399406C1
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 19:28:15 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb7a0550cso668737866b.2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 12:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755545293; x=1756150093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D4HYFdyTVBXe71F3ILdEJ0TM2Mn4kXXP0onbnlEJN0Y=;
 b=cR300HSxYwkjwiMBuOi0jLsF0ObwabqjxMLn4hh/O9SKB3GGMvFwdT8aFpcVOUcDmc
 RZt5BIICYrJEGF2Vto/SJHClfHtEs9ce3Pxiv9UZniqRWPiujeYxLg8QlrphF/HI4jxv
 +FVYDk1mtl5gcye2jOml5ytXPwyQKAQULwPGIjhM+4dI4i7ePoRLQi/dWfHONJUvjTwR
 ggmle5Fx8abLdlzKFPJHOXZyCKw5h5fCLFYmJcs4OSp/u+zCvH0vHlPQ9UAUAl+Lf2Ff
 AQG5f/7O7rFfttJ7kH/1jetC/pJpn3ZEMlYfbyC8iSpmXUcbCrS+1k2OvC51TbIbx5OF
 NqMQ==
X-Gm-Message-State: AOJu0YxcsqDIjjhNw8XdkTgvBPEn7IOiNYrFbE74Py+FxPvFPTQzMwzB
 OR3JGmuGoz5C2hFNfONxuNKdZZvSzUB4gKTG0n5+fBAr0/t1T3i+BkIn7Mng+nIr6ci5Kz6fgOS
 gaBLnmh4=
X-Gm-Gg: ASbGncv2P5FOkiGbZA1vIWlcFtcN4I2rewm+6zQ0IRU9Nkt/3DysVN5/Md73/d0NAna
 I6QT4+XYfEvcdyl4bQXXmF054cPABhrNJrRqw4w2GecLXJS4DGguTgCfSGqJnYqF5DKUNZVh3gP
 OppTHqCFw6FC4ye90ema8fCnrJKuYMWT4uVWHwnylQwODLMeajZHJpnWpucVoKWZYxMpjw2QSXf
 ns6MeMnJ1Q99B+F58jQUP+pgR3YBRCZSJteiIeElxNbztdvv5OSAriMVOFi0vzWvbHmK0Bc/5U6
 3xvLs6z6I0NsUp6Ugy4GzDv5I9TQgQXkIC4O2j2d39E1k1bqhxliU9wmck2b5JTKzxpvrF+1UuT
 zSzDV8q/uax5ytGnzjAs5aOe3XJhaVvEiW3rIYg+WchtXMAkHlDdZ2Pq0acjt07SA+R84VNSnj6
 tA
X-Google-Smtp-Source: AGHT+IHIpJegcUJfOmKL/gotzUDGDF5x507mi1N9ZjLLcub66kEs/gGeptYzDHWiOP8lNjHVBKvdZA==
X-Received: by 2002:a17:907:d2a:b0:ae6:c23f:3cf with SMTP id
 a640c23a62f3a-afcdc244436mr1288888566b.16.1755545293155; 
 Mon, 18 Aug 2025 12:28:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:e4e:9572:b348:82ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd0104a4sm854713366b.87.2025.08.18.12.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 12:28:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 18 Aug 2025 21:27:57 +0200
Message-ID: <20250818192757.75261-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755545293; x=1756150093;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D4HYFdyTVBXe71F3ILdEJ0TM2Mn4kXXP0onbnlEJN0Y=;
 b=H/TijDe3jjydvMdkw11nFLAhjYn7KxrABQXpxu6pGQGAc/DKBsi3L8B96cCrblkwWP
 7veYEqkdQUblgPLf1KpaNCF/pzJcOI8PaCO87r2OaZqt113ikvTevNiwrtv7J1y7P/cO
 A1DKyoaEHAAhUtFbHmqXzJgaIQV6UHjunO7kc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=H/TijDe3
Subject: [Buildroot] [next] package/armadillo: bump to version 14.6.3
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index a58525bb4bf9..75f7837cbbef 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  49ddb76670b1d1a142f760637e653ec5b20ba730e7630a2f3c2b13d324c37e08  armadillo-14.6.2.tar.xz
+sha256  ad1e2aa5b90a389ab714e2d00972ce64da42582b17dd89c18935358551e6e205  armadillo-14.6.3.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 7283f90ba4ba..d70601365197 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 14.6.2
+ARMADILLO_VERSION = 14.6.3
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
