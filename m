Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C0FD15DB6
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 17:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D8D841F0;
	Wed,  3 Dec 2025 17:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-9Hy22i06Cj; Wed,  3 Dec 2025 17:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52447821C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764781427;
	bh=9nmWpzuD1aKX5FXyna5TzarcSjwH2bLLRQ6/N+/rldU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LmJqyQXrJW+eGPNEeQ7C8ElI7mPHa/L8uey7q5Vu5fWZiUQJAwQfAX65kheyElJXJ
	 chiCnZzGWEMaKLP2pBI8PukeCkOMoMmcfIpsoDVwoB/CQiTR9HfjgcrpRcafpSMWHa
	 5YOLQvabMGL1IOKEZ8/Dtc2XfHTY8j5iFZ7jYlc9KtzcITF3GSqKBqIZQ8RswDZKr1
	 safj/CsmIta3S3xP7kr1YEgLM7esqdWbkfQTavPcKIaGQgYFmhjK0xwpeEvXATr/L3
	 +UKG1hgSNVm2Juq5nksSgV5yGtmrZTsBS0D1xmD2Aok9PNdEWVK0xWox8eMGMvt1IJ
	 i0dc8u+/sPVOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52447821C1;
	Wed,  3 Dec 2025 17:03:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0019D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 17:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8EAC616E6
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 17:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfKKXu5vlo_s for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 17:03:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E8F160DC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E8F160DC4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E8F160DC4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 17:03:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 94D1BA4C7956
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:03:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43552)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQqGK-000000000Ea-3Kbc
 for buildroot@buildroot.org; Wed, 03 Dec 2025 17:03:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 18:03:33 +0100
Message-ID: <20251203170333.1769022-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764781413;
 bh=s/BzDPeaHMIEKMEeD2r3iKDXoIpKo+kuliOpsMx5koY=;
 h=From:To:Subject:Date:From;
 b=Btcu8OD4S4iSocp41i2anKBB87Oz3/vqtUiGcn0mvDiNtTIrjkSHe84MIKO3JGSTy
 dPzY/317UOjK1NBw9ITBSdptUTiU3hJZ5Qri/EXvjZoixldDLRSROkMSD8OokkdHQg
 5Ue8ioIULLhfqwN4qG9pQUmZpwRIYJjZ++RIefEnIkid95AGa2c05EKKOQFrcZ+6xR
 8m88R6RNJINkL9RpfSkI7eV13EPwKBXZKUPmT7BVV8It/QaeRDSM3B8vPzmUOYxDQe
 N18lE8lEx7iuIk+PfRn51+iZRq5ETJwlEjUu9XAVZ1j/I+Yz9eMmATBXmDjZidjc+W
 3qrM75u+uAPcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Btcu8OD4
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.4.x series
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

https://lwn.net/Articles/1049060/
"This is the LAST 5.4.y release.  It is now end-of-life and should not be
 used by anyone, anymore.  As of this point in time, there are 1539
 documented unfixed CVEs for this kernel branch, and that number will
 only increase over time as more CVEs get assigned for kernel bugs."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 4df1c5696a..bca5756926 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -6,7 +6,7 @@ sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  83157953598b026fb721c906c60dfdfd8e986f25ecb9910f3504f690e2770e05  linux-5.15.196.tar.xz
 sha256  eb6b76c269d2dc09791638b10b9dcb9d79fd2abd45113a31fc03f68731caa875  linux-5.10.246.tar.xz
-sha256  b7718766d060e6714bbe47004c71c360e844758f42fbf62cbaa5571119527962  linux-5.4.301.tar.xz
+sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4ab3516d61..79e73dab3f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -458,7 +458,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.301"	if BR2_KERNEL_HEADERS_5_4
+	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.246"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.196"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.158"	if BR2_KERNEL_HEADERS_6_1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
