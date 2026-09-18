Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7568C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89EDE8134D;
	Fri, 18 Sep 2026 19:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tpnJLCVj43Ch; Fri, 18 Sep 2026 19:35:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B36A481344
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760138;
	b=JiFxRWXqaHNQrjdN33P9CpQg0SWqTlS43EFFPdJUP6AOnHEmaHVKSuXiH2fUSeAChy0K
	 yRmtbWIN86AwrZO61SaI7xPQFSEDdDaVvT7Zb3UxqaagOBHll2TRi8YDTUZ76ynCGzpBn
	 PtfC7xAjEUkMQOn0lr9qlNqJhLs7mP4cRbGMObs30koYanWdvgcB+ba6FEdQQzlZDR1yT
	 wlQo6D4qcWsSg3ZE/Ei2WbFM3AKGvAZGk9JNu6NjhCJbhe5pi0tWMcxc0jno8+gcxVg1S
	 NU7mJXYFoSd6iMb2Ysg0Y8XbWBAVs0BOzHctBpXavdq1vYAaTwiQ5yabxgPFVFrS+Ug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760138;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w8E+QxJiRJYtGfkfeNE9fMkyBJ47L3dqnwvkbt7gb6U=;
	b=GDOV0C4BnAQ2tfHrH2s3QpesH49BNQmfFpXanwEW6/V0u6Ihry++6ihog86xJN4XnHi0
	 8X7LVADY60w+K/Z0PgQUOF+zsu1XEGvtuITvJ8w6NUHRrA0JnfOKbhEicsEdKVQq/WSjw
	 t0zsKLuDVmi5FXCy5tL1gUZjVzNHYcVpFmmutp5Z2UkKs3AHGqPCmgqszbT/II2pEIMi+
	 dPdm/OCQqpmDSgSsuG3AxiaRIkYphQ2sJFipgzyggEq53/LU4pvzJ6XnJxuckan/670gr
	 yXpBTGIfDVvq6VxBR5Qe0oBobgzUXqa9u6CSq66PrLFg7O5UN3eOgP3LuJuXYeoxFxg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760138;
	bh=w8E+QxJiRJYtGfkfeNE9fMkyBJ47L3dqnwvkbt7gb6U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fwSSOwHehOUL/Hw25iOHSXtN4FphQa6IHLF3iOZUE+8pEN8mQ1OqHLMKD47J+THbH
	 eCQJrVWSXqmKwZ6/5YLoVyq6ZjSmlwIEBq+xATzkMleNO22Z88JBwGsWKFXLsbhjcg
	 4q1ShjU8G2YwN35E5iN8J6e/Wrpf6SuN4zQtBfjG/eiXH07ffKHhXHL6ppAMKb4Qjq
	 9/2O+c2dX3Q3LI13Rg372fz8BHaOHrXTRGtIzcP5qWDLDwQjoGisN0VNtJsfw6LdqP
	 H76mJLFn1hCM7VB3l0ZXVUe8QChk4xLRQkiSdBg7iViD5JsI89jLm4YqUctpey6Ca4
	 8SDCmSoAs1jUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B36A481344;
	Fri, 18 Sep 2026 19:35:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DA4042D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76ED560E33
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjFH2HmjURfo for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A1C7260E0B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760132;
 b=n5a+7GwoX8j28TkK3NjkicpSrkPFAWlHJCJSkJ476UPs1NGUWaeFsrR+vQMKFAL58XsZ
 aRus7we2ge+PlyygyhhoO1zIdUezsF4TZpavf/EBNPFzTc39Gq95mo3CnbrGkyKrmpf1D
 izRILpPQNUfcxe/PlmDGefr7sHqNI837/sb7qefUF3szD0MH3+68m3ERbJFU482NlPOX6
 OK6nacUL0Cj33kWmz/zkcJRJP4vwfQY1MnMteNgGWlNudBUa9oA5TuhDwIl+PiAsLVTwI
 +oLCDcHbLQMoTKX0zADrI44N7ZbXoxvb4H0PvqPSSNqat/7iDOy02xEEDZ4RFWcYqFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760132;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dyvkmpna1L/2pRebFentbkV6L2hdU/ylC//ArwLPuFY=;
 b=pIEjfcLIcx2X6nSL28ExWAMqYfxu39MfUJGXCk1HcXw9SSxsI3KWdDlWzA4qSZduuBZa
 LuAAqDVIQxWkeRDT1t3LvgaIWo4Dc75hHYRtkWYkDOfblwPcHjoIqJf5h2b5VAlbjex6z
 71nMTjZhr/Xro69XF+a48VPrIpH26r6PnePfxgwbsu2sHI5E0xg3TT9Y0GO0JiwSBZyu0
 7d60ESxgzcMBnEB2vkaJkUoSnTFfp5/x3X5vMPNdqnQPm1UJbtFfdczbJFvukchMTVc0d
 sFqMw1OpwS0XHsV+B1L3I9zNjKTp23RkhjejxPf/cwKrmCzyAfcLrtEh62W1DzyznrQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1C7260E0B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38087976A8; Fri, 18 Sep 2026 19:34:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:25:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5a2b355311dc877b18613856af3b26f401c2c89
X-Git-Newrev: 101d543e38e5be14f2b545362fdc0d795c0fab24
X-Patchwork-Hint: ignore
Message-Id: <20260918193425.38087976A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tensorflow-lite: fix Config.in
 comment
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/101d543e38e5be14f2b545362fdc0d795c0fab24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit fixes 3 issues in the Config.in comment:

- It is displayed even on unsupported CPU architectures, so we add a
  "depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS"

- It doesn't mention the need for a glibc toolchain even though that's
  part of the dependencies

- The requirement for dynamic lib support should be part of the same
  comment as the other dependencies

Fixes: fd29fee3a3ac0ce45404ed256d2059836c352728 ("package/tensorflow-lite: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tensorflow-lite/Config.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
index 604a1ea9ec..2536112f99 100644
--- a/package/tensorflow-lite/Config.in
+++ b/package/tensorflow-lite/Config.in
@@ -31,9 +31,8 @@ config BR2_PACKAGE_TENSORFLOW_LITE
 
 	  https://www.tensorflow.org/
 
-comment "tensorflow-lite needs a toolchain w/ gcc >= 10, C++, threads"
+comment "tensorflow-lite needs a glibc toolchain w/ gcc >= 10, C++, threads, dynamic libraries"
+	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
-			!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "tensorflow-lite needs a toolchain w/ shared libraries"
-	depends on !BR2_SHARED_LIBS
+			!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_HAS_THREADS || \
+			BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
