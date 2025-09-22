Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24689CAC5AC
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 08:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D03F4844E0;
	Mon, 22 Sep 2025 08:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ulrwxxa56xD; Mon, 22 Sep 2025 08:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 291EF844BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 291EF844BC;
	Mon, 22 Sep 2025 08:16:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 626D3116C
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 08:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4907341A4B
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 08:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yxz8uiSyYAqK for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 08:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C64CC41988
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C64CC41988
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C64CC41988
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 08:15:56 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2086051619; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 22 Sep 2025 08:15:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1v0biE-00F6BY-0K;
 Mon, 22 Sep 2025 10:15:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 22 Sep 2025 10:15:51 +0200
Message-Id: <20250922081552.3598651-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250922081552.3598651-1-peter@korsgaard.com>
References: <20250922081552.3598651-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=xLnQEUDYoxLLAFcLmGrKQDAlvWmY0DEhju2owCcD/VtYsObd2dxSly5+L/Wjg2rRqOVnfY7VTP0jIofKqHaEFwU9yrPicXBh2rtOfvcmuHWdeAq7LlUo/DvrwauOfmdptjNE7ELFYpv1dNVNICJYLyHYOXl8SDQJKGQn77cIdNksK1V4QuXPfutl9lcwxLB5ZIk71H50I4FigaGWWI1dnyxZmmunQsYxq5+eGbuCm2zpdk8trxYpuDm26EnyrZ7aAaPcevvPM1JRgRSfDTEEpmKFMbeqPsQhIqQ26tcMWw6GtpHDNeowgnB783GPIlgKSthb41pLAgWN3JJq2VR6HQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ZNnheaC+FpkgjudGENOpDKBN8eWTaSBulv/9NT8OX+k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=xLnQEUDY
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/2] package/rtl_433: bump to version 25.02
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details, see the release notes:
https://github.com/merbanan/rtl_433/releases/tag/25.02

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl_433/rtl_433.hash | 2 +-
 package/rtl_433/rtl_433.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl_433/rtl_433.hash b/package/rtl_433/rtl_433.hash
index 3a00e0cae7..30f60a82f7 100644
--- a/package/rtl_433/rtl_433.hash
+++ b/package/rtl_433/rtl_433.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1260c58400bf35832ac1b76cb3cccf3dc1335ffa2416909c63c7d7060c74663b  rtl_433-23.11.tar.gz
+sha256  5a409ea10e6d3d7d4aa5ea91d2d6cc92ebb2d730eb229c7b37ade65458223432  rtl_433-25.02.tar.gz
 # License file, locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index 60f90a94c7..08735be850 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL_433_VERSION = 23.11
+RTL_433_VERSION = 25.02
 RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
