Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B66E8FDCC
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 13:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C5560796;
	Sat, 27 Dec 2025 13:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4wnP1PYqq46; Sat, 27 Dec 2025 13:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C70F26062F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766840683;
	bh=B5f+vdKrowqn6KJFEdJgxB1RwlneBX+1N+cdxkJl+qE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sMExL6b0NdTrZ55glOh5e+/KCZgc7i7VQQeS3GUeMwerwAwmvKzzG16C3zaV4pFWd
	 oUgeoxLPiyuqJnw8evA+MbnvOmnLHvH3wd2icFWI/Php6rLomjH6R69goxTwcdmteO
	 BobXGCmA+uhou9mzLFtOQnPWvodkXUi/rhLQ8w8UMmS5/jqQ6HPKEbT9jc7nAb+Ez/
	 OKXTF/FxlpXOFuRq9iViDyzWnFppSLSu4joRgK43jwBEo/JGy1rX37y6J6cOeFCBRB
	 mhLDw9zPNfLmNhND9apW75kI+2OSUrF3fcHt2v+XcZ3YJ9n4hmTX7X4W2QsphFm/YD
	 VnvF6UQfYVAmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C70F26062F;
	Sat, 27 Dec 2025 13:04:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73104B9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 13:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 640446062F
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 13:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aK6qOKix8JO for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 13:04:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D859760612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D859760612
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D859760612
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 13:04:38 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ZTyFvLBV1GVgvZTyGvwFPN; Sat, 27 Dec 2025 14:04:36 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 27 Dec 2025 14:04:35 +0100
Message-ID: <20251227130435.135472-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLkgt3uf2iU10v1469pQF03FHwft+ju2jXK4hPz+SuokRG4r4uNpoiREz1p/TvUTgr6Pv2Xz4DNqVcT8JDCKJYkkujT4eUbjixOe1VDr4BlI0h1z+Hcf
 1HNyewFixyk7Q6OPeokgjRu753L7a+smg1PTPv/xtuKX3uq4UiGYkK6UKTrfZEd1browsMl4BXBNEolIABGv7zMqmOCtsb06v21MKgzL4zYZUj6sO7/Ymr0n
 DH+1L+0OhLMLTXz0DmoRFhm5CHF58xaXpeYoPQ8OBkE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766840676; bh=lvgS+wr1mHiXDBkstxrh2vSSJkotIaQJSMDgiKw5gmI=;
 h=From:To:Subject:Date:MIME-Version;
 b=DDlZOuuKw7rQdXpg+2QK0cvozhnHz62c7xNsraZ0PuaXhMAGSSbVlU4YgC7jFg3UE
 qExhlOdpZ5sITnMWpuVZR/6mDPZ9Fdzq9C1Vy7qnXbGwifX3hH9wZfNAN7fp8jC4FW
 tovzhtZ88eq/aswpYXiEQloEVSgjpXmUnwP9cH8F47vpJ6BYOQZ6ND4jn2MMCxSgF4
 iaZDjjDrsqrJ1UMGgRQl9WRDtJo5xrNRcJp+T46H8vHVw9l38VPRRrqSR1ah3Ih8Yb
 FR7G35O0h9pdF9QpVH9rTaAQpoLiTq1KGc5TeViOBBJtsOycdA+092jZ42tzB9F0Cz
 s46/zQYCb+c5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DDlZOuuK
Subject: [Buildroot] [PATCH] package/dash: fix build failure due to wchar
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

Since commit [1] package dash requires wchat so let's depend on it to
fix build failure.

[1]:
https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?id=c0674f487c7aec2a3bdf6795cea7e60c9530c360

Fixes:
https://autobuild.buildroot.org/results/e9108ebd9fb8c471add1c5a7f581757175fa5f15/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/dash/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/dash/Config.in b/package/dash/Config.in
index b816ac7837..fe49a908ed 100644
--- a/package/dash/Config.in
+++ b/package/dash/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DASH
 	bool "dash"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_USE_WCHAR
 	help
 	  DASH is a POSIX-compliant implementation of /bin/sh that
 	  aims to be as small as possible. It does this without
@@ -10,3 +11,8 @@ config BR2_PACKAGE_DASH
 	  for most tasks.
 
 	  http://gondor.apana.org.au/~herbert/dash
+
+comment "procps-ng needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_USE_WCHAR
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
