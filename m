Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF558C2A09B
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 17:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D71360608;
	Fri,  7 Aug 2026 17:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHLyAxx3Z5TF; Fri,  7 Aug 2026 17:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2932E60614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786125193;
	bh=93mR7gD0sospZCn2VEJChJjO5YwRS6S/75XOYauip8I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DbbBdbpjp0QNbH9lu3vy249kmJ+7l0/3FmEPlYfBTBqfsd8dNAr4m6UOH1whlTI3p
	 eoIEqjiP5WXV2oz2QoYDsohF1OmZ0eGXhls1jWeHS4oLagp20hPGNqRESBFbcriuA+
	 uO9N1ncKBdDvjApo6eIjbEouIRdVOMi80e8V+ywR+OZN6t/SoFZEP5Vzb2aoKQlm0J
	 sSqYUjgS+vrlg51CvnuTf6BVeeE814CqxJnX2BlfSGFeP4Tuj6oEvUBM+Lt/kt40cY
	 BZjZCHjgEvIu7keQcGCWQeochIyoQGb3n1pW7xt4baSqyz5KA0qVnqH8gdC3RsQx0k
	 wMiylThTtJDyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2932E60614;
	Fri,  7 Aug 2026 17:53:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4782B282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 17:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3593F60608
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 17:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1PFz6ZQYpgH for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 17:53:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BDA8C60614
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA8C60614
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDA8C60614
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 17:53:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c228.dip0.t-ipconnect.de [79.214.194.40])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05D03A4C399E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 19:53:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51142)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wsOkk-0000000032f-1gCW
 for buildroot@buildroot.org; Fri, 07 Aug 2026 17:53:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  7 Aug 2026 19:53:06 +0200
Message-ID: <20260807175306.3545835-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786125187;
 bh=waGqwTOR30IE+jpxzTcjSfPnU70qzwwcvjCZXRDcrYk=;
 h=From:To:Subject:Date:From;
 b=RUHweDQScGk1hiiL63aitneXFszZTbDPIFTB7PHYvYn7J9dN0pdjr7HaQN5ndTYpp
 Rq4stm5kzUhqDojF73rDgocQFbWiFMp+1hxJEplMk9e5/Ou1AUlnbs45Uv7HTsdkU/
 1Gp6eQ4bxfaEimOVRQ+KsvseEmpZZev7dG65/GD3Drrt++Tehq7WugAa/e6V7LIvOH
 o+VEl7FGgsGIiZBK20L7Q9erv7LPnFnzsKIZnSkUvV/yP6VOqwBLsnUaLvia/5v9J0
 dZl1p6Zz/BXQT/9EQC9mvq4uRXKe5H3M2AEtvjM9gx9QniIBLV9Bk4D8dqAxkFr252
 jx0wtDrbGZGzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RUHweDQS
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version to
 1.5.4
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

https://blog.clamav.net/2026/08/clamav-154-and-146-security-patch.html

Fixes CVE-2025-8088, CVE-2026-20337, CVE-2026-20338, CVE-2026-20339,
CVE-2026-20345, CVE-2026-20346, CVE-2026-20347 & CVE-2026-20348.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/42246c4d290a74b6879a7f7aae96ed40ff873e58

 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index be5a2ec5c7..2daa66494f 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  89af57a45bbf13de4dc91ed7f20b435388c88428eb7dc30639a02b2f0fc2dad1  clamav-1.5.3.tar.gz
+sha256  1af1117a228f1b5bc7fa91a0dabc37848a99e7d25188e9be8043332ce721dfd3  clamav-1.5.4.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 9467174e93..1777366fef 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.5.3
+CLAMAV_VERSION = 1.5.4
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
