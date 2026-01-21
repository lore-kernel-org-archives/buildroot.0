Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE39DC44503
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 11:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F49E84544;
	Wed, 21 Jan 2026 11:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BKwWmqsVgtI; Wed, 21 Jan 2026 11:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17FA284539
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768993345;
	bh=hiPtlqQFt5T/DLG/D9J8b3ppn+bNnZeHk7havK7ZCMc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JtZbu12BuU9Hju4BmYE93EX+uAATnnqOz8Uf1yiotwQI9i3NpLE14ZwyhwhX5ofdd
	 xgpaYFG6B3d9h4De2HHTysZxwXAaQG4rd0k7bbUulXY1I3vyJx2EEB3pl4r22ZQuSL
	 TfCKqbc3VTqIga+LteQVgWtQK9s0C1G+tdKtZ2nt9Lhe8ratWqL7/RVjQqkSqYXGag
	 TP0Uic9PhuZprKlElJkCNR38jhSxg6qFUhegUgALbggw+D4rP7Kgq1CxFdzSb0jcMD
	 BIVMqWpDp5PGqlTbucqDQwWHnIbSc/XmVS3oDOaZway/T9WpewUcLl5RRXY/F9BgV9
	 K6O1+QEcqldaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17FA284539;
	Wed, 21 Jan 2026 11:02:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DFCC2377
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FEBA61589
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shXODweR54va for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 11:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A966F61588
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A966F61588
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A966F61588
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:02:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -81287660; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 21 Jan 2026 11:02:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1viVyW-0000000E4uL-3Ra5;
 Wed, 21 Jan 2026 12:02:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 12:02:01 +0100
Message-ID: <20260121110208.3355429-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ZHlV0TUe3B7ZFysOPIxrucSsq88ZUqPQKzdtyWcox7tG41f7S/91fbI4J9XFYicx2ND1P36ziKtPlKRjO4I56KoshICxj4LPSQRczZ7v8H0g7GOaNL4oCo0ou8zAY85y8dyv+5SVkq+BCkKXmM6HUR1OrDibEZINipyR8K9QZdS15vqjhC11wtaXNGlU6kf6zVwuz+Br21/0dJeKXZsT+jnnJU8TEyIXlj3ZJMH2TvvKjmvnRula/yyatE2rmrtZFjOQL4A6uK2jvDtMDbyZKQLSALWC6V2nMo8mg0/0FH110xpQOzhyuzo1PLmxdl/iXDvw4Bh7dCl3f0SJ3OFp+w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=bZc03xUeKcZfSCvIeYymYZLxOD+BDuhlCh/Fvs6RhrU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ZHlV0TUe
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 1/4] linux: fix 'architectures' typo
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

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 96efbe5678..3a1852c7e9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -473,7 +473,7 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
 	  match the vendor subdirectory used by the board in the kernel
 	  (e.g. arch/arm64/boot/dts/rockchip/).
 
-	  While most architechtures make use of vendor subdirectories,
+	  While most architectures make use of vendor subdirectories,
 	  like arm, arm64 and riscv, some architectures like powerpc
 	  and xtensa do not.
 	  In this case, BR2_LINUX_KERNEL_CUSTOM_DTS_DIR should point to
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
