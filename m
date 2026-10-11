Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3989CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 15:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A0F980CCB;
	Sun, 11 Oct 2026 15:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMxD3g3PDb8U; Sun, 11 Oct 2026 15:33:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8DF2780C85
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791732783;
	b=KXSShQtjUtPyaXOwK/ty/tREEN7567PYRWcIU3ExThAcEj8R0KNlHtc0Iuc8v8LDsAYb
	 5q/BLxj6ZdELA3nVhJ6C01aVBumDpDQMyQ2wJSlng1X1m8mpbnjI4UVl6UKAu93uxGFRH
	 /HwRUL9WQBvQwHslEY0Mneaia6bJHcNtZuiWfyVqNS5PM2KUlbTKJFGiGP6vabOxXDsIP
	 9hMNtvB55R9W/89VDVgknpxPzAPgFRWIc6vLFS3H8NH7Wm2eRoq5RiVV0IaXzYo7GtuuS
	 wquQPLdKDFgY4cTdTSLoRmHukMGsNl/1gndYUHqQilD8IjgBsG2iF8JDoM48W89Bocg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791732783;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=zofQyVK0K6RK2Fy7syf1aze/2dde2OkTirJVO0n+l8Q=;
	b=sKYk9WNWej6r7MaL4vJhjTu4Adc2VV0SvUEXEYu+Y7PMdwHJrdAQ2ruQEM+xD1EzNO+U
	 QDu4DE7Y4BuKGjKYvhRfY6dzjQteCL09Q7rYzvttVauY4flxnkl1VshVcOCOqUpVK32YU
	 Jj1LaJuECMqBuhMAWlf/9TE96iGMUf3/RfmHDhBL7nh+2HQroh7YiQ6Oc93IQTjNRTit8
	 YcPO08z2DnHBCuBm1mQmWKggD+/ONJZf/LEZg9tsduxrXqPdUk0NXadZ9bFRN2XQcxDWu
	 TFxe9ukBbYUKY6QuWfobXWDAX2hHr1mC66a7ym3INBv5tSFJpC+kw0G/d8x6ntEBoVg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791732783;
	bh=zofQyVK0K6RK2Fy7syf1aze/2dde2OkTirJVO0n+l8Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z8B2ccccWN87R4TQmOakuwTVXXyEK+fRHDogMHSR1bnm0N1DjarFObmltLi6UU87t
	 /m2qwbXlEaq85KBvi755E5LJaGXh3LiV8/pRmsiqYkTujNrcOoRligKV4gH7yoHuDD
	 zTQ2qfOy3cXJakEf8imRss5pyqDwOcjVHdFzXaCj1gSIhbzh6I0rfRdhVk7vHv0qKH
	 YSDWg8psVEQslN8ea5zRLrXVrMciYoapqMgHUqnWAEfQ54AUCCvsd5t+Ih/qRImU9V
	 tCoPMTd4yaWjE/RhCe1IOARPN5q6UWOjwxU8oHY0/vOgMluXq7WONFjRVA8CnzlTPt
	 wHz9IYoM8inuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DF2780C85;
	Sun, 11 Oct 2026 15:33:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DCAC21A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE2016060E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpZPRRpOJdV8 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 15:33:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 101C3605EE
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791732781;
 b=pP0D6n4bTLpMbZDgiB2Qt9q6Bk85ZT28NgOZK6tSueOkPGLPCl/z3w3K3h13vfiOsuU9
 LprzdePjIv/AT8DBjwQdJSn09bRBJ3vZIiEflAkwwXIpFfSgKTq8axEKoQmcNe3POk/Bn
 vTWUMOEbf+HX+TCuadiwAO0PWZGrCwySaCzjzmtTU0jizHv+C0mM5n9C9oVRNlCJqwDrY
 qEwq5ftEIbh/s8s1QEHPjqwtrXH9SeiozzukXI0o+kU6Zb1QqZg4HfMS4qKh5+Z0pWPT6
 lR+Aw3Qp0hh9UhJF8tCDjmxBs/sojvqCbLP3VBHNk6/GvWOpgavO4oYii5u/dvhOfYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791732781;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=iQIdCsJ7zrerxzq+YsWlq36c5CsR4N0EfmBMVjIjaiM=;
 b=MSTy5bj/NJ4gNIZmrDjkppS/QW49LHHWJd2l5zDP9cCBy+pnhHAEzTM2gYqXpDFl7fle
 tBUCrVFsfI20Zt5XS5jG8QSm+ea0eoAgeGgja0ZFxBpaOnPAk7ZfBMPvMfBhr+Qc0jDY3
 jbm1ICmnKSp20sBb5UD38a6PhMk1++lRWaJz7xc7CHkST3yEnOQdVuMV494fiV51PCNFe
 SFJPjrC7FbPAe9dVxmHHUbBUefYDoiIdZEybrbmN6a6FHha3Ml0auGASVRmZ+gWqvz7mj
 V/Vdp75UDifZ/c8CcPBhlGk7nf/Db+1mahmI/gXR3/0jsm15E5FwTxRYFNRRGHgHk9A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 101C3605EE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:33:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A21192243; Sun, 11 Oct 2026 15:31:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 17:32:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2af78232fc87dcdf007cbda074c97dbc79e00082
X-Git-Newrev: 60f60962a6c60fff37d5b754a6331e8b85ebda77
X-Patchwork-Hint: ignore
Message-Id: <20261011153142.4A21192243@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 4.4.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60f60962a6c60fff37d5b754a6331e8b85ebda77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://cmake.org/cmake/help/latest/release/4.4.html#id4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 5f151221a4..44256efdb9 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.4/cmake-4.4.3-SHA-256.txt
-sha256  c46400618b4f1f2b43507f24fb22f3ae830c3416cf23b776e16e1d413aa892f0  cmake-4.4.3.tar.gz
+# From https://cmake.org/files/v4.4/cmake-4.4.4-SHA-256.txt
+sha256  bd24c30d80a7744ae84b845ff080cc8453b06c622ef01066564108e9cefc44cf  cmake-4.4.4.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 098f6e9158..48d32ddc4a 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.4
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).4
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
