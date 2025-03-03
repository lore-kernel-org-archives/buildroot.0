Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85059C282C5
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 04:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26F0940CF0;
	Mon,  3 Mar 2025 04:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6TVNnil7dbF; Mon,  3 Mar 2025 04:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E634040CF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E634040CF7;
	Mon,  3 Mar 2025 04:16:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6BDD182
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 04:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5B8840CF7
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 04:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xLGQ66RoDpL for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 04:16:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86C0340CE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86C0340CE8
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86C0340CE8
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 04:16:06 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-548878c6a5aso4439865e87.3
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 20:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740975364; x=1741580164;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OreVipyuI6GLObdRwp0cl3kZsljURAP2eyNZa20pwcs=;
 b=JuP5tVM4DIwukn+dbnEUUP6+PNHT37rV+e0Y9uIkpV63a72MvfGcvlnhWuDPEw9EVC
 xfbn74ub3fagUrGvYeVmUWapF4nu/rQlJMIj7yI2VgfjaCm6Ti+aPFvA7wxA32m/PBO/
 snhOvh5gvFTi3ZcHo0loLqBRU3To1LXubniRHDGR07Vj4lGFNvn9Yl88qlCRb2Bn/gj9
 iOqbkd4FkRN0Zf4hi1eMAKmXiMkz1Vx56jVtTkqhZkTAm1FbptoIaqVXlo9YeVETp50+
 S1DtzVOpkziTVOLOQitY2GPvfJeq55GxkqkeIpgFy8bNcP82L2Y5+6K8pBmoJGh7aM2E
 CusQ==
X-Gm-Message-State: AOJu0YxRgpNPz+srSxKiRt0NJe/JsHqr7kIfVNIi5o6QYaT14SEnmDjA
 Q9dQE4lnXqb7cdduvpSt0ORApT5oq7c8UDWXngBxi78sMaDmJbjJ7+AIZA==
X-Gm-Gg: ASbGncudPqVIlKGwkr7NJQ1kdiYASxWVyhBv9PrPwHFDs1bcnKjuOlXJ3ixdrMNwd8K
 RVO1EUaIPswhlMJImx+/KruHkoQX3GaqHzdFYFHCklFUNmiWeguBlK7wG83lUVUw4vTQmC9SsCz
 KfbQ8bQCW8FiILmGnhKVKntyrjykYhzsFfCacaxKsi77fCFeMANNYPazbPwWuOSszTXoSAQfZux
 s/3o9kCozkzjIQ7qo5oG+4nG4E4y2oqPDlEK+dRQS8Q4DYZgYiaA+gK1MBNQYxteQU4fqlOjRli
 lYlLZFnPThXvh945C3BiAY8=
X-Google-Smtp-Source: AGHT+IFg9yQ3mRNCprIu0AAwJr5o7wiL2Lg+RF7JVI4Q/IJJDolnTSBOJvB34wi5q6sUA/zC2OdKuw==
X-Received: by 2002:a05:6512:683:b0:545:2a96:34fc with SMTP id
 2adb3069b0e04-5494c332194mr4695904e87.31.1740975363517; 
 Sun, 02 Mar 2025 20:16:03 -0800 (PST)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495c30df33sm506898e87.128.2025.03.02.20.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 20:16:02 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Mon,  3 Mar 2025 05:15:51 +0100
Message-ID: <20250303041551.3968139-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303041551.3968139-1-troglobit@gmail.com>
References: <20250303041551.3968139-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740975364; x=1741580164; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OreVipyuI6GLObdRwp0cl3kZsljURAP2eyNZa20pwcs=;
 b=KWoECrHHbeALWF5DWYe6TMw8CybudEXsnkwvwCavtb1EI5TrVbb0CmX/AZmLwGjkqV
 BeLKnJ/UEScXscVj/NBtSLt+BNHC1JGatMJKApkJCfad+YTo6F/kczLmgUiI3dbsxc0u
 FCgrF79293IHl+BjJ/+eb6GC3TlFRHL4bwSuxrU0hW36PS5m58MIuXEyzDXNYLS+88Ts
 KBc3ZkconA93aIKAD+DX4H8T1L4ZpF6Gjgv1qSAxfTIbmuYsb7UC2QUTfWTgbxMhKWbu
 Cy1Wsu8aKTkafFXxwU2d1DF71QieYF+AAbzW83F9zaHaL1w1AENqrPT2Bsw6pWnK3BHc
 Z/2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KWoECrHH
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.7.1
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

 - Update syslogd -T documentation, it applies to messages originating
   both locally and from remote syslog servers
 - Fix hostname filtering support, introduced in v2.7.0, broken
 - Fix parsing of userspace messages in /dev/kmsg, inserted an
   extra space before the message payload

From https://github.com/troglobit/sysklogd/releases/tag/v2.7.1

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 4 ++--
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 4024965e23..645bc6a0ae 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,4 +1,4 @@
-# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.0
-sha256  6ab74ab5001121bb32697fd2f7ab3cc4b4452c3f721677e06e5b60982a04d0cc  sysklogd-2.7.0.tar.gz
+# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.1
+sha256  69944b2227647bf47ee01c9f482d19a79dbf2b53b8ce8ded0486b08db8c68c40  sysklogd-2.7.1.tar.gz
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index e8b7fe2062..a3e27fd17b 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.7.0
+SYSKLOGD_VERSION = 2.7.1
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
