Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25396D5B16B
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 21:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E897140377;
	Sat, 13 Dec 2025 21:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WLXkZ1e3tY6a; Sat, 13 Dec 2025 21:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03D00402C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765662076;
	bh=UD4G4bsVEeXRsfjXrbSKjppRojej1oxc4mNgoPzSxtE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HhiKapTDo7DpSBhHKuNyd4MxjyCSCL7ny2ec2sxoUELOpvwgEpWNe9zE+qX3vFsHM
	 6zfGa4EMrLUAr4+qROibe6QXpkc2OrtKV0wkIRRtvV3KigRkMCJ38OdgduzTQGGReR
	 zE+dp+T1JTP9owga+YTZiIUTr96HAinJEyoQM4mmg7xe+7R+8eltpqnQJrCtsaM1oz
	 ThLbMy1PUWsaJ5Eu2iO2x1M4GHGU82dKFCZE9v6Abxu5e+qfYMRerrD53q/7ing22z
	 Y1fnQr9Hm9QgxbBYqQY8YTLAhI77cvJ1SQ8dOeJaRq63M/zrPvAJhZEzzG5b6VLxsz
	 9O42aRxCZtzlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03D00402C0;
	Sat, 13 Dec 2025 21:41:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 201D42C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 121AC40199
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xv3XOjPyRD3 for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 21:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A14D40130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A14D40130
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A14D40130
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:41:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id UXMSvqOTq3rWiUXMSvHz6P; Sat, 13 Dec 2025 22:41:08 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Dec 2025 22:41:06 +0100
Message-ID: <20251213214107.1893921-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213214107.1893921-1-giulio.benetti@benettiengineering.com>
References: <20251213214107.1893921-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPZmBN7ucbg08uqPXpC90V9uR9gPHnJUsAwNSeTRTlMqGRksvrIZeccspeZH4I8QMO+b8jhm7UEB4Pj+ZrmJBmparxUnO6z/fUvK4C4eNeHoCBF0WagU
 7aial5HX6qvHLPde49Vr1e7vIA7rIsuE0KdRUeaLSdZdxq874+NWgICorwNSwqsBwzT0HkNNXG7OGDTV2SPpu5QvCk/0h0rrRkk0Rl+DVMgTq7wh/NCvBOuT
 0WjZv7jIETDHkqQjQyRa5urzHDOXOeiAOq3VFEc9PavNYTWNaws/Ct4stX17nq94B7KYw3WGOnMzrp/PUdFnOmxgHSchFjsx5EBoZz2njbvflN1ei0jEy+Ip
 4IJqCihz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765662068; bh=uh/v3o4JVSDJLTS+3t6szyu4hB4pDmp0FUdSKPpD85o=;
 h=From:To:Subject:Date:MIME-Version;
 b=CFBlqNygfk70nB1PpJqHhXYbdJo18DyonT72soqiOZzTrFkw+O1W6h1XdqzPAZjY4
 cjqiHCu4JML5ZxTuUz7ukEMdpwtfFM7ixtfTPJ6Nkz+PcACd/xlNOLViVwBuWJjJS/
 qWVGOyoS2e9EpBKlXsoaj0Bp4MRwkglqw1mcxrxCmKgne1Q85JtaY1uUi+0MuY0rGw
 wTpp4Z+UHAAYdhKCVD/f7K582YpXypfpHmVsEQa0F2XQQRJ7kMRNW/4jVJ92RYo21j
 pYBBuI9Ahk/92YepbJlCiq9CR9A9sDhEYg9wFwJRLG8hmuhihGD0UQI+S5T1KN2/u0
 U0vPEn4HSv00Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=CFBlqNyg
Subject: [Buildroot] [PATCH v3 2/3] package/nfs-utils: fix build failure due
 to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

Package nfs-utils requires libtirpc rpcdb option enabled. Package
libtirpc with commit [1] disabled rpcdb functions by default so let's
select it by default to enable rpcdb functions required.

[1]:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Fixes:
https://autobuild.buildroot.org/results/29adf2d04cf4c46e492af95edaa96983985d6b57/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* no changes
V2->V3:
* improved commit log with libtirpc commit as suggested by Petr Vorel
  and Thomas Petazzoni
---
 package/nfs-utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 02cc7e78cc..419b605667 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
+	select BR2_PACKAGE_LIBTIRPC_RPCDB
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
