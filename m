Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C079C0218F
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 08:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 160B060870;
	Sun,  2 Feb 2025 08:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwzXFmDV8H9A; Sun,  2 Feb 2025 08:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2566760881
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2566760881;
	Sun,  2 Feb 2025 08:45:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ACAB12A
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE67860909
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bj0bGvUpgTcq for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 08:45:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F07EE60881
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F07EE60881
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F07EE60881
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:45:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b087.dip0.t-ipconnect.de [84.161.176.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C042A4C1419
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 09:44:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34316)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1teVaf-0000000066t-26A8
 for buildroot@buildroot.org; Sun, 02 Feb 2025 08:44:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Feb 2025 09:44:24 +0100
Message-Id: <20250202084429.259494-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738485870;
 bh=/kYGeE2iaP0MiK5lsxX72CKeDvJdWQ351JWbKE17hvE=;
 h=From:To:Subject:Date:From;
 b=Zf28rSUS5jWqSkDBqaS3K/UCOZADZm/Pr8MJyAdT5ukyPPqDJc/Cj3Gg8pf/DRMVV
 EQMTEZ9EaxDXIUvTn0dwUViOndGGBkeFn8kxW4AC+9CcRuTIyw8grynlKvRf/aHUL9
 U5pAHZC+3hZuigS0kV/aHdkQI18zh7AiWcOAwmlWtuTvTnKXVXa0qc23Qy2F9ccSzM
 IVtnBiqEH9NuEqjn9oRWvQ3du/a9D6lUyDwEEvh8iNaG7GZ4JfQoEx53BzzlsbxSa/
 UFRJ9+kjPuBRv4wk5lc07d4yHElCvkhii1Q8wCMr6E+UPI45qs+Ru37NRB+tig/lqa
 ZcQ82hODYEx8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=Zf28rSUS
Subject: [Buildroot] [PATCH 1/6] package/libsilk: switch to github
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

https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Installation/Linux/Deprecated-Installation-Instructions/25460805/
"FreeSWITCH project has been moved to GitHub"

Updated hash due to switch to github.

Fixes:
https://autobuild.buildroot.org/results/4a18ee5fce77d0429a00a151cbd5ad1e48d35405/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libsilk/libsilk.hash | 2 +-
 package/libsilk/libsilk.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libsilk/libsilk.hash b/package/libsilk/libsilk.hash
index 3ed7eac46c..2118036ffd 100644
--- a/package/libsilk/libsilk.hash
+++ b/package/libsilk/libsilk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1b2d44790e841f0707b06fa10af798fa97a326ad4a6a3395b12be1231ed6f9a3  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45-git4.tar.gz
+sha256  816e9d4482a3a6df9c6e16b87e88155d5f38b46def20ec0e9e35ae0f6aa704f3  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45.tar.gz
 sha256  62a5963f034024665641f4a9888b208f1e39aa7e29e87c9634fdcf07d3073baf  COPYING
diff --git a/package/libsilk/libsilk.mk b/package/libsilk/libsilk.mk
index eba7085261..af9a7005a0 100644
--- a/package/libsilk/libsilk.mk
+++ b/package/libsilk/libsilk.mk
@@ -6,8 +6,7 @@
 
 LIBSILK_VERSION = 4268a02240c35c6055b0f237c46b09b2dcf79e45
 # we use the FreeSwitch fork because it contains pkgconf support
-LIBSILK_SITE = https://freeswitch.org/stash/scm/sd/libsilk.git
-LIBSILK_SITE_METHOD = git
+LIBSILK_SITE = $(call github,freeswitch,libsilk,$(LIBSILK_VERSION))
 LIBSILK_LICENSE = BSD-3-Clause
 LIBSILK_LICENSE_FILES = COPYING
 LIBSILK_AUTORECONF = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
