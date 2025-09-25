Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015F8CAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 22:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6143C418CF;
	Thu, 25 Sep 2025 22:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAW5iv6bQO9U; Thu, 25 Sep 2025 22:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98890418D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98890418D3;
	Thu, 25 Sep 2025 22:28:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58DA312D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 22:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A853418D3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 22:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsT6Tpmds-Ze for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 22:28:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7FA3418CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7FA3418CE
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7FA3418CE
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 22:28:20 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-88432e60eebso44951839f.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 15:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758839299; x=1759444099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dlP4Y7nfp2LB+6pLs4hxNOvCv0ql4YFgSthc93ULe30=;
 b=Y6AFwu7CcFPdKSZFNsIikggba7Iyb4luMupJQJLrzmxxqzeZsZmCdCFD9pwaTIuJSx
 BzZk58GJXuOA00YUOKowpIZ3dO8EqSLkJod0LKp7hlFI+WHHTKYirk7R4iDeqej6EfF4
 oTLJyYTGBhg8S9XknS6aCqZB0N7smjeJ4dmKFQ/+AbabN6YS0+BU3AEeSXD3csMRi5Ue
 VOpNu4hoVJK4sT2zPHH6IbNE4sS/zdPZsLCc6mvtZ3rNbbEo0YIWeEFte891EMWa/l1w
 6CFN5VKKKNKTfdsDCNumxs+pWZzbYYzwUGFmjdgBhhIRt8/N7YkSWkmFSSPtIehakNLI
 7rlw==
X-Gm-Message-State: AOJu0YxWMIhcyy/R6s+ucNmCIRDx2Dt3vAe1NXZJOoajc7ymojtTeY8p
 ONoiyDP5QM5qcFLDHqGmxZTtZ6FHVeVGi/0iHh6YLUuL/QTxEXUlEBSYVz6vlQ==
X-Gm-Gg: ASbGncvzdtE0NDMW2DfQz5biFsrquSxgW+FKF4o9Lc/2rdK5os1G5EDVB8OA4y25dbF
 JBvt2+vlYR7pmHLeJ4fYi2LqCsIvBV1xLK6k/6Al26KhRP2kKpJNI3ypf1WOZaFV9eA+MxfpYYE
 Gzrf8GKRzK1PBBzp/ADgoTJSAhgrhFyQTS+ctzh5BL4fPR62Wb6cmwlL0LaDLM9yLPFMrcX7atd
 JrDUWaB8GRtlbAdJmrPMIrprb/LikJeChOhjLJoTpIF9Ql1t1XB7sm1+6BoEcaikV9TdCniTveJ
 WxcHRtiKXsg1ldSHhTOt7rzGE/+thLfuuUQg/1WMvuZAlfI+9e5OcVO3SoHTtis0Bqdw4XvKSKJ
 /fL5AwbNm8Cwg1Zk0oY6/NDMrR06q7mi8rsvkxB2GwnpAFh43vSRB9XiaXdGhqoRVcN2nwU67GX
 R9d0A2HpY=
X-Google-Smtp-Source: AGHT+IHH7+G3c8m4H/R4z9w0J/gmeNc98EtLfkzay9hPnFIev7XSNpdkn13ry6xqWfoq/CBi7Yc/Wg==
X-Received: by 2002:a05:6602:6b0d:b0:90c:99f6:4cec with SMTP id
 ca18e2360f4ac-90c99f65302mr310138139f.3.1758839299296; 
 Thu, 25 Sep 2025 15:28:19 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-56a654676dasm1227278173.28.2025.09.25.15.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:28:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 25 Sep 2025 16:28:14 -0600
Message-ID: <20250925222814.2323048-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758839299; x=1759444099; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dlP4Y7nfp2LB+6pLs4hxNOvCv0ql4YFgSthc93ULe30=;
 b=nbLDJmBXwBiLykbPDay850k9KQ8ACIvDET/vAAKFLSzCLnE67jZCEtL7f/waigMiu7
 KMu9fyLqWX+yYtTnVkgMpyzN8Z0RhsZB7/qs3iVyQ7IKxXII/J0LC9TnCHNmQJ4Mzb1q
 dNZpBvr3vig/g3lpQejCxYJMMjJi0lWM5PaYi5p2VfcY+LanIKEgXaZyqynXqp7pWp4O
 nBDbhn4+VzwPlKhK+OS9zc4uS//UgAZc8HM1U4nfwdmzOcGZPMcT8KwoS3MO8eLM1XYD
 WCap9Y9swyn7cFsrhNGpSnJSeISOKbqWbhkkAX30wr3uTRgyWSHhJwc8ll/aRHHvab1/
 kf+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nbLDJmBX
Subject: [Buildroot] [PATCH 1/1] package/tailscale: bump to version 1.88.3
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tailscale/tailscale.hash | 2 +-
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index e2d600f03e..444412f8f4 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4830cd822a838d5d44fd5eeebd07a2aacaf0255fb3fb7d3852d57659f54e51bc  tailscale-1.78.1-go2.tar.gz
+sha256  98b51e95e84378ab280c5a8706508d493ab9152a0215f00f0f69e3ea2673ea0f  tailscale-1.88.3-go2.tar.gz
 sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 3c6c7bce1e..141a5b98d6 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.78.1
+TAILSCALE_VERSION = 1.88.3
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
