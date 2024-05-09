Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD8AC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF50C409AA;
	Thu,  9 May 2024 14:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDNH3Oo34ASL; Thu,  9 May 2024 14:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B99B415E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B99B415E4;
	Thu,  9 May 2024 14:49:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CDE31BF990
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A49D402E4
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2I8G8R2mLHgQ for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:49:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 160E2400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 160E2400F5
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 160E2400F5
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:49:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 449EnUUg003144;
 Thu, 9 May 2024 09:49:30 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 449EnUMg107963
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 9 May 2024 09:49:30 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 May 2024 09:49:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 May 2024 09:49:30 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 449EnTGm126225;
 Thu, 9 May 2024 09:49:29 -0500
Date: Thu, 9 May 2024 09:49:26 -0500
Message-ID: <20240508-clk-fix-backport-v1-0-92b8e66fcac7@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHbiPGYC/x3NQQqDMBCF4avIrB2ISS3iVcRFkk7qYIgy0VIQ7
 96hy//Bx7ugkjBVGJsLhD5ceSsaXdtAXHx5E/JLG6yxD9ObAWNeMfEXg4/rvsmBHT1tb4dkknO
 gLPhKGMSXuCgsZ8467kKK/j/TfN8/5T/Ha3cAAAA=
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=bb@ti.com;
 h=from:subject:message-id; bh=R0QA5rFPx//PWR34NBXCED+gIEGAwwHKxGlIf6RNd0E=;
 b=owNCWmg5MUFZJlNZ1Mp6PQAAbv////ZNznNurn3l73y7/++W//93+X0r+1+B7mya+9nt3+4wA
 RswIeoMmgaNGjTQGg0DTEZNADQAAaGmgAAaAMgGmQyZGRoyAwTEabUaPUaaY9KFVBpoBoyAGjRk
 aaZANAZBoNAAaGBPSAPSAyDQ2iZBpoGQHoQAGI0aB6IHBqaDTTTQxDQNMgekaZMhkDTQGEABkZD
 JpiaBhAYQNDQaNAaGjTJoyGhoDQABgCrQUAJBVCRhvjkJKGLZAgko66txENOMCLWssOCN3YVjUE
 nfgFPCKRB53ZtKkil1DYIADfp+QKseo/P+nKdKJCI5YDWekBHcNeHQt+1rw8oKABzXoGFjiZ270
 J1fxfoHd9pmNErwq9mXRC6geaMp2hQ3QFA0QuHbZkIsWT1lk9EFzxGKYSL2kaaPvkihZvBuZ5Uy
 v1yE2o+NMf4pmi7VHQL00I2jXypEbYJmKJvmn066k6yxF46PFaGbAnaRi8619VYdMQV1JKrqLt/
 zkbVUIln2rgo43RCdO29GaCRKuSg8HU7QCrAkpg0Ayk9wWZxCM+fwgYZF0L4NW84C3lKDT55bDV
 mZ0M0YRcN1yBDF7y0jolSgGuwOzoABeEA3enAYPDYW9fRgMknt0TAK++mCllsPx0QtxmIToUWcM
 GoX/F3JFOFCQ1Mp6PQ=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1715266170;
 bh=C9BBKIiqKtykzRuNMiPTMjwC+VNNDkynykynjloti6k=;
 h=From:Subject:Date:To:CC;
 b=e7pa3iJzHwNEZcBzrUc8t52zuONG/1lbUxUNUlmNyKK7yt0gNfZoUBI0ApOfiwqBd
 97GVCd3ZpulPoupUP2qSxm7EuhnTtUMTNGCsYhnReG8W6Pcb6AYt6u1bRAEOZ4Stq0
 /EMwpLmm3wVYKJ9ZNlY2BdorKIx9xbeMTq7YQRYo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=e7pa3iJz
Subject: [Buildroot] [PATCH 0/2] board/ti: manually backport Linux patch
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone, 

This short series backports a kernel clock driver fix to reduce a fair 
amount of log spam when using newer DM and DMSC firmwares used in all
TI's K3 devices. The fix is already merged and in the v6.9-rcX cycles 
though while we wait for the v6.9 kernel release, backport this fix.

Thank you for reviewing
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (2):
      board/ti/am64x-sk/patches/linux: backport linux clock fix
      board/ti/am62x-sk/patches/linux: backport linux clock fix

 ...e-sci-clk-Adding-support-for-non-contiguo.patch | 74 ++++++++++++++++++++++
 ...e-sci-clk-Adding-support-for-non-contiguo.patch | 74 ++++++++++++++++++++++
 2 files changed, 148 insertions(+)
---
base-commit: c37e98f486e1f9201d0ff91d9e8166849ae422ac
change-id: 20240508-clk-fix-backport-1e62528f0f33

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
