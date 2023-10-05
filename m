Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3168EE7B61F
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 06:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE8228234A;
	Thu,  5 Oct 2023 06:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE8228234A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMsKL7D58JDH; Thu,  5 Oct 2023 06:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AD698234B;
	Thu,  5 Oct 2023 06:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AD698234B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1894A1BF25B
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 06:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3D4D814B3
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 06:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3D4D814B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOGhdD5W2fVi for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 06:25:08 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0207181416
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 06:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0207181416
Received: from pwmachine.numericable.fr (unknown [82.77.158.143])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7CF1F20B74C3;
 Wed,  4 Oct 2023 23:25:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7CF1F20B74C3
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Thu,  5 Oct 2023 09:24:58 +0300
Message-Id: <20231005062458.8973-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005062458.8973-1-flaniel@linux.microsoft.com>
References: <20231005062458.8973-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1696487107;
 bh=4naR8WGlmE5BvKOIAoLyBxhveGW+l1PPbyM8t8W1ZYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gceb1vOIlwC6E4w9ebJ2fHAXBR/bLJkosmUEZdAuN1/JFrwxhRNniVuJREtrHqjqk
 Xg9Eyam8Ea4FtGwVJvV+pqScQFXbHXn1cGk2t9a8ZSDV9cdqI3y7kX2d9Bka4LxaeB
 BRXmdq9LpHaPfHUaMTpX4CdsArFmMIlXcTp/hI54=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=Gceb1vOI
Subject: [Buildroot] [PATCH 1/1] package/tbb: fixes hash
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: 74b50d553eaf ("package/tbb: bump to version 2021.10.0.")
Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 package/tbb/tbb.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
index 1caf81c5c5..085d54109a 100644
--- a/package/tbb/tbb.hash
+++ b/package/tbb/tbb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eee380323bb7ce864355ed9431f85c43955faaae9e9bce35c62b372d7ffd9f8b  tbb-2021.10.0.tar.gz
+sha256  487023a955e5a3cc6d3a0d5f89179f9b6c0ae7222613a7185b0227ba0c83700b  tbb-2021.10.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
