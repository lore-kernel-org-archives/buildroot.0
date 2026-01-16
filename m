Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BD0C982F0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 18:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1003561017;
	Fri, 16 Jan 2026 18:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wm5xPyGAuSwd; Fri, 16 Jan 2026 18:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C3161019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768587941;
	bh=IVngXHvNEfLyoL6ykAe+T0+JLrrst9NFKcXViOvW55o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hset4zzZcjgAn025uxmC1hVyI6517wlSy+759Zcz6cy1JZBNUmdOhkGXcTBHfwqg6
	 j99VJfZ/7jErSlm2Vr3JI1qXe8O7ScEkcjaY/7PQwmlMXPawplXgjhnIQWbjcE3pc0
	 J8z2KbHXIao243+0Z4erDpN/dO5CWgK0UcsgTSo9M+VO219E9TpKnMPkfPJeNHzGgE
	 hHcMlYRMVXwon6Ce/XDuCVvtNvQ4LJHeu2q/0pvGwBnY0C2cWFO1qPpU4tW3eG+Phv
	 ZTvwPS7MHkXgVVkC8srwYuAFcINtWzF625oLcUnbo2INWdxFJ2BjM1pDRb69SXsCeY
	 naLhYO7c9XfOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C3161019;
	Fri, 16 Jan 2026 18:25:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B2552CC
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 18:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BEC340A4A
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 18:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LU9uDyzdWA9f for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 18:25:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF665409B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF665409B5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF665409B5
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 18:25:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd81.dip0.t-ipconnect.de [84.161.189.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 817F2A4C322F
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 19:25:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39218)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vgoVs-000000000fx-0uq1
 for buildroot@buildroot.org; Fri, 16 Jan 2026 18:25:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 19:25:36 +0100
Message-ID: <20260116182536.364423-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768587936;
 bh=4ucWq7F7F8pbTFPCTWphDaMFHkaD8vgTYg2p84J1aXc=;
 h=From:To:Subject:Date:From;
 b=jBzNGWxITPvNQTEDxz4E2g8lFm9cJdmEveyYpu53YWYKA4+hcznQAvNb5Fc3Sea5y
 FafqDcRa+x/ejllu3Qu05ti+krqdvGXr6Ydb7Eku2bnjOWRNMpcVUmcDZVFD8LU9HY
 hoCSYUKSg1iQdpwQ2za2w/vV74xUgit6CsBovEmke8w7PfA5agLgwPBdYwhg5wn926
 DFNPiOIjkqD5KL2ufI7kZKoeN5H35AxBYdCKYo6Ohj2FMoy8owWfm37CgnBLqAW8GX
 iMhja1cki6L6xDxvWXIY4zQMyZJaDntBimMakKBG6FVh8SXCIuqsKECndlewLKcRXK
 gPOLgLt7bvSEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=jBzNGWxI
Subject: [Buildroot] [PATCH 1/1] package/php-imagick: bump version to 3.8.1
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

https://pecl.php.net/package-changelog.php?package=imagick&release=3.8.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php-imagick/php-imagick.hash | 2 +-
 package/php-imagick/php-imagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-imagick/php-imagick.hash b/package/php-imagick/php-imagick.hash
index f6091c6b7e..fe6a80a6d2 100644
--- a/package/php-imagick/php-imagick.hash
+++ b/package/php-imagick/php-imagick.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bda67461c854f20d6105782b769c524fc37388b75d4481d951644d2167ffeec6  imagick-3.8.0.tgz
+sha256  3a3587c0a524c17d0dad9673a160b90cd776e836838474e173b549ed864352ee  imagick-3.8.1.tgz
 sha256  b6e00df9cb3b91977c0d64a7c4db48cb6f5041f6eeda6583c236775f70a35b78  LICENSE
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index 0223b6ae93..d1ff69de6f 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_IMAGICK_VERSION = 3.8.0
+PHP_IMAGICK_VERSION = 3.8.1
 PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
 PHP_IMAGICK_SITE = http://pecl.php.net/get
 PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
