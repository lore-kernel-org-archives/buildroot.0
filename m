Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D99D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7096F812E6;
	Sun,  7 Dec 2025 14:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJDNF0tcsgn6; Sun,  7 Dec 2025 14:49:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85DF3821FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118955;
	bh=UuUZ4om/Bdspp+7lT2z1/rEi7AZ0oG9xFYU4C5hAeRI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Y6VJeX6LfaLFXG6T0XdF1eVUfBPQAGMJfayclkXQQmaD+tii3xTMtwk6nPZkM+uDM
	 YI5e3ALN0p2KWv1zpw1wYyMyAAaYkoWXe6CpKVPCnn2K/BlGFU0GwEYYNmnnpkxCWt
	 MmKD3tAUhp9+J+0BMMIx6DlrfnUjUks1K/7wdZkAfEK9H/pnilE5K7stPIwdQ/nkiR
	 bf+dytNWFyxUazIpofAMv0ygxHJPcLgv9Kj7Rk6564cM5b5as4U5Z0u0nmp5fjHsrq
	 AVyyItbtPrL5AXoecx+Pdo2hLQh8am9fUzsu+T7o/xgV+ficA/ErrT22Dc8QjHEonG
	 ZWkpQPBtdvn+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85DF3821FB;
	Sun,  7 Dec 2025 14:49:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC54C2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADA36605EB
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zikmvQ5w_UwY for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:49:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0545605A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0545605A2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0545605A2
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:49:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62E8DA4C109B;
 Sun,  7 Dec 2025 15:43:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyJ-00000000416-0hrj;
 Sun, 07 Dec 2025 14:42:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:42 +0100
Message-ID: <20251207144243.3696572-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118582;
 bh=au9dqVE+sY/Qh4Cz/98g9J7s07MLHFwWJC3KEDi63lw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Mn7cH5JW3nFmMSlpOYPAcF7JQs1pBkkQ9MT5pd/JL5TcmzZKyAzj6DedGTuUKbm9x
 lcDDgb5pDRwl2wTUJ6zIahgdInqakcXX8PJg9dDfutcg6KBJa/UuHXO6GbRF/ho2GO
 4cA9hXmbLyFOQGsm5n7zleGuPUmU961HXIsa9Zc3WHuxzbCkeb3cDk3Zs2aaaN36yK
 hprb4dCKxqYWug3pZIBr7mXR4gqVYdqN8XPGn+qQrEUyfwqIj7Lb1hzz3FqlIB0E48
 EcLPozEIIstC3nto5DcKXfMQPzDFtggU0m+hNlMom+fA+PPg5UVUHWFpBd/en0mDuL
 ckRLvHTSYt5Wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Mn7cH5JW
Subject: [Buildroot] [PATCH/next 33/33] package/yad: bump version to 14.2
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switched SITE to github according to
https://sourceforge.net/p/yad-dialog/tickets/337/#8b94

Release notes: https://github.com/v1cont/yad/blob/v14.2/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/yad/yad.hash | 5 +----
 package/yad/yad.mk   | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/yad/yad.hash b/package/yad/yad.hash
index ec0edc522d..0bb54d24a1 100644
--- a/package/yad/yad.hash
+++ b/package/yad/yad.hash
@@ -1,6 +1,3 @@
-# From http://sourceforge.net/projects/yad-dialog/files/
-md5  82d458a2e1695dd0709f71ad26109812  yad-0.40.0.tar.xz
-sha1  4376eb42f8e38972124dc81e534cbdc9088109fb  yad-0.40.0.tar.xz
-
 # Hash for license file
+sha256  5cab399af8d9a10b76d477f848180d00addba38f4f1272a05b153a393bba3038  yad-14.2.tar.xz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/yad/yad.mk b/package/yad/yad.mk
index b40220f9ad..06adf6f20e 100644
--- a/package/yad/yad.mk
+++ b/package/yad/yad.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-YAD_VERSION = 0.40.0
+YAD_VERSION = 14.2
 YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
-YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
+YAD_SITE = https://github.com/v1cont/yad/releases/download/v$(YAD_VERSION)
 YAD_LICENSE = GPL-3.0
 YAD_LICENSE_FILES = COPYING
 YAD_DEPENDENCIES = host-intltool host-pkgconf libgtk3 $(TARGET_NLS_DEPENDENCIES)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
