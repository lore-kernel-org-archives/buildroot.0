Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CEAC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 07:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB7E581775;
	Sun, 28 Jul 2024 07:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BU5KW2jQzEdH; Sun, 28 Jul 2024 07:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDE8581778
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDE8581778;
	Sun, 28 Jul 2024 07:51:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32A291BF32E
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F6E181778
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOBsPUe_Gfij for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 07:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B086281775
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B086281775
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B086281775
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 07:51:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cca8.dip0.t-ipconnect.de [79.214.204.168])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 28E3DA4C31D5
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 09:51:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41844)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXyge-000000005rw-3Yap
 for buildroot@buildroot.org; Sun, 28 Jul 2024 07:51:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 09:51:24 +0200
Message-Id: <20240728075124.4676-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722153085;
 bh=mZTnY0ACLEZKU9WO5+FqTaq3CL4KMJbeDWxDOn9u9io=;
 h=From:To:Subject:Date:From;
 b=AuareWFrRPx+GtcCsjFZ3gtp6fFtABUOUfP9Fo5Sw25osn/C2dHIYKn5hB2pWT+bX
 2Fh57bUr2bB5u75PgPHlAFE1GKrWfQcv3fMzc0Khn0mlas8LXMTFhaEq4+nSeNoF8F
 bW1sd5DPYuIXqA8/Vfb++RIj8QrEovBpp5xq3JzXzaslwlhyvakEg/AB5tU8IW3MdW
 Y0Oa8k0ESzRVq6S+qMcvGQ2GMW+px6pOT2KB1kE61FJfNuX6SBdfdO/vUi1Tph168v
 xRpFxYpEycN4iSysAd+CUFdsu9QL8e/QIaLLhWLJcmoEoy4ynCymuCB7Dm57Iieac3
 tQOj/75UAYXhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=AuareWFr
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump to version 6.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Changelog: https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index b9bc768e8f..6c442c3729 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  c3ae526b01ce4d8df6c794ab170de4a4104d111ea8d8db3f1fd7c25fcb905619  ethtool-6.7.tar.xz
+sha256  a71b0354010661c5cf178bc606ed50fcb91805cf1897ad0eb2818387a5fd0cd9  ethtool-6.9.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 77a7e16937..bd04fca8f3 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 6.7
+ETHTOOL_VERSION = 6.9
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
