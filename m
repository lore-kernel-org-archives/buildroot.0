Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0BDC36013
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 295094F301;
	Fri, 28 Mar 2025 18:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAWHOvSsv8P6; Fri, 28 Mar 2025 18:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 516E54F2E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 516E54F2E6;
	Fri, 28 Mar 2025 18:04:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B22DF12A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9812170451
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1zRxX3_qwLO for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:04:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9A91707C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9A91707C5
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9A91707C5
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:50 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3912622c9c0so236837f8f.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185088; x=1743789888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LtsXbNAtVH/6+szgzf3MqIjkwhN0RjfHcK267i3l4Ok=;
 b=IuN9fsIUDQRG6KcVm/mh5rPX8RrLeIJFcOVlKutfr/3+yPvpIQNR+qPuDUPEjLMMZ2
 pQmqNweWkq2/0qGNSx6k6oQdp59dEyvdepQoP9hDuRN8nozreQ+BhzCmIqK+ccl3Q3h0
 Q3csGUVaeYs5l2aDr68vQmwUwIJnsiaYSUa0m6rTLnLRdI28F+9JfFBd7uHan/kgJ7mp
 Xl6MoispUyGq2ee6ka+++AE1H9F5KYLWybEdRPsWuJX9rgn0+JHX97XoDW4eiLMuuOWp
 GTQdpG0AH4hswoIdYmpokGyeOLRx283ddLtPvWZz0015OlMFy7W9E3vdPtWpLsB4y/wn
 UwIA==
X-Gm-Message-State: AOJu0YxRk/GiyYGrBH5iQY2kWQdzdbm5JKbxi/eiCK50XJKEhL5stB1+
 KA4mRdsRBg8nfs/E2zhJCjxMmQsQ2QfzneMptISDuUshQY/E60X0F8dDaU/x
X-Gm-Gg: ASbGncv40hbzkvmrTRxPNwJW8G6KoQOOuQ0m+HC9CERpTby8hVjfkW52Oo7lkA6NXLA
 DxmnEVDfVydbAZE7V98aWTeFY2WPBfoQ7U01LQ1awu6wvHrDzmB0o2PsGMBRjZ/XuJ7hBa+e4J6
 ml+5n5hIsuTECx5LIvv090b/Y+W6Q3wFQecsKQ0notHTXswLlnwkTZiH2Rz1Cl4YmcQjDwcJ8W9
 xtROQNGitdcX88RyoNsJgYXHAULJxYydkKZCew/laZqBfF+sAezWD2frFdtdFUZkDpfehnlKiYZ
 Jf7yqewJLjo2mRO5oLagRUyTu/BbE7tOkPZuiw==
X-Google-Smtp-Source: AGHT+IHVdVIoEeS2ljXwEJrEMkckGAjL+NULRF2sXqHaa5C6eROFjyVJEOHhkhzxut2A9cU2ewaPGQ==
X-Received: by 2002:a05:600c:4e4a:b0:439:930a:58a6 with SMTP id
 5b1f17b1804b1-43dbc6fa7c7mr1829035e9.8.1743185088074; 
 Fri, 28 Mar 2025 11:04:48 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:47 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:17 +0200
Message-ID: <20250328180427.3434693-10-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185088; x=1743789888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LtsXbNAtVH/6+szgzf3MqIjkwhN0RjfHcK267i3l4Ok=;
 b=C0RyMOoiqNPwIpzwgXKGJCSrA6plz1nJ9lWOcdOluqXSESAQAIgLaypuGpVbukDf0A
 9AUwrPK7INailA50z66Vxgxq+aqw6+WgM4GVG04C0kPOzN06G3vWggP9BPeqq5DU2x8C
 1VSxGkd9+QfTly8NS6Luim6cYYquFh1OoSa7EXx4VrjHmy49XZcd5DDbEJEprPjOrvR9
 ZLj+B+7yzPJ/eAhJC+J+lbGENGqZacb3q/Vgun38LfpXg17fNMHxTxYSWFbevl2DGH07
 uSPG6MsnPHk54JWV1/g4xKbqn26d6XqYvYFJ9Ev4qviH4+8natxEkT5pSoWQZQwUFEWK
 3oKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C0RyMOoi
Subject: [Buildroot] [PATCH v2 09/18] package/qoriq-rcw: bump to
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

Technically, this is lf-6.12.3-1.0.0 plus a few patches on top (the
current master branch). Change log:

45e692536904 rcw: ls1028a: Add configuration for audio codec usage
3c51083d0cdf lx2160asi: e100g1_split.rcw: fix parse error

The second patch is necessary to fix a build error which was signalled
previously here on the lists:
https://lore.kernel.org/buildroot/20250318213839.17470-1-vjardin@free.fr/

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: update to what is now the newest BSP tag

 package/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index b9316582ffc6..5c1898551bb2 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bfb992fcb396894874143257b53d14394ada48df0771f7edb55324fa932bbcdc  qoriq-rcw-lf-6.6.52-2.2.0.tar.gz
+sha256  f99ef0620dc49c6a0b9d03958cdb8a3e559907351fccd4814fd37b80d1324e97  qoriq-rcw-45e69253690452656a4dfe933c4c9f55e1eb0f5f.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index c536a12373fc..c44832737f62 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = lf-6.6.52-2.2.0
+QORIQ_RCW_VERSION = 45e69253690452656a4dfe933c4c9f55e1eb0f5f
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
