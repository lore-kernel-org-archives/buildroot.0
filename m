Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F905C55ABF
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 12:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 836E060603;
	Thu,  6 Aug 2026 12:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FR5xDxzECK-q; Thu,  6 Aug 2026 12:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8E4C60624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786018924;
	bh=55ysLtHpVe/lFp++uh47YkiNQHeBZT3SoeKsI2YBB4g=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=RNtsYMe9y8I2ZKdfGheP7dm0FdomzeubInXCfp3ZemUDGpTinnE6DOJfol/zKnee/
	 B77Gwnlfl0iWhktSy9l0MzLYJny3ih9vKcjOind+pkRnRL9Xm9wIfARysskBGh+E3K
	 SY/CvDYDmBON6LlesJdZKkLCC1yHXCL7d+6Og+QERgh4s08c1z+medSOwnya/oEJ/O
	 PzQrD9ZNYqKFEoGhLkRTXFEyn1SPJFBg4xI1/SySyPbZmTT/WHeT2Hl5KKsc/PO4nZ
	 XbakT5CkJivPLRzqFSGB9YlMDmq4ynCp4LzmtA5iT/rFXhwEPDOWxyjfwhINAgQKmX
	 yq8JB6SVubFWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8E4C60624;
	Thu,  6 Aug 2026 12:22:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C81E4198
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 12:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B992460624
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 12:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3DMW7sfAH_3 for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 12:22:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A2E260603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A2E260603
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A2E260603
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 12:22:01 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-47f93b2fe4cso1419403f8f.0
 for <buildroot@buildroot.org>; Thu, 06 Aug 2026 05:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786018919; x=1786623719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DSJZsQGDbjdEM0REf9FIw5UnBXWOVMBB2P2vZgYhw7M=;
 b=GBTpnVhH1FLuqNFQfycZWyJ07hPLn8XeflrjlGwXhDzElN66UtIF1qJo7LuY2GVlU6
 LNlhiABLcCEvpdUefckgTVy3oiXD5LYDYYlO6NyP0ZeJzfutcOeQWol9p6Jn43T6aKTJ
 iZr2SfaAUuA1eNhUoSul2mU2+QfGBN3n1aBCV6JdCvJISLnrLZNMRh+BJ1J+v+QlNMW5
 53hg7YCyMyNIGHLm+snI5Y1iRUnKEXAfWgAtpPNeNOlh+L4plzzjMX8Uf3PcLDqRYx3C
 gI8Rhju1Rvg6TFniRGgXWVDS/tFljUoiVAJ/FF+afj6QKbZ5GcgMunkQB83BEOfZmRZw
 /VJA==
X-Gm-Message-State: AOJu0YzB806KdAWOWzY/pXNYQmw88dRgh//n+VV/XPB/gupTZ/W3peVs
 nUWzw1Pqh2vcZ6FV39nZCsQp0EVDyRPMPs1dwjX3MjXHp8Xpe8p/fmLwNBj4+vLecdYC5Qf/QaT
 NWF7rb+0=
X-Gm-Gg: AR+sD1214GGnfSCVDsmGOeiWXI1gaPd9xIzRoLYYA8XOWf44kklLCgdOTd0nzvFVKWJ
 HussoRrbYGSL9hTd2hSFpsUGPU68FURzMaOMw4mV6z7MhEYq7/LpXSOz/R3VSBAgHs8NEfwbSfF
 qxiWcq926ZO4+2zSXqPq9wW8zuhTpkY5Rdxl8abCmclB1VjLliw8GYBgiPBFLrmnleJaz8l2sqm
 HDMqmF9rEwv+MbDh+X6Uc/SfML+ykcuq6KHIEK4jIRdx1BKY7MtmocDrvxoig2mCJzEKkAo/KSc
 9olXd8ho/PIbz9nRUPV4o+BNkubiMy/6U0JSDAVwIdNfFJ9nVKcg9c5XVeUCzrv/0vAdmKPrNfV
 1bCed8aRWDP+zPHoehF+6c+/fNNquAkmJwTBMJSOrA+F/uI+n0zS9FZKEvESSYR290oG0fTJaIU
 7ZBYTIpRZ1oGBDTxlK57eOSmJ/+H7+btv0NJ9jZ8TEOvhaX0N6H7jnoW0v/zc/fk4dMzqk3QeOh
 oU+9yE0QP6eCmn0tje/YywsColXjP/AhuGWzQygOxYBzmQ487JfMdWtDYg59XwEl2/8
X-Received: by 2002:a5d:5f96:0:b0:47d:f441:5f93 with SMTP id
 ffacd0b85a97d-47fec6403cfmr22958734f8f.25.1786018914173; 
 Thu, 06 Aug 2026 05:21:54 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ff7b26879sm5866021f8f.30.2026.08.06.05.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 05:21:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Thu,  6 Aug 2026 14:21:50 +0200
Message-ID: <20260806122150.546235-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1786018919; x=1786623719; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DSJZsQGDbjdEM0REf9FIw5UnBXWOVMBB2P2vZgYhw7M=;
 b=N5hb+OLjUm5ZrJoSwL7vRvfQOL8E1udq4pOmx3GJqUbKRSmp2YOJIbS5ZHffMq0wQM
 ErgHdXc9CrOwaj4Pc6lShSrW5ZGBixC3OZtelU0JEKnauuuQkdvTNReYBLQ+Ld6SSqC/
 T0ivGS2D+EO7ghZveyEAv06bRpphmo//atQPE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=N5hb+OLj
Subject: [Buildroot] [PATCH] utils/pkg-stats: Add stats for active,
 lagging and inactive packages.
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is following commit [1] and adds statistics ath the end of the
page for the number of packages that are considered active, lagging or
inactive based on their upstream activity for github and gitlab hosted
repositories.

This patch also adjusts the logic for determining upstream status.
A package is considered inactive if it has not had any upstream activity
for 3 years or more, lagging if it has not had any upstream activity for
1 year or more, and active otherwise.

Tested locally.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>

[1] https://lore.kernel.org/all/20260727144936.3553073-1-dowan.gullient@smile.fr/
---
 support/scripts/pkg-stats | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 29376b9e78..e98028ad30 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -605,9 +605,11 @@ async def check_git_status(session, pkg, npkgs, verbose=False):
                     now = datetime.datetime.now(datetime.timezone.utc)
                     delta = now - pub_date
 
-                    if delta.days >= 365:
+                    # 3 years without any activity can be considered as inactive
+                    if delta.days >= 1095:
                         pkg.upstream_status = ("inactive", "inactive")
-                    elif delta.days >= 180:
+                    # 1 year without any activity can be considered as lagging
+                    elif delta.days >= 365:
                         pkg.upstream_status = ("lagging", "lagging")
                     else:
                         pkg.upstream_status = ("active", "active")
@@ -866,6 +868,12 @@ def calculate_stats(packages):
         else:
             stats["version-not-uptodate"] += 1
         stats["patches"] += pkg.patch_count
+        if pkg.upstream_status[0] == "active":
+            stats["active-packages"] += 1
+        elif pkg.upstream_status[0] == "lagging":
+            stats["lagging-packages"] += 1
+        elif pkg.upstream_status[0] == "inactive":
+            stats["inactive-packages"] += 1
         stats["total-cves"] += len(pkg.cves)
         stats["total-unsure-cves"] += len(pkg.unsure_cves)
         stats["total-stale-cve-ignores"] += len(pkg.stale_cve_ignores)
@@ -1370,6 +1378,12 @@ def dump_html_stats(f, stats):
             stats["version-not-uptodate"])
     f.write('<div class="data">Packages with no known upstream version</div><div class="data">%s</div>\n' %
             stats["version-unknown"])
+    f.write('<div class="data">Packages with an active upstream</div><div class="data">%s</div>\n' %
+            stats["active-packages"])
+    f.write('<div class="data">Packages with a lagging upstream</div><div class="data">%s</div>\n' %
+            stats["lagging-packages"])
+    f.write('<div class="data">Packages with an inactive upstream</div><div class="data">%s</div>\n' %
+            stats["inactive-packages"])    
     f.write('<div class="data">Packages affected by CVEs</div><div class="data">%s</div>\n' %
             stats["pkg-cves"])
     f.write('<div class="data">Total number of CVEs affecting all packages</div><div class="data">%s</div>\n' %
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
