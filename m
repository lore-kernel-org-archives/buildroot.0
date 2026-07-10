Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21BFC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 07:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 650C76078A;
	Fri, 10 Jul 2026 07:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0D_PyT3Ly1L; Fri, 10 Jul 2026 07:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91408606AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783668079;
	bh=XVPKGmb4qwPM68kzjauILuaS3b4nGIFI3lXNWEVjKNU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U3ch5Q4pVDGW/9NSMHQwyIUGtbYrohbpxjnkRaONbcjdtp+t/gNY2BWICwJlBszq6
	 NEZ5/vroOyUuDJOrZeTPz84Z7Fr/CvB1a+XoJG+fQgRBqy4SLz02DcxC18+9VWi/Fh
	 JmHA9cql65exsRSecw/IDN2QMvzfqu9az3a0m8Zl1UvMlhaJUaeTbbsbu8Gj5Qqfvb
	 27fifaeN/nyfqV/1VV3XaMvkALhFHwDsv2yRXpwi0HHaeDOesI81hRGZijavNZF49e
	 ZCh3Rp6Lw/bMxYXGfyrBeMH4J/yP3aYknXeklu4E0QTwc5JITm+W0ICwEntg4E/0Z9
	 5ODWniUYGT7qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91408606AA;
	Fri, 10 Jul 2026 07:21:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99DE9FD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C3CB812C1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0jgT40dy2QK for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 07:21:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 883DC812C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 883DC812C5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 883DC812C5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:21:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4f9.dip0.t-ipconnect.de [79.214.196.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5D048A4C324A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 09:21:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50068)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wi5Wl-000000008GF-1yu0
 for buildroot@buildroot.org; Fri, 10 Jul 2026 07:20:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 09:19:59 +0200
Message-ID: <20260710072003.160464-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783668062;
 bh=8FF+RRrJ1Dh8gawMrVhPa4Lq5nkul/SA1tWWxv95now=;
 h=From:To:Subject:Date:From;
 b=YbLYy7VGcFFfU4tyqR/M+kFg9FB70OjH0cevQQx/sR9W6nkNde3nCFdGBe7roJHhr
 0q+Hx8xxkwHhCftwirCTl9YE05zbvNLD7qP08ClYelm3Q5lDqC+C+xilopoBpfPi7d
 BL0Cv0UfV0vYfYXwSbuIrl0m11CuoRcykjs3i8NeUCghJ3fbMIt940VgYLC387YGeq
 nAgZl6cjTrv4OjRvpTxk+/5SgUK4hR5UBpgcDgRkjUHT07QrsawUUXjcSGAfdvJ421
 2ljR3cFiAPT/lpEdOnWFGbXe2Z47z48cYDcnxOdY7jDuFKYXQV7hFagcqaIUugbGvN
 H4KXFuwO2iK/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=YbLYy7VG
Subject: [Buildroot] [PATCH 1/5] package/libva: bump version to 2.24.1
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

https://github.com/intel/libva/blob/2.24.1/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/668fc1fd6c25e7abbad7dbfe140e34c7187e1f75

 package/libva/libva.hash | 2 +-
 package/libva/libva.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 2d7e8b7ee8..918230e1c0 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b10aceb30e93ddf13b2030eb70079574ba437be9b3b76065caf28a72c07e23e7  libva-2.23.0.tar.gz
+sha256  0b4a3649ee8d683b9cce2ef094df4fb039d276c0cef7e49337c43d3b297b9f42  libva-2.24.1.tar.gz
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index f41a0c00ff..9f044293d8 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.23.0
+LIBVA_VERSION = 2.24.1
 LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
