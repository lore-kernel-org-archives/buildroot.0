Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50995D10375
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 06:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F309482572;
	Thu, 27 Nov 2025 06:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZnwArQLqohf; Thu, 27 Nov 2025 06:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA3FC82591
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA3FC82591;
	Thu, 27 Nov 2025 06:31:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C61F3DE
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 06:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B828D402E6
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 06:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9LtNUCHV8_c for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 06:31:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F132240065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F132240065
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F132240065
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 06:31:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F7D3A4C76FA
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 07:31:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47086)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vOVWt-000000002HE-2VVQ
 for buildroot@buildroot.org; Thu, 27 Nov 2025 06:30:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Nov 2025 07:30:59 +0100
Message-ID: <20251127063059.5166-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764225060;
 bh=q7pPMB/mPL1ljr5xHANUJxWbk1P2O/1z8tSoMwUeEn4=;
 h=From:To:Subject:Date:From;
 b=RjJk0qYIiVB9fHANspbYAYkPzTdFflygSsa8m95NkvHHR2m/2XCmsRei1iRap/1zB
 4Ds8SJXh0QtT6KAoGlt2fiVw+q+c7GmWI3a7BABwpHzhCMs7SGIWmgtqf9cusmJYwU
 8l56II20yfeiT+UpPZEmXhVqUZbO4ehuHwjYskcXSFO2DtKVMr6W9LF39jNQM/ryrc
 8Xw8lo1lMaSBgTZ+8WAj0ACHwi8m0q+etgwdT817TYh6ZlB0O0gCulI5h7aanlL6JI
 DSImmMSbQ0aEPciMTl/Ne5WFwWuuKyMn3e3g1J9EI1pq9Qldu5raWd4NpvwsjQBeI2
 v5MVb39KuC7rA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=RjJk0qYI
Subject: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: fix hash for kernel 6.6.117
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

Buildroot commit 59479ae646767f22914335301dcec6fbeb313755 added a wrong
hash for kernel 6.6.117.

Fixes:
https://autobuild.buildroot.org/results/5aa65e053b827e4d5c21d4cc06f439f1dd093053/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 943b3dc9f4..a01162c3b5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  6d08803b953c509df48d44d3281ed392524321d8bb353eb21c0555790c8f8e06  linux-6.17.9.tar.xz
 sha256  a1d2cd7327f10eec022615c1bb12c06439bd110d2020164be97f698f43ca58be  linux-6.12.59.tar.xz
-sha256  a8fbffe691974a3bf6a21d34eefad71a64c2a1fcc4513218356f1a87e390788b  linux-6.1.117.tar.xz
+sha256  643b31079222fdbda70cfdd0b68c514f05a3926104be4762a4685f62818b43d1  linux-6.6.117.tar.xz
 sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-6.1.158.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  83157953598b026fb721c906c60dfdfd8e986f25ecb9910f3504f690e2770e05  linux-5.15.196.tar.xz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
