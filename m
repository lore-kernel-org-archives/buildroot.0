Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDC9D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5B8061528;
	Mon, 12 Jan 2026 08:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPRLq-0SLihj; Mon, 12 Jan 2026 08:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1524661500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206752;
	bh=pSAJmnPHlrjcEw8nwLERD6wjrhSTUgGcoueXdWAtD18=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cn21f+Tc/MO5alDqHElwGuZNKh4BEHxdsH3wHbbDeqTK8T4sFA727neu+uFO7JZvC
	 LjlGjqqnPvH7Oa7nFKXkZZP8X5OZ4uQgCuL/x5tMeN96T/XuFVvcCiokZEASj1RtBi
	 axNoOLDFpWoYdXsx59Ax90wNe4F7Z+JrSJefd3WHTu9lC52/0X83UMXgA6edPb/m9S
	 qLN4PTLzzEeBFuHja6owMEn4u111LCkjXq2mXOAmLiXd/uEiXR1pWLZLgsbyKMAQn0
	 Uj4wUYj2LwvMf3C4wk1KNBkb6uSVoXdWG4/a+wuu7RRGuqNK0dbKmZQvrKpBuf5Axg
	 WRu7cHnQncEPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1524661500;
	Mon, 12 Jan 2026 08:32:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66B1F18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58C2461510
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aST5mYCHKZMC for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40C5F61500
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40C5F61500
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40C5F61500
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:32:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6706FA4C3B70
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJF-000000007z0-04rN
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:11 +0100
Message-ID: <20260112082950.2528445-63-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206611;
 bh=alv+eHDzR/y+btUJWcIg/fx3R4zRkhKXOsqbB5h6KTs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Y1Mf80wtFJ8L/QqujnMaEm3gWxlTIRKM6Wkp9b0XyCd8Ohvo8AutuzUh2y78x60Ix
 n/l4aypZHrJpFStorpcXuNIOIqUHzQWJKMItc0+4HorUmMk/v2EUac5SbdWFUyJMbK
 VHuh/LCJZUjSplPtKLKXH6YZPO9+mfIRPCS1n2TpwA8hilzr5xDPXjcIDUa82PbQuZ
 0518hiWknPS23Anay0W0xBGZUAGiBnf7md9npLL83/adhAftPyPFD7+GUhonmeDofk
 IQb6nLMt5QExdZhDbS7XPqO8IgitJOp40g2F8ulvGB3aueOrwMkaB7AxWPcE+DxF6Y
 P2M10eR9BE5gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Y1Mf80wt
Subject: [Buildroot] [PATCH 063/102] package/x11r7/xlib_libFS: bump version
 to 1.0.10
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

https://lists.x.org/archives/xorg-announce/2024-August/003524.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libFS/xlib_libFS.hash | 6 +++---
 package/x11r7/xlib_libFS/xlib_libFS.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libFS/xlib_libFS.hash b/package/x11r7/xlib_libFS/xlib_libFS.hash
index 6ca152ac4a..e88e77b2ce 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.hash
+++ b/package/x11r7/xlib_libFS/xlib_libFS.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-August/003200.html
-sha256  597379438b3242ccc7d7b0fc432dc6c844eca0d4a82a7b82518bfeb203fc208a  libFS-1.0.9.tar.xz
-sha512  7d012e62736c6d567931bad982eec221199d296f0fe41e1e7fde5575b8b928e9a8c644aa8746242bdfe72393635320b58774d9a519285765bd26d633588092b8  libFS-1.0.9.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003524.html
+sha256  9babbd3c86069c98563da044045fdc0ece4ec0c93dcdd2c68aa74eb34b4f3b77  libFS-1.0.10.tar.xz
+sha512  f4dc361b7e1dcc1f348ea86e96c5a60ff40c5168b6097f00d8a5db2b86d089cfca12ac13dbde5ce3b53279b7eb8773ed6dcd9c678c2e95363ffa5127ecaacee7  libFS-1.0.10.tar.xz
 # Locally computed
 sha256  5386724e7475b89394dd836b954a6688f875efab99e43e8eb7e8775f5b99a341  COPYING
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index 0fbf453ca4..1311c8df7a 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBFS_VERSION = 1.0.9
+XLIB_LIBFS_VERSION = 1.0.10
 XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.xz
 XLIB_LIBFS_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBFS_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
