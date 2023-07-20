Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D21EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 17:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9D4282998;
	Thu, 20 Jul 2023 17:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9D4282998
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lb8Jvs6YGQ9I; Thu, 20 Jul 2023 17:53:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECEA982B69;
	Thu, 20 Jul 2023 17:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECEA982B69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 011E31BF5DA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEEAD61219
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEEAD61219
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKsREEc8Yy73 for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 17:53:38 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03706611F7
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 17:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03706611F7
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B62CBA4C0B4E
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 19:53:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34104)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMXq3-0008NS-1S
 for buildroot@buildroot.org; Thu, 20 Jul 2023 19:53:19 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 19:53:19 +0200
Message-Id: <20230720175319.151079-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720175319.151079-1-bernd@kuhls.net>
References: <20230720175319.151079-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689875599;
 bh=ingNj212ghue2tCgEf7fzLZWQ7g5SKocWX0qBnmThyI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fwTf0HvD2Fksr9dl7Lr3w8NXuaIHJkhS/GX85uC791i6WrSSIHEaagydUE/JZkUSI
 2mjIS3jHnqfzNAlj2YerjQnMkiLvmZHVVTaVt3zjJ+TBCGR5xQUrbbDWYiZQv6Sna3
 mi/+0H6QFqPqVG62Hx+xBNsVQLgHOjLLX+0QE9H9nMTAvcjbSa7g8Uy+5ahS0sVUDg
 6DJHAjpXjsxMRlc/A1PlpKv4DsVfh/vYugA1+h/RLYGF29taFu/YlEgQL844rzm56L
 jTIHTsMm8hvF5M/Vd9K354a8VOcdbj2nH48PDp27wC3OEyVZ91kWjfiKLqAAYGgV4U
 LPE7XjiImgNCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=fwTf0HvD
Subject: [Buildroot] [PATCH 2/2] package/tor: needs openssl with threads
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

Fixes:
http://autobuild.buildroot.net/results/b8e/b8efae5bf6ac3b51e8443951ef1dd88824af3f2b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/tor/Config.in b/package/tor/Config.in
index 52009267e2..de35c34492 100644
--- a/package/tor/Config.in
+++ b/package/tor/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_TOR
 	bool "tor"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_PACKAGE_OPENSSL_HAS_THREADS
 	select BR2_PACKAGE_LIBEVENT
-	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  Tor is free software and an open network that helps you
@@ -17,3 +17,7 @@ config BR2_PACKAGE_TOR
 comment "tor needs a toolchain w/ NPTL"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
+comment "tor needs a thread-enabled openssl library (libressl or dynamically-linked openssl)"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_OPENSSL_HAS_THREADS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
