Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB53C56208
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 21:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F41B40873;
	Thu,  6 Aug 2026 21:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-TligCTO1C7; Thu,  6 Aug 2026 21:08:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B6CD40834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786050522;
	bh=YvRdXOng4354S3rx4Ii3wjChwRuMHqvZzdcwE8UqN48=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jCK8F13aLAueujL+p7Hu0kvWpKNkTPfdsHs21DmLR5+YGWAtFAwd8o8Xu7SuaIW8U
	 i2XseiaRLOFvDQ4q3n9QGHsqypcc/Lrtyv1MX4LVl6E8VDIZ0FEY8c60N1QWgThRyC
	 KmYdl+Ksii5qUIyYS+LJ1ulNtgXUHbvMxJKml5u3VlqvojjDe4tHhDaqOZuz+oqsYD
	 PuFBz18zDEZZFNwq6NMsdN4vB/ExdDeIwoIEEO6+F9xujklXLiZRE04AQrOBmSGrKl
	 OxQnBM3xfAZ4Rj0HHI0mnvkW9163YkTAqLxFxBq4P+Ok5XVu1YKWnyf5p2iObk9x3e
	 cJEuiK+zxNzHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B6CD40834;
	Thu,  6 Aug 2026 21:08:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19EB123F
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B83180F26
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWP9MZltf9Su for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 21:08:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14C7980D99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14C7980D99
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14C7980D99
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:08:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b3cd.dip0.t-ipconnect.de [84.161.179.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 10911A4C46AC
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 23:08:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35670)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1ws5KL-000000006am-1YI3
 for buildroot@buildroot.org; Thu, 06 Aug 2026 21:08:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Aug 2026 23:08:33 +0200
Message-ID: <20260806210833.3852-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786050514;
 bh=Mn98HAFKKzR660wN4hLio3bRbGscjR5Dk25zrs0OVVA=;
 h=From:To:Subject:Date:From;
 b=KK2XSKDuXcqU7aI4JPfMWmUATtCq9UcfGsCKNM6QPnVZBZ6FBhT9/UfXPZC/AezdS
 +58RYi5TJ6CTLYITNIv5+SZqQem2cIsTm8xFJCAlRpJw8O3Wz53z6EbDPUtS4l2RC3
 k8Qh0xAB9rgUR4QRGxu/QMxhtGwSGbybjN0tG9FKXd4p8YKMHpvzbrN0dw4B9qNlXL
 YPsHk0sL78NhJQtb2cRboDo/SLVhoogvUY5UFClRE0aWX4qRfikJJ7L2RLSJFfEAZG
 Q02STrsH2Kkl/k9mo/pUTVIEpWKJ7ZLNSJY832nBKswe1+vE5Q+bZaqNS09i3ABGzE
 uSl7dYy+BSepQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KK2XSKDu
Subject: [Buildroot] [PATCH 1/1] package/apr-util: security bump to version
 1.6.4
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

https://archive.apache.org/dist/apr/Announcement-aprutil-1.x.html
https://archive.apache.org/dist/apr/CHANGES-APR-UTIL-1.6

Fixes CVE-2025-49506, CVE-2026-32327, CVE-2026-34191, CVE-2026-34501 &
CVE-2026-34502.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7ffe5d525f354be9be20f7c7abcf860b82f2547b

 package/apr-util/apr-util.hash | 4 ++--
 package/apr-util/apr-util.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
index 7e2793cd77..b8fff95de6 100644
--- a/package/apr-util/apr-util.hash
+++ b/package/apr-util/apr-util.hash
@@ -1,4 +1,4 @@
-# From http://www.apache.org/dist/apr/apr-util-1.6.3.tar.bz2.sha256
-sha256  a41076e3710746326c3945042994ad9a4fcac0ce0277dd8fea076fec3c9772b5  apr-util-1.6.3.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-util-1.6.4.tar.bz2.sha256
+sha256  3e2ae08f40efa0c3701e54a954cefa08242de22a69f91a8ae44fc1e624ba309b  apr-util-1.6.4.tar.bz2
 # Locally calculated
 sha256  ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2  LICENSE
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 477db1c593..c11957bc56 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.6.3
+APR_UTIL_VERSION = 1.6.4
 APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
 APR_UTIL_SITE = https://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
