Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F126C54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 11:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 051A540106;
	Tue,  5 Mar 2024 11:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eh9BFvn1xkf8; Tue,  5 Mar 2024 11:15:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBD08401AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBD08401AD;
	Tue,  5 Mar 2024 11:15:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 187771BF489
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 11:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 055806063C
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 11:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cBGOAMKVoE5 for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 11:15:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.71;
 helo=smtpcmd0871.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0DAD86060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DAD86060A
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DAD86060A
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 11:15:16 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hSlNrDVYlnAihhSlNrELz8; Tue, 05 Mar 2024 12:15:14 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 12:15:13 +0100
Message-Id: <20240305111513.393818-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBJfC8LEr65yu5X18M50SKvqZgTdNYHV7wRiOa7HBA+fARbGj1Xu8jP9nDn4bjIPkTCu/mJpMWPwGilqqePCts+vTqRHV2kuL0cBZaHCYcrPpoB5uaV0
 fNC24lN9xAp10aCLyMpCyqwvUXrkfoUsNqO2LubnVsygGLVffl4g/LDEtQLPShB9q7AHdNYZTmoUlRV7WhZ7SIBHBfAjfRVu3re6qbZODHLaju+k56Z/lu0T
 FiC+d51uZ7oNagNeaBxK/bbKesCsKs7OHBVxaTOOywuZ/YlYVJ8UAyjxNhwWV8Nmb3VK6v0XYh1PousYCV+w3JEStMA/8cYN3fsiDDWbL1Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709637314; bh=1UfEknjZL0uooPmfhbjFwiF8e1YfVHwQFHTkwV/cjo8=;
 h=From:To:Subject:Date:MIME-Version;
 b=CNpNjYGf/wNiZUvTh87knlUsxsRYhQ4xwk+X2UsPrEdSYA3yG0QNu6bQUOCVHju2D
 UVjrrL1VidKLVt3LUfV8sJelZpVtoDJm170HxuwS5k6mwYRtOS+RKAJ6vsz9y67lqG
 fhNWrFEELhW68mlkrS6ygBuSFXhYLIai4UkcYQvNEOnprWDj+MQ5jNf/OsSnsHbKpQ
 EGglTL18zyLW5C+IxblR1Pby09otk3AcT8vo3amnwaTO5ywZSQ4e9BAXlD10yPWjyn
 hhxSYNWefsFlnmgaDGDrfFVg5Xbwpr3jaFnoEOfy5vO6mlIN+rDDsZ6DlvCEKXAzZx
 wLa9Wq/86hcxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=CNpNjYGf
Subject: [Buildroot] [PATCH] package/mmc-utils: fix build failure due to
 type-punned error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream to fix:

mmc_cmds.c: In function 'do_ffu':
mmc_cmds.c:2971:2: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
  sect_done = htole32(*((__u32 *)&ext_csd[EXT_CSD_NUM_OF_FW_SEC_PROG_0]));
  ^

Fixes:
http://autobuild.buildroot.net/results/06f972f95f4f2e0e7504b1fa069b89695b7377ef

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ds-fix-type-punned-warning-on-ext_cs.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/mmc-utils/0001-mmc-utils-mmc_cmds-fix-type-punned-warning-on-ext_cs.patch

diff --git a/package/mmc-utils/0001-mmc-utils-mmc_cmds-fix-type-punned-warning-on-ext_cs.patch b/package/mmc-utils/0001-mmc-utils-mmc_cmds-fix-type-punned-warning-on-ext_cs.patch
new file mode 100644
index 0000000000..837c09f4d3
--- /dev/null
+++ b/package/mmc-utils/0001-mmc-utils-mmc_cmds-fix-type-punned-warning-on-ext_cs.patch
@@ -0,0 +1,40 @@
+From 18b2b6e2049cf650a2fb27992047cd439ee0d501 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 5 Mar 2024 11:52:54 +0100
+Subject: [PATCH] mmc-utils: mmc_cmds: fix type-punned warning on &ext_csd[]
+ casting
+
+When building with -Werror=strict-aliasing error is thrown:
+
+mmc_cmds.c: In function 'do_ffu':
+mmc_cmds.c:2972:2: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+  sect_done = htole32(*((__u32 *)&ext_csd[EXT_CSD_NUM_OF_FW_SEC_PROG_0]));
+  ^
+cc1: all warnings being treated as errors
+
+Let's fix type-punned breaking strict-aliasing by memcpy() the variable.
+
+Upstream: https://patchwork.kernel.org/project/linux-mmc/patch/20240305105949.392092-1-giulio.benetti@benettiengineering.com/
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ mmc_cmds.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/mmc_cmds.c b/mmc_cmds.c
+index ae7b876..dcd60aa 100644
+--- a/mmc_cmds.c
++++ b/mmc_cmds.c
+@@ -2968,7 +2968,8 @@ do_retry:
+ 	}
+ 
+ 	/* Test if we need to restart the download */
+-	sect_done = htole32(*((__u32 *)&ext_csd[EXT_CSD_NUM_OF_FW_SEC_PROG_0]));
++	memcpy(&sect_done, &ext_csd[EXT_CSD_NUM_OF_FW_SEC_PROG_0], sizeof(__u32));
++	sect_done = htole32(sect_done);
+ 	/* By spec, host should re-start download from the first sector if sect_done is 0 */
+ 	if (sect_done == 0) {
+ 		if (retry--) {
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
