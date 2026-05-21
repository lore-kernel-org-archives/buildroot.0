Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3074CD5BAF
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 16:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D61461B17;
	Thu, 21 May 2026 16:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tt-b6pPQdcyJ; Thu, 21 May 2026 16:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C9EA61B14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779381752;
	bh=c6Y/3VO/1rwt953xWTLe8u9gwy8HFUnZdTvGR9C5h4c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b59ldLL3Bcd4Bo/nqoqaRNEFxxfnN7cUVHawUbPuDEUo4EGo5kwVblmYszETzrE6H
	 I3xIKpdE4ZvNkiQoocoDTMHpZPEvD4oQ78WhCXedcbdhFajfV/IPunC+7SHt619CqH
	 L6aIgW2J3qM9VdN3sTfNpHQqzOw9uFmQ8cqvVB0x5SAy0eTpaFk5ievr4wi1Q5dwH/
	 lQI/KcYS2otzEcg3RZzljqJkm+mfGZpP0NvgtdyhWApZNv+lgrTwE9O2CdjYBli0ND
	 /rYivj4O72uN2bOWbxVV4M9BMqvatof7WKOO3E5FrZSqoKkGKs1WHZuR/gXof+gjOt
	 OezpFQnU7HWMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C9EA61B14;
	Thu, 21 May 2026 16:42:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF375D3
 for <buildroot@buildroot.org>; Thu, 21 May 2026 16:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF9FA61B14
 for <buildroot@buildroot.org>; Thu, 21 May 2026 16:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Huc0-9vnyXk8 for <buildroot@buildroot.org>;
 Thu, 21 May 2026 16:42:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 249B461797
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 249B461797
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 249B461797
 for <buildroot@buildroot.org>; Thu, 21 May 2026 16:42:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 575D2A4C072D
 for <buildroot@buildroot.org>; Thu, 21 May 2026 18:42:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40396)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQ6TY-000000001po-35O0
 for buildroot@buildroot.org; Thu, 21 May 2026 16:42:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 21 May 2026 18:42:24 +0200
Message-ID: <20260521164224.1462806-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779381745;
 bh=ssqM2yQOf4Hcz2qFtcZ8VWPI80iA9PZt5suxkpmAX7g=;
 h=From:To:Subject:Date:From;
 b=NfTw+1/XAm5VGMZz5Mpjq4HhSz9xL6hfDhMOMCeSUhQhX2FI7regg6S3tQQMGIkXo
 kLcG939tli9+dBKzYzaB3Ig0vboeqOGZAG4JNtm1/Oy1XWE/4bO/yene7nXTDqSyNJ
 rAgk49WVUDWcJGZI3k2aoC8AVcljxx3Ld+3KNvV0OH6jvnRzn60zBDN2kIrXULLk26
 oT0ocs3pLPoU2VfVvUUyFuD5v94fxfzSKLgRACUC06ZowRUO+D3cAxhnuhaRnK+eM4
 vBjJZmamflLi6sN3l+iHhyNATltlnDDCnrdOXf8fmHl9DzgJ4hkYqcktXescxzJ6Rg
 709izrdtFbUVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=NfTw+1/X
Subject: [Buildroot] [PATCH/next 1/1] package/utfcpp: bump version to 4.1.1
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

https://github.com/nemtrif/utfcpp/releases/tag/v4.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/utfcpp/utfcpp.hash | 2 +-
 package/utfcpp/utfcpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
index bde4a223f4..779bd2d282 100644
--- a/package/utfcpp/utfcpp.hash
+++ b/package/utfcpp/utfcpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9a45cbeefacf512879971eaf57fe52133b73a0152d5354f3adeaf8d103cff0f3  utfcpp-4.1.0.tar.gz
+sha256  1ca68016f0abc24172998e39ce0d8f8e2b7a26f7579a0ff85d4e1b9a7aea56f8  utfcpp-4.1.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index de6d6f6f86..0ec08bd54e 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTFCPP_VERSION = 4.1.0
+UTFCPP_VERSION = 4.1.1
 UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
 UTFCPP_LICENSE = BSL-1.0
 UTFCPP_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
