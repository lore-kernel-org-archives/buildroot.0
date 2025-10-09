Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ED4CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 21:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F2AC411E4;
	Thu,  9 Oct 2025 21:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAY25tXNiHQ3; Thu,  9 Oct 2025 21:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39546411E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39546411E5;
	Thu,  9 Oct 2025 21:08:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9416F226
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 21:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9048D40676
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 21:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akXtHs4wtnF3 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 21:08:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2411540488
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2411540488
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2411540488
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 21:08:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AED1A5FFA3;
 Thu,  9 Oct 2025 23:08:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Julien Olivain <ju.o@free.fr>
Date: Thu,  9 Oct 2025 23:08:39 +0200
Message-ID: <20251009210839.11148-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760044130;
 bh=pJxdAc3w15uAbcf/LGrfA8n0ZqoVCI+vtmr4uiExpx4=;
 h=From:To:Cc:Subject:Date:From;
 b=YZUv8alplppqgpWt/dopVxeDpmmEnZRepmQk9An/P1P/6F+39PsMokIRdTN1bkJ+D
 fkKqY2g4IR1vO9wukLXFr/mBHRgZV6Mca11NAHtzCzofRxU55M2X3p7B+PX6gu9urT
 3F2vz6dAWxXba5IGWx8Jf3rjnYth6tET8j0hZ6Mjn15XEiikPeYJYfPrW5Fo80++Fj
 IqfhQRi5mqL1b5CXstxM2qX9V3SkF7cYpCZ+a/8GzeJn/1lFAyjchXQST6KV+mzDmD
 oTkIRR3vpOGFfkxQ0OiDt4zymL2JUoW/oNedDrA1Pv4OUsGpEk4qArIlLyARp+7mbc
 CAcQEPPnC8yWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YZUv8alp
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: fix hash file
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] introduced an extra empty line in the hash file
which makes check-package to report the error:

    package/rsyslog/rsyslog.hash:4: consecutive empty lines

This commit fixes that.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/b39d3d8f62182d734c368e9197e1089792f2f958

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rsyslog/rsyslog.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index d59eff7eed..546682c9f7 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,7 +1,6 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
 sha256  c89b1e74d36d0ca4a95b74a1abe36ed0b1faac8b7c8be471a8415cfa776206fd  rsyslog-8.2508.0.tar.gz
 
-
 # Locally calculated
 sha256  054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083  COPYING
 sha256  8743ad560dea1229d4f46cd603e10874db41a27f3c74f64e958ef123f3943fab  COPYING.ASL20
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
