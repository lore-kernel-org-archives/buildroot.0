Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F201D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D70D60FB2;
	Thu, 27 Nov 2025 19:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZqj4u8e2rdn; Thu, 27 Nov 2025 19:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C094060B46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C094060B46;
	Thu, 27 Nov 2025 19:42:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F5A4708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0172E843ED
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stDASxXt0xG5 for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:42:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E557E843E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E557E843E1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E557E843E1
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:42:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EFAA3A4C7526;
 Thu, 27 Nov 2025 20:42:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47544)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vOhsp-0000000030U-2Kvh;
 Thu, 27 Nov 2025 19:42:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>
Date: Thu, 27 Nov 2025 20:42:25 +0100
Message-ID: <20251127194225.2405068-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764272548;
 bh=JQ62SpLnmg/sstYGX9rgqeo4d2H/mx+6JDdPBxq7pwo=;
 h=From:To:Cc:Subject:Date:From;
 b=BSocYSgsbAexSuw1WMlTpUE6AgnqNtKfrJLwDtno9yP85xNlN+cwlJ0E/rEIDMnLt
 IEP3ufhkAXXVfsnlhdgDWP7FsUpdeHYL/EYlci4ajsJJGhc3Ii5X87Pbj6rH87dz0Q
 tAzhXqO92hzJvuqI050Xs5ZuwEc7cDZFPFCUeCXz7De7JQU9YEbKrxntf6nuskuY1f
 qrJiqRB3qGMtnewhtZETWZnO6xmU4oW2rBzHdLSEkxPFgFWojun8q6oSh76iUWAAt2
 aW0BXxzCpGdNOfEe8Zfz8Iu4fFkRisncr+/xHId34LIGobjddiZm8C6/SQAUZy/oAG
 3wRBoOveP/PPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=BSocYSgs
Subject: [Buildroot] [PATCH v3 1/1] package/unzip: bump to Debian patch
 level -29 to fix GCC 15.x issues
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

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

unzip currently fails to build with GCC 15.x. We're already fetching
from Debian, using patchlevel -27, and it turns out that Debian
patchlevel -29 has the GCC 15.x fix, and very few other fixes:

unzip (6.0-29) unstable; urgency=medium

  * Ignore invalid "Total number of disks" field on Microsoft ZIP64 files.
    Closes: #661956, #1064000.
  * Drop conflicting declarations of gmtime() and localtime().
    Should fix build with gcc-15. Closes: #1098043.
  * Fix zipgrep handling of escapes. Closes: #1054628.
  * Stop using update-mime. Closes: #1072396.
  * Add debian/source/lintian-overrides for *.a files.
  * Do not trim Debian changelog.
  * Add debian/salsa-ci.yml.
  * Add Vcs-Git and Vcs-Browser fields.
  * Update Standards-Version.

unzip (6.0-28) unstable; urgency=medium

  * Drop debian/source/lintian-overrides, obsolete since version 6.0-18.
  * Update URI for Info-ZIP license in copyright file.
  * Update standards version to 4.6.2.
  * Run wrap-and-sort.
  * Update Homepage.

So let's just bump to this patchlevel version.

Note that the .dsc file link in the .hash file was wrong, it was still
referring to patchlevel -26.

Fixes:

  https://autobuild.buildroot.net/results/d81cb9d7c9e87dd233dde350d15cb03427ba2036/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Christian Stewart <christian@aperture.us>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd:
 Updated _SITE from /debian-debug/ to /debian/ (Baruch)
 Updated comment of UNZIP_IGNORE_CVES to reflect bump.]
---
v3:
- updated _SITE from /debian-debug/ to /debian/ (Baruch)
- updated comment of UNZIP_IGNORE_CVES to reflect bump.

 package/unzip/unzip.hash | 4 ++--
 package/unzip/unzip.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
index bbf4f7d71f..0b371e5454 100644
--- a/package/unzip/unzip.hash
+++ b/package/unzip/unzip.hash
@@ -1,6 +1,6 @@
-# From https://snapshot.debian.org/archive/debian/20210110T204103Z/pool/main/u/unzip/unzip_6.0-26.dsc
+# From https://snapshot.debian.org/archive/debian/20250311T215724Z/pool/main/u/unzip/unzip_6.0-29.dsc
 sha256  036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37  unzip_6.0.orig.tar.gz
-sha256  67bde7c71d52afd61aa936d4415c8d12fd90ca26e9637a3cd67cae9b71298c12  unzip_6.0-27.debian.tar.xz
+sha256  14043e5ea351c02b3bc8676e1e6d20d79b9a690b6d7520e8138ac629cc048417  unzip_6.0-29.debian.tar.xz
 
 # Locally computed:
 sha256  7469b81d5d29ac4fd670f7c86ba0cb9fa34f137a2d4d5198437d92ddf918984b  LICENSE
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 5effebee4a..8dccaf6ce3 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -6,13 +6,13 @@
 
 UNZIP_VERSION = 6.0
 UNZIP_SOURCE = unzip_$(UNZIP_VERSION).orig.tar.gz
-UNZIP_PATCH = unzip_$(UNZIP_VERSION)-27.debian.tar.xz
-UNZIP_SITE = https://snapshot.debian.org/archive/debian/20220916T090657Z/pool/main/u/unzip
+UNZIP_PATCH = unzip_$(UNZIP_VERSION)-29.debian.tar.xz
+UNZIP_SITE = https://snapshot.debian.org/archive/debian/20250311T215724Z/pool/main/u/unzip
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
 UNZIP_CPE_ID_VALID = YES
 
-# unzip_$(UNZIP_VERSION)-27.debian.tar.xz has patches to fix:
+# unzip_$(UNZIP_VERSION)-29.debian.tar.xz has patches to fix:
 UNZIP_IGNORE_CVES = \
 	CVE-2014-8139 \
 	CVE-2014-8140 \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
