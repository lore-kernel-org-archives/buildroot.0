Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7DACD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80D0384A4E;
	Sat, 30 May 2026 20:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZNfBJSCbvde; Sat, 30 May 2026 20:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFD6B84A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780172708;
	bh=b7+Sksvzs5zBKrObAeEHbiFwaesSmkVpyl1zMvAbx0E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NnDYgupkfP6qM2lb5u3OPwU3lPSETc8uQ/1nBLJKDGzNTnmpCI3vNWpkwc2UbSL/o
	 Js0LHbtdzhKTV7ia9MogegSqYNTyDuSd5tJW9+VcUy5Msv6fUrN3fhobj3G41Hj9VB
	 NnNsWtAdvXjGX9lZ+hHQqH8WZQImTPSEib4pkkAC+rNdHdfP5n7KxFEjyJJ4dtrTUP
	 6BS9N2tPQadeB/tNVvymt+ojtOWSs5QdVj0IYe1xbwCRg1pQ7l77E+uzFShmKESly8
	 R4ALkIKF96wumXbv2zpIhNy3f8PV94AW6QtLwRBL5klKEA7oc58NbsZSLgOIS3ZfB4
	 AQk0fxvS4PuWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFD6B84A45;
	Sat, 30 May 2026 20:25:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D94FAF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA3DA40137
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOfedkfJ8d34 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C7D54010F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C7D54010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:25:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 776A48755A; Sat, 30 May 2026 20:24:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 22:23:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28e52cde511f03317507835a33b3bd8362d08f5d
X-Git-Newrev: 8e2d15cb760c10474862697a4917e32878e5d279
X-Patchwork-Hint: ignore
Message-Id: <20260530202451.776A48755A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburing: properly handle VERSION
 vs. SITE
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e2d15cb760c10474862697a4917e32878e5d279
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

VERSION should ideally contain only the version, i.e 2.12 and not some
additional prefix like liburing- as it prevents our logic matching
against release-monitoring.org data to work properly.

Fixes: d2ed4565321c74772014681ca5ddcb433162e468 ("package/liburing: bump to version 2.12")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/liburing/liburing.hash | 2 +-
 package/liburing/liburing.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index d37b69497f..d50a81d2cb 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f1d10cb058c97c953b4c0c446b11e9177e8c8b32a5a88b309f23fdd389e26370  liburing-2.12.tar.gz
+sha256  f1d10cb058c97c953b4c0c446b11e9177e8c8b32a5a88b309f23fdd389e26370  2.12.tar.gz
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index 24ceb281b5..78b43d5bfa 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBURING_VERSION = liburing-2.12
+LIBURING_VERSION = 2.12
 LIBURING_SOURCE = $(LIBURING_VERSION).tar.gz
-LIBURING_SITE = $(call github,axboe,liburing,$(LIBURING_VERSION))
+LIBURING_SITE = $(call github,axboe,liburing,liburing-$(LIBURING_VERSION))
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
 LIBURING_LICENSE_FILES = COPYING COPYING.GPL LICENSE README
 LIBURING_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
