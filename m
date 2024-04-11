Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D7CC4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 21:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90CC860652;
	Thu, 11 Apr 2024 21:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyCwUyBgqHRR; Thu, 11 Apr 2024 21:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 987D5608DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 987D5608DC;
	Thu, 11 Apr 2024 21:02:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0F841BF983
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC55F82269
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ayd7hWJ2lghq for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 21:02:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBF708229D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBF708229D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBF708229D
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 21:02:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1baba.dip0.t-ipconnect.de [84.161.186.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9935A4C246B
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 23:02:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37732)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rv1ZE-000000001RB-3x6S
 for buildroot@buildroot.org; Thu, 11 Apr 2024 21:02:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 23:02:45 +0200
Message-Id: <20240411210245.2128044-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712869365;
 bh=ZtKcjDI7Z/w+0/P6za6epfjZnQNd5nU/k7arpcHHMvI=;
 h=From:To:Subject:Date:From;
 b=fyDLV6Pf+qmm0Y0qtsWLNbAChzVeTRa0/yZIbBbkveXewkXsQ1UXdu2kKd5zT3Kgx
 MTKonVD7JkIdY/P2RTAtXXF6ZZdRYwm0FEissvs4tbs5+rmoJiMfJ+K8Q52dpL8qIM
 ECrOGfNKb6LRTBDx3Mqfvq0xtywaiAdQQLrPd02RdqEFcO1MGpgca3x36cO75iMObt
 7w9MXUngEj4XHW9gZB3/OguZbeON3fSroviE5LQwx0Lo29u4G7J6BKbFuknfMl4pJE
 ulQ0u3kAh3Da2oT8LjZhwCTefDDDDapGiO6aqCAGIvIOVd0LkRT9LEawSiz0um+San
 aS2F//4qju1RA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=fyDLV6Pf
Subject: [Buildroot] [PATCH] package/libpng: bump version to 1.6.43
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

Release notes:
https://sourceforge.net/p/png-mng/mailman/message/58741099/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.hash | 4 ++--
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index fbae14c51d..356c0e3e5d 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/png-mng/mailman/message/58731120/
-sha256  c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450  libpng-1.6.42.tar.xz
+# From https://sourceforge.net/p/png-mng/mailman/message/58741099/
+sha256  6a5ca0652392a2d7c9db2ae5b40210843c0bbc081cbd410825ab00cc59f14a6c  libpng-1.6.43.tar.xz
 # Locally computed:
 sha256  7317e078e2d3b5d7ba5a6159e650945153262b44b76f6700f8e9edb261c5143e  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index c4da9f89c7..af38afde47 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.42
+LIBPNG_VERSION = 1.6.43
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
