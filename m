Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48DED5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BFD6606CB;
	Sun, 14 Dec 2025 21:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZ1xxHULQg6t; Sun, 14 Dec 2025 21:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F79B6070F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765746083;
	bh=JwZBvJelMzBmwgcsA5BVTBymvSBsiiQNwBEszTsJJz0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O0AMFRkNKWj15AjiFZbWxzXaNGgGxd2qFetRTIEp1c8tYY6Y3DPXo06B3t4PMfo4r
	 +2XNxVoHzqAwwwRuUlGdkSI3SHAWYX6iXUlWb1aWUkw/clMvxLXFpsDWmLdHA7qUjX
	 6Wox+7xUcwtr6baxdxn1BV+kcSg5AEnzcHuYTmCESqnAwUlSBFnQGO1fVourP7Xaqv
	 5iPWANQdEA0YrQlJ5J30OZDYy7BOdC5ms2HIWJQDbwBY1pkyCvQFwISgMbNGJIH7ol
	 ZUZ0jdKo3JUIYaUmFVHgw3N2ABTTtwjh6mhUqis6rATKQ3Te4mdzO4T0sSThvUxr7C
	 0fJDn+sAb/g7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F79B6070F;
	Sun, 14 Dec 2025 21:01:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E741117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5583E8129D
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J08jNTwU1E2W for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:01:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D3108128E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D3108128E
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D3108128E
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:01:17 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id UtDPvsLpS3pJ0UtDPv6ymc; Sun, 14 Dec 2025 22:01:15 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 14 Dec 2025 22:01:14 +0100
Message-ID: <20251214210114.2523806-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMfpdV8IthiOonPAbsCxZgoj6yfSG6BHzJkEGMLTW/7Ze12uHYiWp4l2faiSgj+hSnyNXVukm5hSN+Nmx2kPJzMsSZty70JvFuhp9eUiJmEF7CztUkmZ
 qKDSgLekYU+sXfxcl/tWf2vrmGaPGZLkazvEOo8zB8RSOxUN+HJaBe1SzdnqFhf3Ln5PSAhuGIrp+wvuyvSO801zwOCASFVCn+yQc4+pblNj2+IkKq4EQI31
 t2/WS6mJ0jMCMsrVn6bDoNzaStqtAwkuxu5snnfUFTU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765746075; bh=5By9Nk54rCr+lsHh/t+UWj/bnW8HQ8Enwz/yZ62nbG4=;
 h=From:To:Subject:Date:MIME-Version;
 b=OvrFived+sP98SZkKTAIvOY0BVp4/0TzTKGinOCDT/TWc2XB56ccxim6g8RilNCpz
 kIAaYRZYtdjUeVErsWj3gv2XhbmMJBgqo4IsXONP8JWCUKnbzE0QS1T6U9all9HkDx
 16hKIbPjRor74WTlCNMZJIEuK1PQVgPAWutUueMNRciH0kVRfFo49toLQ+LXLg/7G0
 IkSl3uGXS3byQBX7TvoQVxENbI4E+yJ4I6U5CaqQrugZ+lFNIthhnXNBhxnyVeEwkz
 4H4HmndbQhi1CjEvfxc1JbOEeD0JgnELJSKQolcgz5bXjFOkgDI47XraT5+jG7ivtO
 5xlcLIOk3nm0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OvrFived
Subject: [Buildroot] [PATCH] package/rtl8723bu: bump to 2025-12-14 version
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

This version allows to build with Linux 6.18

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 1261139a20..e230485226 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  e9f94b6e6a6412acbef98d5e21f5c5ef185b0d856f35790e328caeb5df40702c  rtl8723bu-bb6fcc9d14b1ec8eb9c3b448c2023fa8fc551178.tar.gz
+sha256  22d81a21318cdae23ab6a65bed7c24d7cc98e7d1afef7a200804761c72036019  rtl8723bu-ac3d2f564bdf6816f1e3a3384524dc1a966f78a3.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index b324b87685..f1c4eda4ed 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = bb6fcc9d14b1ec8eb9c3b448c2023fa8fc551178
+RTL8723BU_VERSION = ac3d2f564bdf6816f1e3a3384524dc1a966f78a3
 RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
