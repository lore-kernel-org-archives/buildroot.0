Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27CED39013
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE92060BBC;
	Wed, 14 Jan 2026 19:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTTtFBlNzM6V; Wed, 14 Jan 2026 19:55:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCE7D60BBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420501;
	bh=d21cGQyDMYn34WU3+6v4Hr0pCRt2tn6YjqSA0AUu75o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EdqWeKmKsX1ehOPsh9cxRMi2PyGATLV4MxQQTsXtsXzjZRC0z6wgxE1icbetu6U0/
	 8nvyyi8Yj9KuHje98fDyzkmzrcpIbZUttGzzLPdmm0lKhq9JjPHPp2LgNJ8yc57TEW
	 XtqGLvROi273Jbq/qBi3AkLTAy3wSZzDCfjyynlaTWIatLpqYLvZ+l/GzFL62PNQ8+
	 hT6mbtuzNu1vEfrqCauEy3u9/qw1Ka5uI9TZPRCakwZ57Io3SHECBBQ9fNwk+W0Cnm
	 monwUbv0WRiRCJc3hxXBtuB25aQ+dNYweJzQ38CwDEA0i2XCx5v35hCkb2u3ki4LQf
	 2z/u+Z95fXrOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE7D60BBD;
	Wed, 14 Jan 2026 19:55:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67DB025D
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D29F40AE8
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B51ai02SvCNH for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9EE0F40AE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE0F40AE4
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EE0F40AE4
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:55 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6xAvBAQ9wf0Dg6xBvzgbC; Wed, 14 Jan 2026 20:54:53 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:54:36 +0100
Message-ID: <20260114195451.3978704-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCgihcE5ANmE4LoHgsJ0LdLfOfwXyZ3Wgr7NMVIpSAtKb/gCpuHhOcVSMxAytoPXiqI5fhxDf9hH/9Aico/jP0oh8SMLt12r69TB593xFV12CpUJiwmt
 iVoFKbMBHRwEdRtw+k8RrbLuuXxCxTGgp97TSaP+Qhkb0jMST2CRNv2ZCnezo+D9F+7AKHLxXoKvVVLYS5gdenKcmBwnsA8hDQJYZecQGdpuCEei1zyaoN5L
 WIRs6xIb/ac/arWlhDpTS5YrmAYQjBoM6d1LtjjkdNM/Fbg3i4NRilmcmnrNYL00QzjVKkuhRNkVzBhZrB6aR0IT5qbMcDNDDEnS8zhxKjlz9xPyW1OaWh5t
 pGQELGGZWehu8sRFmI4fLwfYBOMXSGTwEtVweX4OxWANLEdIGPuz4xzRyTtL2ssyOyCKLlXJmIg6Q8tfYxG0mG76UuwiiGOuV0jWRh7Tf7ryOGMsmufeC2Mx
 OCIWZvLYHeWBr+OIvgJDD22Sdok6qgXhQ1IV4NmFWRwf6XImidWQtDBXSkYfAt/CdEOt8TpX/93NQIGz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420493; bh=brE+X7bgqeNKUZtAtvB3heNnxRrG5TGr8xFFcTn7v5E=;
 h=From:To:Subject:Date:MIME-Version;
 b=OD+69yXGSET5ArBZ8cc+01y0Xc8KWW7RqHkg0uzNSRSlkYN5sG0d8yWJwcHIa8CsI
 65Cx97iT2Autj22D530OZp6I1YYh2aom/MfQalHARQh47+2b5Ii1WylXtpmrr6Zd9K
 qBxE/whH3/VcSmdrfYoVULzAfB1lD1NeuRoFoFm7okMXHtBrfT00xoUUZP3Df227ki
 80UDOONY0AcXv47CkubU74Wk7ocis1Ss001WeN3Xj3bxv7GLYLS3EnJWjxKGt+mT+Q
 aCIUepZZHRfKuN2icgmHcdMiU46TI1YoRZkZYO8nNLhbB3wPcyKxjKf1WMD3xetds6
 poFpXlS+gDWTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OD+69yXG
Subject: [Buildroot] [PATCH 03/17] board/bananapi: simplify berry and ultra
 configurations
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
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The genimage.cfg and post-build.sh files for Banana Pi Berry and
Ultra are identical. Replace the files in the M2 Ultra directory
with symbolic links pointing to the M2 Berry directory to reduce
code duplication and ease maintenance.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/bananapi/bananapi-m2-ultra/genimage.cfg  | 17 +----------------
 board/bananapi/bananapi-m2-ultra/post-build.sh |  7 +------
 2 files changed, 2 insertions(+), 22 deletions(-)
 mode change 100644 => 120000 board/bananapi/bananapi-m2-ultra/genimage.cfg
 mode change 100755 => 120000 board/bananapi/bananapi-m2-ultra/post-build.sh

diff --git a/board/bananapi/bananapi-m2-ultra/genimage.cfg b/board/bananapi/bananapi-m2-ultra/genimage.cfg
deleted file mode 100644
index 92c8677545..0000000000
--- a/board/bananapi/bananapi-m2-ultra/genimage.cfg
+++ /dev/null
@@ -1,16 +0,0 @@
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8K
-		size = 1016K # 1MB - 8KB
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/bananapi/bananapi-m2-ultra/genimage.cfg b/board/bananapi/bananapi-m2-ultra/genimage.cfg
new file mode 120000
index 0000000000..aa6832894c
--- /dev/null
+++ b/board/bananapi/bananapi-m2-ultra/genimage.cfg
@@ -0,0 +1 @@
+../bananapi-m2-berry/genimage.cfg
\ No newline at end of file
diff --git a/board/bananapi/bananapi-m2-ultra/post-build.sh b/board/bananapi/bananapi-m2-ultra/post-build.sh
deleted file mode 100755
index 21a2b0d8e7..0000000000
--- a/board/bananapi/bananapi-m2-ultra/post-build.sh
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname "$0")"
-
-install -m 644 -D "${BOARD_DIR}"/extlinux.conf \
-	"${TARGET_DIR}"/boot/extlinux/extlinux.conf
diff --git a/board/bananapi/bananapi-m2-ultra/post-build.sh b/board/bananapi/bananapi-m2-ultra/post-build.sh
new file mode 120000
index 0000000000..01ca59fa50
--- /dev/null
+++ b/board/bananapi/bananapi-m2-ultra/post-build.sh
@@ -0,0 +1 @@
+../bananapi-m2-berry/post-build.sh
\ No newline at end of file
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
