Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AB7E94602
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 20:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D64612B7;
	Mon,  9 Feb 2026 20:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xR1BLp88BRaK; Mon,  9 Feb 2026 20:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC10F60E5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770669128;
	bh=buqVEfdwN25QlLKB/fJpmyGF54aaYMn9f0BTtI6HCpw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kAHbLvA37FOViaKQhgUUbIimZ3bp1RaNeBu6TykksjVa5WP2UBYem2H5SJNdxHR6R
	 ZgHBZxyxonzH9X/mfRgRxtDHHWZb4xpnr91YL4Va9fX7U7CB9/Eyxw6XFN8W851lpY
	 Zh4kLM2rCxSSIzria5n9Dj06QGSxKdkWPpDWVmR05Ttt6vr0aJar+CGWVHtU9S2aCk
	 7acCipmr1ZpvPJFaA2ki9vDAQ3D2/Xn26K4djbx3vgPAPE6kpsQkouEnLR/O/ASqKr
	 IDyzIWREMHMEevrrrYK8OJ2mbiDNEC6vnTVTMENjdiwB73Z+lHMToO2kq2e7EsWmKT
	 tGfRKiIBP2R3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC10F60E5B;
	Mon,  9 Feb 2026 20:32:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA2C1219
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EDDD400CE
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdCOXxZHWhta for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 20:32:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73819400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73819400BD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73819400BD
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:32:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b67.dip0.t-ipconnect.de [91.58.11.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8EAB3A4C07FE
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 21:32:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60358)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vpXut-000000001at-3UpR
 for buildroot@buildroot.org; Mon, 09 Feb 2026 20:31:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  9 Feb 2026 21:31:32 +0100
Message-ID: <20260209203132.3837056-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770669121;
 bh=CPsXbRe2ZIOVD+8eHARMtnbLzJlj6MgD/RSn1tCqu1U=;
 h=From:To:Subject:Date:From;
 b=bnYSqEYrA9TTPC++TJo+3wdItP5fwuVcOWOpG6TnDMXwY1EF0mC9U4+qWHwwV4XbP
 gQOaFa3x6WSH4X3+pFI9YOZlFM5Y/eF9JO+6lkYIYt1tBfHGvoZ8NP0Xxuuqp3VICy
 jDHxDXjypY8i8tNLeRpybOqO/uLOror6bco4UwrfjCwOktg2Xc8Zjh6pQ1b2bwXPML
 uvoA3/LTEwOLkOAU13dtRRv94BdPnkn1RecrX1uhFzjOx3u4jed7+lkfKSTwJ0TaPB
 0SMS8N53D0KWQDz71/C3c5TE4aTWeL7kRKkLBjzZx6L6DlLXB46T9cuar8ZobLr0BG
 yTGqDsh/i60ZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bnYSqEYr
Subject: [Buildroot] [PATCH 1/1] package/m4: bump version to 1.4.21
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

https://lists.gnu.org/archive/html/m4-announce/2026-02/msg00000.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/m4/m4.hash | 2 +-
 package/m4/m4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/m4/m4.hash b/package/m4/m4.hash
index a5b8456cc2..b6dcca6c7d 100644
--- a/package/m4/m4.hash
+++ b/package/m4/m4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  e236ea3a1ccf5f6c270b1c4bb60726f371fa49459a8eaaebc90b216b328daf2b  m4-1.4.20.tar.xz
+sha256  f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66  m4-1.4.21.tar.xz
 # License files, locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 396c2bbee2..d498754b35 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-M4_VERSION = 1.4.20
+M4_VERSION = 1.4.21
 M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
