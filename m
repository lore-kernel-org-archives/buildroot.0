Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0FF106FD84
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 06:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2632807AD;
	Fri, 13 Mar 2026 06:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwQwO4qwMAj0; Fri, 13 Mar 2026 06:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 833B9807B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773383807;
	bh=+3LNJQjeID/Zr8D85xSCDSOC0Dgna+EwBSuInbdSYBA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KKqAPCXCFigQCaxHFMOwS5mlPr/kR9r/Jg4PxsPi3BWZUsz2JySCsuPeqD8qKZ3ly
	 MPtW7jA77oy+kE6rxVk3EavLTDvQChj4zAt0LBtl3PnUUjMvD5udeHfJBBmtOxtTVX
	 11yDMjEoVhlnX7HiDP431163g8I1NrjQs6aH4YyDIeDNXMDOcL/0QazFK9oQYHEUsa
	 fFlGk8z4bhvlMYzZablx3/PWZ8/ZGrZfEpOSEqWN8UOk5qOJ8QP7S6pFylcEedKqer
	 rzWGvKmaotbasXUnnW3QNX0HKzlz6j8VCYFMIzAIvdaj/a0mMM32IVfgXrIzRYCezb
	 ZiDqAOSfLR0sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 833B9807B8;
	Fri, 13 Mar 2026 06:36:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DFA9786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 06:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 442764037B
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 06:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QK94oFpvjhrp for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 06:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94BDB4007D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94BDB4007D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94BDB4007D
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 06:36:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8439CA4C0A6A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 07:36:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0w8V-000000000dW-35lo
 for buildroot@buildroot.org; Fri, 13 Mar 2026 06:36:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 07:36:39 +0100
Message-ID: <20260313063639.1700676-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773383800;
 bh=IuovO1Jrgwyf4NxH7Mdh787jXq5gBNjX8SJtSK1s5MU=;
 h=From:To:Subject:Date:From;
 b=JAtT1irwyHRjRXp2XVPCzzzY13Kw1BLkjHHZKzUaGDVVVDfqklTktgWjKyD/R3j29
 UXWk0mXG1i5inFD6O5VvSnhO0S2H4otRWXx4jl32XyMWmYI/KukOAvDP73FueFkbtt
 ojTedV1657UTujVTHMZzJ98PaBLgqERqjR6Bqu1wFDsmeIO5Egr68ljb3FJ3eYp2C/
 oaTu7sHYnofXwQOop89h8Apdcp37hipaD0K0EWCuqZY79SBvt4syM9Oyq4kJ0sbu+b
 3mJZkKHJthNBFHfBpWruSBUXjvwahOpTJx5QbALmwHSGR54DbYWmjHStO50GQw5r8l
 qn6Dh2aYQz3Fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=JAtT1irw
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.5.4
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

https://www.php.net/ChangeLog-8.php#8.5.4
https://news-web.php.net/php.announce/486

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 5747e153f2..7fdb76b01a 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  ce65725b8af07356b69a6046d21487040b11f2acfde786de38b2bfb712c36eb9  php-8.5.3.tar.xz
+sha256  c1569f1f543f6b025c583cdc0e730e5c5833c603618613f1aa8e75d1524b8c91  php-8.5.4.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 4cba87a06e..220fb8c5c0 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.3
+PHP_VERSION = 8.5.4
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
