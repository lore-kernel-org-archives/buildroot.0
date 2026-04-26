Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C9AFF885C
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 08:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA812427FF;
	Sun, 26 Apr 2026 08:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HkQepssyDZQ3; Sun, 26 Apr 2026 08:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCA4842802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777192858;
	bh=s8g/y3mwD6fDYDNRTWpp4TMpinlTtLtzu+EIM/mPJdY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A7ja5BECjYuZTEx7KMRwRftDiSCOsP6tpV5QSi76BCJoo7Ukc/VVH1Gw7i9zOtosX
	 BP0m1k86mTQ5DeDgQzP4mFtGjG5yuR72Vmx6J7Uk1ek0dVhLdUUT5rtZeYwYtpvGU7
	 vV0H6huKJZgbtTDGty2Ml8I1EvuuGMfL3XnQ1Jf4ErlPQcjgXwTf8gy3Uar/Tgw7/5
	 zTd6sd0UMQjIWO5QaBfnnexexlRxZEnbHLeCJT0paFWDhaN4ynMpKRbfPRZab5fQLB
	 WTeHQPQx7EKhbOXaY8v4hFaNHRPB52zgm8BS+JA/O3tYZHzW/vhUABqBviOtmtHK0a
	 PVN24D4rVpiCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA4842802;
	Sun, 26 Apr 2026 08:40:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51DA9231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 08:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 442E742802
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 08:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_DmzkKOZGO8 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 08:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7129A427FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7129A427FF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7129A427FF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 08:40:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E104FA4C0CF4;
 Sun, 26 Apr 2026 10:40:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51662)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGv2s-000000002ZW-0egD;
 Sun, 26 Apr 2026 08:40:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 Apr 2026 10:40:54 +0200
Message-ID: <20260426084054.3305901-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777192854;
 bh=lgffQgwRoPL8Lh1Y4a4/FsJkE1VoDMSM+YIKoVt4sVU=;
 h=From:To:Cc:Subject:Date:From;
 b=jsHD5CAQ9fXlXCuxieqQtNv45wpMx8CEPqrGULHGRvfwot7GiiOXi5ReEXIJq2ywh
 aXJgC5esbYGnuEoD5+GZV3vAXu7Kf5BFaIe3V5IHzgZYXN2A7tUu/MhHAGUzrWAThM
 WIDeAhmQzpXha1NH4kNSqhY0xTEPVuh8p/rO0M0k+gXzdHkVI2kdgFq+lSsMoZf6xC
 TtGNAX8LBnRNkCvAKZFuNyXqRSlP3RNiKT6SMaa/LkVy9trKjkuPEYL/zk6O8r02FH
 asFm+jrdesTa/Ix6tIWsncWtZR0CMmllOns838mVPGaaPlscD/x+V9GcvSsbsw0nsG
 DJoI3NT+vOJVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=jsHD5CAQ
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.0
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

https://github.com/libexpat/libexpat/blob/R_2_8_0/expat/Changes

Fixes CVE-2026-41080.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 37a9c2ab9f..a0f8b514a8 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_5
-sha256  1032dfef4ff17f70464827daa28369b20f6584d108bc36f17ab1676e1edd2f91  expat-2.7.5.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_0
+sha256  a37bfae0aa9775bd8521ebd85dc456d486f0ff31138f6c91fd902ea732624542  expat-2.8.0.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 68af751233..07c209543e 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.5
+EXPAT_VERSION = 2.8.0
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
