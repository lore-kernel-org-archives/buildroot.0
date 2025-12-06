Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BF6D3B7E1
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 21:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F48607F0;
	Sat,  6 Dec 2025 21:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TNGhUHuWOvF; Sat,  6 Dec 2025 21:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09DD0606BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765057547;
	bh=ON5h9ERLEu6aDWxHu91jFWvVi76zLyss01CIeu82LZc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fbwIVowvQKD2baJ5V0p4SxzfC0iG8yRGdv01yO9ziHvGKDt8IE1MZsy6KLKdiTFnX
	 c4PJzBHnEfQtkMVEz/MDUITjPRCNJjcOyF2i1xOKRq6313+k5JN9nfBYCf68/mQSEa
	 6F9UMabomPYFeR4XHmChC3n8KzI3PoHUtNFJrsCey8+GHwp1IFtfQHg/BPmxH3Ndqt
	 nZf9Wz4ubscvt8nJCfFMKmp6NuweheWgfUSMIV8+A8PzAdACMlu8sa7y+IHgaBDSN2
	 /zW/ZKX0XvODKnDZoHAWEEYuo0TGRfmeeWlaULHm+V+HpvgOlpDJCr15sNICr95OI1
	 ZRjHpEFy0Tf4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09DD0606BE;
	Sat,  6 Dec 2025 21:45:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E598C1A9
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 21:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6F95606BE
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 21:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2BveGzoBefg for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 21:45:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6D7160674
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6D7160674
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6D7160674
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 21:45:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F63CA4C02C4;
 Sat,  6 Dec 2025 22:45:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36264)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vS05q-000000007UP-1zXV;
 Sat, 06 Dec 2025 21:45:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Dec 2025 22:45:30 +0100
Message-ID: <20251206214530.2307283-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765057542;
 bh=QSdKunLYA+zrAcZ5esecnJoQnjXsAgf9UgGKL/0VcmM=;
 h=From:To:Cc:Subject:Date:From;
 b=DnJ4dwz6tJiTxjLVAN+ufkMExEep/hR2j2zpMm8W0hsQ8XoJgQ/V9Uz2/i1J7gncd
 O17S9kDKB3MA9y7Y1lqne0IK9ketH9uL/xL/wE1HDbVYuk+/1nq59sv20S6AV2A/0s
 yn/nGZLYbO+FoMDwtd8xPki51BIsfBp4c7eBxhohvjSwAFrIxDLKXKkVPgtLXGhMzQ
 s+NEgij6ZxGQjDNwbyKI+Kvnfvjvc3HNc8Wt7Suxk7fFIT8B1UrFhMTD7jgOyOte2l
 OZX/AflOPSzV8sHk8jUi+25TJFqgN6X77I+KPzYaWQycoM2rcyUFsELUfF2PPRu3+w
 08kqcNQB9ov9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=DnJ4dwz6
Subject: [Buildroot] [PATCH 1/1] package/audit: switch SITE to https
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

The http link is broken:

Connecting to people.redhat.com (people.redhat.com)|209.132.178.26|:80...
 failed: No route to host.

No autobuilder error recorded.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/audit/Config.in | 2 +-
 package/audit/audit.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/Config.in b/package/audit/Config.in
index 6e5761533f..e9bdf346da 100644
--- a/package/audit/Config.in
+++ b/package/audit/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_AUDIT
 
 	  Note: The z/OS remote plugin is disabled in this package
 
-	  http://people.redhat.com/sgrubb/audit/
+	  https://people.redhat.com/sgrubb/audit/
 
 comment "audit needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index eb0b74b098..499cf1cee9 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AUDIT_VERSION = 3.1.5
-AUDIT_SITE = http://people.redhat.com/sgrubb/audit
+AUDIT_SITE = https://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
 AUDIT_CPE_ID_VENDOR = linux_audit_project
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
