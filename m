Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60591CD37AA
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 20:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32820610F5;
	Thu,  7 May 2026 20:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tB5hekoAKnVu; Thu,  7 May 2026 20:28:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AE39610BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778185699;
	bh=+XSdjJUlTQ453lA4zUwP1P4YvRl+HhDGgMFibcjSxqU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bRxMg8MMa3PdKTZw7aT30IXq//+vNSj94QV29yVJkQAVHRuZHRacRoQZclDfarOrw
	 I0qpbdQmm8+nsWwI4pPy1rSeqmZ+Qh3DN+S0qccM3Xj/aCcbnxr2PFFmgnuKcVBtTp
	 9hDr5E5SOzpXUb2oITfMMh3c7U7NI1DaKLEo35GJc07lAaOAiwlAvSaZJSDE5Y0Zfs
	 Xfm+4fhCEv0xN0OLUAJdVlB562A+/SEou4VqcWnRL3iH2zDozRIc5JCekQ9j2KjxDs
	 qUaAbgOYFiz3Y0gz/kGGdeyAk1HCJv2me27jlHhW/yMN0lfy1JhYIcqjq4SIgz8cvV
	 BrmiIaNI4XMFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AE39610BD;
	Thu,  7 May 2026 20:28:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0521317
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 926B0610BD
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFW2v3Fr9b86 for <buildroot@buildroot.org>;
 Thu,  7 May 2026 20:28:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2B5E61010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2B5E61010
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2B5E61010
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:28:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05da.dip0.t-ipconnect.de [91.58.5.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8BF81A4C0C94
 for <buildroot@buildroot.org>; Thu,  7 May 2026 22:28:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33338)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wL5KN-000000005xZ-1tR2
 for buildroot@buildroot.org; Thu, 07 May 2026 20:28:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 May 2026 22:28:11 +0200
Message-ID: <20260507202811.3399651-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778185692;
 bh=ICucxxIfwGIyPYhMynKOzzh4V8xFACepf5YQR08VOB8=;
 h=From:To:Subject:Date:From;
 b=hg4qlUALlNO3vdMTcPxE5QP8nLXZ9pGoeANjqjuHb3fFsq8D2tG1dJOlcc5IvO4s7
 rSI0gzV8JHOSHjZe8v63wLEY/O5qKuFl4lnZmM0MCsmZ+RRRljsxYq8rh1DMsgGZ1e
 uAdxdq57F+Yio38BUkC2xNApqPt93IQwewWs6QmiCf2/7l2G5mBML7hR06YDzBuVLq
 Z+1JBPV9eXRNBgTVLNBo2hqwWpVwLp4MiJ7+jzAEYwDxoFFzvo17leNvAevZ/v9V1G
 eXcFDUXwH8hW38tzkdmKZzA0KmB8o5aGo9l3CNh6xcm82cvHgBQH6gyUcQXvFPIEEE
 E3zy851p9Zc2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=hg4qlUAL
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.5.6
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

https://www.php.net/ChangeLog-8.php#8.5.6
https://news-web.php.net/php.announce/492
https://github.com/php/php-src/blob/php-8.5.6/NEWS

Fixes CVE-2026-7263, CVE-2026-6735, CVE-2026-29078, CVE-2026-29079,
CVE-2026-7259, CVE-2026-6104, CVE-2025-14179, CVE-2026-6722,
CVE-2026-7261, CVE-2026-7262, CVE-2026-7568, CVE-2026-7258 &
CVE-2026-42371.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index d400f8e0bb..c85df44d73 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  95bec382f4bd00570a8ef52a58ec04d8d9b9a90494781f1c106d1b274a3902f2  php-8.5.5.tar.xz
+sha256  826c600b7c6f956bd335558ca3bdbcab23b22126c1cc8d9348be2280a2204bb7  php-8.5.6.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 9976884001..0eae93fac2 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.5
+PHP_VERSION = 8.5.6
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
