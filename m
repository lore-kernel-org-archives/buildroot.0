Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14ADC54E66
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 19:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDBC9400A4;
	Mon, 11 Mar 2024 19:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HuYCh1lvslA2; Mon, 11 Mar 2024 19:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0E4740151
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0E4740151;
	Mon, 11 Mar 2024 19:32:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D66941BF86B
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 19:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3CD640151
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 19:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJnMfKvra7OA for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 19:32:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D11E3400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D11E3400A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D11E3400A4
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 19:32:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0dd1.dip0.t-ipconnect.de [91.58.13.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F851A4C2536
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 20:32:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36926)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rjlNa-000000005rM-00zz
 for buildroot@buildroot.org; Mon, 11 Mar 2024 19:32:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 20:32:09 +0100
Message-Id: <20240311193209.467219-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1710185530;
 bh=f7MmChDJogxeHFwOvcwy3w/psqP3IlIV1SEJVtuu7gU=;
 h=From:To:Subject:Date:From;
 b=Tw3wJ6nG27eYDnms3Zeuk344v4H/hejpqdbQOlkrfPwxMe+vptKdRz2SO88wuov77
 skcZP1EicLQJI+ySXWswmesO9qKeCisIgSSGKKlz0ypt6gnrIdmYUAAy6bH+Y2l1iV
 pCPl/69DZ7n6b6/o3xuFZtSAa7Huo4HcrXdouMogYussvysvU7DBCGcgz7sDplRYG3
 +qj1hcBcwmb2vJFBVmhNy7sdtgLO34UoRectLAyx+0JcGRSjVKFseJkN/CPXJAYJao
 tfpA75qfo2EAhBa3FPeoqiQ25C8orw8ShsHZGEG7AOnXsy99J+HC4AJDIZzD4YUtd1
 1ZJddInws3TdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=Tw3wJ6nG
Subject: [Buildroot] [PATCH 1/1] package/busybox: disable tc to fix build
 with kernel >= 6.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see https://bugs.busybox.net/show_bug.cgi?id=15934

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/busybox/busybox-minimal.config | 3 +--
 package/busybox/busybox.config         | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 1e7ad1d357..5d2a30806a 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -955,8 +955,7 @@ CONFIG_PING=y
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
 # CONFIG_SSL_CLIENT is not set
-CONFIG_TC=y
-CONFIG_FEATURE_TC_INGRESS=y
+# CONFIG_TC is not set
 # CONFIG_TCPSVD is not set
 # CONFIG_UDPSVD is not set
 CONFIG_TELNET=y
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 6e8bd2799d..cfd16172fa 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -968,8 +968,7 @@ CONFIG_FEATURE_FANCY_PING=y
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
 # CONFIG_SSL_CLIENT is not set
-CONFIG_TC=y
-CONFIG_FEATURE_TC_INGRESS=y
+# CONFIG_TC is not set
 # CONFIG_TCPSVD is not set
 # CONFIG_UDPSVD is not set
 CONFIG_TELNET=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
